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

`default_nettype none

// baeckler - 01-08-2012

module shell_sync_regs #(
	parameter WIDTH = 32,
	parameter DEPTH = 2		// minimum of 2
)(
	input  wire              clk,
	input  wire  [WIDTH-1:0] din,
	output logic [WIDTH-1:0] dout
);

reg [WIDTH-1:0] din_meta = 0 /* synthesis preserve dont_replicate */
/* synthesis ALTERA_ATTRIBUTE = "-name SDC_STATEMENT \"set_false_path -to [get_keepers *shell_sync_regs*din_meta\[*\]]\" " */;

reg [WIDTH*(DEPTH-1)-1:0] sync_sr = 0 /* synthesis preserve dont_replicate */;

always @(posedge clk) begin
	din_meta <= din;
	sync_sr <= (sync_sr << WIDTH) | din_meta;
end
assign dout = sync_sr[WIDTH*(DEPTH-1)-1:WIDTH*(DEPTH-2)];

endmodule

`default_nettype wire

