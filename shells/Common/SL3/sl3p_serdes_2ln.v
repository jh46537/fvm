// Copyright 2012 Altera Corporation. All rights reserved.  
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

// baeckler - 10-25-2012

module sl3p_serdes_2ln #(
	parameter LANES = 2, // to override you would need to modify the Serdes
	parameter CNTR_BITS = 16  // reset pacing
)(
	// no domain
	input sys_arst,
	input sloop,
		
	// pins
	input pll_ref_clk,
	output [LANES-1:0] tx_pin,
	input [LANES-1:0] rx_pin,
	
	// tx port
	input tx_clk_in,
	output tx_srst,
	output [LANES-1:0] tx_clk_out,
	input tx_valid,
	input [LANES*66-1:0] tx_din,  // bit 0 sent first, to tx_pin[0] 
	output reg tx_din_pempty,
	
	output reg tx_overflow,
	output reg tx_underflow,
		
	// rx port
	input rx_clk_in,
	output rx_srst,
	output [LANES-1:0] rx_clk_out,
	output [LANES*66-1:0] rx_dout,  // bit 0 sent first, from rx_pin[0] 		
	output rx_valid,

	output reg [LANES-1:0] framing_err,
	output reg [LANES-1:0] word_lock,
	output deskew_locked,
	
	input reset_rx_digital,
	output reg rx_underflow,
	output reg rx_overflow,
	
	// SERDES reconfig port
	input           mgmt_clk_clk,  // also used for reset sequencing
        input  wire [279:0] reconfig_to_xcvr,   //   reconfig_to_xcvr.reconfig_to_xcvr
        output wire [183:0] reconfig_from_xcvr,  // reconfig_from_xcvr.reconfig_from_xcvr
        input wire reconfig_busy, tx_cal_busy_r, rx_cal_busy_r,
        output wire mgmt_rst_reset
    //input   [6:0]   reconfig_mgmt_address,
    //input           reconfig_mgmt_read,
    //output  [31:0]  reconfig_mgmt_readdata,
    //output          reconfig_mgmt_waitrequest,
    //input           reconfig_mgmt_write,
    //input   [31:0]  reconfig_mgmt_writedata    
);

