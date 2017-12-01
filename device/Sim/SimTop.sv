/*
Name: SimTop.sv
Description: Top-level simulation file. Instantiates user role and DRAM/PCIe timing models, interfaces with C test harness.

Copyright (c) Microsoft Corporation
 
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

// For some reason, needs to be in reverse order
typedef struct packed {
    int last;
    int slot;
    longint data1;
    longint data0;
} SimPCIePacket;

typedef struct packed {
    longint data7;
    longint data6;
    longint data5;
    longint data4;
    longint data3;
    longint data2;
    longint data1;
    longint data0;
} SimDRAMPacket;

module SimTop;

    // C DPI functions (from harness.h)
    import "DPI-C" function void initHarness();
    import "DPI-C" function int checkDone();
    import "DPI-C" function int pcieSendToSW(input SimPCIePacket val);
    import "DPI-C" function int pcieValidFromSW();
    import "DPI-C" function int pcieRecvFromSW(output SimPCIePacket val);
    import "DPI-C" function void writeDRAM(input int channel, input int addr, input SimDRAMPacket val);
    import "DPI-C" function void readDRAM(input int channel, input int addr, output SimDRAMPacket val);
    import "DPI-C" function int readSoftReg_recvReq(output int addr, output int isWrite, output longint writeData);
    import "DPI-C" function int readSoftReg_sendResp(input longint data);

    MemReq        mem_reqs        [1:0];
    logic         mem_req_grants  [1:0];
    MemResp       mem_resps       [1:0];
    logic         mem_resp_grants [1:0];

    PCIEPacket    pcie_packet_roleIn;
    logic         pcie_full_roleOut;
    PCIEPacket    pcie_packet_roleOut;
    logic         pcie_grant_roleIn;

    SoftRegReq    softreg_req;
    SoftRegResp   softreg_resp;

    logic clk;
    logic rst;

    // 10ns clock cycle
    always begin
        #5
        clk = ~clk;
    end

    // Deal with PCIe Role -> SW
    always@(negedge clk) begin
        
        pcie_grant_roleIn = 1'b0;
        
        if(!rst && pcie_packet_roleOut.valid == 1'd1) begin
            automatic SimPCIePacket packet = '{data0: pcie_packet_roleOut.data[63:0], data1: pcie_packet_roleOut.data[127:64], 
                                                slot: pcie_packet_roleOut.slot, last: pcie_packet_roleOut.last};
            pcie_grant_roleIn = pcieSendToSW(packet);
            //$display("%d: PCIe output packet slot: %0d, data0: %0x, data1: %0x, last: %d, granted: %d", $time, pcie_packet_roleOut.slot, pcie_packet_roleOut.data[63:0], pcie_packet_roleOut.data[127:64], pcie_packet_roleOut.last, pcie_grant_roleIn);
        end
    end
    
    // Deal with PCIe SW -> Role
    SimPCIePacket recvPacket;
    logic recvPacketValid;
    
    always@(negedge clk) begin
        
        pcie_packet_roleIn = '{valid: 1'b0, data: 128'b0, slot: 16'b0, pad: 4'b0, last: 1'b0};
        
        if(!rst && !pcie_full_roleOut) begin
            
            // pcieRecvFromSW performs a deq, so only call when guaranteed to not drop packet
            recvPacketValid = pcieRecvFromSW(recvPacket);
            
            if(recvPacketValid) begin
                automatic logic[127:0] data = {recvPacket.data1, recvPacket.data0};
                pcie_packet_roleIn = '{valid: 1'b1, data: data, slot: recvPacket.slot[15:0], pad: 4'b0, last: recvPacket.last[0]};
                //$display("%d: PCIe -> Role writing data %0x %0x slot %0d last %0d", $time, recvPacket.data0, recvPacket.data1, recvPacket.slot, recvPacket.last);
            end
        end
    end
    
    
    // Process DRAM reads and writes
    genvar i;
    reg      memRespQ_enq   [1:0];
    MemResp  memRespQ_in    [1:0];
    wire     memRespQ_full  [1:0];
    MemResp  memRespQ_out   [1:0];
    wire     memRespQ_empty [1:0];
    reg      memRespQ_deq   [1:0];

    
    generate
        for(i=0; i < 2; i=i+1) begin : dramHarness
        
            FIFO
            #(
                .WIDTH     ($bits(MemResp)),
                .LOG_DEPTH (9)
            )
            LoopbackQ
            (
            .clock         (clk),
            .reset_n       (~rst),
            .wrreq         (memRespQ_enq[i]),
            .data          (memRespQ_in[i]),
            .full          (memRespQ_full[i]),
            .q             (memRespQ_out[i]),
            .empty         (memRespQ_empty[i]),
            .rdreq         (memRespQ_deq[i]),
            .almost_full   (),
            .almost_empty  (),
            .usedw         ()
            );
            
            assign mem_resps[i] = {valid: !memRespQ_empty[i], data: memRespQ_out[i].data};
            assign memRespQ_deq[i] = mem_resp_grants[i];
            
            always@(negedge clk) begin
                mem_req_grants[i] = 1'b0;
                
                memRespQ_enq[i] = 1'b0;
                memRespQ_in[i] = {valid: 1'b0, data: 512'b0};
                
                if(!rst && mem_reqs[i].valid == 1'b1 && !memRespQ_full[i]) begin
                    mem_req_grants[i] = 1'b1;

                    //$display("%0d: Channel %0d: isWrite %0d addr %0x data %0x", $time, i, mem_reqs[i].isWrite, mem_reqs[i].addr, mem_reqs[i].data);
                    if(mem_reqs[i].isWrite) begin
                        writeDRAM(i, mem_reqs[i].addr, mem_reqs[i].data);
                    end
                    else begin
                        SimDRAMPacket data;
                        readDRAM(i, mem_reqs[i].addr, data);
                        memRespQ_enq[i] = 1'b1;
                        memRespQ_in[i] = {valid: 1'b1, data: data};
                    end
                end
            end
        end
    endgenerate

    // Deal with SoftReg read req/resp
    logic        softreg_req_valid;
    logic [31:0] softreg_req_addr;
    logic        softreg_req_isWrite;
    logic [63:0] softreg_req_data;
    
    always@(negedge clk) begin
        
        softreg_req = '{valid: 1'b0, addr: 32'b0, isWrite: 1'b0, data: 64'b0};

        // SoftReg interface has no backpressure
        
        // SoftReg receive request
        if(!rst) begin
            softreg_req_valid = readSoftReg_recvReq(softreg_req_addr, softreg_req_isWrite, softreg_req_data);
            softreg_req = '{valid: softreg_req_valid, addr: softreg_req_addr, isWrite: softreg_req_isWrite, data: softreg_req_data};
            
            // SoftReg send response
            if(softreg_resp.valid) begin
                readSoftReg_sendResp(softreg_resp.data);
            end
        end
    end
    
    // Initialize test harness thread and reset system
    initial begin
        clk = 0;
        rst = 1;
        initHarness();
        
        #20
        rst = 0;
    end
    
    // Terminate simulation when done
    always@(negedge clk) begin
        
        automatic int done = checkDone();
        
        if(done == 32'd1)
            $finish;
    end

    // Instantiate SimpleRole under test
    SimpleRole role
    (
    // User clock and reset (active high)
    .clk(clk),
    .rst(rst),
    
    // Simplified Memory interface
    .mem_reqs(mem_reqs),
    .mem_req_grants(mem_req_grants),
    .mem_resps(mem_resps),
    .mem_resp_grants(mem_resp_grants),

    // PCIe Slot DMA interface
    .pcie_packet_in(pcie_packet_roleIn),
    .pcie_full_out(pcie_full_roleOut),
    .pcie_packet_out(pcie_packet_roleOut),
    .pcie_grant_in(pcie_grant_roleIn),

    // Soft register interface
    .softreg_req(softreg_req),
    .softreg_resp(softreg_resp),
    
    // SL3 interface (disabled)
    .sl_tx_out(),
    .sl_tx_full_in(),
    .sl_tx_oob_out(),
    .sl_tx_oob_full_in(),
    .sl_rx_in(),
    .sl_rx_grant_out(),
    .sl_rx_oob_in(),
    .sl_rx_oob_grant_out()
    );

endmodule
