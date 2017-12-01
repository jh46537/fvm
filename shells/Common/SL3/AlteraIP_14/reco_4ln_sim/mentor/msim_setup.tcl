
# (C) 2001-2014 Altera Corporation. All rights reserved.
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

# ACDS 14.0 200 win32 2014.11.13.10:18:45

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
  set TOP_LEVEL_NAME "reco_4ln"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/14.0/quartus/"
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                       ./libraries/altera_ver/           
  vmap       altera_ver            ./libraries/altera_ver/           
  ensure_lib                       ./libraries/lpm_ver/              
  vmap       lpm_ver               ./libraries/lpm_ver/              
  ensure_lib                       ./libraries/sgate_ver/            
  vmap       sgate_ver             ./libraries/sgate_ver/            
  ensure_lib                       ./libraries/altera_mf_ver/        
  vmap       altera_mf_ver         ./libraries/altera_mf_ver/        
  ensure_lib                       ./libraries/altera_lnsim_ver/     
  vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver/     
  ensure_lib                       ./libraries/stratixv_ver/         
  vmap       stratixv_ver          ./libraries/stratixv_ver/         
  ensure_lib                       ./libraries/stratixv_hssi_ver/    
  vmap       stratixv_hssi_ver     ./libraries/stratixv_hssi_ver/    
  ensure_lib                       ./libraries/stratixv_pcie_hip_ver/
  vmap       stratixv_pcie_hip_ver ./libraries/stratixv_pcie_hip_ver/
}
ensure_lib          ./libraries/reco_4ln/
vmap       reco_4ln ./libraries/reco_4ln/

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                     -work altera_ver           
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                              -work lpm_ver              
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                 -work sgate_ver            
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                             -work altera_mf_ver        
    vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                         -work altera_lnsim_ver     
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                        -work stratixv_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                   -work stratixv_hssi_ver    
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"               -work stratixv_pcie_hip_ver
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_xcvr_functions.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/altera_xcvr_functions.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_h.sv"                                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_h.sv"                                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_resync.sv"                                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_resync.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_h.sv"                                   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_h.sv"                            -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_dfe_cal_sweep_h.sv"                               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_dfe_cal_sweep_h.sv"                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig.sv"                                     -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_sv.sv"                                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_sv.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cal_seq.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_cal_seq.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_cif.sv"                                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xreconf_cif.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_uif.sv"                                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xreconf_uif.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_basic_acq.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xreconf_basic_acq.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_analog.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_analog.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_analog_sv.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_analog_sv.sv"                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_analog_datactrl.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xreconf_analog_datactrl.sv"                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_analog_rmw.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xreconf_analog_rmw.sv"                         -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_analog_ctrlsm.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xreconf_analog_ctrlsm.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_offset_cancellation.sv"                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_offset_cancellation.sv"          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_offset_cancellation_sv.sv"              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_offset_cancellation_sv.sv"       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_eyemon.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon_sv.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon_ctrl_sv.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon_ber_sv.sv"                       -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/ber_reader_dcfifo.v"                                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/step_to_mon_sv.sv"                                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mon_to_step_sv.sv"                                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_eyemon_sv.sv"                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_eyemon_ctrl_sv.sv"               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_eyemon_ber_sv.sv"                -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/ber_reader_dcfifo.v"                               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/step_to_mon_sv.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/mon_to_step_sv.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_sv.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_reg_sv.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sv.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv"                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv"           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_oc_cal_sv.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_pi_phase_sv.sv"                     -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv"               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv"                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv"                     -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_local_reset_sv.sv"                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sim_sv.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv"                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_sv.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_reg_sv.sv"                   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_cal_sv.sv"                   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv"             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv"    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_oc_cal_sv.sv"                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_pi_phase_sv.sv"              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv"        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv"             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv"              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_local_reset_sv.sv"           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_cal_sim_sv.sv"               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv"         -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_adce.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_adce.sv"                         -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_adce_sv.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_adce_datactrl_sv.sv"                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_adce_sv.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_adce_datactrl_sv.sv"             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_sv.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_cal.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_control.sv"                         -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_datapath.sv"                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_pll_reset.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_eye_width.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_align_clk.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_get_sum.sv"                         -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_cal_sim_model.sv"                   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_sv.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_cal.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_control.sv"                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_datapath.sv"                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_pll_reset.sv"                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_eye_width.sv"                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_align_clk.sv"                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_get_sum.sv"                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_dcd_cal_sim_model.sv"            -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_mif.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_mif.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_mif.sv"                                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_mif_ctrl.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_mif_avmm.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_reconfig_mif.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_reconfig_mif_ctrl.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_reconfig_mif_avmm.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_pll.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_pll.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_pll.sv"                                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_pll_ctrl.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_reconfig_pll.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_reconfig_pll_ctrl.sv"                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_soc.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_ram.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_direct.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_l2p_addr.sv"                                   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_l2p_ch.sv"                                     -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_l2p_rom.sv"                                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_lif_csr.sv"                                    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_lif.sv"                                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_basic.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_arbiter_acq.sv"                                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_basic.sv"                               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xrbasic_l2p_addr.sv"                            -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xrbasic_l2p_ch.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xrbasic_l2p_rom.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xrbasic_lif_csr.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xrbasic_lif.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_xcvr_reconfig_basic.sv"                         -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_arbiter_acq.sv"                                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_reconfig_basic.sv"                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_arbiter.sv"                                      -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_m2s.sv"                                          -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_wait_generate.v"                                   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_csr_selector.sv"                                 -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_arbiter.sv"                               -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_m2s.sv"                                   -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/altera_wait_generate.v"                            -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/alt_xcvr_csr_selector.sv"                          -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_reconfig_bundle_to_basic.sv"                           -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/mentor/sv_reconfig_bundle_to_basic.sv"                    -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu.v"                                  -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_reconfig_cpu.v"                     -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v"          -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0.v"                -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_irq_mapper.sv"                      -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_reset_controller.v"                                -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_reset_synchronizer.v"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_master_translator.sv"                       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_slave_translator.sv"                        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_master_agent.sv"                            -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_slave_agent.sv"                             -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_burst_uncompressor.sv"                      -work reco_4ln
  vlog     "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_avalon_sc_fifo.v"                                  -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv"        -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv"    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv"    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv"    -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv"     -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv" -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_arbitrator.sv"                              -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv"       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv"   -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv"       -work reco_4ln
  vlog -sv "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv"   -work reco_4ln
  vlog     "$QSYS_SIMDIR/reco_4ln.v"                                                                               
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS -L work -L work_lib -L reco_4ln -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS -L work -L work_lib -L reco_4ln -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
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
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
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
