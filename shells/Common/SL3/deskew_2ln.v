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

// baeckler  - 11-05-2012

module deskew_2ln (
	input clk,
	input srst,
	input word_locked,
	input [1:0] am_ping,
	output reg [1:0] fallback_req,
	output reg deskew_locked
);

initial fallback_req = 2'b0;
initial deskew_locked = 1'b0;

reg [1:0] am_ping_r;
always @(posedge clk) begin
	am_ping_r <= am_ping;
end

wire [1:0] recent_ping;
grace_period_8 gp0 (
	.clk(clk),
	.start_grace(am_ping_r[0]),
	.grace(recent_ping[0])
);

grace_period_8 gp1 (
	.clk(clk),
	.start_grace(am_ping_r[1]),
	.grace(recent_ping[1])
);

reg deskew_caution = 1'b0;
always @(posedge clk) begin
	if (srst || !word_locked) begin
		deskew_locked <= 1'b0;
		fallback_req <= 2'b0;
		deskew_caution <= 1'b0;
	end
	else begin
		fallback_req <= 2'b0;
		if (deskew_locked) begin
			// look for a problem serious enough to unlock
			if (^am_ping_r) begin
				if (deskew_caution) deskew_locked <= 1'b0;
				deskew_caution <= 1'b1;
			end
			if (&am_ping_r) deskew_caution <= 1'b0;	
		end
		else begin
			// try to become aligned
			deskew_caution <= 1'b0;
			if (&am_ping_r) deskew_locked <= 1'b1;
			fallback_req[0] <=  am_ping_r[1] & recent_ping[0];
			fallback_req[1] <=  am_ping_r[0] & recent_ping[1];								
		end
	end
end

endmodule