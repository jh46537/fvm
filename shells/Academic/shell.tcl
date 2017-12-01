# ========== Device & Project Settings ==========
set_global_assignment -name FAMILY $DEVFAMILY
set_global_assignment -name DEVICE $PARTNUMBER
set_global_assignment -name TOP_LEVEL_ENTITY Shell
set_global_assignment -name SEED [getShellParam seed_value]
set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER 1.0

# ========== Global Project Settings  ==========
set_global_assignment -name ACTIVE_SERIAL_CLOCK FREQ_25MHZ
set_global_assignment -name AUTO_GLOBAL_CLOCK ON
set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF
set_global_assignment -name ECO_REGENERATE_REPORT ON
set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
set_global_assignment -name INTERNAL_SCRUBBING ON
set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
set_global_assignment -name LAST_QUARTUS_VERSION 14.0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 100
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS"
set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 13.0
set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall
set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
set_global_assignment -name POWER_BOARD_TEMPERATURE 40
set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
set_global_assignment -name POWER_USE_TA_VALUE 65
set_global_assignment -name PROJECT_CREATION_TIME_DATE "15:11:31  OCTOBER 29, 2012"
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"
set_global_assignment -name TIMEQUEST_DO_CCPP_REMOVAL ON
set_global_assignment -name TIMEQUEST_DO_REPORT_TIMING ON
set_global_assignment -name TIMEQUEST_MULTICORNER_ANALYSIS ON
set_global_assignment -name TRI_STATE_SPI_PINS ON
set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE ON
set_global_assignment -name UNIPHY_TEMP_VER_CODE 1487760456
set_global_assignment -name USE_CONFIGURATION_DEVICE ON
set_global_assignment -name VERILOG_INPUT_VERSION SYSTEMVERILOG_2005
set_global_assignment -name VERILOG_SHOW_LMF_MAPPING_MESSAGES OFF
set_global_assignment -name STRATIXIII_UPDATE_MODE REMOTE
set_global_assignment -name STRATIXII_CONFIGURATION_DEVICE EPCQ256
set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "ACTIVE SERIAL X4"
set_global_assignment -name ENABLE_DRC_SETTINGS ON
set_global_assignment -name ROUTER_CLOCKING_TOPOLOGY_ANALYSIS ON
set_global_assignment -name MUX_RESTRUCTURE AUTO
set_global_assignment -name OPTIMIZATION_TECHNIQUE SPEED
set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC ON 
set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON 
set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_RETIMING ON
set_global_assignment -name ROUTER_LCELL_INSERTION_AND_LOGIC_DUPLICATION ON
set_global_assignment -name ROUTER_TIMING_OPTIMIZATION_LEVEL NORMAL
set_global_assignment -name AUTO_PACKED_REGISTERS_STRATIXII NORMAL
set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON
set_global_assignment -name AUTO_GLOBAL_REGISTER_CONTROLS OFF
set_global_assignment -name SMART_RECOMPILE ON
set_global_assignment -name SYNCHRONIZER_IDENTIFICATION AUTO
#set_global_assignment -name AUTO_RESOURCE_SHARING ON
#set_global_assignment -name ALLOW_ANY_RAM_SIZE_FOR_RECOGNITION ON
#set_global_assignment -name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION ON
#set_global_assignment -name AUTO_PARALLEL_SYNTHESIS ON
set_global_assignment -name SAFE_STATE_MACHINE ON

#######################################
# Parameters
#######################################

set_parameter -name TARGET_BOARD  "$target_board"
set_parameter -name TARGET_DEVICE "$DEVFAMILY"


#######################################
# Global Macros (must precede all else)
#######################################

if {[getShellParam use_ddr] == 1}             { set_global_assignment -name VERILOG_MACRO "USE_DDR=1" }
if {[getShellParam use_second_dimm] == 1}     { set_global_assignment -name VERILOG_MACRO "USE_SECOND_DIMM=1" }
if {[getShellParam use_ecc_ddr] == 1}         { set_global_assignment -name VERILOG_MACRO "USE_ECC_DDR=1" }
if {[getShellParam ddr_use_lutram] == 1}      { set_global_assignment -name VERILOG_MACRO "DDR_USE_LUTRAM=1" }
if {[getShellParam use_perf_monitor] == 1}    { set_global_assignment -name VERILOG_MACRO "USE_PERF_MONITOR=1" }
if {[getShellParam pcie_disable_aeq] == 1}    { set_global_assignment -name VERILOG_MACRO "PCIE_DISABLE_AEQ=1" }
if {[getShellParam pcie_use_stream_dma] == 1} { set_global_assignment -name VERILOG_MACRO "PCIE_USE_STREAM_DMA=1" }
if {[getShellParam pcie_use_gen2_soft_reset] == 1} { set_global_assignment -name VERILOG_MACRO "PCIE_GEN2_SOFT_RESET=1" }
if {[getShellParam use_sl3] == 1}             { set_global_assignment -name VERILOG_MACRO "USE_SL3=1" }

if {[getShellParam pcie_use_stream_dma] == 0 && [getShellParam pcie_enable_gen3] == 1} { 
	return -code error "PCIe Slot-based DMA Engine does not support gen 3"
}

set_global_assignment -name VERILOG_MACRO FPGA_USER_CLOCK=[getShellParam fpga_user_clock]
set_global_assignment -name VERILOG_MACRO PCIE_ENABLE_GEN3=[getShellParam pcie_enable_gen3]
set_global_assignment -name VERILOG_MACRO PCIE_VENDOR_ID_HIP0=[getShellParam pcie_vendor_id_hip0]
set_global_assignment -name VERILOG_MACRO PCIE_DEVICE_ID_HIP0=[getShellParam pcie_device_id_hip0]
set_global_assignment -name VERILOG_MACRO PCIE_HIGH_DRIVE_HIP0=[getShellParam pcie_high_drive_hip0]
set_global_assignment -name VERILOG_MACRO PCIE_HIGH_DRIVE_HIP1=[getShellParam pcie_high_drive_hip1]
set_global_assignment -name VERILOG_MACRO PCIE_FORCE_MEDIAN_CTLE_HIP0=[getShellParam pcie_force_median_ctle_hip0]
set_global_assignment -name VERILOG_MACRO PCIE_FORCE_MEDIAN_CTLE_HIP1=[getShellParam pcie_force_median_ctle_hip1]
set_global_assignment -name VERILOG_MACRO PCIE_SLOTS_ON_STREAMING=[getShellParam pcie_slots_on_streaming]
set_global_assignment -name VERILOG_MACRO PCIE_SLOTS_LOOPBACK_FIFO=[getShellParam pcie_slots_loopback_fifo]
set_global_assignment -name VERILOG_MACRO SL3_LANES=[getShellParam sl3_lanes]

# Print info about shell and selected parameters
set time [clock format [clock seconds]]
post_message -type info ""
post_message -type info ""
post_message -type info "*******************************"
post_message -type info "Shell:       Mt. Granite"
post_message -type info "Date:        $time"
foreach param [dict keys $shell_params] {
	set val [dict get $shell_params $param]
	post_message -type info "         $param = $val"
}


#######################################
# Common Assignments                  #
#######################################
source $shell_path/Boards/$target_board/pins.tcl

if {[getShellParam use_ddr] == 1} {
	source $shell_path/Boards/$target_board/ddr.tcl
	source $shell_path/shell_ddr.tcl
}
source $shell_path/shell_common.tcl

set_global_assignment -name SEARCH_PATH $shell_path/Types
