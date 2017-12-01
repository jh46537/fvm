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

// baeckler - 04-15-2013

module armored66_rx #(
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
	output dout_clk,
	output [NUM_LN*66-1:0] dout,
	output dout_valid,
	output [NUM_LN-1:0] dout_fix,  // corrected error
	output [NUM_LN-1:0] dout_fail,  // uncorrected error
	
	input [NUM_LN-1:0] sloop,
	output [NUM_LN-1:0] rx_freqlock,
	output [NUM_LN-1:0] rx_wordlock,
	output deskew_locked,

	output rx_overflow,
	output rx_underflow,
			
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
assign rst_rxd = !ir_rdy_1;

wire [NUM_LN-1:0] bitslip;
wire [40*NUM_LN-1:0] dout_raw;
wire [NUM_LN-1:0] recover_clk;
assign dout_clk = recover_clk[0];
reg [NUM_LN-1:0] rd_en = {NUM_LN{1'b0}};
wire [NUM_LN-1:0] pempty,full,empty;

b40rx_array ir0 (	
	.clk_ref({NUM_LN{clk_ref}}),
	.rst_rxa(rst_rxa),
	.lane_rst_rxd({NUM_LN{rst_rxd}}),
	
	.rx_pin(rx_pin),
	.clk_rx_core(dout_clk),
	.clk_rx_recover(recover_clk),
	
	.rd_en(rd_en),
	.full(full),
	.pfull(),
	.empty(empty),
	.pempty(pempty),
	
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

reg [NUM_LN-1:0] pempty_r = {NUM_LN{1'b0}};
reg [NUM_LN-1:0] empty_r = {NUM_LN{1'b0}};
reg [NUM_LN-1:0] full_r = {NUM_LN{1'b0}};
reg none_pempty = 1'b0;
reg any_empty = 1'b0;
reg any_full = 1'b0;

always @(posedge dout_clk) begin
	pempty_r <= pempty;
	empty_r <= empty;
	full_r <= full;
	none_pempty <= ~|pempty_r;	
	any_empty <= |empty_r;	
	any_full <= |full_r;	
end
assign rx_underflow = any_empty;
assign rx_overflow = any_full;


////////////////////////////////////////////////////////
// rx ECC decoders

reg central_phase = 1'b0 /* synthesis preserve dont_replicate */;
always @(posedge dout_clk) begin
	central_phase <= ~central_phase;
end

wire [NUM_LN*33-1:0] dout_dec;
reg [NUM_LN*66-1:0] dout_r = {(NUM_LN*66){1'b0}};

genvar i;
generate
	for (i=0;i<NUM_LN;i=i+1) begin: dl
		armored40_dec ad (
			.clk(dout_clk),
			.din(dout_raw[(i+1)*40-1:i*40]),
			.dout(dout_dec[(i+1)*33-1:i*33]),
			.dout_fix(dout_fix[i]),
			.dout_fail(dout_fail[i])
		);
		defparam ad .TARGET_CHIP = TARGET_CHIP;
		
		reg local_phase = 1'b0 /* synthesis preserve */;
		always @(posedge dout_clk) begin
			local_phase <= central_phase;
			if (local_phase) begin
				dout_r [i*66+32:i*66+0] <= dout_dec[(i+1)*33-1:i*33];
			end
			else begin
				dout_r [i*66+65:i*66+33] <= dout_dec[(i+1)*33-1:i*33];
			end
		end		
	end
endgenerate
assign dout = dout_r;
assign dout_valid = !central_phase;

////////////////////////////////////////////////////////
// ECC word lock control

generate
	for (i=0;i<NUM_LN;i=i+1) begin: wl
		reg local_wordlock = 1'b0;
		reg local_bitslip = 1'b0;
		reg [4:0] local_cntr = 5'b0;
		reg local_ping = 1'b0;
		reg [3:0] local_err_cnt = 4'b0;
		reg local_any_err = 1'b0;
		
		always @(posedge dout_clk) begin
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

////////////////////////////////////////////////////////
// 33 bit half word phase
 
reg [NUM_LN-1:0] frame_err = {NUM_LN{1'b0}};
reg [NUM_LN-1:0] last_frame_err = {NUM_LN{1'b0}};
reg [NUM_LN-1:0] half_slip = {NUM_LN{1'b0}};

generate
	for (i=0;i<NUM_LN;i=i+1) begin: fl
		
		reg double_fe = 1'b0;
		wire double_fe_grace;
		
		grace_period_64 gp (
			.clk(dout_clk),
			.start_grace(double_fe),
			.grace(double_fe_grace)
		);
		defparam gp .TARGET_CHIP = TARGET_CHIP;

		always @(posedge dout_clk) begin
			double_fe <= frame_err[i] & last_frame_err[i];		
			half_slip[i] <= double_fe & !double_fe_grace;
		
			if (dout_valid) begin
				frame_err[i] <= (~^dout_r[i*66+1:i*66]) & rx_wordlock[i]; 		
				last_frame_err[i] <= frame_err[i];
			end			
		end
	end
endgenerate

////////////////////////////////////////////////////////
// cross lane deskew control

reg [NUM_LN-1:0] am_ping = {NUM_LN{1'b0}};
generate
for (i=0; i<NUM_LN; i=i+1) begin : aml
	wire [4:0] tmp_btype = {dout[i*66+37:i*66+34],dout[i*66]};
	
	always @(posedge dout_clk) begin
		am_ping[i] <= dout_valid && (tmp_btype == 5'b11001);
	end
end
endgenerate

reg all_word_lock = 1'b0;
always @(posedge dout_clk) begin
	all_word_lock <= &rx_wordlock;
end

wire dout_srst;
sync_regs sr0 (
	.clk(dout_clk),
	.din(rst_rxd),
	.dout(dout_srst)
);
defparam sr0 .WIDTH = 1;

wire [NUM_LN-1:0] fallback_req;
sl3p_deskew ds (
	.clk(dout_clk),
	.srst(dout_srst),
	.word_locked(all_word_lock),
	.am_ping(am_ping),
	.fallback_req(fallback_req),
	.deskew_locked(deskew_locked)
);
defparam ds .NUM_LN = NUM_LN;

////////////////////////////////////////////////////////
// read enable control

always @(posedge dout_clk) begin
	rd_en <= {NUM_LN{none_pempty}} & ~half_slip & ~fallback_req;
end

endmodule

