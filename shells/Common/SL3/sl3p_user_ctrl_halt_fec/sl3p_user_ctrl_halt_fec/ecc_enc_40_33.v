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

// baeckler - 03-18-2013

module ecc_enc_40_33 #(
    parameter TARGET_CHIP = 2,
    parameter PINVERT = 1'b1  // invert the parity XORs
)(
    input clk,
    input [32:0] din,
    output [39:0] dout
);
// 33 data bits
// 7 parity bits

localparam ENC_LATENCY = 2;

wire [32:0] dd;
delay_regs dr0 (.clk(clk),.din(din),.dout(dd));
defparam dr0 .WIDTH = 33;
defparam dr0 .LATENCY = ENC_LATENCY;

wire [32:0] d = din;

wire [6:0] p;
assign dout = {dd[32],dd[31],dd[30],dd[29],dd[28],dd[27],dd[26],p[6],dd[25],dd[24],dd[23],dd[22],dd[21],dd[20],dd[19],dd[18],dd[17],dd[16],dd[15],dd[14],dd[13],dd[12],dd[11],p[5],dd[10],dd[9],dd[8],dd[7],dd[6],dd[5],dd[4],p[4],dd[3],dd[2],dd[1],p[3],dd[0],p[2],p[1],p[0]};

f_xor px1 (.clk(clk),.dout(p[1]),.din({d[0],d[1],d[3],d[4],d[6],d[8],d[10],d[11],d[13],d[15],d[17],d[19],d[21],d[23],d[25],d[26],d[28],d[30],d[32]}));
defparam px1 .WIDTH = 19;
defparam px1 .TARGET_CHIP = TARGET_CHIP;
defparam px1 .LATENCY = ENC_LATENCY;
defparam px1 .HEAD_INVERT = PINVERT;

f_xor px2 (.clk(clk),.dout(p[2]),.din({d[0],d[2],d[3],d[5],d[6],d[9],d[10],d[12],d[13],d[16],d[17],d[20],d[21],d[24],d[25],d[27],d[28],d[31],d[32]}));
defparam px2 .WIDTH = 19;
defparam px2 .TARGET_CHIP = TARGET_CHIP;
defparam px2 .LATENCY = ENC_LATENCY;
defparam px2 .HEAD_INVERT = PINVERT;

f_xor px3 (.clk(clk),.dout(p[3]),.din({d[1],d[2],d[3],d[7],d[8],d[9],d[10],d[14],d[15],d[16],d[17],d[22],d[23],d[24],d[25],d[29],d[30],d[31],d[32]}));
defparam px3 .WIDTH = 19;
defparam px3 .TARGET_CHIP = TARGET_CHIP;
defparam px3 .LATENCY = ENC_LATENCY;
defparam px3 .HEAD_INVERT = PINVERT;

f_xor px4 (.clk(clk),.dout(p[4]),.din({d[4],d[5],d[6],d[7],d[8],d[9],d[10],d[18],d[19],d[20],d[21],d[22],d[23],d[24],d[25]}));
defparam px4 .WIDTH = 15;
defparam px4 .TARGET_CHIP = TARGET_CHIP;
defparam px4 .LATENCY = ENC_LATENCY;
defparam px4 .HEAD_INVERT = PINVERT;

f_xor px5 (.clk(clk),.dout(p[5]),.din({d[11],d[12],d[13],d[14],d[15],d[16],d[17],d[18],d[19],d[20],d[21],d[22],d[23],d[24],d[25]}));
defparam px5 .WIDTH = 15;
defparam px5 .TARGET_CHIP = TARGET_CHIP;
defparam px5 .LATENCY = ENC_LATENCY;
defparam px5 .HEAD_INVERT = PINVERT;

f_xor px6 (.clk(clk),.dout(p[6]),.din({d[26],d[27],d[28],d[29],d[30],d[31],d[32]}));
defparam px6 .WIDTH = 7;
defparam px6 .TARGET_CHIP = TARGET_CHIP;
defparam px6 .LATENCY = ENC_LATENCY;
defparam px6 .HEAD_INVERT = PINVERT;

f_xor px0 (.clk(clk),.dout(p[0]),.din({d[0],d[1],d[2],d[4],d[5],d[7],d[10],d[11],d[12],d[14],d[17],d[18],d[21],d[23],d[24],d[26],d[27],d[29],d[32]}));
defparam px0 .WIDTH = 19;
defparam px0 .TARGET_CHIP = TARGET_CHIP;
defparam px0 .LATENCY = ENC_LATENCY;
defparam px0 .HEAD_INVERT = PINVERT;

endmodule

/////////////////////////////


// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : 97
// BENCHMARK INFO :  Total pins : 74
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.503 ns, From delay_regs:dr0|storage[10], To delay_regs:dr0|storage[43]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.588 ns, From f_xor:px1|xr[3], To f_xor:px1|f_xor:fx|f_xor:fx|d[0]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.415 ns, From f_xor:px6|xr[0], To f_xor:px6|f_xor:fx|f_xor:fx|d[0]}
