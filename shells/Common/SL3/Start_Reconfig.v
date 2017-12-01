// megafunction wizard: %LPM_CONSTANT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_CONSTANT 

// ============================================================
// File Name: Start_Reconfig.v
// Megafunction Name(s):
// 			LPM_CONSTANT
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.1 Build 177 11/07/2012 SP 0.dp5;1 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module Start_Reconfig (
	result);

	output	[10:0]  result;

	wire [10:0] sub_wire0;
	wire [10:0] result = sub_wire0[10:0];

	lpm_constant	LPM_CONSTANT_component (
				.result (sub_wire0));
	defparam
		LPM_CONSTANT_component.lpm_cvalue = 0,
		LPM_CONSTANT_component.lpm_hint = "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=GO",
		LPM_CONSTANT_component.lpm_type = "LPM_CONSTANT",
		LPM_CONSTANT_component.lpm_width = 11;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix V"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "1"
// Retrieval info: PRIVATE: JTAG_ID STRING "GO"
// Retrieval info: PRIVATE: Radix NUMERIC "10"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: Value NUMERIC "0"
// Retrieval info: PRIVATE: nBit NUMERIC "11"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_CVALUE NUMERIC "0"
// Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=GO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CONSTANT"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "11"
// Retrieval info: USED_PORT: result 0 0 11 0 OUTPUT NODEFVAL "result[10..0]"
// Retrieval info: CONNECT: result 0 0 11 0 @result 0 0 11 0
// Retrieval info: GEN_FILE: TYPE_NORMAL Start_Reconfig.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL Start_Reconfig.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Start_Reconfig.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Start_Reconfig.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Start_Reconfig_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Start_Reconfig_bb.v FALSE
// Retrieval info: LIB_FILE: lpm
