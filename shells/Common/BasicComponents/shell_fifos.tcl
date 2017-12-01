
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name VERILOG_FILE       $curdir/shell_async_fifo.v
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_async_fifo_retimed.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_async_fifo_mixed.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_async_fifo_mixed_retimed.sv
set_global_assignment -name VERILOG_FILE       $curdir/shell_fifo.v
set_global_assignment -name VERILOG_FILE       $curdir/shell_regfifo.v
set_global_assignment -name VERILOG_FILE       $curdir/shell_regfifodual.v
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_regfifoskid.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_regfifopipe.sv
set_global_assignment -name VERILOG_FILE       $curdir/shell_shift_reg.v
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_fifo_mixed.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_sync_counter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/shell_reset_synchronizer.sv
