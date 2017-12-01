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
// baeckler - 11-07-2012
// make it a little more convenient to do single LUT variable width XORs
// add option to force to VCC
//DV_FIX default_nettype//`default_nettype wire
module xor_lut_v #(
	parameter TARGET_CHIP = 2,
	parameter WIDTH = 5 
)(
	input [WIDTH-1:0] din,
	input force_vcc,
	output dout
);

wire [4:0] d = 5'h0 | (din << (5-WIDTH));

wys_lut w (
	.a(force_vcc),
	.b(d[0]),
	.c(d[1]),
	.d(d[2]),
	.e(d[3]),
	.f(d[4]),
	.out(dout)	
);
defparam w .TARGET_CHIP = TARGET_CHIP;
defparam w .MASK = 64'hEBBEBEEBBEEBEBBE; // xor5(b..f) or A
	
endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 1
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 0
// BENCHMARK INFO :  Total block memory bits : 0
