
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
# Auto-generated simulation script

# ----------------------------------------
# Initialize the variable
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
} 

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "ntv_serdes_2ln"
} 

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
} 

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/13.0.0.153/quartus/"
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
ensure_lib                ./libraries/ntv_serdes_2ln
vmap       ntv_serdes_2ln ./libraries/ntv_serdes_2ln

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  vlog +define+SKIP_KEYWORDS_PRAGMA "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                    -work altera_ver           
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                             -work lpm_ver              
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                -work sgate_ver            
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                            -work altera_mf_ver        
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                        -work altera_lnsim_ver     
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                       -work stratixv_ver         
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                  -work stratixv_hssi_ver    
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"              -work stratixv_pcie_hip_ver
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/altera_xcvr_functions.sv"                -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_pcs.sv"                               -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_pcs_ch.sv"                            -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_pma.sv"                               -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_reconfig_bundle_to_xcvr.sv"           -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_reconfig_bundle_to_ip.sv"             -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_reconfig_bundle_merger.sv"            -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_rx_pma.sv"                            -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_tx_pma.sv"                            -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_tx_pma_ch.sv"                         -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_h.sv"                            -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_avmm_csr.sv"                     -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_avmm_dcd.sv"                     -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_avmm.sv"                         -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_data_adapter.sv"                 -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_native.sv"                       -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_xcvr_plls.sv"                         -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/alt_xcvr_resync.sv"                      -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_10g_rx_pcs_rbc.sv"               -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_10g_tx_pcs_rbc.sv"               -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_8g_rx_pcs_rbc.sv"                -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_8g_tx_pcs_rbc.sv"                -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_8g_pcs_aggregate_rbc.sv"         -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_common_pcs_pma_interface_rbc.sv" -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_common_pld_pcs_interface_rbc.sv" -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_pipe_gen1_2_rbc.sv"              -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_pipe_gen3_rbc.sv"                -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_rx_pcs_pma_interface_rbc.sv"     -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_rx_pld_pcs_interface_rbc.sv"     -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_tx_pcs_pma_interface_rbc.sv"     -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/sv_hssi_tx_pld_pcs_interface_rbc.sv"     -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/altera_xcvr_native_sv_functions_h.sv"    -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/altera_xcvr_native_sv/altera_xcvr_native_sv.sv"                -work ntv_serdes_2ln
  vlog  "$QSYS_SIMDIR/ntv_serdes_2ln.v"                                                                  
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  vsim +access +r  -t ps -L work -L ntv_serdes_2ln -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  vsim -dbg -O2 +access +r -t ps -L work -L ntv_serdes_2ln -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
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
