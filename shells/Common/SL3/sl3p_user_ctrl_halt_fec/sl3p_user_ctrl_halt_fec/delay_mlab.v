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

// baeckler - 01-17-2012

module delay_mlab #(
	parameter WIDTH = 32,
	parameter LATENCY = 5, // minimum of 2, maximum of 33 for s5, 32 for s4
	parameter TARGET_CHIP = 1 // 1 S4, 2 S5
)(
	input clk,
	input [WIDTH-1:0] din,
	output [WIDTH-1:0] dout	
);

//////////////////////////////////////////////////
// pointers

// Stratix 4 and 5 have slightly different write latency
localparam ADDR_WIDTH = (TARGET_CHIP == 2) ? (
							 (LATENCY > 17) ? 5 : 
							 (LATENCY > 9) ? 4 :
							 (LATENCY > 5) ? 3 : 2)
					     : (
							 (LATENCY > 16) ? 5 : 
							 (LATENCY > 8) ? 4 :
							 (LATENCY > 4) ? 3 : 2);					     


reg [ADDR_WIDTH-1:0] waddr = {ADDR_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] raddr = {ADDR_WIDTH{1'b0}};

always @(posedge clk) begin
	raddr <= raddr + 1'b1;
	waddr <= raddr + LATENCY;
end

//////////////////////////////////////////////////
// storage

wire [WIDTH-1:0] ram_q;
reg [WIDTH-1:0] wdata = {WIDTH{1'b0}};

always @(posedge clk) begin
	wdata <= din;
end

generate
	if (TARGET_CHIP == 1) begin : tc4
		s4mlab s4m (
			.wclk(clk),
			.wena(1'b1),
			.waddr_reg(waddr),
			.wdata_reg(wdata),
			.raddr(raddr),
			.rdata(ram_q)		
		);
		defparam s4m .WIDTH = WIDTH;
		defparam s4m .ADDR_WIDTH = ADDR_WIDTH;
	end
	else begin : tc5
		s5mlab s5m (
			.wclk(clk),
			.wena(1'b1),
			.waddr_reg(waddr),
			.wdata_reg(wdata),
			.raddr(raddr),
			.rdata(ram_q)		
		);
		defparam s5m .WIDTH = WIDTH;
		defparam s5m .ADDR_WIDTH = ADDR_WIDTH;
	end
endgenerate

assign dout = ram_q;

endmodule
// BENCHMARK INFO :  EP4S100G5F45C2
// BENCHMARK INFO :  Max depth :  2.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 4
// BENCHMARK INFO :  Memory ALUTs : 32
// BENCHMARK INFO :  Dedicated logic registers : 36
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.225 ns, From waddr[1], To s4mlab:tc4.s4m|ml[20].lrm~write_address_reg0}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.262 ns, From waddr[1], To s4mlab:tc4.s4m|ml[0].lrm~write_address_reg0}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.216 ns, From waddr[1], To s4mlab:tc4.s4m|ml[0].lrm~write_address_reg0}
