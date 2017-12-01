
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

# ACDS 14.0 200 win32 2014.09.04.11:01:16

# ----------------------------------------
# vcsmx - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="pcie_reconfig"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/14.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

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
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/pcie_reconfig/
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
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                       -work altera_ver           
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                                -work lpm_ver              
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                   -work sgate_ver            
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                               -work altera_mf_ver        
  vlogan +v2k -sverilog "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                           -work altera_lnsim_ver     
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                          -work stratixv_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                     -work stratixv_hssi_ver    
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"                 -work stratixv_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_xcvr_functions.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_h.sv"                                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_resync.sv"                                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_h.sv"                                   -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_dfe_cal_sweep_h.sv"                               -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig.sv"                                     -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_sv.sv"                                  -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cal_seq.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_cif.sv"                                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_uif.sv"                                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_basic_acq.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_analog.sv"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_analog_sv.sv"                           -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_analog_datactrl.sv"                           -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_analog_rmw.sv"                                -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xreconf_analog_ctrlsm.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_offset_cancellation.sv"                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_offset_cancellation_sv.sv"              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon.sv"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon_sv.sv"                           -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon_ctrl_sv.sv"                      -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_eyemon_ber_sv.sv"                       -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/ber_reader_dcfifo.v"                                      -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/step_to_mon_sv.sv"                                        -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/mon_to_step_sv.sv"                                        -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_sv.sv"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_reg_sv.sv"                          -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sv.sv"                          -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv"                    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv"           -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_oc_cal_sv.sv"                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_pi_phase_sv.sv"                     -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv"               -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv"                    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv"                     -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_local_reset_sv.sv"                  -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_cal_sim_sv.sv"                      -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv"                -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_adce.sv"                                -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_adce_sv.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_adce_datactrl_sv.sv"                    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_sv.sv"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_cal.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_control.sv"                         -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_datapath.sv"                        -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_pll_reset.sv"                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_eye_width.sv"                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_align_clk.sv"                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_get_sum.sv"                         -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_dcd_cal_sim_model.sv"                   -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_mif.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_mif.sv"                                  -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_mif_ctrl.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_mif_avmm.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_pll.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_pll.sv"                                  -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_pll_ctrl.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_soc.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_ram.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_direct.sv"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_l2p_addr.sv"                                   -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_l2p_ch.sv"                                     -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_l2p_rom.sv"                                    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_lif_csr.sv"                                    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xrbasic_lif.sv"                                        -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_xcvr_reconfig_basic.sv"                                -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_arbiter_acq.sv"                                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_basic.sv"                               -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_arbiter.sv"                                      -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_m2s.sv"                                          -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_wait_generate.v"                                   -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_csr_selector.sv"                                 -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/sv_reconfig_bundle_to_basic.sv"                           -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu.v"                                  -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_reconfig_cpu.v"                     -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v"          -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0.v"                -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_irq_mapper.sv"                      -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_reset_controller.v"                                -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_reset_synchronizer.v"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_master_translator.sv"                       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_slave_translator.sv"                        -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_master_agent.sv"                            -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_slave_agent.sv"                             -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_burst_uncompressor.sv"                      -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_avalon_sc_fifo.v"                                  -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv"        -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv"    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv"    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv"    -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv"     -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv" -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/altera_merlin_arbitrator.sv"                              -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv"       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv"   -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv"       -work pcie_reconfig
  vlogan +v2k -sverilog "$QSYS_SIMDIR/alt_xcvr_reconfig/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv"   -work pcie_reconfig
  vlogan +v2k           "$QSYS_SIMDIR/pcie_reconfig.v"                                                                               
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
