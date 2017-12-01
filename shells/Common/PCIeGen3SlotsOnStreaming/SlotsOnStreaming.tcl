
#Local imports
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

# new sources for slots on streaming
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_AbaloneWrapper.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_Top.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_RegAccess.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_CpuToFpga.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_FpgaToCpu.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_Gearbox.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/SlotsOnStreaming_Interrupt.sv
