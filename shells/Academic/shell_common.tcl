#################################################################
# Common assignments
#
# DO NOT OPEN THIS FILE DIRECTLY IN QUARTUS
#################################################################

############ Search paths & Source Files


# Common Types
set_global_assignment -name SYSTEMVERILOG_FILE $shell_path/Types/ShellTypes.sv


source $shell_common/BasicComponents/shell_common.tcl

# Shell Constraints File (must precede all other SDCs)
set_global_assignment -name SDC_FILE $shell_path/shell.sdc


# DRAM
if { ![info exists SIMULATION] } {
    set_global_assignment -name SYSTEMVERILOG_FILE $shell_path/DramUser.v
}
source $shell_common/DramSupport/DramSupport.tcl


# Common Shell IP
if { ![info exists SIMULATION] } {

	set_global_assignment -name VERILOG_FILE $shell_path/ClockGen/ClockGen.v

	set_global_assignment -name VERILOG_FILE $shell_common/ConfigCRC/ConfigCRC.v
	source $shell_common/Temperature/temperature.tcl
	set_global_assignment -name VERILOG_FILE $shell_common/BlinkyLED/PCIeStatusLEDs.v
	set_global_assignment -name QIP_FILE $shell_common/AlteraIP/Status_Mux.qip
    set_global_assignment -name QIP_FILE $shell_common/ClockPLL/core_clk_pll.qip

	# Unique Chip ID
	set_global_assignment -name SYSTEMVERILOG_FILE $shell_common/ChipID/Unique_Chip_ID.sv
	set_global_assignment -name VERILOG_FILE $shell_common/ChipID/jtag_chip_id.v
	if {$DEVFAMILY == "Stratix V"} {
		set_global_assignment -name VERILOG_FILE $shell_common/ChipID/altchip_id.v
	} 
}

# ASMI_RSU
if { ![info exists SIMULATION] } {
	source $shell_common/asmi_rsu/asmi_rsu.tcl
}

# I2C
if { ![info exists SIMULATION] } {
	source $shell_common/I2C/I2C.tcl
}

if { ![info exists SIMULATION] } {
    source $shell_common/SL3/SL3.tcl
}

if {[getShellParam pcie_use_stream_dma] == 1} {
    if { ![info exists SIMULATION] } {
        source $shell_common/PCIeGen3/PCIeGen3.tcl
    }
} else {
    if { ![info exists SIMULATION] } {
       source $shell_common/PCIeGen2/PCIeGen2.tcl
    }
}

# Soft registers
set_global_assignment -name SYSTEMVERILOG_FILE $shell_common/SoftRegs/SoftRegs.sv

# PCIe-specific constraints for QSYS-based design from Altera.
if {([getShellParam pcie_use_qsys_design] == 1) && ([getShellParam pcie_use_stream_dma] == 1)} {
    set_global_assignment -name SDC_FILE $shell_common/PCIeGen3/PCIe.sdc
}

if { ![info exists SIMULATION] } {
    set_global_assignment -name SYSTEMVERILOG_FILE $shell_path/shell.sv
}


set_instance_assignment -name GLOBAL_SIGNAL "GLOBAL CLOCK" -to ClockGen|core_clk
set_instance_assignment -name GLOBAL_SIGNAL "GLOBAL CLOCK" -to ClockGen|mgmt_clk
