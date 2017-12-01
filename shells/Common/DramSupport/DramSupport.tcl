#These files are exported for all projects to consume


set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]


if { [info exists SIMULATION] } {
    set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_UmiDramSim.sv
    set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_AvalonDramSim.sv
}

set_global_assignment -name VERILOG_FILE       $curdir/shell_UserMemoryInterfaceToAVL.v

