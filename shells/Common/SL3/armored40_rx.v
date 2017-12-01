`timescale 1 ps / 1 ps
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

// baeckler - 04-02-2013

module armored40_rx #(
	parameter NUM_LN = 4,
	parameter RX_REF = "644.53125 MHz",
	parameter DRATE = "10312.5 Mbps",
	parameter RST_CNTR = 16, // nominal 16/20 or 6 for fast simulation of reset seq
	parameter TARGET_CHIP = 2
)(
	input clk100,  // reset management + reconfig
	input rst100, // this fires the entire cycle
	
	input clk_ref,  // to CDR
	
	input [NUM_LN-1:0] rx_pin,		// to HS pin
	output [NUM_LN-1:0] dout_clk,
	output [NUM_LN*33-1:0] dout,
	output [NUM_LN-1:0] dout_fix,  // corrected error
	output [NUM_LN-1:0] dout_fail,  // uncorrected error
	
	input [NUM_LN-1:0] sloop,
	output [NUM_LN-1:0] rx_freqlock,
	output [NUM_LN-1:0] rx_wordlock,
	
	input  [NUM_LN*70-1:0] reconfig_to_xcvr,
	output [NUM_LN*46-1:0] reconfig_from_xcvr	
);


////////////////////////////////////////////////////////
// rx pin array

wire rst_rxa;

wire ir_rdy_0;
reset_delay ird0 (
    .clk(clk100),
    .ready_in(!rst100),
    .ready_out(ir_rdy_0)
);
defparam ird0 .CNTR_BITS = RST_CNTR;
assign rst_rxa = !ir_rdy_0;

wire ir_rdy_1;
reset_delay ird1 (
    .clk(clk100),
    .ready_in(ir_rdy_0 & (&rx_freqlock)),
    .ready_out(ir_rdy_1)
);
defparam ird1 .CNTR_BITS = RST_CNTR;
wire rst_rxd;
wire clk_rx_io;
assign rst_rxd = !ir_rdy_1;

wire [NUM_LN-1:0] clk_rx_recover;
assign clk_rx_io = clk_rx_recover[NUM_LN/4];

wire [NUM_LN-1:0] bitslip;
wire [40*NUM_LN-1:0] dout_raw;

r40rx_array ir0 (	
	.clk_ref({NUM_LN{clk_ref}}),
	.rst_rxa(rst_rxa),
	.lane_rst_rxd({NUM_LN{rst_rxd}}),
	
	.rx_pin(rx_pin),
	.clk_rx_core(dout_clk),
	.clk_rx_recover(dout_clk),
	.rx_freqlock(rx_freqlock),	
	.rx_bitslip(bitslip),
	.sloop(sloop),
	
	.rx_data(dout_raw),	// lsb first
			
	.reconfig_to_xcvr(reconfig_to_xcvr),       
	.reconfig_from_xcvr(reconfig_from_xcvr)      		
);
defparam ir0 .NUM_LN = NUM_LN;
defparam ir0 .RX_REF = RX_REF;
defparam ir0 .DRATE = DRATE;

////////////////////////////////////////////////////////
// rx decoders

genvar i;
generate
	for (i=0;i<NUM_LN;i=i+1) begin: dl
		armored40_dec ad (
			.clk(dout_clk[i]),
			.din(dout_raw[(i+1)*40-1:i*40]),
			.dout(dout[(i+1)*33-1:i*33]),
			.dout_fix(dout_fix[i]),
			.dout_fail(dout_fail[i])
		);
		defparam ad .TARGET_CHIP = TARGET_CHIP;
	end
endgenerate

////////////////////////////////////////////////////////
// word lock control

generate
	for (i=0;i<NUM_LN;i=i+1) begin: wl
		reg local_wordlock = 1'b0;
		reg local_bitslip = 1'b0;
		reg [3:0] local_cntr = 4'b0;
		reg local_ping = 1'b0;
		reg [3:0] local_err_cnt = 4'b0;
		reg local_any_err = 1'b0;
		
		always @(posedge dout_clk[i]) begin
			local_cntr <= local_cntr + 1'b1;
			local_ping <= &local_cntr;
			if (local_ping) begin
				local_err_cnt <= 4'b0;
				local_any_err <= 1'b0;
			end
			else begin
				local_err_cnt <= local_err_cnt + (dout_fix[i] | dout_fail[i]);
				local_any_err <= (dout_fix[i] | dout_fail[i] | local_any_err);
			end
			if (local_ping) local_bitslip <= 1'b0;
			
			if (local_wordlock) begin
				if (local_err_cnt[3]) begin
					// 8 or more errors in window -> unlock
					local_wordlock <= 1'b0;
				end
			end
			else begin
				if (local_ping) begin
					if (local_bitslip) begin
						// flushed out, start observing
						local_bitslip <= 1'b0;
					end
					else begin
						// observing - slip on any errors, lock on none
						if (local_any_err) local_bitslip <= 1'b1;
						else local_wordlock <= 1'b1;
					end
				end
			end
		end	
		
		assign rx_wordlock[i] = local_wordlock;
		assign bitslip[i] = local_bitslip;
	end
endgenerate

endmodule


// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : N/A until Partition Merge
// BENCHMARK INFO :  Total pins : N/A until Partition Merge
// BENCHMARK INFO :  Total virtual pins : N/A until Partition Merge
// BENCHMARK INFO :  Total block memory bits : N/A until Partition Merge
