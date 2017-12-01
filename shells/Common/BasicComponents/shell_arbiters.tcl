
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_FastArbiter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_FastArbiter4.sv
