
#Local imports
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -library "shell_temperature" -name VERILOG_FILE $curdir/Temperature.v

if { $DEVFAMILY == "Stratix V" } {    
    set_global_assignment -library "shell_temperature" -name VERILOG_FILE $curdir/s5_temp_sense.v
    set_global_assignment -library "shell_temperature" -name VERILOG_FILE $curdir/shell_multibitsync.v
}

if { $DEVFAMILY == "Arria 10" } {
    set_global_assignment -library "shell_temperature" -name VERILOG_FILE $curdir/a10_temp_sense.v
}