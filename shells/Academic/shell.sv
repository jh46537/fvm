/*
Name: shell.sv
Description: Top-level module for Catapult Academic Shell

CATAPULT ACADEMIC USERS: PLEASE DO NOT MODIFY THIS FILE!

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
 
`timescale 1ns/1ps
//DV_FIX default_nettype//`default_nettype none

`ifdef QUESTA
//DV_FIX default_nettype//  `default_nettype wire
`else
`endif
module Shell # (
    parameter TARGET_BOARD  = "",   // "MtGranite"
    parameter TARGET_DEVICE = ""    // "Stratix V"
) (

    //////////////////////////////////////////////////////////////////////////////
    // PCI Express
    //////////////////////////////////////////////////////////////////////////////

    input                                                     pcie_0_refclk,    // 100 MHz
    input                                                     pcie_0_reset_n,   // only toggled on hard power cycle
    input  [7:0]                                              pcie_0_rx,
    output [7:0]                                              pcie_0_tx,
 
    //////////////////////////////////////////////////////////////////////////////
    // Serial Lite 3 Network Links
    //////////////////////////////////////////////////////////////////////////////

`ifdef USE_SL3
    input                                                     xcvr_refclk,    // 625 MHz
    output [`SL3_LANES-1:0]                                   xcvr_tx_0,      // pin 0 is lane #0
    input  [`SL3_LANES-1:0]                                   xcvr_rx_0,
    output [`SL3_LANES-1:0]                                   xcvr_tx_1,
    input  [`SL3_LANES-1:0]                                   xcvr_rx_1,
    output [`SL3_LANES-1:0]                                   xcvr_tx_2,
    input  [`SL3_LANES-1:0]                                   xcvr_rx_2,
    output [`SL3_LANES-1:0]                                   xcvr_tx_3,
    input  [`SL3_LANES-1:0]                                   xcvr_rx_3,
`endif

    //////////////////////////////////////////////////////////////////////////////
    // DDR3 Channels
    //////////////////////////////////////////////////////////////////////////////

    input                                                     mem_0_refclk,     // 125 MHz

`ifdef USE_DDR
    output [15:0]                                             mem_0_a,
    output [2:0]                                              mem_0_ba,
    output [1:0]                                              mem_0_ck,
    output [1:0]                                              mem_0_ck_n,
    output [1:0]                                              mem_0_cke,
    output [1:0]                                              mem_0_cs_n,
    output [8:0]                                              mem_0_dm,
    output [0:0]                                              mem_0_ras_n,
    output [0:0]                                              mem_0_cas_n,
    output [0:0]                                              mem_0_we_n,
    output                                                    mem_0_reset_n,
    inout  [71:0]                                             mem_0_dq,
    inout  [8:0]                                              mem_0_dqs,
    inout  [8:0]                                              mem_0_dqs_n,
    output [1:0]                                              mem_0_odt,
    
    // Shared signal
    input                                                     mem_0_rzq,
    
`ifdef USE_SECOND_DIMM
    output [15:0]                                             mem_1_a,
    output [2:0]                                              mem_1_ba,
    output [1:0]                                              mem_1_ck,
    output [1:0]                                              mem_1_ck_n,
    output [1:0]                                              mem_1_cke,
    output [1:0]                                              mem_1_cs_n,
    output [8:0]                                              mem_1_dm,
    output [0:0]                                              mem_1_ras_n,
    output [0:0]                                              mem_1_cas_n,
    output [0:0]                                              mem_1_we_n,
    output                                                    mem_1_reset_n,
    inout  [71:0]                                             mem_1_dq,
    inout  [8:0]                                              mem_1_dqs,
    inout  [8:0]                                              mem_1_dqs_n,
    output [1:0]                                              mem_1_odt,
`endif /*USE_SECOND_DIMM*/

