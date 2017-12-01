
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

# ACDS 14.0 209 win32 2015.09.14.15:31:06

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="pcie_de_gen3_x8_ast256"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="D:/altera/14.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/alt_xcvr_reconfig_0/
mkdir -p ./libraries/pcie_reconfig_driver_0/
mkdir -p ./libraries/APPS/
mkdir -p ./libraries/DUT/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/stratixv_ver/
mkdir -p ./libraries/stratixv_hssi_ver/
mkdir -p ./libraries/stratixv_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                      -work altera_ver           
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                               -work lpm_ver              
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                  -work sgate_ver            
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                              -work altera_mf_ver        
  ncvlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                          -work altera_lnsim_ver     
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                         -work stratixv_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                    -work stratixv_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"                -work stratixv_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                -work rst_controller         -cdslib ./cds_libs/rst_controller.cds.lib        
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                              -work rst_controller         -cdslib ./cds_libs/rst_controller.cds.lib        
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_h.sv"                                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv"                                   -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_dfe_cal_sweep_h.sv"                               -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig.sv"                                     -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_sv.sv"                                  -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cal_seq.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xreconf_cif.sv"                                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xreconf_uif.sv"                                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xreconf_basic_acq.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog.sv"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog_sv.sv"                           -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xreconf_analog_datactrl.sv"                           -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xreconf_analog_rmw.sv"                                -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xreconf_analog_ctrlsm.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation.sv"                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation_sv.sv"              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon.sv"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_sv.sv"                           -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_ctrl_sv.sv"                      -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_ber_sv.sv"                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/ber_reader_dcfifo.v"                                      -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/step_to_mon_sv.sv"                                        -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/mon_to_step_sv.sv"                                        -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_sv.sv"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_reg_sv.sv"                          -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sv.sv"                          -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv"                    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv"           -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_oc_cal_sv.sv"                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_pi_phase_sv.sv"                     -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv"               -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv"                    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv"                     -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_local_reset_sv.sv"                  -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sim_sv.sv"                      -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv"                -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce.sv"                                -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce_sv.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce_datactrl_sv.sv"                    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_sv.sv"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_control.sv"                         -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_datapath.sv"                        -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_pll_reset.sv"                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_eye_width.sv"                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_align_clk.sv"                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_get_sum.sv"                         -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal_sim_model.sv"                   -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_mif.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif.sv"                                  -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif_ctrl.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif_avmm.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_pll.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_pll.sv"                                  -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_pll_ctrl.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_soc.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_ram.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_direct.sv"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xrbasic_l2p_addr.sv"                                   -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xrbasic_l2p_ch.sv"                                     -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xrbasic_l2p_rom.sv"                                    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xrbasic_lif_csr.sv"                                    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xrbasic_lif.sv"                                        -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_reconfig_basic.sv"                                -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_arbiter_acq.sv"                                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_basic.sv"                               -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv"                                      -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv"                                          -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/altera_wait_generate.v"                                   -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv"                                 -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_basic.sv"                           -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu.v"                                  -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu.v"                     -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v"          -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0.v"                -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_irq_mapper.sv"                      -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                        -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                            -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                             -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                      -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                  -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv"        -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv"    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv"    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv"    -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv"     -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv" -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                              -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv"       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv"   -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv"       -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv"   -work alt_xcvr_reconfig_0    -cdslib ./cds_libs/alt_xcvr_reconfig_0.cds.lib   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv"                                   -work pcie_reconfig_driver_0 -cdslib ./cds_libs/pcie_reconfig_driver_0.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/submodules/altpcie_reconfig_driver.sv"                               -work pcie_reconfig_driver_0 -cdslib ./cds_libs/pcie_reconfig_driver_0.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/submodules/altpcied_sv_hwtcl.sv"                                     -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_hip_rs.v"                                       -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_tl_cfg_sample.v"                                -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_rx_ecrc_128_sim.v"                              -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_rx_ecrc_64_sim.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_tx_ecrc_128_sim.v"                              -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_tx_ecrc_64_sim.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_ast256_downstream.v"                            -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_app_icm.v"                                 -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_msi.v"                                 -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_rx.v"                                  -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_rx_128.v"                              -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_rx_64.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_tx.v"                                  -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_tx_128.v"                              -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ast_tx_64.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_check_128.v"                          -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_check_64.v"                           -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_gen.v"                                -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_gen_calc.v"                           -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_gen_ctl_128.v"                        -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_gen_ctl_64.v"                         -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cdma_ecrc_gen_datapath.v"                       -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_compliance_test.v"                              -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cpld_rx_buffer.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_cplerr_lmi.v"                                   -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_dma_descriptor.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_dma_dt.v"                                       -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_dma_prg_reg.v"                                  -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_example_app_chaining.v"                         -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_npcred_monitor.v"                               -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_pcie_reconfig_initiator.v"                      -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_rc_slave.v"                                     -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_read_dma_requester.v"                           -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_read_dma_requester_128.v"                       -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_reconfig_clk_pll.v"                             -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_reg_access.v"                                   -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_rxtx_downstream_intf.v"                         -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_tx_ecrc_ctl_fifo.v"                             -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_tx_ecrc_data_fifo.v"                            -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_tx_ecrc_fifo.v"                                 -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_write_dma_requester.v"                          -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcierd_write_dma_requester_128.v"                      -work APPS                   -cdslib ./cds_libs/APPS.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/submodules/altpcie_sv_hip_ast_hwtcl.v"                               -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog     "$QSYS_SIMDIR/submodules/altpcie_hip_256_pipen1b.v"                                -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog     "$QSYS_SIMDIR/submodules/altpcie_rs_serdes.v"                                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog     "$QSYS_SIMDIR/submodules/altpcie_rs_hip.v"                                         -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altpcie_ptk.sv"                                           -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altpcie_monitor_sv_dlhip_sim.sv"                          -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                 -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_pcs.sv"                                                -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_pcs_ch.sv"                                             -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_pma.sv"                                                -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv"                            -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv"                              -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv"                             -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_rx_pma.sv"                                             -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_tx_pma.sv"                                             -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_tx_pma_ch.sv"                                          -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_h.sv"                                             -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_avmm_csr.sv"                                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_avmm_dcd.sv"                                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_avmm.sv"                                          -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_data_adapter.sv"                                  -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_native.sv"                                        -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_plls.sv"                                          -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                       -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_10g_rx_pcs_rbc.sv"                                -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_10g_tx_pcs_rbc.sv"                                -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_8g_rx_pcs_rbc.sv"                                 -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_8g_tx_pcs_rbc.sv"                                 -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_8g_pcs_aggregate_rbc.sv"                          -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_common_pcs_pma_interface_rbc.sv"                  -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_common_pld_pcs_interface_rbc.sv"                  -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_pipe_gen1_2_rbc.sv"                               -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_pipe_gen3_rbc.sv"                                 -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_rx_pcs_pma_interface_rbc.sv"                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_rx_pld_pcs_interface_rbc.sv"                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_tx_pcs_pma_interface_rbc.sv"                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_hssi_tx_pld_pcs_interface_rbc.sv"                      -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_emsip_adapter.sv"                                 -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/sv_xcvr_pipe_native.sv"                                   -work DUT                    -cdslib ./cds_libs/DUT.cds.lib                   
  ncvlog     "$QSYS_SIMDIR/pcie_de_gen3_x8_ast256.v"                                                                                                                          
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
