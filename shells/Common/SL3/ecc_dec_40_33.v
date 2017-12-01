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

module ecc_dec_40_33 #(
    parameter TARGET_CHIP = 2,
    parameter PINVERT = 1'b1 // inverted parity
)(
    input clk,
    input [39:0] din,
    output reg [32:0] dout,
    output reg dout_err,
    output reg dout_fail
);
// 33 data bits
// 7 parity bits

localparam SYN_LATENCY = 2;

wire [6:0] p;
wire [32:0] d;
assign {d[32],d[31],d[30],d[29],d[28],d[27],d[26],p[6],d[25],d[24],d[23],d[22],d[21],d[20],d[19],d[18],d[17],d[16],d[15],d[14],d[13],d[12],d[11],p[5],d[10],d[9],d[8],d[7],d[6],d[5],d[4],p[4],d[3],d[2],d[1],p[3],d[0],p[2],p[1],p[0]} = din;

// build a syndrome
wire [6:0] s;
f_xor sx1 (.clk(clk),.dout(s[1]),.din({p[1],d[0],d[1],d[3],d[4],d[6],d[8],d[10],d[11],d[13],d[15],d[17],d[19],d[21],d[23],d[25],d[26],d[28],d[30],d[32]}));
defparam sx1 .WIDTH = 20;
defparam sx1 .TARGET_CHIP = TARGET_CHIP;
defparam sx1 .LATENCY = SYN_LATENCY;
defparam sx1 .HEAD_INVERT = PINVERT;

f_xor sx2 (.clk(clk),.dout(s[2]),.din({p[2],d[0],d[2],d[3],d[5],d[6],d[9],d[10],d[12],d[13],d[16],d[17],d[20],d[21],d[24],d[25],d[27],d[28],d[31],d[32]}));
defparam sx2 .WIDTH = 20;
defparam sx2 .TARGET_CHIP = TARGET_CHIP;
defparam sx2 .LATENCY = SYN_LATENCY;
defparam sx2 .HEAD_INVERT = PINVERT;

f_xor sx3 (.clk(clk),.dout(s[3]),.din({p[3],d[1],d[2],d[3],d[7],d[8],d[9],d[10],d[14],d[15],d[16],d[17],d[22],d[23],d[24],d[25],d[29],d[30],d[31],d[32]}));
defparam sx3 .WIDTH = 20;
defparam sx3 .TARGET_CHIP = TARGET_CHIP;
defparam sx3 .LATENCY = SYN_LATENCY;
defparam sx3 .HEAD_INVERT = PINVERT;

f_xor sx4 (.clk(clk),.dout(s[4]),.din({p[4],d[4],d[5],d[6],d[7],d[8],d[9],d[10],d[18],d[19],d[20],d[21],d[22],d[23],d[24],d[25]}));
defparam sx4 .WIDTH = 16;
defparam sx4 .TARGET_CHIP = TARGET_CHIP;
defparam sx4 .LATENCY = SYN_LATENCY;
defparam sx4 .HEAD_INVERT = PINVERT;

f_xor sx5 (.clk(clk),.dout(s[5]),.din({p[5],d[11],d[12],d[13],d[14],d[15],d[16],d[17],d[18],d[19],d[20],d[21],d[22],d[23],d[24],d[25]}));
defparam sx5 .WIDTH = 16;
defparam sx5 .TARGET_CHIP = TARGET_CHIP;
defparam sx5 .LATENCY = SYN_LATENCY;
defparam sx5 .HEAD_INVERT = PINVERT;

f_xor sx6 (.clk(clk),.dout(s[6]),.din({p[6],d[26],d[27],d[28],d[29],d[30],d[31],d[32]}));
defparam sx6 .WIDTH = 8;
defparam sx6 .TARGET_CHIP = TARGET_CHIP;
defparam sx6 .LATENCY = SYN_LATENCY;
defparam sx6 .HEAD_INVERT = PINVERT;

f_xor sx0 (.clk(clk),.dout(s[0]),.din({p[0],p[1],p[2],d[0],p[3],d[1],d[2],d[3],p[4],d[4],d[5],d[6],d[7],d[8],d[9],d[10],p[5],d[11],d[12],d[13],d[14],d[15],d[16],d[17],d[18],d[19],d[20],d[21],d[22],d[23],d[24],d[25],p[6],d[26],d[27],d[28],d[29],d[30],d[31],d[32]}));
defparam sx0 .WIDTH = 40;
defparam sx0 .TARGET_CHIP = TARGET_CHIP;
defparam sx0 .LATENCY = SYN_LATENCY + 1;
defparam sx0 .HEAD_INVERT = PINVERT;

// decode the syndrome
reg [39:0] ds = 40'b0;
reg syn_err = 1'b0;
always @(posedge clk) begin
    ds <= 40'b0;
    ds[s[6:1]] <= 1'b1;
    syn_err <= |s[6:1];
end
wire [32:0] dfix = {ds[39],ds[38],ds[37],ds[36],ds[35],ds[34],ds[33],ds[31],ds[30],ds[29],ds[28],ds[27],ds[26],ds[25],ds[24],ds[23],ds[22],ds[21],ds[20],ds[19],ds[18],ds[17],ds[15],ds[14],ds[13],ds[12],ds[11],ds[10],ds[9],ds[7],ds[6],ds[5],ds[3]};

wire [32:0] dd;
delay_regs dr1 (.clk(clk),.din(d),.dout(dd));
defparam dr1 .WIDTH = 33;
defparam dr1 .LATENCY = SYN_LATENCY+1;

// make correction
initial dout = 33'b0;
initial dout_err = 1'b0;
initial dout_fail = 1'b0;
always @(posedge clk) begin
    dout <= dd ^ dfix;
    dout_err <= syn_err | s[0];
    dout_fail <= syn_err && !s[0];
end

endmodule


// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : 207
// BENCHMARK INFO :  Total pins : 76
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.322 ns, From delay_regs:dr1|storage[12], To delay_regs:dr1|storage[45]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.343 ns, From delay_regs:dr1|storage[19], To delay_regs:dr1|storage[52]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.182 ns, From delay_regs:dr1|storage[52], To delay_regs:dr1|storage[85]}
