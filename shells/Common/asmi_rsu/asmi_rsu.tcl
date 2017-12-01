
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -library "shell_rsu" -name VERILOG_FILE $curdir/Custom_ASMI_RSU_top.v

if { $DEVFAMILY == "Stratix V" } {    
    set_global_assignment -library "shell_rsu" -name VERILOG_FILE $curdir/StratixV/rsu_epcq256.v
    set_global_assignment -library "shell_rsu" -name VERILOG_FILE $curdir/StratixV/asmi_epcq256.v
}

if { $DEVFAMILY == "Arria 10" } {
    set_global_assignment -library "shell_rsu" -name VERILOG_FILE $curdir/Arria10/rsu_epcql1024.v
    set_global_assignment -library "shell_rsu" -name VERILOG_FILE $curdir/Arria10/asmi_epcql1024.v
}