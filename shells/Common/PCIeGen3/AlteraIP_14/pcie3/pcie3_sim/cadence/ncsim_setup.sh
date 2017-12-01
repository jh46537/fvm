
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

# ACDS 14.0 205 win32 2014.09.25.03:51:49

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="pcie3"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/14.0/quartus/"
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
mkdir -p ./libraries/pcie3/
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
  ncvlog     "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_sv_hip_ast_hwtcl.v"              -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog     "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_hip_256_pipen1b.v"               -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog     "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_rs_serdes.v"                     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog     "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_rs_hip.v"                        -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_ptk.sv"                          -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_monitor_sv_dlhip_sim.sv"         -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altera_xcvr_functions.sv"                -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_pcs.sv"                               -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_pcs_ch.sv"                            -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_pma.sv"                               -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_reconfig_bundle_to_xcvr.sv"           -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_reconfig_bundle_to_ip.sv"             -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_reconfig_bundle_merger.sv"            -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_rx_pma.sv"                            -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_tx_pma.sv"                            -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_tx_pma_ch.sv"                         -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_h.sv"                            -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_avmm_csr.sv"                     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_avmm_dcd.sv"                     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_avmm.sv"                         -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_data_adapter.sv"                 -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_native.sv"                       -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_plls.sv"                         -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/alt_xcvr_resync.sv"                      -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_10g_rx_pcs_rbc.sv"               -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_10g_tx_pcs_rbc.sv"               -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_8g_rx_pcs_rbc.sv"                -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_8g_tx_pcs_rbc.sv"                -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_8g_pcs_aggregate_rbc.sv"         -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_common_pcs_pma_interface_rbc.sv" -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_common_pld_pcs_interface_rbc.sv" -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_pipe_gen1_2_rbc.sv"              -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_pipe_gen3_rbc.sv"                -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_rx_pcs_pma_interface_rbc.sv"     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_rx_pld_pcs_interface_rbc.sv"     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_tx_pcs_pma_interface_rbc.sv"     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_hssi_tx_pld_pcs_interface_rbc.sv"     -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_emsip_adapter.sv"                -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/sv_xcvr_pipe_native.sv"                  -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/alt_xcvr_reconfig_h.sv"                  -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_pcie_sv_hip_ast/altpcie_reconfig_driver.sv"              -work pcie3 -cdslib ./cds_libs/pcie3.cds.lib
  ncvlog     "$QSYS_SIMDIR/pcie3.v"                                                                                                    
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
