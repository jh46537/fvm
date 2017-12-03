/*
Name: MMU.sv
Description: Memory Management Unit (MMU)

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
    logic[31:0]     appId;
    logic           isPTEReq;
    logic           valid;
    logic           isWrite;
    logic[511:0]    data;
    logic[31:0]     addr;
} AdvMemReq;

module MMU
#(
    parameter NUM_APPS = 2,
    parameter PAGE_SIZE_WIDTH = 16
)
(
    // User clock and reset
    input   clk,
    input   rst,
    
    // Memory interface (Application side)
    input   MemReq  vir_mem_reqs        [NUM_APPS-1:0],
    output          vir_mem_req_grants  [NUM_APPS-1:0],
    output  MemResp vir_mem_resps       [NUM_APPS-1:0],
    input           vir_mem_resp_grants [NUM_APPS-1:0],
    
    // Memory interface (Main Memory side)
    output  MemReq  phy_mem_reqs,
    input           phy_mem_req_grants,
    input   MemResp phy_mem_resps,
    output          phy_mem_resp_grants
);

    localparam FRAME_NUM_WIDTH = 32 - PAGE_SIZE_WIDTH;

    // virtual memory request buffer queue
    MemReq      vir_mem_reqs_buffered   [NUM_APPS-1:0];
    AdvMemReq   pte_reqs                [NUM_APPS-1:0];
    
    wire        vir_mem_reqs_BQ_full    [NUM_APPS-1:0];
    wire        vir_mem_reqs_BQ_empty   [NUM_APPS-1:0];
    wire        vir_mem_reqs_BQ_wr      [NUM_APPS-1:0];
    wire        vir_mem_reqs_BQ_rd      [NUM_APPS-1:0];
    
    // virtual memory request history queue
    AdvMemReq   vir_mem_reqs_serialized;
    AdvMemReq   oldest_vir_mem_req;
    
    wire        vir_mem_reqs_HQ_full;
    wire        vir_mem_reqs_HQ_empty;
    wire        vir_mem_reqs_HQ_wr;
    wire        vir_mem_reqs_HQ_rd;
    
    // physical memory request queue
    AdvMemReq   phy_mem_reqs_ready;
    AdvMemReq   adv_phy_mem_reqs;
    
    wire        phy_mem_reqs_Q_full;
    wire        phy_mem_reqs_Q_empty;
    reg         phy_mem_reqs_Q_wr;
    wire        phy_mem_reqs_Q_rd;
    
    // PTE response queue
    MemResp     pte_resps;
    MemResp     pte_resps_buffered;
    
    wire        pte_resps_Q_full;
    wire        pte_resps_Q_empty;
    wire        pte_resps_Q_wr;
    wire        pte_resps_Q_rd;
    
    // physical memory request history queue
    AdvMemReq   oldest_mem_phy_req;
    
    wire        phy_mem_reqs_HQ_full;
    wire        phy_mem_reqs_HQ_empty;
    wire        phy_mem_reqs_HQ_wr;
    reg         phy_mem_reqs_HQ_rd;
    
    // physical memory response buffer queue
    MemResp     phy_mem_resps_buffered;
    
    wire        phy_mem_resps_Q_full;
    wire        phy_mem_resps_Q_empty;
    wire        phy_mem_resps_Q_wr;
    wire        phy_mem_resps_Q_rd;
    
    // virtual memory response buffer queue
    MemResp     vir_mem_resps_ready     [NUM_APPS-1:0];
    
    wire        vir_mem_resps_BQ_full   [NUM_APPS-1:0];
    wire        vir_mem_resps_BQ_empty  [NUM_APPS-1:0];
    wire        vir_mem_resps_BQ_wr     [NUM_APPS-1:0];
    wire        vir_mem_resps_BQ_rd     [NUM_APPS-1:0];

    // a naive round robin arbiter
    reg [$clog2(NUM_APPS+1)-1:0]    phy_mem_reqs_selector;
    
    always @(posedge clk)
    begin
        if (rst)
        begin
            phy_mem_reqs_selector <= 0;
        end
        else if (phy_mem_reqs_selector == NUM_APPS)
        begin
            phy_mem_reqs_selector <= 0;
        end
        else
        begin
            phy_mem_reqs_selector <= phy_mem_reqs_selector + 1;
        end
    end
    
    // buffer memory requests from applications
    genvar i;
    generate
        for (i = 0; i < NUM_APPS; i = i + 1)
        begin: VirMemReqsBuffer
            assign vir_mem_reqs_BQ_wr[i] = vir_mem_reqs[i].valid & (!vir_mem_reqs_BQ_full[i]);
            assign vir_mem_reqs_BQ_rd[i] = (!vir_mem_reqs_BQ_empty[i]) & (phy_mem_reqs_selector == i) & (!vir_mem_reqs_HQ_full) & (!phy_mem_reqs_Q_full);
            FIFO
            #(
                .WIDTH($bits(MemReq)),
                .LOG_DEPTH(4)
            )
            Queue
            (
                .clock      (clk),
                .reset_n    (~rst),
                .wrreq      (vir_mem_reqs_BQ_wr[i]),
                .data       (vir_mem_reqs[i]),
                .full       (vir_mem_reqs_BQ_full[i]),
                .q          (vir_mem_reqs_buffered[i]),
                .empty      (vir_mem_reqs_BQ_empty[i]),
                .rdreq      (vir_mem_reqs_BQ_rd[i])
            );
            
            assign pte_reqs[i] = '{
                appId: i,
                isPTEReq: 1'b1,
                valid: (vir_mem_reqs_buffered[i].valid & (!vir_mem_reqs_BQ_empty[i])),
                isWrite: 1'b0,
                data: 'b0,
                addr: {vir_mem_reqs_buffered[i].addr[31:PAGE_SIZE_WIDTH], 2'b00}
            };
        end
    endgenerate
    
    assign vir_mem_reqs_serialized.appId = phy_mem_reqs_selector;
    assign vir_mem_reqs_serialized.isPTEReq = 1'b0;
    assign vir_mem_reqs_serialized.valid = vir_mem_reqs_buffered[phy_mem_reqs_selector].valid;
    assign vir_mem_reqs_serialized.isWrite = vir_mem_reqs_buffered[phy_mem_reqs_selector].isWrite;
    assign vir_mem_reqs_serialized.data = vir_mem_reqs_buffered[phy_mem_reqs_selector].data;
    assign vir_mem_reqs_serialized.addr = vir_mem_reqs_buffered[phy_mem_reqs_selector].addr;

    assign vir_mem_reqs_HQ_wr = (!vir_mem_reqs_BQ_empty[phy_mem_reqs_selector]) & (!vir_mem_reqs_HQ_full) & (!phy_mem_reqs_Q_full);
    assign vir_mem_reqs_HQ_rd = (!vir_mem_reqs_HQ_empty) & (!pte_resps_Q_empty) & (phy_mem_reqs_selector == NUM_APPS) & (!phy_mem_reqs_Q_full);
    
    FIFO
    #(
        .WIDTH($bits(AdvMemReq)),
        .LOG_DEPTH(9)
    )
    VirMemReqHistoryQueue
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(vir_mem_reqs_HQ_wr),
        .data(vir_mem_reqs_serialized),
        .full(vir_mem_reqs_HQ_full),
        .q(oldest_vir_mem_req),
        .empty(vir_mem_reqs_HQ_empty),
        .rdreq(vir_mem_reqs_HQ_rd)
    );
    
    assign pte_resps_Q_wr = (!pte_resps_Q_full) & pte_resps.valid;
    assign pte_resps_Q_rd = (!pte_resps_Q_empty) & (!vir_mem_reqs_HQ_empty) & (phy_mem_reqs_selector == NUM_APPS) & (!phy_mem_reqs_Q_full);
    
    FIFO
    #(
        .WIDTH($bits(MemResp)),
        .LOG_DEPTH(4)
    )
    PTERespQueue
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(pte_resps_Q_wr),
        .data(pte_resps),
        .full(pte_resps_Q_full),
        .q(pte_resps_buffered),
        .empty(pte_resps_Q_empty),
        .rdreq(pte_resps_Q_rd)
    );
    
    AdvMemReq   vir_mem_reqs_translated;

    assign vir_mem_reqs_translated = '{
        appId: oldest_vir_mem_req.appId,
        isPTEReq: 1'b0,
        valid: oldest_vir_mem_req.valid,
        isWrite: oldest_vir_mem_req.isWrite,
        data: oldest_vir_mem_req.data,
        addr: {pte_resps_buffered.data[FRAME_NUM_WIDTH-1:0], oldest_vir_mem_req.addr[PAGE_SIZE_WIDTH-1:0]}
    };
    
    // selected phy_mem_reqs_ready from PTE requests and translated requests    
    always @(*)
    begin
        if (phy_mem_reqs_selector == NUM_APPS)
        begin
            phy_mem_reqs_ready = vir_mem_reqs_translated;
        end
        else
        begin
            phy_mem_reqs_ready = pte_reqs[phy_mem_reqs_selector];
        end
    end
    
    always @(*)
    begin
        phy_mem_reqs_Q_wr = 1'b0;
        
        if (phy_mem_reqs_selector == NUM_APPS)
        begin
            phy_mem_reqs_Q_wr = (!phy_mem_reqs_Q_full) & (!vir_mem_reqs_HQ_empty) & (!pte_resps_Q_empty);
        end
        else
        begin
            phy_mem_reqs_Q_wr = (!phy_mem_reqs_Q_full) & (!vir_mem_reqs_BQ_empty[phy_mem_reqs_selector]) & (!vir_mem_reqs_HQ_full);
        end
    end
    
    assign phy_mem_reqs_Q_rd = (!phy_mem_reqs_Q_empty) & phy_mem_req_grants & (!phy_mem_reqs_HQ_full);
    
    FIFO
    #(
        .WIDTH($bits(AdvMemReq)),
        .LOG_DEPTH(4)
    )
    PhyMemReqsQueue
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(phy_mem_reqs_Q_wr),
        .data(phy_mem_reqs_ready),
        .full(phy_mem_reqs_Q_full),
        .q(adv_phy_mem_reqs),
        .empty(phy_mem_reqs_Q_empty),
        .rdreq(phy_mem_reqs_Q_rd)
    );
    
    generate
        for (i = 0; i < NUM_APPS; i = i + 1)
        begin: VirMemReqGrant
            assign vir_mem_req_grants[i] = (phy_mem_reqs_selector == NUM_APPS) & (!phy_mem_reqs_Q_full) & (!vir_mem_reqs_HQ_empty) & (!pte_resps_Q_empty) & (oldest_vir_mem_req.appId == i);
        end
    endgenerate
    
    assign phy_mem_reqs.valid = adv_phy_mem_reqs.valid & (!phy_mem_reqs_Q_empty);
    assign phy_mem_reqs.isWrite = adv_phy_mem_reqs.isWrite;
    assign phy_mem_reqs.data = adv_phy_mem_reqs.data;
    assign phy_mem_reqs.addr = adv_phy_mem_reqs.addr; 
 
    assign phy_mem_reqs_HQ_wr = (!phy_mem_reqs_HQ_full) & (!phy_mem_reqs_Q_empty) & phy_mem_req_grants;

    always @(*)
    begin
        if (oldest_mem_phy_req.isPTEReq && oldest_mem_phy_req.valid)
        begin
            phy_mem_reqs_HQ_rd = (!phy_mem_reqs_HQ_empty) & (!phy_mem_resps_Q_empty) & (!pte_resps_Q_full);
        end
        else if ((!oldest_mem_phy_req.isPTEReq) && oldest_mem_phy_req.valid)
        begin
            phy_mem_reqs_HQ_rd = (!phy_mem_reqs_HQ_empty) & (!phy_mem_resps_Q_empty) & (!pte_resps_Q_full);
        end
    end
    
    FIFO
    #(
        .WIDTH($bits(MemReq)),
        .LOG_DEPTH(9)
    )
    PhyMemReqsHistoryQueue
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(phy_mem_reqs_HQ_wr),
        .data(adv_phy_mem_reqs),
        .full(phy_mem_reqs_HQ_full),
        .q(oldest_mem_phy_req),
        .empty(phy_mem_reqs_HQ_empty),
        .rdreq(phy_mem_reqs_HQ_rd)
    );
    
    assign phy_mem_resps_Q_wr = (!phy_mem_resps_Q_full) & phy_mem_resps.valid;
    
    assign phy_mem_resp_grants = phy_mem_resps_Q_wr;
    
    always @(*)
    begin
        if (oldest_mem_phy_req.isPTEReq && oldest_mem_phy_req.valid)
        begin
            phy_mem_resps_Q_rd = (!phy_mem_reqs_HQ_empty) & (!phy_mem_resps_Q_empty) & (!pte_resps_Q_full);
        end
        else if ((!oldest_mem_phy_req.isPTEReq) && oldest_mem_phy_req.valid)
        begin
            phy_mem_resps_Q_rd = (!phy_mem_reqs_HQ_empty) & (!phy_mem_resps_Q_empty) & (!pte_resps_Q_full);
        end
    end    
    FIFO
    #(
        .WIDTH($bits(MemReq)),
        .LOG_DEPTH(9)
    )
    PhyMemRespsBufferQueue
    (
        .clock(clk),
        .reset_n(~rst),
        .wrreq(phy_mem_resps_Q_wr),
        .data(phy_mem_resps),
        .full(phy_mem_resps_Q_full),
        .q(phy_mem_resps_buffered),
        .empty(phy_mem_resps_Q_empty),
        .rdreq(phy_mem_resps_Q_rd)
    );
    
    assign pte_resps = '{
        valid: oldest_mem_phy_req.isPTEReq,
        data: phy_mem_resps_buffered.data
    };
    
    generate
        for (i = 0; i < NUM_APPS; i = i + 1)
        begin:VirMemResps
            assign vir_mem_resps_ready[i] = '{
                valid: (~oldest_mem_phy_req.isPTEReq & (i == oldest_mem_phy_req.appId)),
                data: phy_mem_resps_buffered.data
            };
            
            assign vir_mem_resps_BQ_wr[i] = (!vir_mem_resps_BQ_full[i]) & (!phy_mem_reqs_HQ_empty) & (!phy_mem_resps_Q_empty) & (oldest_mem_phy_req.appId == i);
            assign vir_mem_resps_BQ_rd[i] = (!vir_mem_resps_BQ_empty[i]) & vir_mem_resp_grants[i];
            
            FIFO
            #(
                .WIDTH($bits(MemReq)),
                .LOG_DEPTH(9)
            )
            VirMemRespsBufferQueue
            (
                .clock(clk),
                .reset_n(~rst),
                .wrreq(vir_mem_resps_BQ_wr[i]),
                .data(vir_mem_resps_ready[i]),
                .full(vir_mem_resps_BQ_full[i]),
                .q(vir_mem_resps[i]),
                .empty(vir_mem_resps_BQ_empty[i]),
                .rdreq(vir_mem_resps_BQ_rd[i])
            );
        end
    endgenerate
    
endmodule