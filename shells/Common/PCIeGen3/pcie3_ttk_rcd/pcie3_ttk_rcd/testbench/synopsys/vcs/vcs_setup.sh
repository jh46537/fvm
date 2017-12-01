
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

# ACDS 14.0 209 win32 2015.09.16.20:41:54

# ----------------------------------------
# vcs - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="pcie3_ttk_rcd_tb"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="D:/altera/14.0/quartus/"
SKIP_FILE_COPY=0
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
# copy RAM/ROM files to simulation directory

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v \
  $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_hssi_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_pcie_hip_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/verbosity_pkg.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/avalon_utilities_pkg.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_arbitrator.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_rsp_demux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_router_002.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_slave_agent.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_master_agent.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_slave_translator.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_master_translator.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0_p2b_adapter.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0_b2p_adapter.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_packets_to_master.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_packets_to_bytes.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_bytes_to_packets.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_sc_fifo.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0_timing_adt.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_jtag_interface.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_jtag_dc_streaming.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_jtag_sld_node.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_jtag_streaming.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_pli_streaming.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_clock_crosser.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_pipeline_base.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_idle_remover.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_idle_inserter.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_reset_controller.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_reset_synchronizer.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_xcvr_functions.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_h.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_resync.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_h.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_dfe_cal_sweep_h.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cal_seq.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_cif.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_uif.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_basic_acq.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_analog.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_analog_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_analog_datactrl.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_analog_rmw.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_analog_ctrlsm.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_offset_cancellation.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_offset_cancellation_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon_ctrl_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon_ber_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/ber_reader_dcfifo.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/step_to_mon_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/mon_to_step_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_reg_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_oc_cal_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_pi_phase_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_local_reset_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sim_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_adce.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_adce_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_adce_datactrl_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_sv.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_cal.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_control.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_datapath.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_pll_reset.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_eye_width.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_align_clk.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_get_sum.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_cal_sim_model.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_mif.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_mif.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_mif_ctrl.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_mif_avmm.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_pll.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_pll.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_pll_ctrl.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_soc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_ram.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_direct.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_l2p_addr.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_l2p_ch.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_l2p_rom.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_lif_csr.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_lif.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_basic.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_arbiter_acq.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_basic.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_arbiter.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_m2s.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_wait_generate.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_csr_selector.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_to_basic.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_irq_mapper.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_reconfig_driver.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_sv_hip_ast_hwtcl.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_hip_256_pipen1b.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_rs_serdes.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_rs_hip.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_ptk.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_monitor_sv_dlhip_sim.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_pcs.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_pcs_ch.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_pma.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_to_xcvr.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_to_ip.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_merger.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_rx_pma.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_tx_pma.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_tx_pma_ch.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_avmm_csr.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_avmm_dcd.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_avmm.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_data_adapter.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_native.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_plls.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_10g_rx_pcs_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_10g_tx_pcs_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_8g_rx_pcs_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_8g_tx_pcs_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_8g_pcs_aggregate_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_common_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_common_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_pipe_gen1_2_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_pipe_gen3_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_rx_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_rx_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_tx_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_tx_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_emsip_adapter.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_pipe_native.sv \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_ltssm_mon.v \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_pipe_phy.v \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_pipe32_hip_interface.v \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_pipe32_driver.v \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_tbed_sv_hwtcl.v \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_bfm_top_rp.v \
  \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_bfm_rp_gen3_x8.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0008.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0007.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0006.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0005.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0004.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0003.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0002.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_source_bfm.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_sink_bfm.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_reset_source.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_clock_source.sv \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd.v \
  $QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/pcie3_ttk_rcd_tb.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
