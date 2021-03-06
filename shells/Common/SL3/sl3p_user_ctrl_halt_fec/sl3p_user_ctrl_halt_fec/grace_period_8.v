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
module grace_period_8 #(
	parameter TARGET_CHIP = 2
)(
	input clk,
	input start_grace,
	output grace
);

reg [3:0] cntr = 4'b0 /* synthesis preserve */;
wire [4:0] din = {cntr,start_grace};
wire [3:0] dout_w;

always @(posedge clk) cntr <= dout_w;
assign grace = cntr[3];

wys_lut w0 (.a(1'b1),.b(din[4]),.c(din[3]),.d(din[2]),.e(din[1]),.f(din[0]),.out(dout_w[0]));
defparam w0 .MASK = 64'h00000000f000ffff;
defparam w0 .TARGET_CHIP = TARGET_CHIP;

wys_lut w1 (.a(1'b1),.b(din[4]),.c(din[3]),.d(din[2]),.e(din[1]),.f(din[0]),.out(dout_w[1]));
defparam w1 .MASK = 64'h00000000f0ffff00;
defparam w1 .TARGET_CHIP = TARGET_CHIP;

wys_lut w2 (.a(1'b1),.b(din[4]),.c(din[3]),.d(din[2]),.e(din[1]),.f(din[0]),.out(dout_w[2]));
defparam w2 .MASK = 64'h00000000fff0f0f0;
defparam w2 .TARGET_CHIP = TARGET_CHIP;

wys_lut w3 (.a(1'b1),.b(din[4]),.c(din[3]),.d(din[2]),.e(din[1]),.f(din[0]),.out(dout_w[3]));
defparam w3 .MASK = 64'hffffffff0ccccccc;
defparam w3 .TARGET_CHIP = TARGET_CHIP;

endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 4
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 4
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.993 ns, From cntr[1], To cntr[3]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.352 ns, From cntr[0], To cntr[2]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.408 ns, From cntr[0], To cntr[2]}
