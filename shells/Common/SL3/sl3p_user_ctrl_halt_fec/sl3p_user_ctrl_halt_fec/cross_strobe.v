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

// baeckler - 01-09-2012
// move a pulse from one domain to another

module cross_strobe (
	input din_clk,
	input din_pulse,
	
	input dout_clk,
	output dout_pulse
);

reg din_togl = 1'b0;
always @(posedge din_clk) begin
	din_togl <= din_togl ^ din_pulse;	
end

reg dout_meta = 1'b0 /* synthesis preserve dont_replicate */
/* synthesis ALTERA_ATTRIBUTE = "-name SDC_STATEMENT \"set_false_path -to *cross_strobe*dout_meta\" " */;

reg [2:0] dout_sr = 3'b0 /* synthesis preserve dont_replicate */;
always @(posedge dout_clk) begin
	dout_meta <= din_togl;
	dout_sr <= {dout_sr[1:0],dout_meta};
end

assign dout_pulse = ^dout_sr[2:1];

endmodule
// BENCHMARK INFO :  EP4S100G5F45C2
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 2
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 5
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.273 ns, From din_togl, To dout_meta}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.331 ns, From din_togl, To din_togl}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.331 ns, From din_togl, To din_togl}
