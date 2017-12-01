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
// unregistered 2 LUT deep XOR, with force VCC option
//DV_FIX default_nettype//`default_nettype wire
module xor_ur2_v #(
	parameter WIDTH = 30,
	parameter LEAF_SIZE = ((WIDTH > 5*5) ? 6 :
						(WIDTH > 5*4) ? 5 :
						(WIDTH > 5*3) ? 4 : 3),
	parameter TARGET_CHIP = 2						
)(
	input force_vcc,
	input [WIDTH-1:0] din,
	output dout
);

localparam NUM_LEAVES = (((WIDTH / LEAF_SIZE) * LEAF_SIZE) < WIDTH) ?
			(WIDTH / LEAF_SIZE) + 1 :
			(WIDTH / LEAF_SIZE);

localparam PADDED_LEN = NUM_LEAVES * LEAF_SIZE;

wire [PADDED_LEN-1:0] padded = {PADDED_LEN{1'b0}} | din;
wire [NUM_LEAVES-1:0] leaf;

genvar i;
generate
	for (i=0; i<NUM_LEAVES; i=i+1) begin : lp
		xor_lut xr (
			.din(padded[(i+1)*LEAF_SIZE-1:i*LEAF_SIZE]),
			.dout(leaf[i])
		);
		defparam xr .WIDTH = LEAF_SIZE;
		defparam xr .TARGET_CHIP = TARGET_CHIP;
	end
endgenerate

xor_lut_v xh (
	.din(leaf),
	.force_vcc(force_vcc),
	.dout(dout)
);
defparam xh .WIDTH = NUM_LEAVES;
defparam xh .TARGET_CHIP = TARGET_CHIP;

endmodule

