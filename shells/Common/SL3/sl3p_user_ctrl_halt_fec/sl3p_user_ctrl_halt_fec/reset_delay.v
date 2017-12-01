// Copyright 2010 Altera Corporation. All rights reserved.  
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
// baeckler - 12-17-2009

// when not ready_in - immediately not ready_out
// when ready_in - wait for counter, then ready out synchronously

module reset_delay #(
	parameter CNTR_BITS = 16
)
(
	input clk,
	input ready_in,
	output ready_out
);

reg [2:0] rs_meta = 3'b0 /* synthesis preserve dont_replicate */
/* synthesis ALTERA_ATTRIBUTE = "-name SDC_STATEMENT \"set_false_path -from [get_fanins -async *reset_delay*rs_meta\[*\]] -to [get_keepers *reset_delay*rs_meta\[*\]]\" " */;

always @(posedge clk or negedge ready_in) begin
	if (!ready_in) rs_meta <= 3'b000;
	else rs_meta <= {rs_meta[1:0],1'b1};
end
wire ready_sync = rs_meta[2];

reg [CNTR_BITS-1:0] cntr = {CNTR_BITS{1'b0}} /* synthesis preserve */;
assign ready_out = cntr[CNTR_BITS-1];
always @(posedge clk or negedge ready_sync) begin
	if (!ready_sync) cntr <= {CNTR_BITS{1'b0}};
	else if (!ready_out) cntr <= cntr + 1'b1;
end

endmodule
// BENCHMARK INFO :  EP4S100G5F45C2
// BENCHMARK INFO :  Max depth :  3.4 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 17
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 18
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.851 ns, From cntr[0], To cntr[15]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.852 ns, From cntr[0], To cntr[15]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.852 ns, From cntr[0], To cntr[15]}
