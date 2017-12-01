
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name VERILOG_FILE       $curdir/shell_altera_ram.v
set_global_assignment -name VERILOG_FILE       $curdir/shell_mram_single.v


