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

`timescale 1 ps / 1 ps
// baeckler - 05-9-2012

module eq_66_const #(
	parameter TARGET_CHIP = 2,
	parameter VAL = 66'h1234
)(
	input clk,
	input [65:0] din,
	output match
);

genvar i;

wire [10:0] subeq;
generate 
	for (i=0; i<11; i=i+1) begin : lp
		eq_6_const eq (
			.din(din[(i+1)*6-1:i*6]),
			.match(subeq[i])
		);
		defparam eq .TARGET_CHIP = TARGET_CHIP;
		defparam eq .VAL = VAL[(i+1)*6-1:i*6];
	end
endgenerate

reg [10:0] subeq_r = 11'b0;
always @(posedge clk) subeq_r <= subeq;

and_r ar (
	.clk(clk),
	.din({1'b1,subeq_r}),
	.dout(match)
);
defparam ar .WIDTH = 12;

endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 14
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 14
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.453 ns, From subeq_r[2], To and_r:ar|and_r:lp[0].a|dout_r}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.423 ns, From subeq_r[10], To and_r:ar|and_r:lp[1].a|dout_r}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.438 ns, From subeq_r[2], To and_r:ar|and_r:lp[0].a|dout_r}
