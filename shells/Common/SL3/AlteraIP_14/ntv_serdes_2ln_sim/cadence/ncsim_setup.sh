
# (C) 2001-2013 Altera Corporation. All rights reserved.
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

# ACDS 13.0 153 win32 2013.05.02.12:00:16

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="ntv_serdes_2ln"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/13.0.0.153/quartus/"
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
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/ntv_serdes_2ln/
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
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/altera_xcvr_functions.sv"                -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_pcs.sv"                               -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_pcs_ch.sv"                            -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_pma.sv"                               -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_reconfig_bundle_to_xcvr.sv"           -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_reconfig_bundle_to_ip.sv"             -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_reconfig_bundle_merger.sv"            -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_rx_pma.sv"                            -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_tx_pma.sv"                            -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_tx_pma_ch.sv"                         -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_h.sv"                            -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_avmm_csr.sv"                     -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_avmm_dcd.sv"                     -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_avmm.sv"                         -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_data_adapter.sv"                 -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_native.sv"                       -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_plls.sv"                         -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/alt_xcvr_resync.sv"                      -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_10g_rx_pcs_rbc.sv"               -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_10g_tx_pcs_rbc.sv"               -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_8g_rx_pcs_rbc.sv"                -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_8g_tx_pcs_rbc.sv"                -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_8g_pcs_aggregate_rbc.sv"         -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_common_pcs_pma_interface_rbc.sv" -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_common_pld_pcs_interface_rbc.sv" -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_pipe_gen1_2_rbc.sv"              -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_pipe_gen3_rbc.sv"                -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_rx_pcs_pma_interface_rbc.sv"     -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_rx_pld_pcs_interface_rbc.sv"     -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_tx_pcs_pma_interface_rbc.sv"     -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_tx_pld_pcs_interface_rbc.sv"     -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/altera_xcvr_native_sv_functions_h.sv"    -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/altera_xcvr_native_sv/altera_xcvr_native_sv.sv"                -work ntv_serdes_2ln -cdslib ./cds_libs/ntv_serdes_2ln.cds.lib
  ncvlog     "$QSYS_SIMDIR/ntv_serdes_2ln.v"                                                                                                            
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
