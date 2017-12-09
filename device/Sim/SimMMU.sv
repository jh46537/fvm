/*
Name: SimMMU.sv
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

`timescale 1 ns / 1 ps

import ShellTypes::*;

module SimMMU ();

    reg     clk;
    reg     rst;

    // virtual address space
    reg             vir_mem_reqs_valid		[1:0];
    reg             vir_mem_reqs_isWrite	[1:0];
    reg     [511:0] vir_mem_reqs_data		[1:0];
    reg     [31:0]  vir_mem_reqs_addr		[1:0];
    MemReq 			vir_mem_reqs 			[1:0];

    wire            vir_mem_req_grants		[1:0];

    wire            vir_mem_resps_valid		[1:0];
    wire    [511:0]	vir_mem_resps_data		[1:0];
    MemResp 		vir_mem_resps 			[1:0];

    reg             vir_mem_resp_grants		[1:0];

    // physical address space
    wire 			phy_mem_reqs_valid;
    wire 			phy_mem_reqs_isWrite;
    wire 	[511:0]	phy_mem_reqs_data;
    wire 	[31:0]	phy_mem_reqs_addr;
    MemReq 			phy_mem_reqs;

    reg 			phy_mem_req_grants;

    reg 			phy_mem_resps_valid;
    reg 	[511:0]	phy_mem_resps_data;
    MemResp 		phy_mem_resps;

    wire  			phy_mem_resp_grants;

    genvar i;
    generate
        for (i = 0; i < 2; i = i + 1)
        begin: connect
            assign vir_mem_reqs[i].valid = vir_mem_reqs_valid[i];
            assign vir_mem_reqs[i].isWrite = vir_mem_reqs_isWrite[i];
            assign vir_mem_reqs[i].data = vir_mem_reqs_data[i];
            assign vir_mem_reqs[i].addr = vir_mem_reqs_addr[i];

            assign vir_mem_resps_valid[i] =  vir_mem_resps[i].valid;
            assign vir_mem_resps_data[i] = vir_mem_resps[i].data;
        end
    endgenerate

    assign phy_mem_reqs_valid = phy_mem_reqs.valid;
    assign phy_mem_reqs_isWrite = phy_mem_reqs.isWrite;
    assign phy_mem_reqs_addr = phy_mem_reqs.addr;
    assign phy_mem_reqs_data = phy_mem_reqs.data;

    assign phy_mem_resps.valid = phy_mem_resps_valid;
    assign phy_mem_resps.data = phy_mem_resps_data;

    MMU mmu
    (
    	.clk(clk),
    	.rst(rst),

    	// virtual address space
    	.vir_mem_reqs(vir_mem_reqs),
    	.vir_mem_req_grants(vir_mem_req_grants),
    	.vir_mem_resps(vir_mem_resps),
    	.vir_mem_resp_grants(vir_mem_resp_grants),

    	// physical address space
    	.phy_mem_reqs(phy_mem_reqs),
    	.phy_mem_req_grants(phy_mem_req_grants),
    	.phy_mem_resps(phy_mem_resps),
    	.phy_mem_resp_grants(phy_mem_resp_grants)
    );

    always #5 clk = ~clk;

    always @(posedge clk)
    begin
        if (rst)
            phy_mem_req_grants <= 1'b0;
        else if (phy_mem_req_grants == 1'b1)
            phy_mem_req_grants <= 1'b0;
        else if (phy_mem_reqs.valid == 1'b1)
            phy_mem_req_grants <= 1'b1;
        else
            phy_mem_req_grants <= 1'b0;
    end

    generate
        for (i = 0; i < 2; i = i + 1)
        begin:VirMemRespGrants
            always @(posedge clk)
            begin
                if (rst)
                    vir_mem_resp_grants[i] <= 1'b0;
                else if (vir_mem_resp_grants[i] == 1'b1)
                    vir_mem_resp_grants[i] <= 1'b0;
                else if (vir_mem_resps[i].valid == 1'b1)
                    vir_mem_resp_grants[i] <= 1'b1;
                else
                    vir_mem_resp_grants[i] <= 1'b0;
            end
        end
    endgenerate

    // system initialization and reset
    initial
    begin
    	#0
    	clk = 1'b1;
    	rst = 1'b1;

    	vir_mem_reqs_valid[0] = 1'b0;
    	vir_mem_reqs_valid[1] = 1'b0;

    	phy_mem_resps_valid = 1'b0;

    	#100
    	rst = 1'b0;    	

    	#100000
    	$finish;
    end

    // virtual memory request
    initial
    begin
        wait(rst == 1'b0);

        #100
        vir_mem_reqs_valid[0] = 1'b1;
        vir_mem_reqs_isWrite[0] = 1'b0;
        vir_mem_reqs_addr[0] = 32'h00030003;

        #10
        vir_mem_reqs_valid[0] = 1'b0;

        #10
        wait(vir_mem_req_grants[0] == 1'b1);

        #10
        vir_mem_reqs_valid[0] = 1'b1;
        vir_mem_reqs_isWrite[0] = 1'b0;
        vir_mem_reqs_addr[0] = 32'h00550004;

        #10
        vir_mem_reqs_valid[0] = 1'b0;
    end

    // physical memory response
    initial
    begin
        wait(phy_mem_reqs_valid == 1'b1);
        fork
            #1000
            phy_mem_resps_valid = 1'b1;
            phy_mem_resps_data = 32'h42;

            #1010
            phy_mem_resps_valid = 1'b0;
        join_none
        wait(phy_mem_reqs_valid == 1'b0);

        wait(phy_mem_reqs.valid == 1'b1);
        fork
            #1000
            phy_mem_resps_valid = 1'b1;
            phy_mem_resps_data = 'h98;

            #1010
            phy_mem_resps_valid = 1'b0;
        join_none
        wait(phy_mem_reqs_valid == 1'b0);

        wait(phy_mem_reqs.valid == 1'b1);
        fork
            #1000
            phy_mem_resps_valid = 1'b1;
            phy_mem_resps_data = 'h98;

            #1010
            phy_mem_resps_valid = 1'b0;
        join_none
        wait(phy_mem_reqs_valid == 1'b0);

        wait(phy_mem_reqs.valid == 1'b1);
        fork
            #1000
            phy_mem_resps_valid = 1'b1;
            phy_mem_resps_data = 'h1234;

            #1010
            phy_mem_resps_valid = 1'b0;
        join_none
        wait(phy_mem_reqs_valid == 1'b0);
    end

    // physical memory request
    initial
    begin
        wait(phy_mem_reqs_valid == 1'b1);
        assert(phy_mem_reqs_addr == 'h898) $display("pass");
        assert(phy_mem_reqs_isWrite == 1'b0) $display("pass");
        wait(phy_mem_reqs_valid == 1'b0);

        wait(phy_mem_reqs.valid == 1'b1);
        assert(phy_mem_reqs_addr == 'h00420003) $display("pass");
        assert(phy_mem_reqs_isWrite == 1'b0) $display("pass");
        wait(phy_mem_reqs_valid == 1'b0);

        wait(phy_mem_reqs.valid == 1'b1);
        assert(phy_mem_reqs_addr == 'h154) $display("pass");
        assert(phy_mem_reqs_isWrite == 1'b0) $display("pass");
        wait(phy_mem_reqs_valid == 1'b0);

        wait(phy_mem_reqs.valid == 1'b1);
        assert(phy_mem_reqs_addr == 'h00980004) $display("pass");
        assert(phy_mem_reqs_isWrite == 1'b0) $display("pass");
        wait(phy_mem_reqs_valid == 1'b0);
    end

    // virtual memory response
    initial
    begin
        wait(vir_mem_resps_valid[0] == 1'b1);
        assert(vir_mem_resps_data[0] == 'h98) $display("pass");
        wait(vir_mem_resps_valid[0] == 1'b0);

        wait(vir_mem_resps_valid[0] == 1'b1);
        assert(vir_mem_resps_data[0] == 'h1234) $display("pass");
        wait(vir_mem_resps_valid[0] == 1'b0);
    end

endmodule