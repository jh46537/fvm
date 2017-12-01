set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name SYSTEMVERILOG_FILE $curdir/UserMemoryInterface2Types.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/UserMemoryInterface2.sv
