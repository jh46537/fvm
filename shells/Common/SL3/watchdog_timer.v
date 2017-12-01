`timescale 1 ps / 1 ps
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

// baeckler - 01-07-2012
//DV_FIX default_nettype//`default_nettype wire
module watchdog_timer #(
	parameter CNTR_BITS = 8	
)(
	input clk,
	input srst,
	output expired
);

reg [CNTR_BITS:0] cntr = {(CNTR_BITS+1){1'b0}};

always @(posedge clk) begin
	if (srst) cntr <= {(CNTR_BITS+1){1'b0}};
	else if (!cntr[CNTR_BITS]) cntr <= cntr + 1'b1;
end
assign expired = cntr[CNTR_BITS];

endmodule
// BENCHMARK INFO :  EP4S100G5F45C2
// BENCHMARK INFO :  Max depth :  2.8 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 11
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 9
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.001 ns, From cntr[8], To cntr[8]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.903 ns, From cntr[8], To cntr[8]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.903 ns, From cntr[8], To cntr[8]}
