// Copyright 2013 Altera Corporation. All rights reserved.  
// Altera products are protected under numerous U.S. and foreign patents, 
// maskwork rights, copyrights and other intellectual property laws.  
//
// This reference design file, and your use thereof, is subject to and governed
// by the terms and conditions of the applicable Altera Reference Design 
// License Agreement (either as signed by you or found at www.altera.com).  By
// using this reference design file, you indicate your acceptance of such terms
// and conditions between you and Altera Corporation.  In the event that you do
// not agree with such terms and conditions, you may not use the reference 
// design file and please promptly destroy any copies you have made.
//
// This reference design file is being provided on an "as-is" basis and as an 
// accommodation and therefore all warranties, representations or guarantees of 
// any kind (whether express, implied or statutory) including, without 
// limitation, warranties of merchantability, non-infringement, or fitness for
// a particular purpose, are specifically disclaimed.  By making this reference
// design file available, Altera expressly does not recommend, suggest or 
// require that this reference design file be used in combination with any 
// other product not provided by Altera.
/////////////////////////////////////////////////////////////////////////////

// baeckler - 10-27-2012

`timescale 1ps / 1ps
//DV_FIX default_nettype//`default_nettype none

// altera message_off 10036 10230
module sl3p_2ln #(
	parameter LANES = 2, // to override you would need to modify the Serdes
	parameter RST_CNTR_BITS = 16,  // reset pacing, ~16 nominal, ~6 for fast simulations
	parameter AM_CNTR_BITS = 10,  // interval to send lane align markers
	parameter TX_CRC = 1'b1,   // enable transmit side CRC insertion
	parameter RX_CRC = 1'b1   // enable receive side CRC checking
)(
	// no domain
	input sys_arst, // reset TX and RX
	input sloop,	// TX to RX internal serial loopback
		
	// pins
	input pll_ref_clk,
	output [LANES-1:0] tx_pin,	// pin 0 is lane #0
	input [LANES-1:0] rx_pin,
	
	// tx data port 
	output tx_clk,
	output tx_srst,
	input tx_tlast,					 
	input [LANES*8-1:0] tx_tkeep,	// packed to the right, aligned with tx_tdata bytes
	input tx_tvalid,
	output tx_tready,
	input [LANES*64-1:0] tx_tdata,	// data on the rhs leaving first, on lane 0
		
	// tx in band flow control
	input [23:0] tx_flow_control,
	output       tx_flow_control_strobe,
	
	// tx status
	output tx_hard_error, // occurs while TX is booting only
		
	// rx data port
	output rx_clk,
	output rx_fix,
	output rx_fail,
	output rx_srst,
	output reg rx_tlast,
	output reg [LANES*8-1:0] rx_tkeep, 
	output reg rx_tvalid,
	output reg [LANES*64-1:0] rx_tdata,	
	
	// rx in band flow control
	output [23:0] rx_flow_control,
	output        rx_flow_control_strobe,
	
	// rx status summary
	output rx_hard_error,  // occurs when RX is not locked to remote TX
	output rx_soft_error,  // bit error detected
	output rx_crc_error,   // CRC mismatch
	output reg rx_halted,  // remote TX has requested a halt
			
	// rx link status detail (informational, no action required)
	output [LANES-1:0] framing_err,
	output [LANES-1:0] word_lock,
	output deskew_locked,
	
	// SERDES reconfig port
	input           mgmt_clk_clk,  // also used for reset sequencing
    input  wire [349:0] reconfig_to_xcvr,   //   reconfig_to_xcvr.reconfig_to_xcvr
    output wire [229:0] reconfig_from_xcvr,  // reconfig_from_xcvr.reconfig_from_xcvr
    input wire reconfig_busy, tx_cal_busy_r, rx_cal_busy_r
);