initial word_lock = {LANES{1'b0}};
initial framing_err = {LANES{1'b0}};

genvar i;

/////////////////////////////////////////////////////////////////////////
// native serdes - 66 bit 

wire pll_powerdown, rst_txa, rst_txd, rst_rxa, rst_rxd;
wire [LANES-1:0] tx_pll_lock, rx_freqlock;

wire [LANES*64-1:0] tx_parallel_data, rx_parallel_data;
wire [LANES*9-1:0] tx_control;
wire [LANES*10-1:0] rx_control;
reg [LANES-1:0] rx_rd_ena = {LANES{1'b0}};
wire [LANES-1:0] rx_valid_f;
reg [LANES-1:0] rx_bitslip = {LANES{1'b0}};

//wire [279:0] reconfig_to_xcvr;   //   reconfig_to_xcvr.reconfig_to_xcvr
//wire [183:0] reconfig_from_xcvr;  // reconfig_from_xcvr.reconfig_from_xcvr

wire [LANES-1:0] tx_cal_busy_l, rx_cal_busy_l;
reg tx_valid_d = 1'b0;

wire [LANES-1:0] rx_pempty;
wire [LANES-1:0] rx_empty;
wire [LANES-1:0] tx_pempty;
wire [LANES-1:0] tx_empty;
wire [LANES-1:0] tx_full;
wire [LANES-1:0] rx_full;

ntv_serdes_2ln sio (
	.pll_powerdown({LANES{pll_powerdown}}),      //      pll_powerdown.pll_powerdown
	.tx_analogreset({LANES{rst_txa}}),     //     tx_analogreset.tx_analogreset
	.tx_digitalreset({LANES{rst_txd}}),    //    tx_digitalreset.tx_digitalreset
	.tx_pll_refclk(pll_ref_clk),      //      tx_pll_refclk.tx_pll_refclk
	.tx_serial_data(tx_pin),     //     tx_serial_data.tx_serial_data
	.pll_locked(tx_pll_lock),         //         pll_locked.pll_locked
	.rx_analogreset({LANES{rst_rxa}}),     //     rx_analogreset.rx_analogreset
	.rx_digitalreset({LANES{rst_rxd}}),    //    rx_digitalreset.rx_digitalreset
	.rx_cdr_refclk(pll_ref_clk),      //      rx_cdr_refclk.rx_cdr_refclk
	.rx_pma_clkout(),      //      rx_pma_clkout.rx_pma_clkout
	.rx_serial_data(rx_pin),     //     rx_serial_data.rx_serial_data
	.rx_clkslip({LANES{1'b0}}),         //         rx_clkslip.rx_clkslip
	.rx_set_locktodata({LANES{1'b0}}),  //  rx_set_locktodata.rx_set_locktodata
	.rx_set_locktoref({LANES{1'b0}}),   //   rx_set_locktoref.rx_set_locktoref
	.rx_is_lockedtoref(),  //  rx_is_lockedtoref.rx_is_lockedtoref
	.rx_is_lockedtodata(rx_freqlock), // rx_is_lockedtodata.rx_is_lockedtodata
	.rx_seriallpbken({LANES{sloop}}),    //    rx_seriallpbken.rx_seriallpbken
	.tx_parallel_data(tx_parallel_data),   //   tx_parallel_data.tx_parallel_data
	.rx_parallel_data(rx_parallel_data),   //   rx_parallel_data.rx_parallel_data
	.tx_10g_coreclkin({LANES{tx_clk_in}}),   //   tx_10g_coreclkin.tx_10g_coreclkin
	.rx_10g_coreclkin({LANES{rx_clk_in}}),   //   rx_10g_coreclkin.rx_10g_coreclkin
	.tx_10g_clkout(tx_clk_out),      //      tx_10g_clkout.tx_10g_clkout
	.rx_10g_clkout(rx_clk_out),      //      rx_10g_clkout.rx_10g_clkout
	.tx_10g_control(tx_control),     //     tx_10g_control.tx_10g_control
	.rx_10g_control(rx_control),     //     rx_10g_control.rx_10g_control
	.tx_10g_data_valid({LANES{tx_valid_d}}),  //  tx_10g_data_valid.tx_10g_data_valid
	
	.rx_10g_fifo_rd_en(rx_rd_ena),  //  rx_10g_fifo_rd_en.rx_10g_fifo_rd_en
	.rx_10g_data_valid(rx_valid_f),  //  rx_10g_data_valid.rx_10g_data_valid
	.rx_10g_bitslip(rx_bitslip),     //     rx_10g_bitslip.rx_10g_bitslip
	
	.tx_cal_busy(tx_cal_busy_l),        //        tx_cal_busy.tx_cal_busy
	.rx_cal_busy(rx_cal_busy_l),        //        rx_cal_busy.rx_cal_busy
	
	.tx_10g_fifo_full(tx_full),   //   tx_10g_fifo_full.tx_10g_fifo_full
	.tx_10g_fifo_pfull(),  //  tx_10g_fifo_pfull.tx_10g_fifo_pfull
	.tx_10g_fifo_empty(tx_empty),  //  tx_10g_fifo_empty.tx_10g_fifo_empty
	.tx_10g_fifo_pempty(tx_pempty), // tx_10g_fifo_pempty.tx_10g_fifo_pempty
	.rx_10g_fifo_full(rx_full),   //   rx_10g_fifo_full.rx_10g_fifo_full
	.rx_10g_fifo_pfull(),  //  rx_10g_fifo_pfull.rx_10g_fifo_pfull
	.rx_10g_fifo_empty(rx_empty),  //  rx_10g_fifo_empty.rx_10g_fifo_empty
	.rx_10g_fifo_pempty(rx_pempty), // rx_10g_fifo_pempty.rx_10g_fifo_pempty
			
	.reconfig_to_xcvr (reconfig_to_xcvr),   //   reconfig_to_xcvr.reconfig_to_xcvr
	.reconfig_from_xcvr (reconfig_from_xcvr)  // reconfig_from_xcvr.reconfig_from_xcvr
);

/////////////////////////////////////////////////////////////////////////
// reconfig and calibration

//wire reconfig_busy, tx_cal_busy_r, rx_cal_busy_r;
//wire mgmt_rst_reset;

//reco_2ln reco (
    //.reconfig_busy(reconfig_busy),
    //.tx_cal_busy(tx_cal_busy_r),
    //.rx_cal_busy(rx_cal_busy_r),
   // 
    //.mgmt_clk_clk(mgmt_clk_clk),
    //.mgmt_rst_reset(mgmt_rst_reset), // resynchronized internally
    //.reconfig_mgmt_address(reconfig_mgmt_address),
    //.reconfig_mgmt_read(reconfig_mgmt_read),
    //.reconfig_mgmt_readdata(reconfig_mgmt_readdata),
    //.reconfig_mgmt_waitrequest(reconfig_mgmt_waitrequest),
    //.reconfig_mgmt_write(reconfig_mgmt_write),
    //.reconfig_mgmt_writedata(reconfig_mgmt_writedata),
   // 
    //.reconfig_to_xcvr(reconfig_to_xcvr),
    //.reconfig_from_xcvr(reconfig_from_xcvr)
//);

/////////////////////////////////////////////////////////////////////////
// common reset control

wire rd0_ready;
reset_delay rd0 (
	.clk(mgmt_clk_clk),
	.ready_in(!sys_arst),
	.ready_out(rd0_ready)
);
defparam rd0 .CNTR_BITS = CNTR_BITS;
assign pll_powerdown = !rd0_ready;

wire rd1_ready;
reset_delay rd1 (
	.clk(mgmt_clk_clk),
	.ready_in(rd0_ready),
	.ready_out(rd1_ready)
);
defparam rd1 .CNTR_BITS = CNTR_BITS;
assign mgmt_rst_reset = !rd1_ready;

wire rd2_ready;
reset_delay rd2 (
	.clk(mgmt_clk_clk),
	.ready_in(rd1_ready & !tx_cal_busy_r & !rx_cal_busy_r),
	.ready_out(rd2_ready)
);
defparam rd2 .CNTR_BITS = CNTR_BITS;
wire calibrated = rd2_ready;

/////////////////////////////////////////////////////////////////////////
// TX reset control

wire rd3_ready;
reset_delay rd3 (
	.clk(mgmt_clk_clk),
	.ready_in(calibrated & (&tx_pll_lock)),
	.ready_out(rd3_ready)
);
defparam rd3 .CNTR_BITS = CNTR_BITS;
assign rst_txa = !rd3_ready;

wire rd4_ready;
reset_delay rd4 (
	.clk(mgmt_clk_clk),
	.ready_in(rd3_ready),
	.ready_out(rd4_ready)
);
defparam rd4 .CNTR_BITS = CNTR_BITS;
assign rst_txd = !rd4_ready;

sync_regs sr1 (
	.clk(tx_clk_in),
	.din(rst_txd),
	.dout(tx_srst)
);
defparam sr1 .WIDTH = 1;

/////////////////////////////////////////////////////////////////////////
// RX reset control

wire rd5_ready;
reset_delay rd5 (
	.clk(mgmt_clk_clk),
	.ready_in(calibrated),
	.ready_out(rd5_ready)
);
defparam rd5 .CNTR_BITS = CNTR_BITS;
assign rst_rxa = !rd5_ready;

wire rd6_ready;
reset_delay rd6 (
	.clk(mgmt_clk_clk),
	.ready_in(rd5_ready & (&rx_freqlock) & (!reset_rx_digital)),
	.ready_out(rd6_ready)
);
defparam rd6 .CNTR_BITS = CNTR_BITS;
assign rst_rxd = !rd6_ready;

sync_regs sr0 (
	.clk(rx_clk_in),
	.din(rst_rxd),
	.dout(rx_srst)
);
defparam sr0 .WIDTH = 1;

/////////////////////////////////////////////////////////////////////////
// TX scram

generate
	for (i=0; i<LANES; i=i+1) begin : wt
		wire [63:0] tx_din_sc;
		scrambler sc (
			.clk(tx_clk_in),
			.srst(tx_srst),
			.ena(tx_valid),
			.din(tx_din[i*66+65:i*66+2]),		// bit 0 is to be sent first
			.dout(tx_din_sc)
		);
		defparam sc .WIDTH = 64;

		reg [1:0] tx_frame = 2'b0;
		always @(posedge tx_clk_in) tx_frame <= {tx_din[i*66+0],tx_din[i*66+1]};
		
		assign tx_parallel_data[64*i+63:64*i] = tx_din_sc;
		assign tx_control[9*i+1:9*i] = tx_frame;
	end
endgenerate
always @(posedge tx_clk_in) tx_valid_d <= tx_valid;

always @(posedge tx_clk_in) begin
	tx_din_pempty <= |tx_pempty;
end
		
/////////////////////////////////////////////////////////////////////////
// RX descram

reg rx_pdata_valid = 1'b0;
reg rx_valid_r = 1'b0;

// another register for timing closure
reg rx_pdata_valid_d = 1'b0;
reg [LANES*64-1:0] rx_parallel_data_d = {(LANES*64){1'b0}};

always @(posedge rx_clk_in) begin
	rx_pdata_valid_d <= rx_pdata_valid;
	rx_parallel_data_d <= rx_parallel_data;
end

// combine the data and control
generate
	for (i=0; i<LANES; i=i+1) begin : wr
		wire [63:0] rx_dout_dsc;
	
		descrambler_wys dw (
			.clk(rx_clk_in),
			.skip(!rx_pdata_valid_d), // this din word isn't valid
			.din(rx_parallel_data_d[64*i+63:64*i]),		// bit 0 is used first
			.dout(rx_dout_dsc)
		);
		defparam dw .WIDTH = 64;

		reg [1:0] rx_frame = 2'b0;
		always @(posedge rx_clk_in) rx_frame <= {rx_control[10*i],rx_control[10*i+1]};
		
		reg [1:0] rx_frame_d = 2'b0;
		always @(posedge rx_clk_in) rx_frame_d <= rx_frame;
		
		assign rx_dout[i*66+65:i*66+2] = rx_dout_dsc;
		assign rx_dout[i*66+1:i*66+0] = rx_frame_d;
		
		always @(posedge rx_clk_in) begin
			framing_err[i] <= ~^{rx_control[10*i],rx_control[10*i+1]} & rx_valid_f[i];
		end
	end
endgenerate

reg [LANES-1:0] rx_purge = {LANES{1'b0}};
wire [LANES-1:0] fallback_req;
reg [LANES-1:0] fallback_needed = {LANES{1'b0}};

reg all_word_lock = 1'b0;
reg rx_none_pempty = 1'b1;
always @(posedge rx_clk_in) begin
	rx_none_pempty <= ~|rx_pempty;
	
	rx_rd_ena <= rx_purge | {LANES{rx_none_pempty}};
	fallback_needed <= all_word_lock ? (fallback_needed | fallback_req) : {LANES{1'b0}};
	if (rx_none_pempty && (|fallback_needed)) begin
		rx_rd_ena <= ~fallback_needed;
		fallback_needed <= {LANES{1'b0}}; 	
	end
			
	rx_pdata_valid <= rx_rd_ena[0];	
	rx_valid_r <= rx_pdata_valid_d;	
end
assign rx_valid = rx_valid_r;

/////////////////////////////////////////////////////////////////////////
// RX word lock control

// slow down
reg [4:0] rx_cntr = 5'b0;
reg rx_ping = 1'b0;
always @(posedge rx_clk_in) begin
	rx_cntr <= rx_cntr + 1'b1;
	rx_ping <= &rx_cntr;
end

localparam RXA_FLUSH = 2'h0,
	RXA_TEST = 2'h1,
	RXA_SLIP = 2'h2,
	RXA_LOCKED = 2'h3;

generate
	for (i=0; i<LANES; i=i+1) begin : ral
		
		reg [1:0] rxa_st = 2'b0 /* synthesis preserve */;
		reg [3:0] err_cntr = 0;
		
		always @(posedge rx_clk_in) begin
			if (rx_ping) err_cntr <= 0;
			else err_cntr <= err_cntr + framing_err[i];
		end
				
		always @(posedge rx_clk_in) begin
			word_lock[i] <= 1'b0;									
			if (rx_srst) begin
				rxa_st <= RXA_FLUSH;
				rx_bitslip[i] <= 1'b0;				
			end
			else begin
				case (rxa_st) 
					RXA_FLUSH: begin
						// let the new slip settle
						if (rx_cntr[4]) begin
							rxa_st <= RXA_TEST;
							rx_bitslip[i] <= 1'b0;
						end
					end
					RXA_TEST: begin
						// bust on any error, goto lock if stable
						if (framing_err[i]) begin
							rxa_st <= RXA_SLIP;							
						end
						else if (!rx_cntr[4]) begin
							rxa_st <= RXA_LOCKED;	
						end
					end											
					RXA_SLIP: begin
						// try the next one
						if (!rx_cntr[4]) begin
							rxa_st <= RXA_FLUSH;
							rx_bitslip[i] <= 1'b1;
						end
					end						
					RXA_LOCKED: begin
						// monitor for errors 
						word_lock[i] <= 1'b1;					
						if (err_cntr[3]) rxa_st <= RXA_FLUSH; 				
					end	
				endcase
			end
		end		
	end
endgenerate

/////////////////////////////////////////////////////////////////////////
// RX cross lane alignment control

reg [LANES-1:0] am_ping = {LANES{1'b0}};

initial rx_underflow = 1'b0;
initial rx_overflow = 1'b0;
always @(posedge rx_clk_in) begin
	rx_underflow <= |rx_empty;
	rx_overflow <= |rx_full;
end

generate
for (i=0; i<LANES; i=i+1) begin : aml
	wire [4:0] tmp_btype = {rx_dout[i*66+37:i*66+34],rx_dout[i*66]};
	
	always @(posedge rx_clk_in) begin
		am_ping[i] <= rx_valid && (tmp_btype == 5'b11001);
	end
end
endgenerate

always @(posedge rx_clk_in) begin
	if (rx_srst) begin
		rx_purge <= {LANES{1'b1}};
		all_word_lock <= 1'b0;		
	end		
	else begin
		all_word_lock <= &word_lock;
		rx_purge <= {LANES{all_word_lock ^ 1'b1}};		
	end
end

deskew_2ln ds (
	.clk(rx_clk_in),
	.srst(rx_srst),
	.word_locked(all_word_lock),
	.am_ping(am_ping),
	.fallback_req(fallback_req),
	.deskew_locked(deskew_locked)
);

/////////////////////////////////////////////////////////////////////////
// TX watchdog

initial tx_overflow = 1'b0;
initial tx_underflow = 1'b0;
always @(posedge tx_clk_in) begin
	tx_underflow <= |tx_empty;
	tx_overflow <= |tx_full;	
end

endmodule
