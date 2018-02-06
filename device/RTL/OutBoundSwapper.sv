/*
Name: OutBoundSwapper.sv
Description: 
Copyright (c) TT
 
All rights reserved. 
 
MIT License
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
documentation files (the ""Software""), to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import ShellTypes::*;

typedef struct packed {
	logic			valid;
	logic	[63:0]	vir_addr;
} OutBndSwpReq;

module OutBoundSwapper 
#(
	parameter PAGE_SIZE_WIDTH = 16
)
(
	input clk,    // Clock
	input rst,    // Asynchronous reset active high
	
	// swapper interface
	input	OutBndSwpReq	out_bnd_swp_reqs,
	output					out_bnd_swp_req_grants,

	// memory interface (for getting PTE)
	output	MemReq			mem_reqs,
	input					mem_req_grants,
	input	MemResp			mem_resps,
	output					mem_resp_grants,

	// PCIE interface (for actual swapping)
	output	PCIEPacket		pcie_packet_out,
	input					pcie_grant_in
);

	// swapping request buffer queue
	OutBndSwpReq 	out_bnd_swp_reqs_buffered;
	wire 			out_bnd_swp_reqs_Q_wr;
	wire 			out_bnd_swp_reqs_Q_rd;
	wire 			out_bnd_swp_reqs_Q_full;
	wire 			out_bnd_swp_reqs_Q_empty;

	//virtual address queue (to be sent over PCIE)
	OutBndSwpReq 	vir_addr_swp_reqs;

	// memory request
	MemReq			mem_reqs_ready;
	wire 			

	// memory response
	MemResp			mem_resp_buffered;

	// pcie request
	PCIEPacket 		pcie_req_vir_addr;
	PCIEPacket 		pcie_req_content;

	assign out_bnd_swp_reqs_Q_wr = (!out_bnd_swp_reqs_Q_full) & out_bnd_swp_reqs.valid;
	assign out_bnd_swp_reqs_Q_rd = (!out_bnd_swp_reqs_Q_empty) & (!)

	FIFO
    #(
        .WIDTH($bits(OutBndSwpReq)),
        .LOG_DEPTH(4)
    )
    SwpReqBufferQ
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(out_bnd_swp_reqs_Q_wr),
        .data(out_bnd_swp_reqs),
        .full(out_bnd_swp_reqs_Q_full),
        .q(out_bnd_swp_reqs_buffered),
        .empty(out_bnd_swp_reqs_Q_empty),
        .rdreq(out_bnd_swp_reqs_Q_rd)
    );

    FIFO
    #(
        .WIDTH($bits(OutBndSwpReq)),
        .LOG_DEPTH(4)
    )
    VirAddrQ
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(),
        .data(out_bnd_swp_reqs),
        .full(),
        .q(vir_addr_swp_reqs),
        .empty(),
        .rdreq()
    );

    assign pcie_req_vir_addr = '{
    	valid: 1'b1,
    	data: vir_addr_swp_reqs.vir_addr,
    	slot: 1,
    	pad: 0,
    	last: 1'b1
    };

    assign mem_req_ready = '{
    	valid: 1'b1,
    	isWrite: 1'b0;
    	addr: {out_bnd_swp_reqs_buffered.vir_addr[63:PAGE_SIZE_WIDTH], {PAGE_SIZE_WIDTH{1'b0}}} + mem_reqs_addr_counter,
    	data: 'b0
    };

    FIFO
    #(
        .WIDTH($bits(MemReq)),
        .LOG_DEPTH(4)
    )
    MemReqBufferQ
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(),
        .data(mem_reqs_ready),
        .full(),
        .q(mem_reqs),
        .empty(),
        .rdreq()
    );

    FIFO
    #(
        .WIDTH($bits(MemResp)),
        .LOG_DEPTH(4)
    )
    MemRespBufferQ
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(),
        .data(mem_resps),
        .full(),
        .q(mem_resp_buffered),
        .empty(),
        .rdreq()
    );

    assign pcie_req_ready = '{
    	valid: 1'b1,
    	data: mem_resp_buffered.data[pcie_data_selector+127:pcie_data_selector],
    	slot: 1
    	pad: 0,
    	last:
    };

    pcie_packet_out pcie_req_selected = (pcie_selector == ADDR)? pcie_req_vir_addr: pcie_req_content;

endmodule