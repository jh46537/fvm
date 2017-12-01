#These files are exported for all projects to consume


set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

source $shell_common/BasicComponents/shell_arbiters.tcl
source $shell_common/BasicComponents/shell_fifos.tcl
source $shell_common/BasicComponents/shell_pipemux.tcl
source $shell_common/BasicComponents/shell_rams.tcl

set_global_assignment -name VERILOG_FILE       $curdir/sync_regs.v
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_sync_regs.sv
set_global_assignment -name VERILOG_FILE       $curdir/shell_posedgedet.v
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_pcie_bypass.sv
