
# (C) 2001-2016 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 14.0 209 win32 2016.09.14.18:14:02

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "ddr3_dimm0"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/14.0.2.209/quartus/"
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_sequencer_mem.hex ./
  file copy -force $QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_AC_ROM.hex ./
  file copy -force $QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_inst_ROM.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                       ./libraries/altera_ver           
vmap       altera_ver            ./libraries/altera_ver           
ensure_lib                       ./libraries/lpm_ver              
vmap       lpm_ver               ./libraries/lpm_ver              
ensure_lib                       ./libraries/sgate_ver            
vmap       sgate_ver             ./libraries/sgate_ver            
ensure_lib                       ./libraries/altera_mf_ver        
vmap       altera_mf_ver         ./libraries/altera_mf_ver        
ensure_lib                       ./libraries/altera_lnsim_ver     
vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver     
ensure_lib                       ./libraries/stratixv_ver         
vmap       stratixv_ver          ./libraries/stratixv_ver         
ensure_lib                       ./libraries/stratixv_hssi_ver    
vmap       stratixv_hssi_ver     ./libraries/stratixv_hssi_ver    
ensure_lib                       ./libraries/stratixv_pcie_hip_ver
vmap       stratixv_pcie_hip_ver ./libraries/stratixv_pcie_hip_ver
ensure_lib                                  ./libraries/rsp_mux                         
vmap       rsp_mux                          ./libraries/rsp_mux                         
ensure_lib                                  ./libraries/rsp_demux                       
vmap       rsp_demux                        ./libraries/rsp_demux                       
ensure_lib                                  ./libraries/cmd_mux                         
vmap       cmd_mux                          ./libraries/cmd_mux                         
ensure_lib                                  ./libraries/cmd_demux                       
vmap       cmd_demux                        ./libraries/cmd_demux                       
ensure_lib                                  ./libraries/if_csr_m0_master_limiter        
vmap       if_csr_m0_master_limiter         ./libraries/if_csr_m0_master_limiter        
ensure_lib                                  ./libraries/router_001                      
vmap       router_001                       ./libraries/router_001                      
ensure_lib                                  ./libraries/router                          
vmap       router                           ./libraries/router                          
ensure_lib                                  ./libraries/crosser                         
vmap       crosser                          ./libraries/crosser                         
ensure_lib                                  ./libraries/rsp_mux_001                     
vmap       rsp_mux_001                      ./libraries/rsp_mux_001                     
ensure_lib                                  ./libraries/cmd_demux_001                   
vmap       cmd_demux_001                    ./libraries/cmd_demux_001                   
ensure_lib                                  ./libraries/router_003                      
vmap       router_003                       ./libraries/router_003                      
ensure_lib                                  ./libraries/s0_seq_debug_agent              
vmap       s0_seq_debug_agent               ./libraries/s0_seq_debug_agent              
ensure_lib                                  ./libraries/dmaster_master_agent            
vmap       dmaster_master_agent             ./libraries/dmaster_master_agent            
ensure_lib                                  ./libraries/s0_seq_debug_translator         
vmap       s0_seq_debug_translator          ./libraries/s0_seq_debug_translator         
ensure_lib                                  ./libraries/dmaster_master_translator       
vmap       dmaster_master_translator        ./libraries/dmaster_master_translator       
ensure_lib                                  ./libraries/a0                              
vmap       a0                               ./libraries/a0                              
ensure_lib                                  ./libraries/ng0                             
vmap       ng0                              ./libraries/ng0                             
ensure_lib                                  ./libraries/p2b_adapter                     
vmap       p2b_adapter                      ./libraries/p2b_adapter                     
ensure_lib                                  ./libraries/b2p_adapter                     
vmap       b2p_adapter                      ./libraries/b2p_adapter                     
ensure_lib                                  ./libraries/transacto                       
vmap       transacto                        ./libraries/transacto                       
ensure_lib                                  ./libraries/p2b                             
vmap       p2b                              ./libraries/p2b                             
ensure_lib                                  ./libraries/b2p                             
vmap       b2p                              ./libraries/b2p                             
ensure_lib                                  ./libraries/fifo                            
vmap       fifo                             ./libraries/fifo                            
ensure_lib                                  ./libraries/timing_adt                      
vmap       timing_adt                       ./libraries/timing_adt                      
ensure_lib                                  ./libraries/jtag_phy_embedded_in_jtag_master
vmap       jtag_phy_embedded_in_jtag_master ./libraries/jtag_phy_embedded_in_jtag_master
ensure_lib                                  ./libraries/rst_controller                  
vmap       rst_controller                   ./libraries/rst_controller                  
ensure_lib                                  ./libraries/mm_interconnect_1               
vmap       mm_interconnect_1                ./libraries/mm_interconnect_1               
ensure_lib                                  ./libraries/mm_interconnect_0               
vmap       mm_interconnect_0                ./libraries/mm_interconnect_0               
ensure_lib                                  ./libraries/seq_bridge                      
vmap       seq_bridge                       ./libraries/seq_bridge                      
ensure_lib                                  ./libraries/dll0                            
vmap       dll0                             ./libraries/dll0                            
ensure_lib                                  ./libraries/oct0                            
vmap       oct0                             ./libraries/oct0                            
ensure_lib                                  ./libraries/c0                              
vmap       c0                               ./libraries/c0                              
ensure_lib                                  ./libraries/dmaster                         
vmap       dmaster                          ./libraries/dmaster                         
ensure_lib                                  ./libraries/s0                              
vmap       s0                               ./libraries/s0                              
ensure_lib                                  ./libraries/m0                              
vmap       m0                               ./libraries/m0                              
ensure_lib                                  ./libraries/p0                              
vmap       p0                               ./libraries/p0                              
ensure_lib                                  ./libraries/pll0                            
vmap       pll0                             ./libraries/pll0                            
ensure_lib                                  ./libraries/ddr3_dimm0                      
vmap       ddr3_dimm0                       ./libraries/ddr3_dimm0                      

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                    -work altera_ver           
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                             -work lpm_ver              
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                -work sgate_ver            
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                            -work altera_mf_ver        
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                        -work altera_lnsim_ver     
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                       -work stratixv_ver         
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                  -work stratixv_hssi_ver    
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"              -work stratixv_pcie_hip_ver
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_arbitrator.sv"                                           -work rsp_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1_rsp_mux.sv"                               -work rsp_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1_rsp_demux.sv"                             -work rsp_demux                       
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_arbitrator.sv"                                           -work cmd_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1_cmd_mux.sv"                               -work cmd_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1_cmd_demux.sv"                             -work cmd_demux                       
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_traffic_limiter.sv"                                      -work if_csr_m0_master_limiter        
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_reorder_memory.sv"                                       -work if_csr_m0_master_limiter        
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_sc_fifo.v"                                               -work if_csr_m0_master_limiter        
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_pipeline_base.v"                                      -work if_csr_m0_master_limiter        
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1_router_001.sv"                            -work router_001                      
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1_router.sv"                                -work router                          
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_handshake_clock_crosser.v"                            -work crosser                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_clock_crosser.v"                                      -work crosser                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_pipeline_base.v"                                      -work crosser                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_arbitrator.sv"                                           -work rsp_mux_001                     
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_rsp_mux_001.sv"                           -work rsp_mux_001                     
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_arbitrator.sv"                                           -work rsp_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                       
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_arbitrator.sv"                                           -work cmd_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                   
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                       
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_router_003.sv"                            -work router_003                      
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_router_001.sv"                            -work router_001                      
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0_router.sv"                                -work router                          
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_slave_agent.sv"                                          -work s0_seq_debug_agent              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_burst_uncompressor.sv"                                   -work s0_seq_debug_agent              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_master_agent.sv"                                         -work dmaster_master_agent            
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_slave_translator.sv"                                     -work s0_seq_debug_translator         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_master_translator.sv"                                    -work dmaster_master_translator       
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_mm_st_converter.v"                                        -work a0                              
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_addr_cmd.v"                                               -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_addr_cmd_wrap.v"                                          -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ddr2_odt_gen.v"                                           -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ddr3_odt_gen.v"                                           -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_lpddr2_addr_cmd.v"                                        -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_odt_gen.v"                                                -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_rdwr_data_tmg.v"                                          -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_arbiter.v"                                                -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_burst_gen.v"                                              -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_cmd_gen.v"                                                -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_csr.v"                                                    -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_buffer.v"                                                 -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_buffer_manager.v"                                         -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_burst_tracking.v"                                         -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_dataid_manager.v"                                         -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_fifo.v"                                                   -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_list.v"                                                   -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_rdata_path.v"                                             -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_wdata_path.v"                                             -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_decoder.v"                                            -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_decoder_32_syn.v"                                     -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_decoder_64_syn.v"                                     -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_encoder.v"                                            -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_encoder_32_syn.v"                                     -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_encoder_64_syn.v"                                     -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_ecc_encoder_decoder_wrapper.v"                            -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_axi_st_converter.v"                                       -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_input_if.v"                                               -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_rank_timer.v"                                             -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_sideband.v"                                               -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_tbp.v"                                                    -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_timing_param.v"                                           -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_controller.v"                                             -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_ddrx_controller_st_top.v"                                      -work ng0                             
  vlog  \"+incdir+$QSYS_SIMDIR/ddr3_dimm0/\" "$QSYS_SIMDIR/ddr3_dimm0/alt_mem_if_nextgen_ddr3_controller_core.sv"                            -work ng0                             
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_dmaster_p2b_adapter.sv"                                     -work p2b_adapter                     
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_dmaster_b2p_adapter.sv"                                     -work b2p_adapter                     
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_packets_to_master.v"                                     -work transacto                       
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_packets_to_bytes.v"                                   -work p2b                             
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_bytes_to_packets.v"                                   -work b2p                             
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_sc_fifo.v"                                               -work fifo                            
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_dmaster_timing_adt.sv"                                      -work timing_adt                      
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_jtag_interface.v"                                     -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_jtag_dc_streaming.v"                                            -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_jtag_sld_node.v"                                                -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_jtag_streaming.v"                                               -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_pli_streaming.v"                                                -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_clock_crosser.v"                                      -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_pipeline_base.v"                                      -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_idle_remover.v"                                       -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_idle_inserter.v"                                      -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_st_pipeline_stage.sv"                                    -work jtag_phy_embedded_in_jtag_master
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_reset_controller.v"                                             -work rst_controller                  
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_reset_synchronizer.v"                                           -work rst_controller                  
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_1.v"                                        -work mm_interconnect_1               
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_mm_interconnect_0.v"                                        -work mm_interconnect_0               
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_simple_avalon_mm_bridge.sv"                              -work seq_bridge                      
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_dll_stratixv.sv"                                         -work dll0                            
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_oct_stratixv.sv"                                         -work oct0                            
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_c0.v"                                                       -work c0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_dmaster.v"                                                  -work dmaster                         
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0.v"                                                       -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_avalon_mm_bridge.v"                                             -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst.v"            -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst_test_bench.v" -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_sequencer_mem_no_ifdef_params.sv"                        -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_mem_if_sequencer_rst.sv"                                        -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_arbitrator.sv"                                           -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_burst_uncompressor.sv"                                   -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_master_agent.sv"                                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_reorder_memory.sv"                                       -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_slave_agent.sv"                                          -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altera_merlin_traffic_limiter.sv"                                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_irq_mapper.sv"                                           -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0.v"                                     -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_cmd_demux.sv"                          -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_cmd_demux_001.sv"                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_cmd_demux_002.sv"                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_cmd_mux.sv"                            -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_cmd_mux_003.sv"                        -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_cmd_mux_005.sv"                        -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_router.sv"                             -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_router_001.sv"                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_router_002.sv"                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_router_003.sv"                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_router_006.sv"                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_router_008.sv"                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_rsp_demux_003.sv"                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_rsp_demux_005.sv"                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_rsp_mux.sv"                            -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_rsp_mux_001.sv"                        -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_s0_mm_interconnect_0_rsp_mux_002.sv"                        -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_ac_ROM_no_ifdef_params.v"                                   -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_ac_ROM_reg.v"                                               -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_bitcheck.v"                                                 -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_core.sv"                                                    -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_datamux.v"                                                  -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_data_broadcast.v"                                           -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_data_decoder.v"                                             -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_ddr3.v"                                                     -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_di_buffer.v"                                                -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_di_buffer_wrap.v"                                           -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_dm_decoder.v"                                               -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_generic.sv"                                                 -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_inst_ROM_no_ifdef_params.v"                                 -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_inst_ROM_reg.v"                                             -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_jumplogic.v"                                                -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_lfsr12.v"                                                   -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_lfsr36.v"                                                   -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_lfsr72.v"                                                   -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_pattern_fifo.v"                                             -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_ram.v"                                                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_ram_csr.v"                                                  -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_read_datapath.v"                                            -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/rw_manager_write_decoder.v"                                            -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_data_mgr.sv"                                                 -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_phy_mgr.sv"                                                  -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_reg_file.sv"                                                 -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_acv_phase_decode.v"                                      -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_acv_wrapper.sv"                                          -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_mgr.sv"                                                  -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_reg_file.v"                                              -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_siii_phase_decode.v"                                     -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_siii_wrapper.sv"                                         -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_sv_phase_decode.v"                                       -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/sequencer_scc_sv_wrapper.sv"                                           -work s0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/afi_mux_ddr3_ddrx_use_shadow_regs.v"                                   -work m0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_clock_pair_generator.v"                                  -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_read_valid_selector.v"                                   -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_addr_cmd_datapath.v"                                     -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_reset.v"                                                 -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_acv_ldc.v"                                               -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_memphy.sv"                                               -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_reset_sync.v"                                            -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_new_io_pads.v"                                           -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_fr_cycle_shifter.v"                                      -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_fr_cycle_extender.v"                                     -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_read_datapath.sv"                                        -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_write_datapath.v"                                        -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_core_shadow_registers.sv"                                -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_simple_ddio_out.sv"                                      -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_phy_csr.sv"                                              -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_iss_probe.v"                                             -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_addr_cmd_ldc_pads.v"                                     -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_addr_cmd_ldc_pad.v"                                      -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_addr_cmd_non_ldc_pad.v"                                  -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/read_fifo_hard_abstract_ddrx_lpddrx.sv"                                -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_read_fifo_hard.v"                                        -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0.sv"                                                      -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_p0_altdqdqs.v"                                              -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altdq_dqs2_stratixv_use_shadow_regs.sv"                                -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altdq_dqs2_abstract.sv"                                                -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/altdq_dqs2_cal_delays.sv"                                              -work p0                              
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_pll0.sv"                                                    -work pll0                            
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0/ddr3_dimm0_0002.v"                                                     -work ddr3_dimm0                      
  vlog                                       "$QSYS_SIMDIR/ddr3_dimm0.v"                                                                                                           
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L if_csr_m0_master_limiter -L router_001 -L router -L crosser -L rsp_mux_001 -L cmd_demux_001 -L router_003 -L s0_seq_debug_agent -L dmaster_master_agent -L s0_seq_debug_translator -L dmaster_master_translator -L a0 -L ng0 -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_1 -L mm_interconnect_0 -L seq_bridge -L dll0 -L oct0 -L c0 -L dmaster -L s0 -L m0 -L p0 -L pll0 -L ddr3_dimm0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L if_csr_m0_master_limiter -L router_001 -L router -L crosser -L rsp_mux_001 -L cmd_demux_001 -L router_003 -L s0_seq_debug_agent -L dmaster_master_agent -L s0_seq_debug_translator -L dmaster_master_translator -L a0 -L ng0 -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_1 -L mm_interconnect_0 -L seq_bridge -L dll0 -L oct0 -L c0 -L dmaster -L s0 -L m0 -L p0 -L pll0 -L ddr3_dimm0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
