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

module scrambler_33 #(
	parameter TARGET_CHIP = 2,
	parameter WIDTH = 33,
	parameter SCRAM_INIT = 33'h1_ffff_ffff
)(
	input clk,srst,
	input [WIDTH-1:0] din,		// bit 0 is to be sent first
	output reg [WIDTH-1:0] dout
);

reg [32:0] scram_state = SCRAM_INIT;
wire [WIDTH+33-1:0] history;
assign history [32:0] = scram_state;

genvar i;
generate
	for (i=33; i<WIDTH+33; i=i+1) begin : lp
		assign history[i] = 
			(history[i-33] ^ history[i-21] ^ history[i-20] ^ history[i-9]) ^ din[i-33];		
	end
endgenerate

initial dout = {WIDTH{1'b0}};
always @(posedge clk) begin
	if (srst) begin
		dout <= 0;
		scram_state <= SCRAM_INIT;
	end
	else begin
		dout <= history[WIDTH+33-1:33];
		scram_state <= history[WIDTH+33-1:WIDTH];
	end
end


endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : 66
// BENCHMARK INFO :  Total pins : 2
// BENCHMARK INFO :  Total virtual pins : 66
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.978 ns, From scram_state[17], To scram_state[13]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.013 ns, From scram_state[26], To scram_state[29]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.900 ns, From scram_state[8], To scram_state[8]}
