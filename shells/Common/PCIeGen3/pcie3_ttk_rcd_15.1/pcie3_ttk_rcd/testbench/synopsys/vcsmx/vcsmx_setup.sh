
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

# ACDS 15.1 189 win32 2016.03.15.17:18:20

# ----------------------------------------
# vcsmx - auto-generated simulation script

# ----------------------------------------
# This script can be used to simulate the following IP:
#     pcie3_ttk_rcd_tb
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "vcsmx_sim.sh", run it as:
# #   ./vcsmx_sim.sh
# #
# # Do the file copy, dev_com and com steps
# source vcsmx_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1
# 
# # Compile the top level module
# vlogan +v2k +systemverilogext+.sv "$QSYS_SIMDIR/../top.sv"
# 
# # Do the elaboration and sim steps
# # Override the top-level name
# # Override the user-defined sim options, so the simulation runs 
# # forever (until $finish()).
# source vcsmx_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME="'-top top'" \
# USER_DEFINED_SIM_OPTIONS=""
# # End of template
# ----------------------------------------
# If pcie3_ttk_rcd_tb is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 15.1 189 win32 2016.03.15.17:18:20
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="pcie3_ttk_rcd_tb"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/15.1.1.189/quartus/"
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
mkdir -p ./libraries/altera_common_sv_packages/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router/
mkdir -p ./libraries/alt_xcvr_reconfig_0_reconfig_mgmt_agent/
mkdir -p ./libraries/master_0_master_agent/
mkdir -p ./libraries/alt_xcvr_reconfig_0_reconfig_mgmt_translator/
mkdir -p ./libraries/master_0_master_translator/
mkdir -p ./libraries/p2b_adapter/
mkdir -p ./libraries/b2p_adapter/
mkdir -p ./libraries/transacto/
mkdir -p ./libraries/p2b/
mkdir -p ./libraries/b2p/
mkdir -p ./libraries/fifo/
mkdir -p ./libraries/timing_adt/
mkdir -p ./libraries/jtag_phy_embedded_in_jtag_master/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/pcie_reconfig_driver_0/
mkdir -p ./libraries/master_0/
mkdir -p ./libraries/alt_xcvr_reconfig_0/
mkdir -p ./libraries/DUT/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_reset_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_pcie_reconfig_driver_hip_status_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_tx_st_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_tx_cred_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_rx_st_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_rx_bar_be_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_power_mngt_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_int_msi_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_hip_status_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_hip_rst_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_dut_config_tl_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst_clk_bfm/
mkdir -p ./libraries/pcie3_ttk_rcd_inst/
mkdir -p ./libraries/DUT_pcie_tb/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/stratixiv_hssi_ver/
mkdir -p ./libraries/stratixiv_pcie_hip_ver/
mkdir -p ./libraries/stratixiv_ver/
mkdir -p ./libraries/stratixv_ver/
mkdir -p ./libraries/stratixv_hssi_ver/
mkdir -p ./libraries/stratixv_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                       -work altera_ver            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                                -work lpm_ver               
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                   -work sgate_ver             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                               -work altera_mf_ver         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                           -work altera_lnsim_ver      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_atoms.v"                    -work stratixiv_hssi_ver    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v"                -work stratixiv_pcie_hip_ver
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_atoms.v"                         -work stratixiv_ver         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_atoms_ncrypt.v"          -work stratixv_ver          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                          -work stratixv_ver          
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                     -work stratixv_hssi_ver     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver 
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"                 -work stratixv_pcie_hip_ver 
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/verbosity_pkg.sv"                                                             -work altera_common_sv_packages                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/avalon_utilities_pkg.sv"                                                      -work altera_common_sv_packages                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"         -work error_adapter_0                                       
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_avalon_st_adapter.v"                          -work avalon_st_adapter                                     
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux                                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_rsp_mux.sv"                                   -work rsp_mux                                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_rsp_demux.sv"                                 -work rsp_demux                                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux                                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_cmd_mux.sv"                                   -work cmd_mux                                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_cmd_demux.sv"                                 -work cmd_demux                                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_router_002.sv"                                -work router_002                                            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0_router.sv"                                    -work router                                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                                 -work alt_xcvr_reconfig_0_reconfig_mgmt_agent               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                          -work alt_xcvr_reconfig_0_reconfig_mgmt_agent               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_master_agent.sv"                                                -work master_0_master_agent                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                            -work alt_xcvr_reconfig_0_reconfig_mgmt_translator          
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_master_translator.sv"                                           -work master_0_master_translator                            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0_p2b_adapter.sv"                                        -work p2b_adapter                                           
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0_b2p_adapter.sv"                                        -work b2p_adapter                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_packets_to_master.v"                                            -work transacto                                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_packets_to_bytes.v"                                          -work p2b                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_bytes_to_packets.v"                                          -work b2p                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                      -work fifo                                                  
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0_timing_adt.sv"                                         -work timing_adt                                            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_jtag_interface.v"                                            -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_jtag_dc_streaming.v"                                                   -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_jtag_sld_node.v"                                                       -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_jtag_streaming.v"                                                      -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_clock_crosser.v"                                             -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_std_synchronizer_nocut.v"                                              -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                             -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_idle_remover.v"                                              -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_idle_inserter.v"                                             -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                           -work jtag_phy_embedded_in_jtag_master                      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_reset_controller.v"                                                    -work rst_controller                                        
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_reset_synchronizer.v"                                                  -work rst_controller                                        
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_mm_interconnect_0.v"                                            -work mm_interconnect_0                                     
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_h.sv"                                                       -work pcie_reconfig_driver_0                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_reconfig_driver.sv"                                                   -work pcie_reconfig_driver_0                                
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd_master_0.v"                                                     -work master_0                                              
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_xcvr_functions.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_h.sv"                                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_resync.sv"                                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_h.sv"                                                       -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_dfe_cal_sweep_h.sv"                                                   -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig.sv"                                                         -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_sv.sv"                                                      -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cal_seq.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_cif.sv"                                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_uif.sv"                                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_basic_acq.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_analog.sv"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_analog_sv.sv"                                               -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_analog_datactrl.sv"                                               -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_analog_rmw.sv"                                                    -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xreconf_analog_ctrlsm.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_offset_cancellation.sv"                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_offset_cancellation_sv.sv"                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon.sv"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon_sv.sv"                                               -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon_ctrl_sv.sv"                                          -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_eyemon_ber_sv.sv"                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/ber_reader_dcfifo.v"                                                          -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/step_to_mon_sv.sv"                                                            -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/mon_to_step_sv.sv"                                                            -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_sv.sv"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_reg_sv.sv"                                              -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sv.sv"                                              -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv"                                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv"                               -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_oc_cal_sv.sv"                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_pi_phase_sv.sv"                                         -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv"                                   -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv"                                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv"                                         -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_local_reset_sv.sv"                                      -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_cal_sim_sv.sv"                                          -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv"                                    -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_adce.sv"                                                    -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_adce_sv.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_adce_datactrl_sv.sv"                                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_sv.sv"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_cal.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_control.sv"                                             -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_datapath.sv"                                            -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_pll_reset.sv"                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_eye_width.sv"                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_align_clk.sv"                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_get_sum.sv"                                             -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_dcd_cal_sim_model.sv"                                       -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_mif.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_mif.sv"                                                      -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_mif_ctrl.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_mif_avmm.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_pll.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_pll.sv"                                                      -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_pll_ctrl.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_soc.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_ram.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_direct.sv"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_l2p_addr.sv"                                                       -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_l2p_ch.sv"                                                         -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_l2p_rom.sv"                                                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_lif_csr.sv"                                                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xrbasic_lif.sv"                                                            -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_reconfig_basic.sv"                                                    -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_arbiter_acq.sv"                                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_basic.sv"                                                   -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_arbiter.sv"                                                          -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_m2s.sv"                                                              -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_wait_generate.v"                                                       -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_csr_selector.sv"                                                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_to_basic.sv"                                               -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu.v"                                                      -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu.v"                                         -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v"                              -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0.v"                                    -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_irq_mapper.sv"                                          -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_reset_controller.v"                                                    -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_reset_synchronizer.v"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_master_translator.sv"                                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                            -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_master_agent.sv"                                                -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                                 -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                          -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                      -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv"                            -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv"                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv"                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv"                        -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv"                         -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv"                     -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv"                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv"                       -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv"                           -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv"                       -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_avalon_st_adapter.v"                  -work alt_xcvr_reconfig_0                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_avalon_st_adapter_er.sv" -work alt_xcvr_reconfig_0                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_sv_hip_ast_hwtcl.v"                                                   -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_hip_256_pipen1b.v"                                                    -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_rs_serdes.v"                                                          -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_rs_hip.v"                                                             -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_scfifo.v"                                                             -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_sv_scfifo_ext.v"                                                      -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_scfifo_sv.v"                                                          -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_sv_gbfifo.v"                                                          -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_tlp_inspector.v"                                                      -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_tlp_inspector_trigger.v"                                              -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_hip_eq_dprio.v"                                                       -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_hip_eq_bypass_ph3.v"                                                  -work DUT                                                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_bfm_pipe_8to32.v"                                                   -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_inspector.sv"                                                         -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_monitor_sv_dlhip_sim.sv"                                              -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_tlp_inspector_monitor.sv"                                             -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_tlp_inspector_cseb.sv"                                                -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_xcvr_functions.sv"                                                     -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_pcs.sv"                                                                    -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_pcs_ch.sv"                                                                 -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_pma.sv"                                                                    -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_to_xcvr.sv"                                                -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_to_ip.sv"                                                  -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_reconfig_bundle_merger.sv"                                                 -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_rx_pma.sv"                                                                 -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_tx_pma.sv"                                                                 -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_tx_pma_ch.sv"                                                              -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_h.sv"                                                                 -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_avmm_csr.sv"                                                          -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_avmm_dcd.sv"                                                          -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_avmm.sv"                                                              -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_data_adapter.sv"                                                      -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_native.sv"                                                            -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_plls.sv"                                                              -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_resync.sv"                                                           -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_10g_rx_pcs_rbc.sv"                                                    -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_10g_tx_pcs_rbc.sv"                                                    -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_8g_rx_pcs_rbc.sv"                                                     -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_8g_tx_pcs_rbc.sv"                                                     -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_8g_pcs_aggregate_rbc.sv"                                              -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_common_pcs_pma_interface_rbc.sv"                                      -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_common_pld_pcs_interface_rbc.sv"                                      -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_pipe_gen1_2_rbc.sv"                                                   -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_pipe_gen3_rbc.sv"                                                     -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_rx_pcs_pma_interface_rbc.sv"                                          -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_rx_pld_pcs_interface_rbc.sv"                                          -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_tx_pcs_pma_interface_rbc.sv"                                          -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_hssi_tx_pld_pcs_interface_rbc.sv"                                          -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_emsip_adapter.sv"                                                     -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/sv_xcvr_pipe_native.sv"                                                       -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/alt_xcvr_reconfig_h.sv"                                                       -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_reconfig_driver.sv"                                                   -work DUT                                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_reset_source.sv"                                                -work pcie3_ttk_rcd_inst_reset_bfm                          
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0008.sv"                                                   -work pcie3_ttk_rcd_inst_pcie_reconfig_driver_hip_status_bfm
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_source_bfm.sv"                                               -work pcie3_ttk_rcd_inst_dut_tx_st_bfm                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0007.sv"                                                   -work pcie3_ttk_rcd_inst_dut_tx_cred_bfm                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_st_sink_bfm.sv"                                                 -work pcie3_ttk_rcd_inst_dut_rx_st_bfm                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0006.sv"                                                   -work pcie3_ttk_rcd_inst_dut_rx_bar_be_bfm                  
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0005.sv"                                                   -work pcie3_ttk_rcd_inst_dut_power_mngt_bfm                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0004.sv"                                                   -work pcie3_ttk_rcd_inst_dut_int_msi_bfm                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0003.sv"                                                   -work pcie3_ttk_rcd_inst_dut_hip_status_bfm                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm_0002.sv"                                                   -work pcie3_ttk_rcd_inst_dut_hip_rst_bfm                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_conduit_bfm.sv"                                                        -work pcie3_ttk_rcd_inst_dut_config_tl_bfm                  
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS                                                                  "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altera_avalon_clock_source.sv"                                                -work pcie3_ttk_rcd_inst_clk_bfm                            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/pcie3_ttk_rcd.v"                                                              -work pcie3_ttk_rcd_inst                                    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_ltssm_mon.v"                                                        -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_pipe_phy.v"                                                         -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_pipe32_hip_interface.v"                                             -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_pipe32_driver.v"                                                    -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcie_tbed_sv_hwtcl.v"                                                      -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_bfm_top_rp.v"                                                       -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/\" "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/submodules/altpcietb_bfm_rp_gen3_x8.v"                                                   -work DUT_pcie_tb                                           
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS                                                                            "$QSYS_SIMDIR/pcie3_ttk_rcd_tb/simulation/pcie3_ttk_rcd_tb.v"                                                                                                                                  
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
