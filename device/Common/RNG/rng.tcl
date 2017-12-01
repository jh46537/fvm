
if { [info exists SIMULATION] } {
source $common_path/AESX/aesx.tcl
   set_global_assignment -name SEARCH_PATH  $common_path/RNG/rtl
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_regs.vh
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_defines.vh
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_rbg.v
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_fifo.v
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_chi_sq_lut.v
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_regs.v
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng_core.v
   set_global_assignment -library RNG -name VERILOG_FILE $common_path/RNG/rtl/rng.v
} else {
	set_global_assignment -name VQM_FILE $common_path/RNG/synplify/rev_1/rng.vqm
}

set_global_assignment -name SDC_FILE $common_path/RNG/rng.sdc

create_partition -contents "rng_rbg_11s:i_rng_rbg" -partition "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name PARTITION_NETLIST_TYPE POST_SYNTH -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name PARTITION_COLOR 16776960 -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_ENABLED ON -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_AUTO_SIZE ON -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_STATE FLOATING -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_RESERVED OFF -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_SECURITY_ROUTING_INTERFACE OFF -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_IGNORE_IO_BANK_SECURITY_CONSTRAINT OFF -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_PR_REGION OFF -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_ROUTING_REGION_EXPANSION_SIZE 2147483647 -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_WIDTH 1 -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_HEIGHT 1 -section_id "rng_rbg_11s:i_rng_rbg"
set_global_assignment -name LL_ORIGIN X1_Y1 -section_id "rng_rbg_11s:i_rng_rbg"
set_instance_assignment -name LL_MEMBER_OF "rng_rbg_11s:i_rng_rbg" -to "rng_rbg_11s:i_rng_rbg" -section_id "rng_rbg_11s:i_rng_rbg"
#set_instance_assignment -name PARTITION_HIERARCHY irngr_673e1 -to "SoftShell:SoftShell|Role:Role|rng:rng_inst|rng_core:i_rng_core|rng_rbg_11s:i_rng_rbg" -section_id "rng_rbg_11s:i_rng_rbg"