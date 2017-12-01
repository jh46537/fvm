// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module a10_temp_sense (
	corectl,
	eoc,
	reset,
	tempout);

	input	corectl;
	input	reset;
	output	eoc;
	output	[9:0]  tempout;
	
	wire  wire_eoc;
	wire  [9:0]   wire_tempout;
	
	twentynm_tsdblock   sd1( 
		.corectl(corectl),
		.eoc(wire_eoc),
		.reset(reset),
		.tempout(wire_tempout));
		
	assign
		eoc = wire_eoc,
		tempout = wire_tempout;

endmodule