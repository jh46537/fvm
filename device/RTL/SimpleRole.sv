/*
Name: SimpleRole.sv
Description: DRAM loopback test. Writes data to DRAM and reads it back before looping back through PCIe.

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


import ShellTypes::*;
import SL3Types::*;


parameter PA_WIDTH = 32;
parameter VA_WIDTH = 40;    // must be greater than PA

typedef struct packed {
    logic        rw;
    logic        pva;
    logic [61:0] pad;
    logic [63:0] addr;
} Command;

typedef struct packed {
    //logic [31:0] size;
    logic        last;
    logic [15:0] slot;
    logic [3:0]  pad;
} JobContext;


module SimpleRole
(
    // User clock and reset
    input                               clk,
    input                               rst,

    // Simplified Memory interface
    output MemReq                       mem_reqs        [1:0],
    input                               mem_req_grants  [1:0],
    input MemResp                       mem_resps       [1:0],
    output                              mem_resp_grants [1:0],

    // PCIe Slot DMA interface
    input PCIEPacket                    pcie_packet_in,
    output                              pcie_full_out,

    output PCIEPacket                   pcie_packet_out,
    input                               pcie_grant_in,

    // Soft register interface
    input SoftRegReq                    softreg_req,
    output SoftRegResp                  softreg_resp,

    // SerialLite III interface
    output SL3DataInterface             sl_tx_out           [3:0],
    input                               sl_tx_full_in       [3:0],
    output SL3OOBInterface              sl_tx_oob_out       [3:0],
    input                               sl_tx_oob_full_in   [3:0],

    input SL3DataInterface              sl_rx_in            [3:0],
    output                              sl_rx_grant_out     [3:0],
    input SL3OOBInterface               sl_rx_oob_in        [3:0],
    output                              sl_rx_oob_grant_out [3:0]
);

    reg[63:0] counter;

    // Disable SL3 links
    genvar i;
    generate
        for(i = 0; i < 4; i=i+1) begin: disableSL3
            assign sl_tx_out[i] = '{valid: 1'b0, data: 128'b0, last: 1'b0};
            assign sl_tx_oob_out[i] = '{valid: 1'b0, data: 15'b0};

            assign sl_rx_grant_out[i] = 1'b0;
            assign sl_rx_oob_grant_out[i] = 1'b0;
        end
    endgenerate

    // Set up DRAM interleaver
    DramInterleaverConfig dramConfig;
    MemReq  mem_interleaved_req;
    wire    mem_interleaved_req_grant;
    MemResp mem_interleaved_resp;
    reg     mem_interleaved_resp_grant;

    DramInterleaver interleaver
    (
    // User clock and reset
    .clk(clk),
    .rst(rst),

    // Config
    .config_in(dramConfig),

    // Input interface
    .mem_req_in(mem_interleaved_req),
    .mem_req_grant_out(mem_interleaved_req_grant),
    .mem_resp_out(mem_interleaved_resp),
    .mem_resp_grant_in(mem_interleaved_resp_grant),

    // Output interfaces
    .mem_req_c0_out(mem_reqs[0]),
    .mem_req_grant_c0_in(mem_req_grants[0]),
    .mem_resp_c0_in(mem_resps[0]),
    .mem_resp_grant_c0_out(mem_resp_grants[0]),

    .mem_req_c1_out(mem_reqs[1]),
    .mem_req_grant_c1_in(mem_req_grants[1]),
    .mem_resp_c1_in(mem_resps[1]),
    .mem_resp_grant_c1_out(mem_resp_grants[1])
    );


    // Softreg config
    always@* begin
        softreg_resp = '{valid:1'b0, data: 64'b0};
        dramConfig = '{valid: 1'b0, mode: CHAN0_ONLY};

        // Read counter values
        if(softreg_req.valid && !softreg_req.isWrite) begin
            case(softreg_req.addr)
                default: softreg_resp = '{valid: 1'b1, data: 32'd1000+softreg_req.addr};
            endcase
        end

        // Control FSM state
        else if(softreg_req.valid && softreg_req.isWrite) begin
            case(softreg_req.addr)
                32'd600: dramConfig = '{valid: 1'b1, mode: CHAN0_ONLY};
                32'd700: dramConfig = '{valid: 1'b1, mode: CHAN1_ONLY};
                32'd800: dramConfig = '{valid: 1'b1, mode: INTERLEAVED};
                default: dramConfig = '{valid: 1'b0, mode: CHAN0_ONLY};
            endcase
        end
    end

    wire       dataInQ_enq;
    PCIEPacket dataInQ_in;
    wire       dataInQ_full;
    PCIEPacket dataInQ_out;
    wire       dataInQ_empty;
    reg        dataInQ_deq;

    assign dataInQ_enq = pcie_packet_in.valid && !dataInQ_full;
    assign dataInQ_in = pcie_packet_in;
    assign pcie_full_out = dataInQ_full;

    FIFO
    #(
        .WIDTH                  ($bits(PCIEPacket)),
        .LOG_DEPTH              (4)
    )
    DataInQ
    (
        .clock                  (clk),
        .reset_n                (~rst),
        .wrreq                  (dataInQ_enq),
        .data                   (dataInQ_in),
        .full                   (dataInQ_full),
        .q                      (dataInQ_out),
        .empty                  (dataInQ_empty),
        .rdreq                  (dataInQ_deq),
        .almost_full            (),
        .almost_empty           (),
        .usedw                  ()
    );

    // Stream from PCIe queue to DRAM

    typedef enum {
        COMMAND,
        WRITE,
        WRITE_COMMIT,
        READ,
        READ_READY,
        READ_RETURN
    } FSMState;

    FSMState state;
    FSMState next_state;
    reg[63:0] writeAddr;
    reg[63:0] next_writeAddr;
    reg[63:0] readAddr;
    reg[63:0] next_readAddr;

    Command cmd;
    reg[63:0] tempAddr;
    reg[1:0] mem_req_count;
    reg[1:0] next_mem_req_count;
    reg[127:0] mem_req_buf[0:3];
    reg[127:0] next_mem_req_buf[0:3];
    reg mem_req_last;
    reg next_mem_req_last;
    reg[1:0] mem_resp_count;
    reg[1:0] next_mem_resp_count;
    reg[127:0] mem_resp_buf[0:3];
    reg[127:0] next_mem_resp_buf[0:3];
    reg[9:0] read_count;
    reg[9:0] next_read_count;

    always@* begin
        next_state = state;
        next_writeAddr = writeAddr;
        next_readAddr = readAddr;

        pcie_packet_out = '{valid: 1'b0, data: 512'b0, slot: 16'b0, pad: 4'b0, last: 1'b0};
        mem_interleaved_req = '{valid: 0, isWrite: 1'b0, addr: 64'b0, data: 512'b0};
        mem_interleaved_resp_grant = 1'b0;

        dataInQ_deq = 1'b0;

        cmd = dataInQ_out.data;
        next_mem_req_count = mem_req_count;
        next_mem_req_buf = mem_req_buf;
        next_mem_req_last = mem_req_last;
        next_mem_resp_count = mem_resp_count;
        next_mem_resp_buf = mem_resp_buf;
        next_read_count = read_count;

        if(state == COMMAND) begin
            if(!dataInQ_empty) begin
                dataInQ_deq = 1'b1;
                if(dataInQ_out.slot == 16'b0) begin
                    // TODO: support VA
                    tempAddr = {{(64-PA_WIDTH){1'b0}}, cmd.addr[PA_WIDTH-1:0]};
                    if(cmd.rw == 1'b0) begin
                        next_state = READ;
                        next_readAddr = tempAddr;
                    end
                    else begin
                        next_state = WRITE;
                        next_writeAddr = tempAddr;
                    end
                end
            end
        end
        else if(state == WRITE) begin

            if(!dataInQ_empty) begin
                dataInQ_deq = 1'b1;
                if(dataInQ_out.slot == 16'b0) begin
                    next_mem_req_buf[mem_req_count] = dataInQ_out.data;
                    if(mem_req_count == 2'b11 || dataInQ_out.last == 1'b1) begin
                        next_state = WRITE_COMMIT;
                        next_mem_req_count = 2'b0;
                        next_mem_req_last = dataInQ_out.last;
                    end
                    else begin
                        next_mem_req_count = mem_req_count + 1'b1;
                    end
                end
            end
        end
        else if(state == WRITE_COMMIT) begin

            mem_interleaved_req = '{valid: 1'b1, isWrite: 1'b1, addr: writeAddr,
                data: {mem_req_buf[3], mem_req_buf[2], mem_req_buf[1], mem_req_buf[0]}};
            if(mem_interleaved_req_grant) begin
                next_writeAddr = writeAddr + 64'd64;
                next_mem_req_buf = '{128'b0, 128'b0, 128'b0, 128'b0};
                next_mem_req_last = 1'b0;
                if(mem_req_last == 1'b0) begin
                    next_state = WRITE;
                end
                else begin
                    next_state = COMMAND;
                end
            end
        end
        else if(state == READ) begin

            mem_interleaved_req = '{valid: 1'b1, isWrite: 1'b0, addr: readAddr, data: 512'b0};
            if(mem_interleaved_req_grant) begin
                next_readAddr = readAddr + 64'd64;
                next_state = READ_READY;
            end
        end
        else if(state == READ_READY) begin

            if(mem_interleaved_resp.valid) begin
                mem_interleaved_resp_grant = 1'b1;
                next_mem_resp_buf[3] = mem_interleaved_resp.data[511:384];
                next_mem_resp_buf[2] = mem_interleaved_resp.data[384:256];
                next_mem_resp_buf[1] = mem_interleaved_resp.data[255:128];
                next_mem_resp_buf[0] = mem_interleaved_resp.data[255:  0];
                next_state = READ_RETURN;
            end
        end
        else if(state == READ_RETURN) begin

            pcie_packet_out = '{valid: 1'b1, data: mem_resp_buf[mem_resp_count], slot: 16'b0, pad: 4'b0, last: (read_count == 10'h3ff)};
            if(pcie_grant_in) begin
                if(mem_resp_count == 2'b11) begin
                    next_mem_resp_buf = '{128'b0, 128'b0, 128'b0, 128'b0};
                    if(read_count == 10'h3ff) begin
                        next_state = COMMAND;
                    end
                    else begin
                        next_state = READ;
                    end
                    next_read_count = read_count + 1'b1;
                end
                next_mem_resp_count = mem_resp_count + 1'b1;
            end
        end

    end

    always@(posedge clk) begin
        if(rst) begin
            counter <= 64'b0;
            state <= COMMAND;
            writeAddr <= 64'b0;
            readAddr <= 64'b0;
            mem_req_count <= 2'b0;
            mem_req_buf <= '{128'b0, 128'b0, 128'b0, 128'b0};
            mem_req_last <= 1'b0;
            mem_resp_count <= 2'b0;
            mem_resp_buf <= '{128'b0, 128'b0, 128'b0, 128'b0};
            read_count <= 9'b0;
        end
        else begin
            counter <= counter + 1;
            state <= next_state;
            writeAddr <= next_writeAddr;
            readAddr <= next_readAddr;
            mem_req_count <= next_mem_req_count;
            mem_req_buf <= next_mem_req_buf;
            mem_req_last <= next_mem_req_last;
            mem_resp_count <= next_mem_resp_count;
            mem_resp_buf <= next_mem_resp_buf;
            read_count <= next_read_count;
        end
    end

endmodule
