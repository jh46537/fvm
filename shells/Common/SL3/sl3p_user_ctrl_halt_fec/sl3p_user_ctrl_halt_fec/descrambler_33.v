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


// baeckler - 04-01-2013
// polynomial 0x100180100  1 + x^9 + x^20 + x^21 + x^33   (max period)

// to cut down pins for testing -
// set_instance_assignment -name VIRTUAL_PIN ON -to din
// set_instance_assignment -name VIRTUAL_PIN ON -to dout

module descrambler_33 #(
	parameter TARGET_CHIP = 2,
	parameter WIDTH = 33
)(	
	input clk,
	input [WIDTH-1:0] din,		// bit 0 is used first
	output reg [WIDTH-1:0] dout
);

reg [32:0] scram_state = {33{1'b1}};
wire [WIDTH+33-1:0] history;
wire [WIDTH-1:0] dout_w;
assign history = {din,scram_state};

genvar i;
generate
	for (i=0; i<WIDTH; i=i+1) begin : lp
		wys_lut w (
			.f(history[33+i-33]),
			.e(history[33+i-21]),
			.d(history[33+i-20]),
			.c(history[33+i-9]),
			.b(history[33+i]),
			.a(1'b0),
			.out(dout_w[i]));
		defparam w .MASK = 64'h6996966996696996;
		defparam w .TARGET_CHIP = TARGET_CHIP;
		
	end
endgenerate

initial dout = {WIDTH{1'b0}};	
always @(posedge clk) begin
	scram_state <= history[WIDTH+33-1:WIDTH];
	dout <= dout_w;	
end

endmodule
	

// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : 66
// BENCHMARK INFO :  Total pins : 1
// BENCHMARK INFO :  Total virtual pins : 66
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.459 ns, From scram_state[23], To dout[23]~reg0}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.436 ns, From scram_state[10], To dout[10]~reg0}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.487 ns, From scram_state[31], To dout[19]~reg0}
