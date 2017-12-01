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

// baeckler - 03-15-2013
// semi fancy variable latency decomposed XOR tree

module f_xor #(
	parameter WIDTH = 10,
	parameter LATENCY = 3,
	parameter TARGET_CHIP = 2,
	parameter HEAD_INVERT = 1'b0
)(
	input clk,
	output dout,
	input [WIDTH-1:0] din	
);

localparam ROUGH_HEXES = WIDTH / 6;
localparam RESIDUE_HEXES = WIDTH % 6;
localparam ROUGH_QUINTS = WIDTH / 5;
localparam RESIDUE_QUINTS = WIDTH % 5;
localparam ROUGH_QUADS = WIDTH / 4;
localparam RESIDUE_QUADS = WIDTH % 4;

localparam GOOD_LEAF = (RESIDUE_HEXES == 0) ? 6 :
			(RESIDUE_QUINTS == 0) ? 5 :
			(RESIDUE_QUADS == 0) ? 4 : 6;
			
localparam ROUGH_LEAVES = WIDTH / GOOD_LEAF;
localparam LEAVES = ((ROUGH_LEAVES * GOOD_LEAF) >= WIDTH) ? ROUGH_LEAVES :
		ROUGH_LEAVES + 1;

genvar i;

generate
	if (WIDTH == 1) begin
		if (LATENCY == 0) begin
			// down to a wire and done
			assign dout = din;
		end
		else begin
			// eat up extra latency
			reg [LATENCY-1:0] d = {LATENCY{1'b0}};
			always @(posedge clk) d <= (d << 1) | din;
			assign dout = d[LATENCY-1];
		end
	end
	else if (WIDTH <= 6) begin
		// bite off the last LUT
		// and take the head inversion if required
		wire xw;
		xor_lut xl (.din(din),.dout(xw));
		defparam xl .WIDTH = WIDTH;
		defparam xl .TARGET_CHIP = TARGET_CHIP;
		defparam xl .INVERT = HEAD_INVERT;
		
		// finish off the registers if any
		f_xor fx (.clk(clk),.dout(dout),.din(xw));
		defparam fx .WIDTH = 1;
		defparam fx .LATENCY = LATENCY;
		defparam fx .TARGET_CHIP = TARGET_CHIP;
		defparam fx .HEAD_INVERT = 1'b0;
	end
	else begin
		// serious width
		// bite off a layer of leaves		
		wire [LEAVES*GOOD_LEAF-1:0] pad_din = {(LEAVES*GOOD_LEAF){1'b0}} | din;
		wire [LEAVES-1:0] xw;
		for (i=0; i<LEAVES; i=i+1) begin : xll
			xor_lut xl (.din(pad_din[(i+1)*GOOD_LEAF-1:i*GOOD_LEAF]),
				.dout(xw[i]));
			defparam xl .WIDTH = GOOD_LEAF;
			defparam xl .TARGET_CHIP = TARGET_CHIP;			
		end
		
		// if latency is available register the leaves
		reg [LEAVES-1:0] xr;
		if (LATENCY > 0) begin
			initial  xr = {LEAVES{1'b0}};
			always @(posedge clk) xr <= xw;
		end
		else begin
			always @(*) xr = xw;
		end
		
		// recurse on the leaves
		f_xor fx (.clk(clk),.dout(dout),.din(xr));
		defparam fx .WIDTH = LEAVES;
		defparam fx .LATENCY = (LATENCY > 0) ? LATENCY - 1 : 0;
		defparam fx .TARGET_CHIP = TARGET_CHIP;		
		defparam fx .HEAD_INVERT = HEAD_INVERT;
	end
endgenerate
	

endmodule

// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : 4
// BENCHMARK INFO :  Total pins : 12
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.523 ns, From f_xor:fx|f_xor:fx|d[0], To f_xor:fx|f_xor:fx|d[1]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.647 ns, From xr[1], To f_xor:fx|f_xor:fx|d[0]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.521 ns, From f_xor:fx|f_xor:fx|d[0], To f_xor:fx|f_xor:fx|d[1]}
