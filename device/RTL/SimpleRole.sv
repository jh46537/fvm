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

    MemReq  vir_mem_reqs        [1:0];
    wire    vir_mem_req_grants  [1:0];
    MemResp vir_mem_resps       [1:0];
    wire    vir_mem_resp_grants [1:0];
    
    SimpleRoleApp app
    (
        .clk(clk),
        .rst(rst), 

        // User Memory Interface (UMI)
        .mem_reqs(vir_mem_reqs),
        .mem_req_grants(vir_mem_req_grants),
        .mem_resps(vir_mem_resps),
        .mem_resp_grants(vir_mem_resp_grants),

        // PCIe Slot DMA Interface
        .pcie_packet_in(pcie_packet_in),
        .pcie_full_out(pcie_full_out),

        .pcie_packet_out(pcie_packet_out),
        .pcie_grant_in(pcie_grant_in),

        // Soft register interface
        .softreg_req(softreg_req),
        .softreg_resp(softreg_resp),

        // SerialLite III interface
        .sl_tx_out(sl_tx_out),
        .sl_tx_full_in(sl_tx_full_in),
        .sl_tx_oob_out(sl_tx_oob_out),
        .sl_tx_oob_full_in(sl_tx_oob_full_in),
        
        .sl_rx_in(sl_rx_in),
        .sl_rx_grant_out(sl_rx_grant_out),
        .sl_rx_oob_in(sl_rx_oob_in),
        .sl_rx_oob_grant_out(sl_rx_oob_grant_out)
    );
    
    MMU mmu
    (
        .clk(clk),
        .rst(rst),
        
        // Memory interface (Application side)
        .vir_mem_reqs(vir_mem_reqs),
        .vir_mem_req_grants(vir_mem_req_grants),
        .vir_mem_resps(vir_mem_resps),
        .vir_mem_resp_grants(vir_mem_resp_grants),
    
        // Memory interface (Main Memory side)
        .phy_mem_reqs(mem_reqs[0]),
        .phy_mem_req_grants(mem_req_grants[0]),
        .phy_mem_resps(mem_resps[0]),
        .phy_mem_resp_grants(mem_resp_grants[0])
    );
    
    assign mem_reqs[1] = '{valid: 1'b0, isWrite: 1'b0, data: 'b0, addr: 'b0};
    assign mem_resp_grants[1] = 1'b0;
        
endmodule
