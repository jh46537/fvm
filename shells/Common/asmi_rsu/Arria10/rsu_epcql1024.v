// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/altera_remote_update/altera_remote_update.sv#3 $
// $Revision: #3 $
// $Date: 2014/09/26 $
// $Author: tgngo $

// +----------------------------------------------------------------------
// | Altera remote update
// | The Altera Remote Update megafunction provides features to download a
// | new configuration image from remote location, store in configuration
// | device, and direct the dedicated remote system upgrade circuitry to
// | reconfigure itself with new configuration data."
// | This component is for Arria 10 support only.
// +----------------------------------------------------------------------

`timescale 1 ps / 1 ps
module  rsu
	(
     // +----------------------
     // | Clock and Reset
     // +----------------------
     busy,
     clock,
     reset,
     // +----------------------
     // | Input signals
     // +----------------------
     // ctk_nupdt: 1 = Control Reg, 0 = Update Reg
     ctl_nupdt,
     data_in,
     data_out,
     param,
     // +----------------------
     // | Output signals
     // +----------------------
     write_param,
     read_param,
     reconfig,
     reset_timer);
    input [31 : 0] data_in;
    output [31:0]  data_out;
    input [2:0]    param;
    input          write_param;
    input          read_param;
    input          reconfig;
    input          reset;
    input          reset_timer;
    output         busy;
    input          clock;
    input          ctl_nupdt;
    
    // +-----------------------------------------------------------------------------
    // | State machine: declaration
    // | IDLE           : Idle
    // | CAPTURE_REGS   : Capture the value of either update register  or control register
    // |                  it is det by ctl_nupdt from user
    // | CAPTURE_UPTREG : RU_CTL = 10, capture value from update reg to shift reg,
    // |                  this is used when read after reset asserts
    // | SHIFT_IN       : Shift in value to RU_DIN
    // | SHIFT_OUT      : Shift out value from RU_DOUT
    // | UPDATE         : RU_CTL = 11, to update value from shift reg to update reg
    // +-----------------------------------------------------------------------------
    enum
        {
         IDLE,
         CAPTURE_REGS,
         CAPTURE_UPTREG,
         SHIFT_IN,
         SHIFT_OUT,
         UPDATE
         } state, next_state;
    // +-------------------------------------------------------
    // | Internal signals
    // +-------------------------------------------------------
    reg [1 : 0]                ru_block_ctl;
    reg                        read_param_reg;
    reg                        write_param_reg;
    wire                       write_param_wire;
    wire                       read_param_wire;
    reg                        reset_trigger_read_reg;
    reg [3 :0]                 param_reg;
    wire                       trigger;
    wire                       reconfig_wire;
    wire                       reset_timer_wire;
    reg                        shift_out_counter_en;
    reg                        shift_in_counter_en;
    reg                        shift_in_counter_en_reg;
    reg                        shift_out_bit_done;
    reg                        shift_in_bit_done;
    reg                        shift_out_bit_done_reg;
    reg                        updtreg_internal_valid;
    reg [5 : 0]                bit_counter;
    reg [5 : 0]                num_bit_to_shift_out;
    reg [31 : 0]               data_out_reg;
    reg [50 : 0]               shiftreg_out;
    reg [50 : 0]               shiftreg;
    reg [45 : 0]               shiftreg_in;
    wire                       regout_wire;
    wire                       regin_wire;
    // Internal signals to keep values for write, so that wont overwrite
    reg [11 : 0]               watchdog_timeout_value_reg;
    reg                        watchdog_enable_reg;
    reg [31 : 0]               boot_addr_reg;
    reg                        anf_reg; // application not factory

    // +-------------------------------------------------------
    // | Get write/read_param for user, only affect when the IP
    // | is in IDLE state.
    // +-------------------------------------------------------
    assign write_param_wire = write_param && (state == IDLE);
    assign read_param_wire  = read_param && (state == IDLE);
    assign trigger          = write_param_wire || read_param_wire;
    
    // +-------------------------------------------------------
    // | Register read/write_param signals
    // +-------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset) begin
                read_param_reg  <= '0;
                write_param_reg <= '0;
            end
            else begin
                if (state == IDLE) begin
                    read_param_reg  <= read_param_wire;
                    write_param_reg <= write_param_wire;
                end
            end // else: !if(reset)
        end // always_ff @
    
    // +-------------------------------------------------------
    // | Read transaction after reset is triggered
    // +-------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset)
                reset_trigger_read_reg <= '0;
            else begin
                if (state == CAPTURE_UPTREG)
                    reset_trigger_read_reg <= 1'b1;
                if (shift_out_bit_done_reg)
                    reset_trigger_read_reg <= '0;
            end // else: !if(reset)
        end // always_ff @
    // +----------------------------------------------------------------
    // | Param input setting. Use one more bit for "reset read"
    // | param_reg: 4 bits
    // |            {0,param} -> from user input
    // |            1000      -> Reset read
    // | Register param value when in IDLE and has trigger read or write
    // +----------------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset) begin
                param_reg <= '0;
            end
            else begin
                if (state == IDLE && trigger)
                    param_reg <= {1'b0,param};
                // In this state need to shift out whole register in RU block
                // to retreive all values
                if (state == CAPTURE_UPTREG)
                    param_reg <= 4'b1000;
            end // else: !if(reset)
        end // always_ff @

    // +-------------------------------------------------------
    // | Reset trigger: use like a reset synchornizer to read
    // | update resgister after reset to avoid overwrite
    // +-------------------------------------------------------
    reg reset_trigger;
    reg rff;
    always_ff @(posedge clock)
        begin
            if (reset)
                {reset_trigger, rff} <= 2'b11;
            else
                {reset_trigger, rff} <= {rff, 1'b0};
        end

    // +-------------------------------------------------------------
    // | Store input values for any write transaction to reconstruct 
    // | for the next write shift register
    // +-------------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset) begin
                watchdog_timeout_value_reg <= '0;
                watchdog_enable_reg        <= '0;
                boot_addr_reg              <= '0;
                anf_reg                    <= '0;
            end
            else begin
                if (write_param_wire) begin
                    if (param == 3'b010)
                        watchdog_timeout_value_reg <= data_in[11 : 0];
                    if (param == 3'b011)
                        watchdog_enable_reg <= data_in[0];
                    if (param == 3'b100)
                        boot_addr_reg <= data_in;
                    if (param == 3'b101)
                        anf_reg <= data_in[0];
                end
                else begin
                    // read after reset, use these values
                    if (updtreg_internal_valid) begin
                        watchdog_timeout_value_reg <= shiftreg[50 : 39];
                        watchdog_enable_reg        <= shiftreg[38];
                        boot_addr_reg              <= shiftreg[37 : 6];
                        anf_reg                    <= shiftreg[5];
                    end
                end // else: !if(write_param_wire)
            end // else: !if(reset)
        end // always_ff @
    
    // +-------------------------------------------------------
    // | State machine: updates state
    // +-------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset)
                state <= IDLE;
            else
                state <= next_state;
        end

    // +-------------------------------------------------------
    // | State machine: next state conditions
    // +-------------------------------------------------------
    always_comb
        begin
            case (state)
                IDLE: begin
                    if (reset_trigger)
                        next_state = CAPTURE_UPTREG;
                    else if (read_param_wire)
                        next_state  = CAPTURE_REGS;
                    else if (write_param_wire)
                        next_state  = SHIFT_IN;
                    else
                        next_state  = IDLE;
                end
                
                CAPTURE_UPTREG: begin
                    next_state  = SHIFT_OUT;
                end

                CAPTURE_REGS: begin
                    if (read_param_reg)
                        next_state  = SHIFT_OUT;
                    else begin
                        if (write_param_reg)
                            next_state  = SHIFT_IN;
                        else
                            next_state  = CAPTURE_REGS;
                    end
                end

                SHIFT_OUT: begin
                    if (shift_out_bit_done)
                        next_state  = IDLE;
                    else
                        next_state  = SHIFT_OUT;
                end

                SHIFT_IN: begin
                    if (shift_in_bit_done)
                        next_state  = UPDATE;
                    else
                        next_state  = SHIFT_IN;
                end

                UPDATE: begin
                    next_state = IDLE;
                end
            endcase // case (state)
        end

    // +-------------------------------------------------------
    // | State machine: state outputs
    // +-------------------------------------------------------
    always_comb
        begin
            case (state)
                IDLE: begin
                    shift_in_counter_en   = 1'b0;
                    shift_out_counter_en  = 1'b0;
                    ru_block_ctl          = {1'b1, ctl_nupdt};
                end

                CAPTURE_UPTREG: begin
                    shift_in_counter_en   = 1'b0;
                    shift_out_counter_en  = 1'b0;
                    ru_block_ctl          = 2'b10;
                end

                CAPTURE_REGS: begin
                    shift_in_counter_en   = 1'b0;
                    shift_out_counter_en  = 1'b0;
                    ru_block_ctl          = {1'b1, ctl_nupdt};
                end

                SHIFT_OUT: begin
                    shift_in_counter_en   = 1'b0;
                    shift_out_counter_en  = 1'b1;
                    ru_block_ctl          = 2'b00;
                end

                SHIFT_IN: begin
                    shift_in_counter_en   = 1'b1;
                    shift_out_counter_en  = 1'b0;
                    ru_block_ctl          = 2'b00;
                end

                UPDATE: begin
                    shift_in_counter_en   = 1'b0;
                    shift_out_counter_en  = 1'b0;
                    ru_block_ctl          = 2'b01;
                end

            endcase // case (state)
        end

    // +-------------------------------------------------------
    // | Counter bits shift: increase 1 for shift in or out bit
    // +-------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset)
                bit_counter <= '0;
            else begin
                if (shift_out_counter_en || shift_in_counter_en)
                    bit_counter <= bit_counter + 6'b00001;
                else
                    bit_counter <= '0;
            end
        end

    // +-------------------------------------------------------------------------------------------------
    // | Remote update IP param value - (for Arria 10)
    // | 001, 110, 111: illegal values
    // | 000: Read (Only)Reconfiguration trigger conditions (read only) : 5 bits
    // | 010: Read/Write Watchdog Timeout Value                         : 12 bits -> CR[45 : 34] (Control Register)
    // | 011: Read/Write Watchdog Enable                                : 1 bit   -> CR[33]
    // | 100: Read/Write Page Select
    // |                   - 32 bits address: mapped to {PGM[31 : 2], 2'b00}      -> CR[32 : 1]
    // | 101: Read/Write Configuration Mode (AnF): 1 bit                          -> CR[0]
    // |
    // | Note that the Shift Register, which the IP core can read/write, it concatenates
    // | Status Register (SR) 5 bits and "temporary" register of CR or UR 46 bits. So SR has 51 bits.
    // | Because 5 bits SR are at add at higher part so part select still same as in CR
    // +-------------------------------------------------------------------------------------------------
    // |                 ___________                  ____________________
    // |       <--dout<-|__SR[4:0]_|<-din-----<-dout-|_____R[45:0]_______|<--din--
    // |
    // +-------------------------------------------------------
    // | Shift out (MSB first) stop point
    // +-------------------------------------------------------
    always_comb
        begin
            shift_out_bit_done  = '0;
            shift_in_bit_done   = '0;
            if (bit_counter == num_bit_to_shift_out)
                shift_out_bit_done  = 1'b1;
            // for shift in, always shift full range with R-46 bits
            if ((bit_counter == 6'd46) && write_param_reg)
                shift_in_bit_done  = 1'b1;
        end

    // +----------------------------------------------------------------------
    // | Input shifting to RU block (RU_DIN):
    // |  - Reconstruct the value of Shift register before shift in
    // |    the value either from previous write or value read out from update
    // |    register after reset.
    // +----------------------------------------------------------------------
    reg [45 : 0] shiftreg_in_reg;
    always_comb
        begin
            shiftreg_in = {watchdog_timeout_value_reg, watchdog_enable_reg, boot_addr_reg, anf_reg};
        end
    assign regin_wire  = shiftreg_in_reg[0];


    always_ff @(posedge clock, posedge reset)
        begin
            if (reset)
                shiftreg_in_reg <= '0;
            else begin
                if (shift_in_counter_en_reg)
                    shiftreg_in_reg[44 : 0] <= shiftreg_in_reg[45 : 1];
                else
                    shiftreg_in_reg <= shiftreg_in;
            end
        end

    // +-------------------------------------------------------
    // | Output shifting from RU block (RU_DOUT)
    // +-------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset)
                shiftreg_out <= '0;
            else begin
                if (state == SHIFT_OUT)
                    shiftreg_out <= {regout_wire, shiftreg_out[50:1]};
            end
        end

    // +------------------------------------------------------------------
    // | updtreg_internal_valid: indicate when the read after reset finish
    // |                         and value are ready to read
    // +------------------------------------------------------------------
    always_ff @(posedge clock)
        begin
            shift_out_bit_done_reg  <= shift_out_bit_done;
            updtreg_internal_valid  <= shift_out_bit_done_reg && reset_trigger_read_reg;
            shift_in_counter_en_reg <= shift_in_counter_en;
        end

    // +--------------------------------------------------------------------------
    // | shiftreg          : store the value after shift out and ru block and hold
    // |                     until next read happens
    // +--------------------------------------------------------------------------
    always_ff @(posedge clock, posedge reset)
        begin
            if (reset) begin
                shiftreg          <= '0;
            end
            else begin
                if (shift_out_bit_done_reg)
                    shiftreg <= shiftreg_out;
            end
        end
    // +-------------------------------------------------------
    // | Counter stop value selection, signals mapping ...
    // +-------------------------------------------------------
    always_comb
        begin
            case (param_reg)
                4'b0000: begin // Reconfiguration trigger conditions
                    num_bit_to_shift_out  = 6'd4;
                    data_out_reg          = {27'b0,shiftreg[50 : 46]};
                end
                4'b0010: begin // Watchdog timeout value
                    num_bit_to_shift_out  = 6'd50;
                    data_out_reg          = {18'b0,shiftreg[50 : 39]};
                end
                4'b0011: begin // Watchdog timeout enable
                    num_bit_to_shift_out  = 6'd38;
                    data_out_reg          = {31'b0,shiftreg[50]};
                end
                4'b0100: begin // Page select
                    num_bit_to_shift_out  = 6'd37;
                    data_out_reg          = shiftreg[50 : 19];
                end
                4'b0101: begin // Configuration mode (AnF)
                    num_bit_to_shift_out  = 6'd5;
                    data_out_reg          = {31'b0,shiftreg[50]};
                end
                4'b1000: begin // Read after reset trigger
                    num_bit_to_shift_out  = 6'd50;
                    data_out_reg          = {18'b0,shiftreg[50 : 39]};
                end
                default: begin // Default
                    num_bit_to_shift_out  = 6'd0;
                    data_out_reg          = '0;
                end
            endcase // case (param_reg)
        end // always_comb
    
    assign data_out  = data_out_reg;
    // +-------------------------------------------------------------------------------------------------------
    // | (reset_trigger || reset_trigger_read_reg || updtreg_internal_valid) : To make sure the busy is asserted 
    // |  right after reset trigger and keep hold until the shift out values are avaiable,
    // | updtreg_internal_valid: To make sure that busy is kept high for one more clock to all internal values are
    // | stored, avoid user can send wrte/read at that time which can corrupt data.
    // +-------------------------------------------------------------------------------------------------------
    assign busy      = (reset_trigger || reset_trigger_read_reg || updtreg_internal_valid) || write_param_reg || read_param_reg;
    // Reconfig and reset timer are active only no operations in RU block
    assign reset_timer_wire  = reset_timer && (state == IDLE);
    assign reconfig_wire     = reconfig && (state == IDLE);
       
    // +-------------------------------------------------------
    // | RU block instantiation: ARRIA 10
    // +-------------------------------------------------------
	twentynm_rublock   ru_block
	(
	.clk(clock),
	.ctl(ru_block_ctl),
	.rconfig(reconfig_wire),
	.regin(regin_wire),
	.regout(regout_wire),
	.rsttimer(reset_timer_wire));

endmodule