reg rx_tlast_int = 1'b0;
initial rx_tlast = 1'b0;
initial rx_tkeep = {LANES{8'h0}};
reg rx_tvalid_int = 1'b0;
initial rx_tvalid = 1'b0;
initial rx_tdata = {LANES{64'h0}};	

assign framing_err = 2'b0;
///////////////////////////////////////////////////////////
// serdes assembly
///////////////////////////////////////////////////////////

// tx serdes port
wire             tx_clk_out;
reg tx_valid = 1'b0;
wire tx_valid_to_serdes;
reg [LANES*66-1:0] tx_din = 0;  // bit 0 sent first; to tx_pin[0] 
wire [LANES*66-1:0] tx_din_to_serdes;  // bit 0 sent first; to tx_pin[0] 
wire tx_clk_in = tx_clk_out;
wire tx_din_pempty;
	
// rx serdes port
wire             rx_clk_out;
wire [LANES*66-1:0] rx_dout;  // bit 0 sent first; from rx_pin[0] 		
wire rx_valid;
wire rx_clk_in = rx_clk_out;

wire rx_overflow, rx_underflow;
wire reset_rx_digital;
wire tx_srst_serdes, rx_srst_serdes;

wire [LANES-1:0] rx_sbe;  // Single bit error
wire [LANES-1:0] rx_dbe;  // Double bit error
assign rx_fix  = |rx_sbe;
assign rx_fail = |rx_dbe;

// enforce that the 2 cycle data is held properly
wire tx_phase;
reg [LANES*66-1:0] tx_din_to_serdes_r = {(LANES*66){1'b0}};  // bit 0 sent first; to tx_pin[0]
always @(posedge tx_clk_out) begin
	if (tx_phase) begin
		tx_din_to_serdes_r <= tx_din_to_serdes;
		// synthesis translate off
			if (!tx_valid_to_serdes) $display ("WARNING : the tx side is loading a bad word. OK while booting");	
			// if this happens frequently the phase -> valid path needs to be inverted
			// once at startup is fint
		// synthesis translate on
	end	
end

sl3p_serdes_2ln_ecc ss (
	// no domain
	.sys_arst(sys_arst),
	.sloop(sloop),
	
	// pins
	.pll_ref_clk(pll_ref_clk),
	.tx_pin(tx_pin),
	.rx_pin(rx_pin),
	
	// tx port
	//.tx_clk_in(tx_clk_in),
	.tx_srst(tx_srst_serdes),
	.tx_clk_out(tx_clk_out),
	//.tx_valid(tx_valid_to_serdes),
	.tx_phase(tx_phase),
	.tx_din(tx_din_to_serdes_r),  // bit 0 sent first, to tx_pin[0] 
		
	// rx port
	.rx_srst(rx_srst_serdes),
	.rx_clk_out(rx_clk_out),
	.rx_dout(rx_dout),  // bit 0 sent first, from rx_pin[0] 		
	.rx_valid(rx_valid),
	.rx_fix(rx_sbe), // single bit, corrected
	.rx_fail(rx_dbe), // double bit, not
	.word_lock(word_lock),
	.deskew_locked(deskew_locked),
	
	.rx_overflow(rx_overflow),
	.rx_underflow(rx_underflow),
	
	// SERDES reconfig port
	.mgmt_clk_clk(mgmt_clk_clk),  // also used for reset sequencing
        .reconfig_to_xcvr(reconfig_to_xcvr),   //   reconfig_to_xcvr.reconfig_to_xcvr
        .reconfig_from_xcvr(reconfig_from_xcvr),  // reconfig_from_xcvr.reconfig_from_xcvr
        .reconfig_busy(reconfig_busy), 
        .tx_cal_busy_r(tx_cal_busy_r), 
        .rx_cal_busy_r(rx_cal_busy_r)
);
defparam ss .CNTR_BITS = RST_CNTR_BITS;

///////////////////////////////////////////////////////////
// tx management
///////////////////////////////////////////////////////////

wire rd0_ready;
reset_delay rd0 (
	.clk(tx_clk),
	.ready_in(!sys_arst && !tx_srst_serdes),
	.ready_out(rd0_ready)
);
defparam rd0 .CNTR_BITS = 3;
assign tx_srst = !rd0_ready;
assign tx_hard_error = !rd0_ready; 

///////////////////////////////////////////////////////////
// rx management
///////////////////////////////////////////////////////////

wire rd1_ready;
reset_delay rd1 (
	.clk(rx_clk),
	.ready_in(!sys_arst && !rx_srst_serdes),
	.ready_out(rd1_ready)
);
defparam rd1 .CNTR_BITS = 3;

wire rd2_ready;
reset_delay rd2 (
	.clk(rx_clk),
	.ready_in(rd1_ready && deskew_locked),
	.ready_out(rd2_ready)
);
defparam rd2 .CNTR_BITS = 3;
assign rx_srst = !rd2_ready;
assign rx_hard_error = !rd2_ready;

// if the RX FIFO goes of bounds after word locking reset the whole RX side
// there is probably something serious wrong with the TX partner
wire rd3_ready;
reset_delay rd3 (
	.clk(rx_clk),
	.ready_in(rd1_ready && (&word_lock)),
	.ready_out(rd3_ready)
);
defparam rd3 .CNTR_BITS = 3;
//assign reset_rx_digital = rd3_ready && (rx_overflow || rx_underflow);

reg rx_soft_error_r = 1'b0;
always @(posedge rx_clk) begin
	rx_soft_error_r <= (|framing_err) | rx_crc_error;
end
assign rx_soft_error = rx_soft_error_r;

///////////////////////////////////////////////////////////
// tx alignment schedule
///////////////////////////////////////////////////////////

reg [AM_CNTR_BITS-1:0] tx_am_cntr = 0;
reg tx_am_cntr_msb = 1'b0;
reg tx_am_req = 1'b0;

always @(posedge tx_clk) begin
	if (tx_valid) tx_am_cntr <= tx_am_cntr + 1'b1;
	tx_am_cntr_msb <= tx_am_cntr[AM_CNTR_BITS-1];
	tx_am_req <= tx_am_cntr_msb && !tx_am_cntr[AM_CNTR_BITS-1];
end

///////////////////////////////////////////////////////////
// tx coding layer
///////////////////////////////////////////////////////////

assign tx_clk = tx_clk_in;
reg tx_valid_pre2 = 1'b0;
reg tx_valid_pre = 1'b0;

reg    tx_flow_control_strobe_reg = 1'b0;
reg    tx_flow_control_strobe_reg2 = 1'b0;
assign tx_flow_control_strobe     = tx_flow_control_strobe_reg;

wire [65:0] align_word = {tx_flow_control[7:0],tx_flow_control[23:8],4'h0,4'b1100,32'h0,2'b01};
wire [65:0] idle_word =  {tx_flow_control[7:0],tx_flow_control[23:8],4'h0,4'b0000,32'h0,2'b01};
wire [65:0] eop_word  =  {tx_flow_control[7:0],tx_flow_control[23:8],4'h0,4'b0011,32'h0,2'b01};
reg [65:0] tx_din_pre = 0 /* synthesis preserve */;
reg tx_payload = 1'b0; // user traffic, not idles or internal

wire [LANES*66-1:0] framed_din;
reg tx_am = 1'b0;
reg tx_laststall = 1'b0;
reg [LANES*66-1:0] tx_laststall_data = {LANES*66{1'b0}};

reg tx_tready_int = 1'b0;
assign tx_tready = tx_tready_int & (~tx_laststall);

// stage data into the TX serdes
always @(posedge tx_clk) begin
	
	tx_flow_control_strobe_reg <= 1'b0;

        // modulate valid data 
	// if this isn't working properly the latency -> serdes probably
	// changed, try inverting tx_phase
	if (!tx_phase) begin
		tx_valid_pre2 <= 1'b1;		
	end
	else begin
		tx_valid_pre2 <= 1'b0;
	end
	
	if (!tx_valid_pre2) begin
		// the SEDES is satisfied - don't send
		tx_valid_pre <= 1'b0;
		tx_tready_int <= 1'b0;		
	end
	else begin
		// yes, some data is going into the SERDES 
		// want it for internal use?
		tx_valid_pre <= 1'b1;
		
		if (tx_am) begin
			// use for tx alignment
			tx_din_pre <= align_word;
			tx_flow_control_strobe_reg2 <= ~tx_flow_control_strobe_reg2;
			tx_flow_control_strobe_reg <= tx_flow_control_strobe_reg2;
			tx_am <= 1'b0;
			tx_tready_int <= 1'b0;		
		end else begin
			// offer this cycle to the user (or steal for last insertion)
			tx_tready_int <= 1'b1;
		end
	end

	if (!tx_valid_pre) begin
		// SERDES waiting
		tx_payload <= 1'b0;
		tx_valid <= 1'b0;
	end
	else begin
		// SERDES taking data
		tx_payload <= 1'b0;
		tx_valid <= 1'b1;
		if (!tx_tready_int) begin
			// load the internally scheduled word
			tx_din <= {LANES{tx_din_pre}};
		end
		else begin
			// user cycle
			if (tx_tvalid || tx_laststall) begin
				tx_laststall_data <= framed_din;
				tx_payload <= 1'b1;
				tx_laststall <= 1'b0;

				if (tx_laststall) begin //insert data displaced by eop frame
					tx_din <= tx_laststall_data;
				end else if (tx_tlast) begin //insert eop frame
					tx_din <= {idle_word,eop_word};
					tx_laststall <= 1'b1;
					tx_flow_control_strobe_reg2 <= ~tx_flow_control_strobe_reg2;
					tx_flow_control_strobe_reg <= tx_flow_control_strobe_reg2;
				end else begin
					tx_din <= framed_din;
				end				
			end else begin
				// unclaimed by user - send idles
				tx_din <= {LANES{idle_word}};
				tx_flow_control_strobe_reg2 <= ~tx_flow_control_strobe_reg2;
				tx_flow_control_strobe_reg <= tx_flow_control_strobe_reg2;
			end
		end
	end
	
	if (tx_am_req) tx_am <= 1'b1;	
end

// you're an EOP if you're in a tlast word, and to the right is keep
wire [LANES-1:0] txeop;
assign txeop[0] = tx_tlast && !tx_laststall; 
assign txeop[1] = 1'b0; 

// you're an idle if EOP is to the right
wire [LANES-1:0] txidle;
assign txidle[0] = 1'b0;
assign txidle[1] = txeop[0];

// synthesis translate off
wire [LANES*64-1:0] tx_unframed;
// synthesis translate on

// frame the user data 
genvar i;
generate
	for (i=0; i<LANES; i=i+1) begin : lp0
		wire [63:0] local_din = tx_tdata[(i+1)*64-1:i*64];
		
		wire [65:0] local_frm = {local_din,2'b10};
		
		assign framed_din[(i+1)*66-1:i*66] = local_frm;		
		
		// synthesis translate off
		assign tx_unframed[(i+1)*64-1:i*64] = local_frm[65:2];
		// synthesis translate on
		
	end	
endgenerate

///////////////////////////////////////////////////////////
// tx CRC (with optional bypass)
///////////////////////////////////////////////////////////

localparam CRC_LATENCY = 3;
generate 
	if (TX_CRC) begin
		// insert CRCs 
		
		reg [LANES-1:0] txeop_r = {LANES{1'b0}};
		reg [LANES-1:0] tx_crc_here_d = {LANES{1'b0}} ;
		reg [LANES-1:0] tx_crc_here_dd = {LANES{1'b0}} ;
		reg [LANES-1:0] tx_crc_here_ddd = {LANES{1'b0}} ;
		reg tx_payload_d = 1'b0;
		reg tx_final_d = 1'b0;
		
		always @(posedge tx_clk) begin
			txeop_r <= txeop;
			tx_final_d <= (|txeop_r) & tx_payload;	
			tx_crc_here_d <= {LANES{tx_payload}} & txeop_r;
			tx_crc_here_dd <= tx_crc_here_d;
			tx_crc_here_ddd <= tx_crc_here_dd;			
		end
		
		// crc is data only, no framing bits
		wire [LANES*64-1:0] tx_din_noframe;
		for (i=0; i<LANES; i=i+1) begin : nf
			assign tx_din_noframe [(i+1)*64-1:i*64] = tx_din [(i+1)*66-1:i*66+2];
		end	
		
		// CRC XOR arrays
		wire [LANES*32-1:0] crc;
		crc32_2word tcrc (
			.clk(tx_clk),
			.din_valid(tx_payload),
			.din_last(tx_final_d),
			.din(tx_din_noframe),
			.crc(crc)
		);	
		defparam tcrc .LATE_LAST = 1'b1;	
				
		// stall the data to meet the CRC
		wire [LANES*66-1:0] tx_din_lag;
		delay_mlab dm0 (
			.clk(tx_clk),
			.din(tx_din),
			.dout(tx_din_lag)
		);
		defparam dm0 .WIDTH = LANES*66;
		defparam dm0 .LATENCY = CRC_LATENCY;
		defparam dm0 .TARGET_CHIP = 2;
		
		wire tx_valid_crc;
		delay_regs dr0 (
			.clk(tx_clk),
			.din(tx_valid),
			.dout(tx_valid_crc)
		);		
		defparam dr0 .WIDTH = 1;
		defparam dr0 .LATENCY = CRC_LATENCY + 1;
		
		// mix CRC into data stream
		reg [LANES*66-1:0] tx_din_crc = {(LANES*66){1'b0}};
		
		wire [LANES*66-1:0] exp_crc;
		wire [LANES*32-1:0] masked_crc;
		
		for (i=0; i<LANES; i=i+1) begin : mk
			assign masked_crc[(i+1)*32-1:i*32] = tx_crc_here_ddd[i] ? crc[(i+1)*32-1:i*32] : 32'h0;
			assign exp_crc [(i+1)*66-1:i*66] = 66'h0 | (masked_crc[(i+1)*32-1:i*32] << 2);
		end	
		
		always @(posedge tx_clk) begin
			tx_din_crc <= exp_crc | tx_din_lag;		
			// synthesis translate off
			if (|(tx_din_lag & exp_crc)) begin
				// this is probably a latency mismatch with the CRC 
				$display ("Warning - installing a TX CRC in a non-zero field");
			end
			// synthesis translate on				
		end		

		assign tx_din_to_serdes = tx_din_crc;
		assign tx_valid_to_serdes = tx_valid_crc;
	end
	else begin
		// go right through - no CRC needed
		assign tx_din_to_serdes = tx_din;
		assign tx_valid_to_serdes = tx_valid;
	end
endgenerate

///////////////////////////////////////////////////////////
// rx coding layer
///////////////////////////////////////////////////////////

assign rx_clk = rx_clk_in;

wire [LANES-1:0] rx_idle_block;
wire [LANES-1:0] rx_eop_block;
wire [LANES-1:0] rx_am_block;
wire [LANES-1:0] rx_data_block;
wire [LANES-1:0] rx_halt_block;

// synthesis translate off
wire [LANES*64-1:0] rx_unframed;
// synthesis translate on

generate
	for (i=0; i<LANES; i=i+1) begin : lp1
		wire [4:0] tmp_rx_type = {rx_dout[i*66+37:i*66+34],rx_dout[i*66]};

		// synthesis translate off
		assign rx_unframed[(i+1)*64-1:i*64] = rx_valid ? rx_dout[i*66+65:i*66+2] : 64'h0;
		// synthesis translate on
		
		assign rx_idle_block[i] = (tmp_rx_type == 5'b00001) ? 1'b1 : 1'b0;
		assign rx_eop_block[i] = (tmp_rx_type ==  5'b00111) ? 1'b1 : 1'b0;
		assign rx_am_block[i] =  (tmp_rx_type ==  5'b11001) ? 1'b1 : 1'b0;
		assign rx_halt_block[i] =(tmp_rx_type ==  5'b01101) ? 1'b1 : 1'b0;
		assign rx_data_block[i] =  !(tmp_rx_type[0]);
				
		always @(posedge rx_clk) begin
			if (rx_srst) begin
				rx_tkeep[(i+1)*8-1:i*8] <= 8'h0;
				rx_tdata[(i+1)*64-1:i*64] <= 64'h0;	
			end
			else begin
				if (!rx_valid) begin
					// no new data on this cycle
					rx_tkeep[(i+1)*8-1:i*8] <= 8'h0;
					rx_tdata[(i+1)*64-1:i*64] <= 64'h0;
				end
				else begin
					rx_tkeep[(i+1)*8-1:i*8] <= rx_data_block[i] ? 8'hff : 8'h0;
					
					// black out the CRC in EOP blocks, data blocks through, black out other ctrl
					rx_tdata[(i+1)*64-1:i*64] <= rx_data_block[i] ? rx_dout[(i+1)*66-1:i*66+2] :
							rx_eop_block[i] ? {rx_dout[(i+1)*66-1:i*66+2+32],32'h0} : 
							64'h0;					
					
				end
			end
		end
	end
endgenerate


always @(posedge rx_clk) begin
	if (rx_srst) begin
		rx_tvalid_int <= 1'b0;
		rx_tvalid <= 1'b0;
	end
	else begin
		if (!rx_valid) begin
			// no new data on this cycle
			rx_tvalid_int <= 1'b0;
			rx_tvalid <= 1'b0;
		end
		else begin
			// if there is something not idle it's valid
			rx_tvalid_int <= !rx_idle_block[0] && !rx_am_block[0] && !rx_halt_block[0];
			rx_tvalid <= !rx_idle_block[0] && !rx_am_block[0] && !rx_halt_block[0] && !rx_eop_block[0];
		end
	end
end

//eop frame comes as the frame before the one we should set last in
//when we see a eop block, set tlast and hold it until we see the next valid user data frame
always @(posedge rx_clk) begin
	if (rx_srst) begin
		rx_tlast_int <= 1'b0;
		rx_tlast <= 1'b0;
	end
	else begin
		if (rx_tvalid) begin //whenever we send a flit to the user, clear the last bit
			rx_tlast <= 1'b0;
		end

		if (|rx_eop_block && rx_valid) begin
			rx_tlast <= 1'b1;
		end

		if (!rx_valid) begin
			rx_tlast_int <= 1'b0;
		end 
		else begin
			rx_tlast_int <= |rx_eop_block;
		end
	end
end

reg [23:0] last_rx_fc = 0;
reg        rx_fc_strobe = 0;
always @(posedge rx_clk) begin
	if (rx_srst) begin
		last_rx_fc <= 1'b0;
		rx_fc_strobe <= 1'b0;
	end
	else begin
	    rx_fc_strobe <= 1'b0;
		if (rx_valid) begin
			if (!rx_data_block[LANES-1]) begin
				// the highest word is control - grab flow control field
				last_rx_fc <= {rx_dout[(LANES-1)*66+57:(LANES-1)*66+42], rx_dout[(LANES-1)*66+65:(LANES-1)*66+58]};
				rx_fc_strobe <= 1'b1;
			end		
		end
	end
end
assign rx_flow_control = last_rx_fc;
assign rx_flow_control_strobe = rx_fc_strobe;

//////////////////////////////////////////////////////////
// RX halt detect 
//////////////////////////////////////////////////////////

// monitor elapsed time since last last error
localparam ERR_CNT_BITS = 10;
reg [ERR_CNT_BITS-1:0] err_timer = {ERR_CNT_BITS{1'b0}} /* synthesis preserve dont_replicate */;
wire rx_very_stable = err_timer[ERR_CNT_BITS-1];
reg rx_stable_clr = 1'b0 /* synthesis preserve dont_replicate */;
always @(posedge rx_clk) begin
	if (rx_srst || rx_soft_error || rx_stable_clr) begin
		err_timer <= {ERR_CNT_BITS{1'b0}};
	end
	else begin
		if (!rx_very_stable) err_timer <= err_timer+1'b1;
	end
end

// aggregate the words being looked at for halting
reg all_lanes_halt = 1'b0 /* synthesis preserve dont_replicate */;
reg all_lanes_am = 1'b0 /* synthesis preserve dont_replicate */;
reg non_am = 1'b0 /* synthesis preserve dont_replicate */;
reg non_halt = 1'b0 /* synthesis preserve dont_replicate */;
always @(posedge rx_clk) begin
	if (rx_srst) begin
		all_lanes_halt <= 1'b0;
		all_lanes_am <= 1'b0;		
		non_am <= 1'b0;
		non_halt <= 1'b0;
	end
	else begin
		all_lanes_halt <= rx_valid && (&rx_halt_block);
		all_lanes_am <= rx_valid && (&rx_am_block);			
		non_am <= rx_valid && ~(&rx_am_block);
		non_halt <= rx_valid && ~(&rx_halt_block);			
	end
end


// look for the sequence of error free operation, AM, non-AM
localparam 
	ST_ERR_WATCH = 2'b00,
	ST_AM_WATCH = 2'b01,
	ST_NON_AM_WATCH = 2'b10,
	ST_ROUND_PASS = 2'b11;
	
reg [1:0] etest_st = 2'b0 /* synthesis preserve dont_replicate */;
reg etest_round_pass = 1'b0 /* synthesis preserve dont_replicate */;
always @(posedge rx_clk) begin
	if (rx_srst) begin
		rx_stable_clr <= 1'b1;
		etest_st <= ST_ERR_WATCH;
		etest_round_pass <= 1'b0;
	end
	else begin
		rx_stable_clr <= 1'b1;
		etest_round_pass <= 1'b0;
		case (etest_st) 
			ST_ERR_WATCH : begin
				rx_stable_clr <= 1'b0;
				if (rx_very_stable) etest_st <= ST_AM_WATCH;
			end
			ST_AM_WATCH : begin
				if (all_lanes_am) etest_st <= ST_NON_AM_WATCH;
			end
			ST_NON_AM_WATCH : begin
				if (non_am) etest_st <= ST_ROUND_PASS;
			end
			ST_ROUND_PASS : begin
				etest_round_pass <= 1'b1;
				etest_st <= ST_ERR_WATCH;
			end		
		endcase
	end
end

// look for repeated halt requests
reg qualified_halt = 1'b0 /* synthesis preserve dont_replicate */;
reg [2:0] halt_history = 3'b0 /* synthesis preserve dont_replicate */;
always @(posedge rx_clk) begin
	if (rx_srst) begin
		qualified_halt <= 1'b0;
		halt_history <= 3'b0;
	end
	else begin
		if (all_lanes_halt) halt_history <= {halt_history[1:0],1'b1};
		if (non_halt) halt_history <= 3'b0;
		qualified_halt <= &halt_history;
	end
end

// repeat the go/resume test and count passes
reg [2:0] release_count = 3'b0;
reg halt_testing = 1'b0;
wire testing_too_long;
always @(posedge rx_clk) begin
	if (rx_srst || rx_hard_error || qualified_halt || testing_too_long || !rx_halted) begin
		release_count <= 4'b0;
		halt_testing <= 1'b0;
	end
	else begin
		if (etest_round_pass) release_count <= release_count + 1'b1;	
		halt_testing <= 1'b1;
	end
end		
wire qualified_go = release_count[2];

// timeout - 2^28 is about a second at 257 MHz 
reg [28:0] timeout_cnt = {29'b0};
always @(posedge rx_clk) begin
	if (!halt_testing) timeout_cnt <= 29'b0;
	else timeout_cnt <= timeout_cnt + 1'b1;
end
assign testing_too_long = timeout_cnt[28];

// central halt control
always @(posedge rx_clk) begin
	if (rx_srst || rx_hard_error || qualified_halt) begin
		rx_halted <= 1'b1;
	end 
	else begin
		if (qualified_go) rx_halted <= 1'b0;	
	end
end

///////////////////////////////////////////////////////////
// RX CRC 
///////////////////////////////////////////////////////////

generate
	if (RX_CRC) begin
		
		// pull expected crc field from unprocessed RX data
		reg [LANES*32-1:0] expect_crc = {LANES{32'h0}};
		for (i=0; i<LANES; i=i+1) begin : rec
			always @(posedge rx_clk) begin
				if (rx_srst) begin
					expect_crc[(i+1)*32-1:i*32] <= 32'h0;
				end
				else begin
					if (!rx_valid) begin
						expect_crc[(i+1)*32-1:i*32] <= 32'h0;
					end
					else begin
						expect_crc[(i+1)*32-1:i*32] <= 
							rx_eop_block[i] ? rx_dout[(i*66)+32+2-1:i*66+2] : 32'h0;																		
					end
				end
			end
		end			
			
		// CRC XOR arrays		
		wire [LANES*32-1:0] recomp_crc;
		crc32_2word rcrc (
			.clk(rx_clk),
			.din_valid(rx_tvalid_int),
			.din_last(rx_tlast_int),
			.din(rx_tdata),
			.crc(recomp_crc)
		);			
		
		// figure out exactly where the CRCs are supposed to be
		wire [LANES-1:0] rxcword;
		assign rxcword[1] = rx_tlast_int & rx_tkeep[0] & rx_tvalid_int;
		assign rxcword[0] = rx_tlast_int & !rx_tkeep[0] & rx_tvalid_int;
		
		// stall expected CRC to match
		wire [LANES-1:0] rxcword_lag;
		wire [LANES*32-1:0] expect_crc_lag;
		delay_mlab dr2 (
			.clk(rx_clk),
			.din({expect_crc,rxcword}),
			.dout({expect_crc_lag,rxcword_lag})
		);
		defparam dr2 .LATENCY = CRC_LATENCY;
		defparam dr2 .WIDTH = LANES*32 + LANES;
		defparam dr2 .TARGET_CHIP = 2;
		
		// compare expected and rebuilt CRCs
		wire [LANES-1:0] crc_mismatch;
		for (i=0; i<LANES; i=i+1) begin : ck 
			mismatch_32 mm32 (
				.clk(rx_clk),
				.din_a(expect_crc_lag[(i+1)*32-1:i*32]),
				.din_b(recomp_crc[(i+1)*32-1:i*32]),
				.din_valid(rxcword_lag[i]),
				.mismatch(crc_mismatch[i])
			);
			defparam mm32 .TARGET_CHIP = 2;
		end				
		
		assign rx_crc_error = |crc_mismatch;
	end
	else begin
		assign rx_crc_error = 1'b0;
	end
endgenerate

endmodule

//DV_FIX default_nettype//`default_nettype wire