`endif


    //////////////////////////////////////////////////////////////////////////////
    // LEDs
    ////////////////////////////////////////////////////////////////////////////// 
    
    output [7:0]                                              LEDs,

    //////////////////////////////////////////////////////////////////////////////
    // I2C Interfaces
    //////////////////////////////////////////////////////////////////////////////

    inout                                                     mezz_sda,
    input                                                     mezz_scl
);

    //////////////////////////////////////////////////////////////////////////////
    // Shell public release versioning. Major revisions
    // are bumped on breaking changes to either softshell/role
    // or to driver / FPGA Core API. Minor revisions bumped
    // on bug fixes, performance tweaks, or other non-breaking changes.
    //
    // FPGA Board ID uniquely identifies the target FPGA board.
    //////////////////////////////////////////////////////////////////////////////

    localparam SHELL_RELEASE_ID                = 32'hCA7ACADE; // Catapult "Academic" Release
    localparam SHELL_RELEASE_MAJOR_VERSION     = 16'h0;        // Major release version
    localparam SHELL_RELEASE_MINOR_VERSION     = 16'd7;        // Minor release revision
    localparam BOARD_ID                        = `BOARD_IDENTIFIER;       // Board ID



    //////////////////////////////////////////////////////////////////////////////
    // Clock and Reset Generator
    //////////////////////////////////////////////////////////////////////////////

    wire mgmt_clk;              // 100Mhz reconfig and calibration clock
    wire asmi_rsu_clk;          // 20Mhz clock for flash memory access
    wire core_clk;              // 175Mhz user logic clock
    wire core_reset;            // core domain; Reset for everything except critical components (PCIe, DRAM, RSU, and temperature monitor)
    wire shell_reset;           // core domain; Reset for the full shell except PCIe & DRAM
    wire app_reset;             // core domain; Reset just for the application logic
    wire mgmt_reset;            // mgmt domain; Reset synchronized to mgmt_clk
    wire asmi_rsu_reset;        // asmi_rsu_clk domain; Reset synchronized to asmi_rsu_clk
    wire config_crc_clk;        // 50Mhz clock for ConfigCRC
    wire temperature_shutdown;  // temperature shutdown triggers reset
    wire core_pll_locked;       // for status reg
    wire core_clk_locked;       // for status reg
    wire manual_core_reset;     // software-triggered reset
    wire manual_app_reset;      // software-triggered reset

    
    ClockGen ClockGen
    (
        .pcie_refclk                                          (pcie_0_refclk),
        .pcie_reset_n                                         (pcie_0_reset_n),
        .global_reset_n                                       (1'b1),
        .manual_core_reset                                    (manual_core_reset),
        .manual_app_reset                                     (manual_app_reset),
        .temperature_shutdown                                 (temperature_shutdown),
        .core_clk                                             (core_clk),
        .core_reset                                           (core_reset),
        .shell_reset                                          (shell_reset),
        .app_reset                                            (app_reset),
        .mgmt_reset                                           (mgmt_reset),
        .asmi_rsu_reset                                       (asmi_rsu_reset),
        .config_crc_clk                                       (config_crc_clk),
        .mgmt_clk                                             (mgmt_clk),
        .asmi_rsu_clk                                         (asmi_rsu_clk),
        .core_pll_locked                                      (core_pll_locked),
        .core_clk_locked                                      (core_clk_locked)
    );

    //////////////////////////////////////////////////////////////////////////////
    // Cycle Counter
    //////////////////////////////////////////////////////////////////////////////

    reg [63:0] cycle_counter;
    always @(posedge core_clk) cycle_counter <= shell_reset ? 64'h0 : cycle_counter + 1'b1;

    // Configuration and Status buses
    SlConfig sl_cfg;
    SlStatus sl_status;

    //////////////////////////////////////////////////////////////////////////////
    // DDR Signals
    //////////////////////////////////////////////////////////////////////////////

    wire                                                      ddr_clk;
    wire                                                      ddr_reset_n;
    wire                                                      ddr_pll_locked;

    wire                                                      ddr_present [1:0];
    wire [31:0]                                               ddr_status_register_core [1:0];
    wire [31:0]                                               ddr_error_count_register_core [1:0];
    wire                                                      ddr_healthy_core [1:0];

`ifdef USE_SECOND_DIMM
    localparam NUM_UMI = 2;
    localparam UMI_ADDR_WIDTH = 32;
`else
    localparam NUM_UMI = 1;
    localparam UMI_ADDR_WIDTH = 31;
`endif
    
    logic                               umi_raise  [NUM_UMI-1:0];
    logic                               umi_grant  [NUM_UMI-1:0];
    logic                               umi_write  [NUM_UMI-1:0];
    logic [UMI_ADDR_WIDTH-1:0]          umi_addr   [NUM_UMI-1:0];
    logic [UMI_ADDR_WIDTH-1:0]          umi_size   [NUM_UMI-1:0];
    logic [UMI_DATA_WIDTH-1:0]          umi_wrdata [NUM_UMI-1:0];
    logic [UMI_MASK_WIDTH-1:0]          umi_wrmask [NUM_UMI-1:0];
    logic                               umi_wren   [NUM_UMI-1:0];
    logic                               umi_wrrdy  [NUM_UMI-1:0];
    logic [UMI_DATA_WIDTH-1:0]          umi_rddata [NUM_UMI-1:0];
    logic                               umi_rdrdy  [NUM_UMI-1:0];
    logic                               umi_rden   [NUM_UMI-1:0]; 

    //////////////////////////////////////////////////////////////////////////////
    // Temperature wires
    ////////////////////////////////////////////////////////////////////////////// 
    
    wire [7:0]                                                degrees_c;


    //////////////////////////////////////////////////////////////////////
    // PCI Express
    //////////////////////////////////////////////////////////////////////
    
    localparam PCIE_DEBUG_CTLE_WIDTH = 64;
    localparam PCIE_DEBUG_WIDTH = PCIE_DEBUG_CTLE_WIDTH + 192;
    
    wire                                                      pcie_250_clk;
    wire                                                      pcie_250_reset;
    wire                                                      pcie_usr_clk;

    // Shell register interface
    wire                                                      register_read_req;
    wire                                                      register_write_req;
    wire [7:0]                                                register_number;
    wire [31:0]                                               register_write_data;
    wire                                                      register_read_data_valid;
    wire [31:0]                                               register_read_data;
    
    // Soft shell register interface
    wire                                                      register64_write_req;
    wire                                                      register64_read_req;
    wire [15:0]                                               register64_number;
    wire [63:0]                                               register64_write_data;
    wire [63:0]                                               register64_read_data;
    wire                                                      register64_read_valid;
    wire                                                      soft_reg_native_64_supported;
    
    reg  [31:0]                                               control_register = 32'h0; // register
    reg  [31:0]                                               control_register2 = 32'h0;// register


    // PCIe information and status 
    wire [15:0]                                               pcie_id;
    wire [31:0]                                               pcie_version; 
    wire [1:0]                                                current_pcie_speed;
    wire [3:0]                                                current_pcie_lanes;
    wire [0:0]                                                current_pcie_link_up;
    wire                                                      pcie_present;

    wire [PCIE_DEBUG_WIDTH-1:0]                               pcie_0_debug;
    wire [PCIE_DEBUG_WIDTH-1:0]                               pcie_1_debug;

    // Soft shell wires
    wire                                                      pcie_input_wren;
    wire [15:0]                                               pcie_input_slot;
    wire [3:0]                                                pcie_input_padbytes;
    wire [PCIE_DATA_WIDTH-1:0]                                pcie_input_data;
    wire                                                      pcie_input_last;
    wire                                                      pcie_input_full;

    wire                                                      pcie_output_empty;
    wire [PCIE_DATA_WIDTH-1:0]                                pcie_output_data;
    wire [15:0]                                               pcie_output_slot;
    wire [3:0]                                                pcie_output_padbytes;
    wire                                                      pcie_output_last;
    wire                                                      pcie_output_rden;
    wire [31:0]                                               slot_dma_health_status;
    wire                                                      pcie_loopback_enable;
                                   
    
    //////////////////////////////////////////////////////////////////////
    // ASMI / RSU -- read/write flash memory / FPGA reconfig from flash
    //////////////////////////////////////////////////////////////////////       
                    
    logic        asmi_rsu_wr_valid;
    logic  [3:0] asmi_rsu_wr_addr;
    logic [31:0] asmi_rsu_wr_data;
    logic        asmi_rsu_rd_req;
    logic  [3:0] asmi_rsu_rd_addr;
    logic [31:0] asmi_rsu_rd_data;
    logic        asmi_rsu_rd_valid;

    Custom_ASMI_RSU_top Custom_ASMI_RSU_top_inst 
    (
        .pcie_clock                          (pcie_250_clk),
        .pcie_resetn                         (~pcie_250_reset),
        .asmi_rsu_clock                      (asmi_rsu_clk),
        .asmi_rsu_resetn                     (~asmi_rsu_reset),
        .pcie_reg_access_write_enable        (asmi_rsu_wr_valid),
        .pcie_reg_access_write_addr          (asmi_rsu_wr_addr),
        .pcie_reg_access_write_data          (asmi_rsu_wr_data),
        .pcie_reg_access_read_req            (asmi_rsu_rd_req),
        .pcie_reg_access_read_addr           (asmi_rsu_rd_addr),
        .pcie_reg_access_read_data           (asmi_rsu_rd_data),
        .pcie_reg_access_read_valid          (asmi_rsu_rd_valid),
        .pcie_link_alive                     (current_pcie_link_up)  //for synchronizing RSU with the PCIe link being disabled by CPU root port
    );


    
    
`ifdef PCIE_USE_STREAM_DMA
    PCIe_Gen3_AbaloneWrapper
    #(
        .PCIE_USE_QSYS_DESIGN                                 (1),
        .PCIE_USE_TTK_HIP0                                    (1),
        .SLOTS_ON_STREAMING                                   (`PCIE_SLOTS_ON_STREAMING),
        .SLOTS_LOOPBACK_FIFO                                  (`PCIE_SLOTS_LOOPBACK_FIFO),
        .FORCE_GEN2                                           (`PCIE_ENABLE_GEN3 == 0),
        .VENDOR_ID                                            (`PCIE_VENDOR_ID_HIP0),
        .DEVICE_ID                                            (`PCIE_DEVICE_ID_HIP0),
        .INCREASE_DRIVE_STRENGTH                              (`PCIE_HIGH_DRIVE_HIP0),
        .FORCE_MEDIAN_CTLE                                    (`PCIE_FORCE_MEDIAN_CTLE_HIP0),
        .DEBUG_WIDTH                                          (PCIE_DEBUG_WIDTH)
    )
`else
    PCIe_Gen2
    #(
        .VENDOR_ID                                            (`PCIE_VENDOR_ID_HIP0),
        .DEVICE_ID                                            (`PCIE_DEVICE_ID_HIP0),
        .DEBUG_WIDTH                                          (PCIE_DEBUG_WIDTH)
    )
`endif
    PCIe_0
    (
        // Clocks and reset
        .pcie_refclk                                          (pcie_0_refclk),
        .pcie_reset_n                                         (pcie_0_reset_n),
        .pcie_clk_out                                         (pcie_250_clk),
        .pcie_rst_out                                         (pcie_250_reset),
        .core_rst                                             (core_reset),

        // Serial pins, note each pin is differential so there are physically 2 pins
        // Quartus will automatically pick up the other half
        .pcie_rx_0                                            (pcie_0_rx[0]),
        .pcie_rx_1                                            (pcie_0_rx[1]),
        .pcie_rx_2                                            (pcie_0_rx[2]),
        .pcie_rx_3                                            (pcie_0_rx[3]),
        .pcie_rx_4                                            (pcie_0_rx[4]),
        .pcie_rx_5                                            (pcie_0_rx[5]),
        .pcie_rx_6                                            (pcie_0_rx[6]),
        .pcie_rx_7                                            (pcie_0_rx[7]),
        .pcie_tx_0                                            (pcie_0_tx[0]),
        .pcie_tx_1                                            (pcie_0_tx[1]),
        .pcie_tx_2                                            (pcie_0_tx[2]),
        .pcie_tx_3                                            (pcie_0_tx[3]),
        .pcie_tx_4                                            (pcie_0_tx[4]),
        .pcie_tx_5                                            (pcie_0_tx[5]),
        .pcie_tx_6                                            (pcie_0_tx[6]),
        .pcie_tx_7                                            (pcie_0_tx[7]),

        // PCIe info
        .id_out                                               (pcie_id),
        .version_out                                          (pcie_version),
        .pcie_present_out                                     (pcie_present),  
        .current_speed                                        (current_pcie_speed),
        .current_lanes                                        (current_pcie_lanes),
        .link_alive                                           (current_pcie_link_up),
        .User_Clock                                           (core_clk),
        .User_Reset                                           (core_reset), // used by slots on streaming
        .PCIe_Loopback_Enable                                 (pcie_loopback_enable),

        // To host
        .Input_Write_En                                       (pcie_input_wren),
        .Input_Slot                                           (pcie_input_slot),  
        .Input_PadBytes                                       (pcie_input_padbytes),
        .Input_Data                                           (pcie_input_data),
        .Input_Last                                           (pcie_input_last),
        .Input_Full                                           (pcie_input_full),
        .Input_Latency                                        (32'd0),

        // From host
        .Output_Empty                                         (pcie_output_empty),
        .Output_Data                                          (pcie_output_data),
        .Output_Slot                                          (pcie_output_slot),  
        .Output_PadBytes                                      (pcie_output_padbytes),
        .Output_Last                                          (pcie_output_last),
        .Output_Read_En                                       (pcie_output_rden),

        // Shell register interface
        .Register_Read_Req                                    (register_read_req),
        .Register_Write_Req                                   (register_write_req),
        .Register_Number                                      (register_number),
        .Register_Write_Data                                  (register_write_data),
        .Register_Read_Data_Valid                             (register_read_data_valid),
        .Register_Read_Data                                   (register_read_data),
        
        // Soft shell register interface
        .SoftReg_Write_Req                                    (register64_write_req),
        .SoftReg_Read_Req                                     (register64_read_req),
        .SoftReg_Number                                       (register64_number),
        .SoftReg_Write_Data                                   (register64_write_data),
        .SoftReg_Read_Data                                    (register64_read_data),
        .SoftReg_Read_Data_Valid                              (register64_read_valid),
        .SoftReg_Supported                                    (soft_reg_native_64_supported),

        // ASMI/RSU
        .asmi_rsu_wr_valid_out                                (asmi_rsu_wr_valid),
        .asmi_rsu_wr_addr_out                                 (asmi_rsu_wr_addr),
        .asmi_rsu_wr_data_out                                 (asmi_rsu_wr_data),
        .asmi_rsu_rd_req_out                                  (asmi_rsu_rd_req),
        .asmi_rsu_rd_addr_out                                 (asmi_rsu_rd_addr),
        .asmi_rsu_rd_data_in                                  (asmi_rsu_rd_data),
        .asmi_rsu_rd_valid_in                                 (asmi_rsu_rd_valid),
        
        // Avalon Master Interface
        .avm_rd                                               (),
        .avm_wr                                               (),
        .avm_addr                                             (),
        .avm_be                                               (),
        .avm_wdata                                            (),
        .avm_rdata                                            (32'd0),
        .avm_rdata_valid                                      (1'b0),
        .avm_waitrequest                                      (1'b0),

        .slot_dma_health_status_out                           (slot_dma_health_status),
        .debug                                                (pcie_0_debug)
    );

    
    wire                                                      pcie_role_enable;
    wire                                                      pciebypass_enable = ~pcie_role_enable;

    wire                                                      pciebypass_role_input_wren;
    wire [PCIE_DATA_WIDTH-1:0]                                pciebypass_role_input_data;
    wire [15:0]                                               pciebypass_role_input_slot;
    wire [3:0]                                                pciebypass_role_input_padbytes;
    wire                                                      pciebypass_role_input_last;
    wire                                                      pciebypass_role_input_full;

    wire                                                      pciebypass_role_output_empty;
    wire [PCIE_DATA_WIDTH-1:0]                                pciebypass_role_output_data;
    wire [15:0]                                               pciebypass_role_output_slot;
    wire [3:0]                                                pciebypass_role_output_padbytes;
    wire                                                      pciebypass_role_output_last;
    wire                                                      pciebypass_role_output_rden;

    PCIe_Bypass PCIeBypass
    (
        .clk                                                (core_clk),
        .reset                                              (app_reset), 
        .bypassEn                                           (pciebypass_enable),

        // PCIe -> Bypass
        .pcieIn_rden_out                                    (pcie_output_rden),
        .pcieIn_data_in                                     (pcie_output_data),
        .pcieIn_slot_in                                     (pcie_output_slot),
        .pcieIn_padbytes_in                                 (pcie_output_padbytes),
        .pcieIn_last_in                                     (pcie_output_last),
        .pcieIn_empty_in                                    (pcie_output_empty),

        // Bypass -> PCI
        .pcieOut_wren_out                                   (pcie_input_wren),
        .pcieOut_data_out                                   (pcie_input_data),
        .pcieOut_slot_out                                   (pcie_input_slot),
        .pcieOut_padbytes_out                               (pcie_input_padbytes),
        .pcieOut_last_out                                   (pcie_input_last),
        .pcieOut_full_in                                    (pcie_input_full),

        // Bypass -> Role
        .roleOut_rden_in                                    (pciebypass_role_output_rden),
        .roleOut_data_out                                   (pciebypass_role_output_data),
        .roleOut_slot_out                                   (pciebypass_role_output_slot),
        .roleOut_padbytes_out                               (pciebypass_role_output_padbytes),
        .roleOut_last_out                                   (pciebypass_role_output_last),
        .roleOut_empty_out                                  (pciebypass_role_output_empty),
        
        // Role -> Bypass
        .roleIn_wren_in                                     (pciebypass_role_input_wren),
        .roleIn_data_in                                     (pciebypass_role_input_data),
        .roleIn_slot_in                                     (pciebypass_role_input_slot),
        .roleIn_padbytes_in                                 (pciebypass_role_input_padbytes),
        .roleIn_last_in                                     (pciebypass_role_input_last),
        .roleIn_full_out                                    (pciebypass_role_input_full)
        
    );

logic               sl_rx_clk [3:0];
logic               sl_tx_clk [3:0];
SL3DataInterface    sl_rx [3:0];
SL3DataInterface    sl_tx [3:0];
logic               sl_tx_stall [3:0];
SL3OOBInterface     sl_rx_oob [3:0];
SL3OOBInterface     sl_tx_oob [3:0];
logic               sl_tx_oob_rden [3:0];


`ifdef USE_SL3
    // Transceiver Wires
    wire [`SL3_LANES-1:0]                                     xcvr_tx_out [3:0];
    wire [`SL3_LANES-1:0]                                     xcvr_rx_in  [3:0];

    assign xcvr_rx_in[0]                                      = xcvr_rx_0;
    assign xcvr_rx_in[1]                                      = xcvr_rx_1;
    assign xcvr_rx_in[2]                                      = xcvr_rx_2;
    assign xcvr_rx_in[3]                                      = xcvr_rx_3;

    assign xcvr_tx_0                                          = xcvr_tx_out[0];
    assign xcvr_tx_1                                          = xcvr_tx_out[1];
    assign xcvr_tx_2                                          = xcvr_tx_out[2];
    assign xcvr_tx_3                                          = xcvr_tx_out[3];

// Interface to Catapult Network: contains SL3 and Elastic Router
    SL3_Network SerialLinks
    (
        .core_clk                                             (core_clk),
        .core_reset                                           (core_reset),

        .mgmt_clk                                             (mgmt_clk),
        .mgmt_reset                                           (mgmt_reset),

        .xcvr_refclk                                          (xcvr_refclk),
        .xcvr_tx_out                                          (xcvr_tx_out),
        .xcvr_rx_in                                           (xcvr_rx_in),

        .sl_cfg_in                                            (sl_cfg),
        .sl_status_out                                        (sl_status),

        .sl_rx_clk_out                                        (sl_rx_clk),
        .sl_tx_clk_out                                        (sl_tx_clk),

        .sl_data_out                                          (sl_rx),
        .sl_data_in                                           (sl_tx),
        .sl_data_stall_out                                    (sl_tx_stall),
        .sl_oob_out                                           (sl_rx_oob),
        .sl_oob_in                                            (sl_tx_oob),
        .sl_oob_rden_out                                      (sl_tx_oob_rden)
    );
`endif


    //////////////////////////////////////////////////////////////////////////////
    // DDR Assembly
    //////////////////////////////////////////////////////////////////////////////

    wire                                                      umi_usr_clk;


`ifdef DDR_USE_LUTRAM
    localparam DDR_USE_LUTRAM = 1;
`else
    localparam DDR_USE_LUTRAM = 0;
`endif

    DramUser
    #(
        .USE_ECC                                              (ShellTypes::USE_ECC),
        .AVL_ADDR_WIDTH                                       (ShellTypes::AVL_ADDR_WIDTH),
        .AVL_DATA_WIDTH                                       (ShellTypes::AVL_DATA_WIDTH),
        .AVL_SPARE_WIDTH                                      (ShellTypes::AVL_SPARE_WIDTH),
        .AVL_BE_WIDTH                                         (ShellTypes::AVL_BE_WIDTH),
        .AVL_SIZE                                             (ShellTypes::AVL_SIZE),
        .NUM_UMI                                              (NUM_UMI),
        .UMI_ADDR_WIDTH                                       (ShellTypes::UMI_ADDR_WIDTH),
        .UMI_MASK_WIDTH                                       (ShellTypes::UMI_MASK_WIDTH),
        .UMI_DATA_WIDTH                                       (ShellTypes::UMI_DATA_WIDTH),
        .UMI_SPARE_WIDTH                                      (ShellTypes::UMI_SPARE_WIDTH),
        .USE_LUTRAM                                           (DDR_USE_LUTRAM)
    )
    DramUserInst_c0
    (
        .ddr_refclk                                           (mem_0_refclk),
        .global_reset_n                                       (1'b1),
        .oct_rzqin                                            (mem_0_rzq),

        .ddr_clk                                              (ddr_clk),
        .ddr_reset_n                                          (ddr_reset_n),
        .ddr_soft_reset_n                                     (1'b1),
        .core_clk                                             (core_clk),
        .umi_usr_clk                                          (umi_usr_clk),
        .pll_locked                                           (ddr_pll_locked),

        // DIMM 0 Status (on core clock)
        .ddr_0_present                                        (ddr_present[0]),
        .ddr_0_status_register_core                           (ddr_status_register_core[0]),
        .ddr_0_error_count_register_core                      (ddr_error_count_register_core[0]),
        .ddr_0_healthy_core                                   (ddr_healthy_core[0]),

        // DIMM 1 Status (on core clock)
        .ddr_1_present                                        (ddr_present[1]),
        .ddr_1_status_register_core                           (ddr_status_register_core[1]),
        .ddr_1_error_count_register_core                      (ddr_error_count_register_core[1]),
        .ddr_1_healthy_core                                   (ddr_healthy_core[1]),

`ifdef USE_DDR
        // DIMM 0 Pins
        .mem_0_a                                              (mem_0_a),
        .mem_0_ba                                             (mem_0_ba),
        .mem_0_ck                                             (mem_0_ck),
        .mem_0_ck_n                                           (mem_0_ck_n),
        .mem_0_cke                                            (mem_0_cke),
        .mem_0_cs_n                                           (mem_0_cs_n),
        .mem_0_dm                                             (mem_0_dm),
        .mem_0_ras_n                                          (mem_0_ras_n),
        .mem_0_cas_n                                          (mem_0_cas_n),
        .mem_0_we_n                                           (mem_0_we_n),
        .mem_0_reset_n                                        (mem_0_reset_n),
        .mem_0_dq                                             (mem_0_dq),
        .mem_0_dqs                                            (mem_0_dqs),
        .mem_0_dqs_n                                          (mem_0_dqs_n),
        .mem_0_odt                                            (mem_0_odt),

`ifdef USE_SECOND_DIMM
        // DIMM 1 Pins
        .mem_1_a                                              (mem_1_a),
        .mem_1_ba                                             (mem_1_ba),
        .mem_1_ck                                             (mem_1_ck),
        .mem_1_ck_n                                           (mem_1_ck_n),
        .mem_1_cke                                            (mem_1_cke),
        .mem_1_cs_n                                           (mem_1_cs_n),
        .mem_1_dm                                             (mem_1_dm),
        .mem_1_ras_n                                          (mem_1_ras_n),
        .mem_1_cas_n                                          (mem_1_cas_n),
        .mem_1_we_n                                           (mem_1_we_n),
        .mem_1_reset_n                                        (mem_1_reset_n),
        .mem_1_dq                                             (mem_1_dq),
        .mem_1_dqs                                            (mem_1_dqs),
        .mem_1_dqs_n                                          (mem_1_dqs_n),
        .mem_1_odt                                            (mem_1_odt),
`endif  // USE_DDR
`endif  // USE_SECOND_DIMM

        // User Memory Interface (core clock)
        .umi_grant_out                                      (umi_grant),
        .umi_raise_in                                       (umi_raise),
        .umi_write_in                                       (umi_write),
        .umi_addr_in                                        (umi_addr),
        .umi_wrmask_in                                      (umi_wrmask),
        .umi_size_in                                        (umi_size),
        .umi_wrdata_in                                      (umi_wrdata),
        .umi_wren_in                                        (umi_wren),
        .umi_wrrdy_out                                      (umi_wrrdy),
        .umi_rddata_out                                     (umi_rddata),
        .umi_rdrdy_out                                      (umi_rdrdy),
        .umi_rden_in                                        (umi_rden)
     
    );


    //////////////////////////////////////////////////////////////////////////////
    // I2C Interfaces
    //////////////////////////////////////////////////////////////////////////////
    
    MEZZ_I2C_REGS                                             mezz_i2c_addr;
    wire [7:0]                                                mezz_i2c_wrdata;
    wire                                                      mezz_i2c_rden;
    wire                                                      mezz_i2c_wren;
    
    logic [7:0]                                               mezz_i2c_rddata;
    logic                                                     mezz_i2c_rdvalid;
    wire  [7:0]                                               mezz_i2c_addr_wire;

    assign mezz_i2c_addr = MEZZ_I2C_REGS'(mezz_i2c_addr_wire);
    
    I2C_slave_io
    #(
        .ADDR                                                 (7'b111_0111),
        .DELAY_TIMER                                          (16'h000fa) //the formula is clk_freq/100khz/4
    ) i2c_slave (
        .clk                                                  (mgmt_clk), //100MHz
        .reset                                                (mgmt_reset), 

        .dout                                                 (mezz_i2c_rddata),               
        .d_valid                                              (mezz_i2c_rdvalid),
        .reg_addr                                             (mezz_i2c_addr_wire),
        .r_req                                                (mezz_i2c_rden),
        .w_req                                                (mezz_i2c_wren),
        .w_error                                              (1'b0),
        .din                                                  (mezz_i2c_wrdata),
        .sda                                                  (mezz_sda),
        .scl                                                  (mezz_scl),
        .state                                                ()
    );

    wire [7:0]                                                i2c_health;
    wire [7:0]                                                i2c_degrees_c;
    

    

    sync_regs#(.WIDTH(8),.DEPTH(2)) ic2_temp_sr (.clk(mgmt_clk),.din(degrees_c),.dout(i2c_degrees_c));
    sync_regs#(.WIDTH(8),.DEPTH(2)) i2c_health_sr(.clk(mgmt_clk),.din({7'b0, current_pcie_link_up}),.dout(i2c_health));
    

    localparam I2C_MAJOR_VERSION = 8'h00;

    always @(posedge mgmt_clk) begin
        if (mgmt_reset) begin
            mezz_i2c_rddata         <= 8'b0;
            mezz_i2c_rdvalid        <= 1'b0;
        end else begin
            mezz_i2c_rdvalid <= mezz_i2c_rden;
            case(mezz_i2c_addr)
                MEZZ_I2C_FPGA_TEMPERATURE:      mezz_i2c_rddata <=  i2c_degrees_c;
                MEZZ_I2C_FPGA_HEALTH:           mezz_i2c_rddata <=  i2c_health;
                MEZZ_I2C_VERSION:               mezz_i2c_rddata <=  I2C_MAJOR_VERSION; // hard-coded version number.
                default:                        mezz_i2c_rddata <=  8'h00;
            endcase

            if (mezz_i2c_wren) begin end
        end
    end


    //////////////////////////////////////////////////////////////////////
    // Role Instantiation
    //////////////////////////////////////////////////////////////////////

    wire                                                      softreg_read;
    wire                                                      softreg_write;
    wire [31:0]                                               softreg_addr;
    wire [63:0]                                               softreg_wrdata;
    wire [63:0]                                               softreg_rddata;
    wire                                                      softreg_rdvalid;
    wire [63:0]                                               shell_rddata0;
    wire [63:0]                                               shell_rddata1;
    wire [63:0]                                               shell_rddata2;
    wire [31:0]                                               shell_softreglock;
    wire                                                      shell_rdvalid;
    wire [7:0]                                                shell_number;

    wire [31:0]                                               soft_shell_id;
    wire [31:0]                                               soft_shell_version;
    wire [31:0]                                               soft_shell_status;
    wire [31:0]                                               role_id;
    wire [31:0]                                               role_version;
    wire [31:0]                                               role_status;

    wire                                                      role_pcie_full;
    wire                                                      role_pcie_empty;
    assign                                                    pciebypass_role_output_rden = ~role_pcie_full & ~pciebypass_role_output_empty;
    assign                                                    pciebypass_role_input_wren = ~role_pcie_empty & ~pciebypass_role_input_full;
    
    Role #(
        .NUM_UMI( NUM_UMI )    
    ) Role (
        .clk                            (core_clk),
        .rst                            (app_reset), 

        .pcie_clk                       (pcie_250_clk),
        .ddr_clk                        (ddr_clk),

        .umi_usr_clk                    (umi_usr_clk),
        .pcie_usr_clk                   (pcie_usr_clk),
        
        .umi_raise_out                  (umi_raise),
        .umi_write_out                  (umi_write),
        .umi_addr_out                   (umi_addr),
        .umi_size_out                   (umi_size),
        .umi_grant_in                   (umi_grant),

        .umi_rddata_in                  (umi_rddata),
        .umi_rdrdy_in                   (umi_rdrdy),
        .umi_rden_out                   (umi_rden),

        .umi_wrdata_out                 (umi_wrdata),
        .umi_wrmask_out                 (umi_wrmask),
        .umi_wren_out                   (umi_wren),
        .umi_wrrdy_in                   (umi_wrrdy),

        .pcie_data_in                   (pciebypass_role_output_data),
        .pcie_slot_in                   (pciebypass_role_output_slot),
        .pcie_padbytes_in               (pciebypass_role_output_padbytes),
        .pcie_last_in                   (pciebypass_role_output_last),
        .pcie_full_out                  (role_pcie_full),
        .pcie_wren_in                   (pciebypass_role_output_rden),

        .pcie_data_out                  (pciebypass_role_input_data),
        .pcie_slot_out                  (pciebypass_role_input_slot),
        .pcie_padbytes_out              (pciebypass_role_input_padbytes),
        .pcie_last_out                  (pciebypass_role_input_last),
        .pcie_empty_out                 (role_pcie_empty),
        .pcie_rden_in                   (pciebypass_role_input_wren),

        .id_out                         (soft_shell_id),
        .version_out                    (soft_shell_version),
        .status_out                     (soft_shell_status),

        .role_id_out                    (role_id),
        .role_version_out               (role_version),
        .role_status_out                (role_status),
        
        .softreg_read_in                (softreg_read),
        .softreg_write_in               (softreg_write),
        .softreg_addr_in                (softreg_addr),
        .softreg_wrdata_in              (softreg_wrdata),
        .softreg_rddata_out             (softreg_rddata),
        .softreg_rdvalid_out            (softreg_rdvalid),

        .sl_rx_clk_in                   (sl_rx_clk),
        .sl_tx_clk_in                   (sl_tx_clk),
        .sl_rx_in                       (sl_rx),
        .sl_tx_out                      (sl_tx),
        .sl_tx_stall_in                 (sl_tx_stall),
        .sl_rx_oob_in                   (sl_rx_oob),
        .sl_tx_oob_out                  (sl_tx_oob),
        .sl_tx_oob_rden_in              (sl_tx_oob_rden)
    );

    SoftRegs SoftRegs
    (
        .clk                                                  (core_clk),
        .rst                                                  (core_reset),

        //legacy 32-bit shell register interface - requires software mutex
        .shell_write_in                                       (register_write_req),
        .shell_read_in                                        (register_read_req),
        .shell_number_in                                      (register_number),
        .shell_wrdata_in                                      (register_write_data),
        .shell_rddata0_out                                    (shell_rddata0),
        .shell_rddata1_out                                    (shell_rddata1),
        .shell_rddata2_out                                    (shell_rddata2),
        .shell_softreglock_out                                (shell_softreglock), 
        .shell_rdvalid_out                                    (shell_rdvalid),
        .shell_number_out                                     (shell_number),

        //native 64-bit pcie register interface - no software mutex
        .shell64_write_in                                     (register64_write_req),
        .shell64_read_in                                      (register64_read_req),
        .shell64_number_in                                    (register64_number),
        .shell64_wrdata_in                                    (register64_write_data),
        .shell64_rddata_out                                   (register64_read_data),
        .shell64_rdvalid_out                                  (register64_read_valid),
        
        .softreg_read_out                                     (softreg_read),
        .softreg_write_out                                    (softreg_write),
        .softreg_addr_out                                     (softreg_addr),
        .softreg_wrdata_out                                   (softreg_wrdata),
        .softreg_rddata_in                                    (softreg_rddata),
        .softreg_rdvalid_in                                   (softreg_rdvalid)
    );

    

    //////////////////////////////////////////////////////////////////////////////
    // Configuration CRC
    ////////////////////////////////////////////////////////////////////////////// 

    wire [15:0] cfg_crcerror_cnt;

    ConfigCRC ConfigCRC
    (
        .config_crc_clk                                       (config_crc_clk),
        .core_clk                                             (core_clk),
        .core_reset                                           (core_reset),
        .control_register                                     (control_register),
        .cfg_crcerror_cnt                                     (cfg_crcerror_cnt)
    );

    //////////////////////////////////////////////////////////////////////////////
    // Control Register Fields
    //////////////////////////////////////////////////////////////////////////////

    wire   clear_temp_records                                 = control_register[3];
    assign pcie_loopback_enable                               = control_register[5];
    assign pcie_role_enable                                   = control_register[6];
    assign manual_app_reset                                   = control_register[30];
    assign manual_core_reset                                  = control_register[31];

    //////////////////////////////////////////////////////////////////////////////
    // Status Update Registers
    //////////////////////////////////////////////////////////////////////////////

    wire        shell_ready;
    wire [31:0] capabilities_register;
    wire [31:0] shell_status_register     = {28'h0, ddr_pll_locked, core_clk_locked, 1'b1, shell_ready};
    assign      shell_ready               = core_clk_locked & ddr_healthy_core[0];
    wire [31:0] pcie_status_register      = {26'h0, current_pcie_speed, current_pcie_lanes};
    wire [31:0] pcie_status_register_sync;
    wire [31:0] slot_dma_health_status_sync;

    assign capabilities_register[0]       = ddr_present[1];
    assign capabilities_register[1]       = ddr_present[0];
    assign capabilities_register[2]       = 1'b0;
    assign capabilities_register[3]       = 1'b0;
    assign capabilities_register[4]       = pcie_present;
    assign capabilities_register[5]       = 1'b0;
    assign capabilities_register[6]       = soft_reg_native_64_supported;
    assign capabilities_register[31:7]    = 25'h0;

    wire [PCIE_DEBUG_WIDTH-1:0] pcie_0_debug_sync;
    wire [PCIE_DEBUG_WIDTH-1:0] pcie_1_debug_sync;
    sync_regs#(.WIDTH(PCIE_DEBUG_WIDTH),.DEPTH(2)) sr_pcie_0_dbg (.clk(core_clk),.din(pcie_0_debug),.dout(pcie_0_debug_sync));
    sync_regs#(.WIDTH(PCIE_DEBUG_WIDTH),.DEPTH(2)) sr_pcie_1_dbg (.clk(core_clk),.din(pcie_1_debug),.dout(pcie_1_debug_sync));

    sync_regs#(.WIDTH(32),.DEPTH(2)) sr_stat0 (.clk(core_clk),.din(pcie_status_register),.dout(pcie_status_register_sync));
    sync_regs#(.WIDTH(32),.DEPTH(2)) sr_stat1 (.clk(core_clk),.din(slot_dma_health_status),.dout(slot_dma_health_status_sync));
    
    wire [63:0] unique_chip_id;
    wire [63:0] unique_chip_id_core;
    wire [31:0] temperature_status;

    //SL3
    wire [31:0] sl3_link_status;
    assign sl3_link_status[31:12] = 20'h0;
    assign sl3_link_status[11:8]  = {sl_status.hard_error[kWest], sl_status.hard_error[kEast], sl_status.hard_error[kSouth], sl_status.hard_error[kNorth]};
    assign sl3_link_status[7:4]   = {1'b0, 1'b0, 1'b0, 1'b0}; 
    assign sl3_link_status[3:0]   = {&sl_status.word_lock[kWest], &sl_status.word_lock[kEast], &sl_status.word_lock[kSouth], &sl_status.word_lock[kNorth]};

    wire [15:0] sl3_sbe [3:0];
    wire [15:0] sl3_dbe [3:0];

    genvar i;
    generate
        for(i=0; i < 4; i=i+1) begin : gen_sl3_secded_counters
            assign sl3_sbe[i] = (|sl_status.single_bit_ecc_err_cnt[i][31:16]) ? 16'hFFFF : sl_status.single_bit_ecc_err_cnt[i][15:0];
            assign sl3_dbe[i] = (|sl_status.double_bit_ecc_err_cnt[i][31:16]) ? 16'hFFFF : sl_status.double_bit_ecc_err_cnt[i][15:0];
        end
    endgenerate

    assign sl_cfg.node_id           =  control_register2[7:0];
    assign sl_cfg.force_dfe[kNorth] =  control_register2[8];
    assign sl_cfg.force_dfe[kSouth] =  control_register2[9];
    assign sl_cfg.force_dfe[kEast]  =  control_register2[10];
    assign sl_cfg.force_dfe[kWest]  =  control_register2[11];
    assign sl_cfg.sl3_reset_NS      =  control_register2[12];
    assign sl_cfg.sl3_reset_EW      =  control_register2[13];
    assign sl_cfg.clear_ecc_err_cnt =  control_register[14];
    assign sl_cfg.rx_halt[kNorth]   = ~control_register2[16];
    assign sl_cfg.rx_halt[kSouth]   = ~control_register2[17];
    assign sl_cfg.rx_halt[kEast]    = ~control_register2[18];
    assign sl_cfg.rx_halt[kWest]    = ~control_register2[19];

    Status_Mux big_status_mux // Pipelined 4 deep
    (
        .clock                               (core_clk),
        .sel                                 (shell_rdvalid == 1'b1 ? shell_number[6:0] : register_number[6:0]),
        .result                              (register_read_data),
        .data0x                              (control_register),
        .data4x                              (32'b0),
        .data5x                              (control_register2),
        .data11x                             (shell_softreglock), 
        .data12x                             (/*reserved for soft register address command*/),
        .data13x                             (shell_rddata0[31:0]),
        .data14x                             (shell_rddata0[63:32]),
        .data15x                             (/*reserved for soft register read command*/),
        .data16x                             (shell_rddata1[31:0]),
        .data17x                             (shell_rddata1[63:32]),
        .data18x                             (32'b0),

        .data19x                             (32'b0),
        .data20x                             (32'b0),
        .data21x                             (32'b0),
        .data22x                             (32'b0),

        .data23x                             (32'b0),
        .data24x                             (32'b0),
        .data25x                             (32'b0),
        .data26x                             (32'b0),

        .data27x                             (32'b0),
        .data28x                             (32'b0),
        .data29x                             (32'b0),
        .data30x                             (32'b0),
        .data31x                             (32'b0),
        .data32x                             (ddr_status_register_core[1]),
        .data33x                             (ddr_error_count_register_core[1]),

        .data34x                             (slot_dma_health_status_sync),
        .data35x                             (32'b0),
        .data36x                             (32'b0),
        .data37x                             (32'b0),
        .data38x                             (32'b0),
        .data40x                             (shell_rddata2[31:0]),
        .data41x                             (shell_rddata2[63:32]),
        .data42x                             (32'b0),
        .data43x                             (32'b0),
        .data44x                             (32'b0),
        .data45x                             (32'b0),
        .data46x                             (32'b0),
        .data47x                             (32'b0),
        
        .data57x                             (BOARD_ID),
        .data58x                             ({SHELL_RELEASE_MAJOR_VERSION,SHELL_RELEASE_MINOR_VERSION}),
        .data59x                             (32'b0),
        .data60x                             (32'b0),
        .data61x                             (soft_shell_version),
        .data62x                             (unique_chip_id_core[31:0]),
        .data63x                             (unique_chip_id_core[63:32]),
        .data64x                             (SHELL_RELEASE_ID),
        .data65x                             (role_version),
        .data66x                             (cycle_counter[31:0]),
        .data67x                             (cycle_counter[63:32]),
        .data68x                             (shell_status_register),
        .data69x                             (pcie_status_register_sync),
        .data70x                             (role_status),  
        .data71x                             (temperature_status),
        .data72x                             (capabilities_register),
        .data73x                             (ddr_status_register_core[0]),
        .data74x                             (ddr_error_count_register_core[0]),
        .data75x                             ({16'b0,pcie_id}),
        .data76x                             (pcie_version),
        .data77x                             (32'b0),
        // Catapult Network Link Status (80 to 97)
        .data80x                             (sl_status.link_status[kNorth]),
        .data81x                             ({sl3_dbe[kNorth], sl3_sbe[kNorth]}),
        .data82x                             (32'h0),
        .data83x                             (32'h0),
        .data84x                             (sl_status.link_status[kSouth]),
        .data85x                             ({sl3_dbe[kSouth], sl3_sbe[kSouth]}),
        .data86x                             (32'h0),
        .data87x                             (32'h0),
        .data88x                             (sl_status.link_status[kEast]),
        .data89x                             ({sl3_dbe[kEast], sl3_sbe[kEast]}),
        .data90x                             (32'h0),
        .data91x                             (32'h0),
        .data92x                             (sl_status.link_status[kWest]),
        .data93x                             ({sl3_dbe[kWest], sl3_sbe[kWest]}),
        .data94x                             (32'h0),
        .data95x                             (32'h0),
        .data96x                             (sl3_link_status),
        .data97x                             ({sl_status.neighbor_node_id[kWest],sl_status.neighbor_node_id[kEast],sl_status.neighbor_node_id[kSouth],sl_status.neighbor_node_id[kNorth]}),
        
        .data99x                             (soft_shell_id),
        .data100x                            (soft_shell_status),
        .data101x                            (role_id),
        .data104x                            ({16'd0, cfg_crcerror_cnt}),
        .data105x                            ({24'h0, I2C_MAJOR_VERSION}),
        .data106x                            (32'b0),
        
        .data112x                            (pcie_0_debug_sync[223:192]),    // AEQ CTLEs
        .data113x                            (pcie_0_debug_sync[255:224]),    // Forced CTLE Value
        .data114x                            (pcie_1_debug_sync[223:192]),    // AEQ CTLEs
        .data115x                            (pcie_1_debug_sync[255:224]),    // Forced CTLE Value
        
        .data116x                            (pcie_0_debug_sync[95:64]),    // ltssmstate history
        .data117x                            (pcie_0_debug_sync[127:96]),
        .data118x                            (pcie_0_debug_sync[159:128]),
        .data119x                            (pcie_0_debug_sync[191:160]),
        .data120x                            (pcie_1_debug_sync[95:64]),    // ltssmstate history
        .data121x                            (pcie_1_debug_sync[127:96]),
        .data122x                            (pcie_1_debug_sync[159:128]),
        .data123x                            (pcie_1_debug_sync[191:160]),
        .data124x                            (pcie_0_debug_sync[31:0]),
        .data125x                            (pcie_0_debug_sync[63:32]),
        .data126x                            (pcie_1_debug_sync[31:0]),
        .data127x                            (pcie_1_debug_sync[63:32])
    );

    always@(posedge core_clk)
        control_register <= (register_write_req & (register_number == 8'd0)) ? register_write_data : control_register;

    always@(posedge core_clk)
        control_register2 <= (register_write_req & (register_number == 8'd5)) ? register_write_data : control_register2;

    // Special asynchronous shell registers that may take more than 4 cycles to read.
    wire asyncShellRegs = (register_number == 13) | (register_number == 16) | (register_number == 17) | (register_number == 40) | (register_number == 41) | (register_number == 11);

    shell_shift_reg#(.WIDTH(1),.DELAY(4)) read_valid_sr(.CLK(core_clk),.in((register_read_req & ~asyncShellRegs) | shell_rdvalid),.out(register_read_data_valid));

    //////////////////////////////////////////////////////////////////////////////
    // Temperature Sensor and LEDs
    //////////////////////////////////////////////////////////////////////////////

    

    Temperature Temperature
    (
        .core_clk                           (core_clk),
        .mgmt_clk                           (mgmt_clk),
        .clear_temp_records                 (clear_temp_records),
        .shell_reset                        (shell_reset),
        .cycle_counter                      (cycle_counter),
        .temperature_shutdown               (temperature_shutdown),
        .temperature_status                 (temperature_status),
        .degrees_c_out                      (degrees_c)
    );
    

    // Pikes Peak / Storey Peak LEDs:
    //  (green) LEDs[0] = D1
    //  (green) LEDs[1] = D2
    //  (green) LEDs[2] = D3
    //  (green) LEDs[3] = D4
    //  (green) LEDs[4] = D5
    //  (green) LEDs[5] = D6
    //  (green) LEDs[6] = D7
    //  (green) LEDs[7] = D8
    //  (amber) --12v-- = D9
    
    // Speed/lanes are internally synchronized
    PCIeStatusLEDs PCIe_0_Status_LEDs
    (
            .pcie_refclk  ( pcie_0_refclk ),
            .pcie_speed   ( current_pcie_speed[0] ),
            .pcie_lanes   ( current_pcie_lanes[0] ),
            
            .heartbeat_LED( LEDs[0] ),
            .speed_LED    ( LEDs[1] ),
            .lanes_LED    ( LEDs[2] )
    );
    
    assign LEDs[3] = 1'b0;
    assign LEDs[4] = 1'b0;
    assign LEDs[5] = 1'b0;
    assign LEDs[6] = 1'b0;
    assign LEDs[7] = 1'b0;
    

    //////////////////////////////////////////////////////////////////////////////
    // Unique Chip ID
    //////////////////////////////////////////////////////////////////////////////
    
    logic                                 unique_chip_id_valid;

    Unique_Chip_ID #(
        .TARGET_DEVICE(TARGET_DEVICE)
    )
    Chip_ID
    (
        .clk                              (asmi_rsu_clk),              // max 30MHz Clock
        .rst                              (asmi_rsu_reset),
        .chip_id                          (unique_chip_id),
        .data_valid                       (unique_chip_id_valid)
    );
    sync_regs#(.WIDTH(64),.DEPTH(2)) sr_chipid0 (.clk(core_clk),.din(unique_chip_id_valid ? unique_chip_id : 64'b0),.dout(unique_chip_id_core));


endmodule

//DV_FIX default_nettype//`default_nettype wire
