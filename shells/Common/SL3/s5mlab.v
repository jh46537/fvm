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

// baeckler - 01-16-2012

module s5mlab #(
	parameter WIDTH = 20,
	parameter ADDR_WIDTH = 5
)
(
	input wclk,
	input wena,
	input [ADDR_WIDTH-1:0] waddr_reg,
	input [WIDTH-1:0] wdata_reg,
	input [ADDR_WIDTH-1:0] raddr,
	output [WIDTH-1:0] rdata		
);

genvar i;
generate
	for (i=0; i<WIDTH; i=i+1)  begin : ml
		stratixv_mlab_cell lrm (
			.clk0(wclk),
			.ena0(wena),
			
			// synthesis translate off
			.clk1(1'b0),
			.ena1(1'b1),
			.ena2(1'b1),
			.clr(1'b0),
			.devclrn(1'b1),
			.devpor(1'b1),
			// synthesis translate on			

			.portabyteenamasks(1'b1),
			.portadatain(wdata_reg[i]),
			.portaaddr(waddr_reg),
			.portbaddr(raddr),
			.portbdataout(rdata[i])			
			
		);

		defparam lrm .mixed_port_feed_through_mode = "dont_care";
		defparam lrm .logical_ram_name = "lrm";
		defparam lrm .logical_ram_depth = 1 << ADDR_WIDTH;
		defparam lrm .logical_ram_width = WIDTH;
		defparam lrm .first_address = 0;
		defparam lrm .last_address = (1 << ADDR_WIDTH)-1;
		defparam lrm .first_bit_number = i;
		defparam lrm .data_width = 1;
		defparam lrm .address_width = ADDR_WIDTH;
	end
endgenerate

endmodule	

// BENCHMARK INFO :  5SGTMC7K2F40C2ES
// BENCHMARK INFO :  Max depth :  0.0 LUTs
// BENCHMARK INFO :  Combinational ALUTs : 20
// BENCHMARK INFO :  Memory ALUTs : 20
// BENCHMARK INFO :  Dedicated logic registers : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.557 ns, From ml[0].lrm~MEMORYREGOUT, To ml[0].lrm~OBSERVABLEENAREGOUT0}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.557 ns, From ml[0].lrm~MEMORYREGOUT, To ml[0].lrm~OBSERVABLEENAREGOUT0}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.556 ns, From ml[0].lrm~MEMORYREGOUT, To ml[0].lrm~OBSERVABLEENAREGOUT0}
