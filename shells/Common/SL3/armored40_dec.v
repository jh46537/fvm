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

module armored40_dec #(
    parameter TARGET_CHIP = 2
)(
    input clk,
    input [39:0] din,
    output [32:0] dout,
    output reg dout_fix,
    output reg dout_fail
);

//////////////////////////////////////////////////////////
// deinterleave

wire [39:0] din_dl;
dlv2 dl (
	.clk(clk),
	.din(din),
	.dout(din_dl)
);
defparam dl .WIDTH = 40;

//////////////////////////////////////////////////////////
// ecc decoder
// 33 data bits
// 7 parity bits

wire [32:0] dout_dec;
wire dout_dec_fix, dout_dec_fail;

ecc_dec_40_33 ed (
    .clk(clk),
    .din(din_dl),
    .dout(dout_dec),
    .dout_err(dout_dec_fix),
    .dout_fail(dout_dec_fail)
);
defparam ed .TARGET_CHIP = TARGET_CHIP;

//////////////////////////////////////////////////////////
// descrambler

wire [32:0] ds_dat;
descrambler_33 ds (
	.clk(clk),
	.din(dout_dec),		// bit 0 is to be sent first
	.dout(dout)
);
defparam ds .TARGET_CHIP = TARGET_CHIP;
defparam ds .WIDTH = 33;

initial dout_fix = 1'b0;
initial dout_fail = 1'b0;
always @(posedge clk) begin
	dout_fix <= dout_dec_fix;
	dout_fail <= dout_dec_fail;
end

endmodule


// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : 275
// BENCHMARK INFO :  Total pins : 76
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.115 ns, From ecc_dec_40_33:ed|f_xor:sx1|f_xor:fx|f_xor:fx|d[0], To ecc_dec_40_33:ed|ds[34]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.098 ns, From ecc_dec_40_33:ed|f_xor:sx6|f_xor:fx|f_xor:fx|d[0], To ecc_dec_40_33:ed|ds[6]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.268 ns, From ecc_dec_40_33:ed|f_xor:sx6|f_xor:fx|f_xor:fx|d[0], To ecc_dec_40_33:ed|ds[35]}
