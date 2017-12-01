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

module armored40_enc #(
	parameter TARGET_CHIP = 2,
	parameter SCRAM_INIT = 33'h12345678
)(
	input clk,
	input sclr,
	input [32:0] din,
	output [39:0] dout
);

//////////////////////////////////////////////////////////
// scrambler

wire [32:0] scr;
scrambler_33 sc (
	.clk(clk),
	.srst(sclr),
	.din(din),		// bit 0 is to be sent first
	.dout(scr)
);

defparam sc .TARGET_CHIP = TARGET_CHIP;
defparam sc .WIDTH = 33;
defparam sc .SCRAM_INIT = SCRAM_INIT;


//////////////////////////////////////////////////////////
// ecc encoder

wire [39:0] enc_d;
ecc_enc_40_33 en (
    .clk(clk),
    .din(scr),
    .dout(enc_d)
);
defparam en .TARGET_CHIP = TARGET_CHIP;

//////////////////////////////////////////////////////////
// interleave 2 words

ilv2 il (
	.clk(clk),
	.din(enc_d),
	.dout(dout)
);
defparam il .WIDTH = 40;

endmodule

