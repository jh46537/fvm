module H
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
                    //$display("%h", cmd);
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

            //$display("counter %d", counter);
            //$display("WRITE %d", mem_req_count);
            if(!dataInQ_empty) begin
                dataInQ_deq = 1'b1;
                if(dataInQ_out.slot == 16'b0) begin
                    //$display("%h", dataInQ_out.data);
                    //$display(mem_req_count);
                    next_mem_req_buf[mem_req_count] = dataInQ_out.data;
                    if(mem_req_count == 2'b11 || dataInQ_out.last == 1'b1) begin
                        next_state = WRITE_COMMIT;
                        next_mem_req_count = 2'b0;
                        next_mem_req_last = dataInQ_out.last;
                    end
                    else begin
                        next_mem_req_count = mem_req_count + 1'b1;
                    end
                    //$display(next_mem_req_count);
                end
            end
        end
        else if(state == WRITE_COMMIT) begin

            //$display("WRITE_COMMIT: %h", writeAddr);
            //$display("buf3: %h", mem_req_buf[3]);
            //$display("buf2: %h", mem_req_buf[2]);
            //$display("buf1: %h", mem_req_buf[1]);
            //$display("buf0: %h", mem_req_buf[0]);
            mem_interleaved_req = '{valid: 1'b1, isWrite: 1'b1, addr: writeAddr,
                data: {mem_req_buf[3], mem_req_buf[2], mem_req_buf[1], mem_req_buf[0]}};
            if(mem_interleaved_req_grant) begin
                //$display("WRITE_COMMIT: %h", writeAddr);
                //$display("GRANTED");
                next_writeAddr = writeAddr + 64'd64;
                next_mem_req_buf = '{128'b0, 128'b0, 128'b0, 128'b0};
                next_mem_req_last = 1'b0;
                if(mem_req_last == 1'b0) begin
                    next_state = WRITE;
                end
                else begin
                    //$display("last");
                    next_state = COMMAND;
                end
            end
        end
        else if(state == READ) begin

            //$display("READ");
            mem_interleaved_req = '{valid: 1'b1, isWrite: 1'b0, addr: readAddr, data: 512'b0};
            if(mem_interleaved_req_grant) begin
                //$display("addr: %h", readAddr);
                next_readAddr = readAddr + 64'd64;
                next_state = READ_READY;
            end
        end
        else if(state == READ_READY) begin

            //$display("READ_READY");
            if(mem_interleaved_resp.valid) begin
                //$display("reads: %d (%d bytes)", read_count, 64*read_count);
                //$display("data: %h", mem_interleaved_resp.data);
                mem_interleaved_resp_grant = 1'b1;
                next_mem_resp_buf[3] = mem_interleaved_resp.data[511:384];
                next_mem_resp_buf[2] = mem_interleaved_resp.data[384:256];
                next_mem_resp_buf[1] = mem_interleaved_resp.data[255:128];
                next_mem_resp_buf[0] = mem_interleaved_resp.data[255:  0];
                next_state = READ_RETURN;
            end
        end
        else if(state == READ_RETURN) begin

            //$display("READ_RETURN");
            //$display("resp_count: %d", mem_resp_count);
            //$display("read_count: %d", read_count);
            //$display("last?: %d", (read_count == 10'h3ff));
            pcie_packet_out = '{valid: 1'b1, data: mem_resp_buf[mem_resp_count], slot: 16'b0, pad: 4'b0, last: (read_count == 10'h3fe)};
            if(pcie_grant_in) begin
                if(mem_resp_count == 2'b11) begin
                    next_mem_resp_buf = '{128'b0, 128'b0, 128'b0, 128'b0};
                    if(read_count == 10'h3fe) begin
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
