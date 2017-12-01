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

// baeckler - 01-11-2012

module dip8_48 (
	input [47:0] d,
	output [7:0] p
);

// grid pattern

// 47 46 45 44 43 42 41 40
// 39 38 37 36 35 34 33 32
// 31 30 29 28 27 26 25 24
// 23 22 21 20 19 18 17 16
// 15 14 13 12 11 10 09 08
// 07 06 05 04 03 02 01 00
// p7 p6 p5 p4 p3 p2 p1 p0

assign p[7] = d[0] ^ d[9] ^ d[18] ^ d[27] ^ d[36] ^ d[45];
assign p[6] = d[7] ^ d[8] ^ d[17] ^ d[26] ^ d[35] ^ d[44];
assign p[5] = d[6] ^ d[15] ^ d[16] ^ d[25] ^ d[34] ^ d[43];
assign p[4] = d[5] ^ d[14] ^ d[23] ^ d[24] ^ d[33] ^ d[42];
assign p[3] = d[4] ^ d[13] ^ d[22] ^ d[31] ^ d[32] ^ d[41];
assign p[2] = d[3] ^ d[12] ^ d[21] ^ d[30] ^ d[39] ^ d[40];
assign p[1] = d[2] ^ d[11] ^ d[20] ^ d[29] ^ d[38] ^ d[47];
assign p[0] = d[1] ^ d[10] ^ d[19] ^ d[28] ^ d[37] ^ d[46];

// C version

// p = (d>>0) ^ (d>>9) ^ (d>>18) ^ (d>>27) ^ (d>>36) ^ (d>>45)) & 1);
// p = (p<<1) | (((d>>7) ^ (d>>8) ^ (d>>17) ^ (d>>26) ^ (d>>35) ^ (d>>44)) & 1);
// p = (p<<1) | (((d>>6) ^ (d>>15) ^ (d>>16) ^ (d>>25) ^ (d>>34) ^ (d>>43)) & 1);
// p = (p<<1) | (((d>>5) ^ (d>>14) ^ (d>>23) ^ (d>>24) ^ (d>>33) ^ (d>>42)) & 1);
// p = (p<<1) | (((d>>4) ^ (d>>13) ^ (d>>22) ^ (d>>31) ^ (d>>32) ^ (d>>41)) & 1);
// p = (p<<1) | (((d>>3) ^ (d>>12) ^ (d>>21) ^ (d>>30) ^ (d>>39) ^ (d>>40)) & 1);
// p = (p<<1) | (((d>>2) ^ (d>>11) ^ (d>>20) ^ (d>>29) ^ (d>>38) ^ (d>>47)) & 1);
// p = (p<<1) | (((d>>1) ^ (d>>10) ^ (d>>19) ^ (d>>28) ^ (d>>37) ^ (d>>46)) & 1);

endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 8
// BENCHMARK INFO :  Memory ALUTs : 0
// BENCHMARK INFO :  Dedicated logic registers : 0
// BENCHMARK INFO :  Total block memory bits : 0
