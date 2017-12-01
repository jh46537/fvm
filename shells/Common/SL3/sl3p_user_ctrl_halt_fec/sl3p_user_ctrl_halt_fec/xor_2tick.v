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
// baeckler - 08-08-2012

module xor_2tick #(
	parameter WIDTH = 36,
	parameter LEAF_SIZE = ((WIDTH > 5*5) ? 6 :
						(WIDTH > 4*4) ? 5 :	4),
	parameter TARGET_CHIP = 2						
)(
	input clk,
	input [WIDTH-1:0] din,
	output dout
);

localparam NUM_LEAVES = (((WIDTH / LEAF_SIZE) * LEAF_SIZE) < WIDTH) ?
			(WIDTH / LEAF_SIZE) + 1 :
			(WIDTH / LEAF_SIZE);

localparam PADDED_LEN = NUM_LEAVES * LEAF_SIZE;

wire [PADDED_LEN-1:0] padded = {PADDED_LEN{1'b0}} | din;
wire [NUM_LEAVES-1:0] leaf;

// synthesis translate off
initial begin
	if (WIDTH > 36) begin
		$display ("%m This block is not suitable for more than 2 levels of 6 LUT");
		$stop();
	end
end
// synthesis translate on

genvar i;
generate
	for (i=0; i<NUM_LEAVES; i=i+1) begin : lp
		xor_r xr (
			.clk(clk),
			.din(padded[(i+1)*LEAF_SIZE-1:i*LEAF_SIZE]),
			.dout(leaf[i])
		);
		defparam xr .WIDTH = LEAF_SIZE;
		defparam xr .TARGET_CHIP = TARGET_CHIP;
	end
endgenerate

xor_r xh (
	.clk(clk),
	.din(leaf),
	.dout(dout)
);
defparam xh .WIDTH = NUM_LEAVES;
defparam xh .TARGET_CHIP = TARGET_CHIP;

endmodule


// BENCHMARK INFO :  EP4S100G5F45C2
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 7
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 7
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.172 ns, From xor_r:lp[1].xr|dout_r, To xor_r:xh|dout_r}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.098 ns, From xor_r:lp[0].xr|dout_r, To xor_r:xh|dout_r}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.182 ns, From xor_r:lp[0].xr|dout_r, To xor_r:xh|dout_r}
