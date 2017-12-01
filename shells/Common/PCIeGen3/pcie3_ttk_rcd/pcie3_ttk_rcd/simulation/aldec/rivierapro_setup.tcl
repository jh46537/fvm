
# (C) 2001-2015 Altera Corporation. All rights reserved.
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

# ACDS 14.0 209 win32 2015.09.16.20:39:47

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
  set TOP_LEVEL_NAME "pcie3_ttk_rcd"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "D:/altera/14.0/quartus/"
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
ensure_lib                                                 ./libraries/rsp_mux                                        
vmap       rsp_mux                                         ./libraries/rsp_mux                                        
ensure_lib                                                 ./libraries/rsp_demux                                      
vmap       rsp_demux                                       ./libraries/rsp_demux                                      
ensure_lib                                                 ./libraries/cmd_mux                                        
vmap       cmd_mux                                         ./libraries/cmd_mux                                        
ensure_lib                                                 ./libraries/cmd_demux                                      
vmap       cmd_demux                                       ./libraries/cmd_demux                                      
ensure_lib                                                 ./libraries/router_002                                     
vmap       router_002                                      ./libraries/router_002                                     
ensure_lib                                                 ./libraries/router                                         
vmap       router                                          ./libraries/router                                         
ensure_lib                                                 ./libraries/alt_xcvr_reconfig_0_reconfig_mgmt_agent        
vmap       alt_xcvr_reconfig_0_reconfig_mgmt_agent         ./libraries/alt_xcvr_reconfig_0_reconfig_mgmt_agent        
ensure_lib                                                 ./libraries/pcie_reconfig_driver_0_reconfig_mgmt_agent     
vmap       pcie_reconfig_driver_0_reconfig_mgmt_agent      ./libraries/pcie_reconfig_driver_0_reconfig_mgmt_agent     
ensure_lib                                                 ./libraries/alt_xcvr_reconfig_0_reconfig_mgmt_translator   
vmap       alt_xcvr_reconfig_0_reconfig_mgmt_translator    ./libraries/alt_xcvr_reconfig_0_reconfig_mgmt_translator   
ensure_lib                                                 ./libraries/pcie_reconfig_driver_0_reconfig_mgmt_translator
vmap       pcie_reconfig_driver_0_reconfig_mgmt_translator ./libraries/pcie_reconfig_driver_0_reconfig_mgmt_translator
ensure_lib                                                 ./libraries/p2b_adapter                                    
vmap       p2b_adapter                                     ./libraries/p2b_adapter                                    
ensure_lib                                                 ./libraries/b2p_adapter                                    
vmap       b2p_adapter                                     ./libraries/b2p_adapter                                    
ensure_lib                                                 ./libraries/transacto                                      
vmap       transacto                                       ./libraries/transacto                                      
ensure_lib                                                 ./libraries/p2b                                            
vmap       p2b                                             ./libraries/p2b                                            
ensure_lib                                                 ./libraries/b2p                                            
vmap       b2p                                             ./libraries/b2p                                            
ensure_lib                                                 ./libraries/fifo                                           
vmap       fifo                                            ./libraries/fifo                                           
ensure_lib                                                 ./libraries/timing_adt                                     
vmap       timing_adt                                      ./libraries/timing_adt                                     
ensure_lib                                                 ./libraries/jtag_phy_embedded_in_jtag_master               
vmap       jtag_phy_embedded_in_jtag_master                ./libraries/jtag_phy_embedded_in_jtag_master               
ensure_lib                                                 ./libraries/rst_controller                                 
vmap       rst_controller                                  ./libraries/rst_controller                                 
ensure_lib                                                 ./libraries/mm_interconnect_0                              
vmap       mm_interconnect_0                               ./libraries/mm_interconnect_0                              
ensure_lib                                                 ./libraries/master_0                                       
vmap       master_0                                        ./libraries/master_0                                       
ensure_lib                                                 ./libraries/alt_xcvr_reconfig_0                            
vmap       alt_xcvr_reconfig_0                             ./libraries/alt_xcvr_reconfig_0                            
ensure_lib                                                 ./libraries/pcie_reconfig_driver_0                         
vmap       pcie_reconfig_driver_0                          ./libraries/pcie_reconfig_driver_0                         
ensure_lib                                                 ./libraries/DUT                                            
vmap       DUT                                             ./libraries/DUT                                            

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
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                              -work rsp_mux                                        
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0_rsp_mux.sv"               -work rsp_mux                                        
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0_rsp_demux.sv"             -work rsp_demux                                      
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                              -work cmd_mux                                        
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0_cmd_mux.sv"               -work cmd_mux                                        
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0_cmd_demux.sv"             -work cmd_demux                                      
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0_router_002.sv"            -work router_002                                     
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0_router.sv"                -work router                                         
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                             -work alt_xcvr_reconfig_0_reconfig_mgmt_agent        
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                      -work alt_xcvr_reconfig_0_reconfig_mgmt_agent        
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                            -work pcie_reconfig_driver_0_reconfig_mgmt_agent     
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                        -work alt_xcvr_reconfig_0_reconfig_mgmt_translator   
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                       -work pcie_reconfig_driver_0_reconfig_mgmt_translator
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_master_0_p2b_adapter.sv"                    -work p2b_adapter                                    
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_master_0_b2p_adapter.sv"                    -work b2p_adapter                                    
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master.v"                        -work transacto                                      
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"                      -work p2b                                            
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets.v"                      -work b2p                                            
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                  -work fifo                                           
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_master_0_timing_adt.sv"                     -work timing_adt                                     
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_jtag_interface.v"                        -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_jtag_dc_streaming.v"                               -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_jtag_sld_node.v"                                   -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_jtag_streaming.v"                                  -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_pli_streaming.v"                                   -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                         -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                         -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_remover.v"                          -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_inserter.v"                         -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                       -work jtag_phy_embedded_in_jtag_master               
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                -work rst_controller                                 
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                              -work rst_controller                                 
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_mm_interconnect_0.v"                        -work mm_interconnect_0                              
  vlog  "$QSYS_SIMDIR/submodules/pcie3_ttk_rcd_master_0.v"                                 -work master_0                                       
  vlog  "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_h.sv"                                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv"                                   -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_dfe_cal_sweep_h.sv"                               -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig.sv"                                     -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_sv.sv"                                  -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cal_seq.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xreconf_cif.sv"                                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xreconf_uif.sv"                                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xreconf_basic_acq.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog.sv"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog_sv.sv"                           -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xreconf_analog_datactrl.sv"                           -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xreconf_analog_rmw.sv"                                -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xreconf_analog_ctrlsm.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation.sv"                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation_sv.sv"              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon.sv"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_sv.sv"                           -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_ctrl_sv.sv"                      -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_ber_sv.sv"                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/ber_reader_dcfifo.v"                                      -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/step_to_mon_sv.sv"                                        -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/mon_to_step_sv.sv"                                        -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_sv.sv"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_reg_sv.sv"                          -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sv.sv"                          -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv"                    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv"           -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_oc_cal_sv.sv"                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_pi_phase_sv.sv"                     -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv"               -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv"                    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv"                     -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_local_reset_sv.sv"                  -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sim_sv.sv"                      -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv"                -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce.sv"                                -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce_sv.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce_datactrl_sv.sv"                    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_sv.sv"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_control.sv"                         -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_datapath.sv"                        -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_pll_reset.sv"                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_eye_width.sv"                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_align_clk.sv"                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_get_sum.sv"                         -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal_sim_model.sv"                   -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_mif.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif.sv"                                  -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif_ctrl.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif_avmm.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_pll.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_pll.sv"                                  -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_pll_ctrl.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_soc.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_ram.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_direct.sv"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xrbasic_l2p_addr.sv"                                   -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xrbasic_l2p_ch.sv"                                     -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xrbasic_l2p_rom.sv"                                    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xrbasic_lif_csr.sv"                                    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xrbasic_lif.sv"                                        -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_basic.sv"                                -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_arbiter_acq.sv"                                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_basic.sv"                               -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv"                                      -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv"                                          -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_wait_generate.v"                                   -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv"                                 -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_basic.sv"                           -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu.v"                                  -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu.v"                     -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v"          -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0.v"                -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_irq_mapper.sv"                      -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                        -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                            -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                             -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                      -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                  -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv"        -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv"    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv"    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv"    -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv"     -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv" -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                              -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv"       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv"   -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv"       -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv"   -work alt_xcvr_reconfig_0                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv"                                   -work pcie_reconfig_driver_0                         
  vlog  "$QSYS_SIMDIR/submodules/altpcie_reconfig_driver.sv"                               -work pcie_reconfig_driver_0                         
  vlog  "$QSYS_SIMDIR/submodules/altpcie_sv_hip_ast_hwtcl.v"                               -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altpcie_hip_256_pipen1b.v"                                -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altpcie_rs_serdes.v"                                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altpcie_rs_hip.v"                                         -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altpcie_ptk.sv"                                           -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altpcie_monitor_sv_dlhip_sim.sv"                          -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                 -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_pcs.sv"                                                -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_pcs_ch.sv"                                             -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_pma.sv"                                                -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv"                            -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv"                              -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv"                             -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_rx_pma.sv"                                             -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_tx_pma.sv"                                             -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_tx_pma_ch.sv"                                          -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_h.sv"                                             -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_avmm_csr.sv"                                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_avmm_dcd.sv"                                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_avmm.sv"                                          -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_data_adapter.sv"                                  -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_native.sv"                                        -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_plls.sv"                                          -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                       -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_10g_rx_pcs_rbc.sv"                                -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_10g_tx_pcs_rbc.sv"                                -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_8g_rx_pcs_rbc.sv"                                 -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_8g_tx_pcs_rbc.sv"                                 -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_8g_pcs_aggregate_rbc.sv"                          -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_common_pcs_pma_interface_rbc.sv"                  -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_common_pld_pcs_interface_rbc.sv"                  -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_pipe_gen1_2_rbc.sv"                               -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_pipe_gen3_rbc.sv"                                 -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_rx_pcs_pma_interface_rbc.sv"                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_rx_pld_pcs_interface_rbc.sv"                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_tx_pcs_pma_interface_rbc.sv"                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_hssi_tx_pld_pcs_interface_rbc.sv"                      -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_emsip_adapter.sv"                                 -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/sv_xcvr_pipe_native.sv"                                   -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv"                                   -work DUT                                            
  vlog  "$QSYS_SIMDIR/submodules/altpcie_reconfig_driver.sv"                               -work DUT                                            
  vlog  "$QSYS_SIMDIR/pcie3_ttk_rcd.v"                                                                                                          
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_002 -L router -L alt_xcvr_reconfig_0_reconfig_mgmt_agent -L pcie_reconfig_driver_0_reconfig_mgmt_agent -L alt_xcvr_reconfig_0_reconfig_mgmt_translator -L pcie_reconfig_driver_0_reconfig_mgmt_translator -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_0 -L master_0 -L alt_xcvr_reconfig_0 -L pcie_reconfig_driver_0 -L DUT -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_002 -L router -L alt_xcvr_reconfig_0_reconfig_mgmt_agent -L pcie_reconfig_driver_0_reconfig_mgmt_agent -L alt_xcvr_reconfig_0_reconfig_mgmt_translator -L pcie_reconfig_driver_0_reconfig_mgmt_translator -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_0 -L master_0 -L alt_xcvr_reconfig_0 -L pcie_reconfig_driver_0 -L DUT -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
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
