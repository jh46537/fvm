
#Dependencies
source $shell_common/BasicComponents/shell_pipemux.tcl
source $shell_common/BasicComponents/shell_fifos.tcl
source $shell_common/BasicComponents/shell_arbiters.tcl
source $shell_common/BasicComponents/shell_rams.tcl

#Local imports
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Types.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Cfg_Decode.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DataAligner.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DataAlignerTx.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DataFilter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Delay.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DmaEngine_Arbiter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DmaEngine_CircularBuffer.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DmaEngine_RequestIssue.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DmaEngine_RequestSplit.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DmaEngine_TagManager.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_DmaEngine.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Registers.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_TLP_Rx.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_TLP_Tx.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_TxArbiter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Counter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe.sv    

# unified sources
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Gen3_AbaloneWrapper.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Gen3.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Top.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_AlteraIPWrapper.sv
set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Reg_Access.sv

if {[getShellParam pcie_use_qsys_design] == 1} {
    set_global_assignment                          -name QIP_FILE     $curdir/pcie3/synthesis/pcie3_ttk_rcd.qip
    set_global_assignment -library "pcie3_ttk_rcd" -name VERILOG_FILE $curdir/pcie3/synthesis/pcie3_rcd.v
} else {
    set_global_assignment -name QIP_FILE           $curdir/AlteraIP_14/pcie3/pcie3.qip
    set_global_assignment -name QIP_FILE           $curdir/AlteraIP_14/pcie_reconfig/pcie_reconfig.qip
}

if {[getShellParam pcie_slots_on_streaming] == 1} {
    source $curdir/../PCIeGen3SlotsOnStreaming/SlotsOnStreaming.tcl
} else {
    set_global_assignment -name SYSTEMVERILOG_FILE $curdir/PCIe_Control.sv
}