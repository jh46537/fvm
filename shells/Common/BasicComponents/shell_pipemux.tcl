
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_pipemux.sv
set_global_assignment -name VERILOG_FILE       $curdir/shell_pipemux16.v
set_global_assignment -name VERILOG_FILE       $curdir/shell_pipemux64.v
set_global_assignment -name VERILOG_FILE       $curdir/shell_pipemux_prim.v
