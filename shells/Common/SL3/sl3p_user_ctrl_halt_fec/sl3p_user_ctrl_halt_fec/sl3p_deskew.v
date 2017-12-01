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

// baeckler  - 11-05-2012

module sl3p_deskew #(
	parameter NUM_LN = 16
)(
	input clk,
	input srst,
	input word_locked,
	input [NUM_LN-1:0] am_ping,
	output reg [NUM_LN-1:0] fallback_req,
	output reg deskew_locked
);

initial fallback_req = {NUM_LN{1'b0}};
initial deskew_locked = 1'b0;

reg [NUM_LN-1:0] am_ping_r = {NUM_LN{1'b0}};
always @(posedge clk) begin
	am_ping_r <= am_ping;
end

///////////////////////////////////////////////////////////
// monitor alignment pings and the following time window.

wire [NUM_LN-1:0] recent_ping;
genvar i;
generate
	for (i=0; i<NUM_LN; i=i+1) begin : gp
		grace_period_8 gp0 (
			.clk(clk),
			.start_grace(am_ping_r[i]),
			.grace(recent_ping[i])
		);	
	end
endgenerate

///////////////////////////////////////////////////////////
// look for neighbors pinging during my post-ping window

reg [NUM_LN-1:0] too_soon = {NUM_LN{1'b0}};
wire [NUM_LN-1:0] up_neighbor = {1'b0,am_ping_r[NUM_LN-1:1]};
wire [NUM_LN-1:0] dn_neighbor = {am_ping_r[NUM_LN-2:0],1'b0};
		
generate
	if (NUM_LN == 2) begin
		always @(posedge clk) too_soon <= recent_ping & (up_neighbor | dn_neighbor);
	end
	else begin
		wire [NUM_LN-1:0] up2_neighbor = {2'b0,am_ping_r[NUM_LN-1:2]};
		wire [NUM_LN-1:0] dn2_neighbor = {am_ping_r[NUM_LN-3:0],2'b0};

		always @(posedge clk) too_soon <= recent_ping & 
			(up_neighbor | dn_neighbor | up2_neighbor | dn2_neighbor);
	end
endgenerate

///////////////////////////////////////////////////////////
// combine flags

wire any_am_ping;
or_r oor (
    .clk(clk),
    .din(am_ping_r),
    .dout(any_am_ping)
);
defparam oor .WIDTH = NUM_LN;

wire all_am_ping;
and_r ap (
    .clk(clk),
    .din(am_ping_r),
    .dout(all_am_ping)
);
defparam ap .WIDTH = NUM_LN;

///////////////////////////////////////////////////////////
// control

reg deskew_caution = 1'b0;
always @(posedge clk) begin
	if (srst || !word_locked) begin
		deskew_locked <= 1'b0;
		fallback_req <= {NUM_LN{1'b0}};
		deskew_caution <= 1'b0;
	end
	else begin
		fallback_req <= {NUM_LN{1'b0}};
		if (deskew_locked) begin
			// look for a problem serious enough to unlock
			if (any_am_ping && !all_am_ping) begin
				if (deskew_caution) deskew_locked <= 1'b0;
				deskew_caution <= 1'b1;
			end
			if (all_am_ping) deskew_caution <= 1'b0;	
		end
		else begin
			// try to become aligned
			deskew_caution <= 1'b0;
			if (all_am_ping) deskew_locked <= 1'b1;
			fallback_req <= too_soon;
		end
	end
end

endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Total registers : 124
// BENCHMARK INFO :  Total pins : 36
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.278 ns, From am_ping_r[9], To grace_period_8:gp[9].gp0|cntr[0]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.204 ns, From am_ping_r[14], To or_r:oor|or_r:lp[3].a|dout_r}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.317 ns, From grace_period_8:gp[12].gp0|cntr[0], To grace_period_8:gp[12].gp0|cntr[0]}
