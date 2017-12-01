if {[getShellParam use_ddr] == 1} {

    ### Global Clocks
    set_instance_assignment -name GLOBAL_SIGNAL "DUAL-REGIONAL CLOCK" -to DramUserInst|DIMM_0|ddr3_dimm0_inst|pll0|pll_avl_clk 
    set_instance_assignment -name GLOBAL_SIGNAL "DUAL-REGIONAL CLOCK" -to DramUserInst|DIMM_0|ddr3_dimm0_inst|pll0|pll_config_clk 
    set_instance_assignment -name GLOBAL_SIGNAL "GLOBAL CLOCK" -to DramUserInst|DIMM_0|ddr3_dimm0_inst|pll0|afi_clk 
    set_instance_assignment -name GLOBAL_SIGNAL "DUAL-REGIONAL CLOCK" -to DramUserInst|DIMM_0|ddr3_dimm0_inst|pll0|pll_hr_clk 
    set_instance_assignment -name GLOBAL_SIGNAL "GLOBAL CLOCK" -to DramUserInst|DIMM_0|ddr3_dimm0_inst|pll0|pll_p2c_read_clk 
    set_instance_assignment -name GLOBAL_SIGNAL OFF -to DramUserInst|DIMM_0|ddr3_dimm0_inst|p0|umemphy|ureset|phy_reset_n 
    set_instance_assignment -name GLOBAL_SIGNAL OFF -to DramUserInst|DIMM_0|ddr3_dimm0_inst|s0|rst_controller|alt_rst_sync_uq1|reset_out 
    set_instance_assignment -name GLOBAL_SIGNAL OFF -to DramUserInst|DIMM_0|ddr3_dimm0_inst|s0|sequencer_rw_mgr_inst|rw_mgr_inst|rw_mgr_core_inst|rw_soft_reset_n 
    set_instance_assignment -name GLOBAL_SIGNAL OFF -to DramUserInst|DIMM_0|ddr3_dimm0_inst|rst_controller|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out 
    set_instance_assignment -name GLOBAL_SIGNAL OFF -to DramUserInst|DIMM_0|ddr3_dimm0_inst|if_csr_m0|rst_controller|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out 
    set_instance_assignment -name GLOBAL_SIGNAL OFF -to DramUserInst|DIMM_0|ddr3_dimm0_inst|p0|umemphy|uread_datapath|reset_n_fifo_wraddress[*]
    set_instance_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS ON -to DramUserInst|DIMM_0|ddr3_dimm0_inst 
    set_instance_assignment -name PLL_COMPENSATION_MODE DIRECT -to DramUserInst|DIMM_0|ddr3_dimm0_inst|pll0|fbout 
    set_instance_assignment -name MAX_FANOUT 4 -to DramUserInst|DIMM_0|ddr3_dimm0_inst|p0|umemphy|uio_pads|wrdata_en_qr_to_hr|dataout_r[*][*] 
    set_instance_assignment -name FORM_DDR_CLUSTERING_CLIQUE ON -to DramUserInst|DIMM_0|ddr3_dimm0_inst|p0|umemphy|*qr_to_hr* 
    set_global_assignment -name USE_DLL_FREQUENCY_FOR_DQS_DELAY_CHAIN ON
    set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE ON
    set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON

    #QIP File

	if {$target_board == "MtGranite"} {
		if {[getShellParam use_ecc_ddr] == 1} {
			set_global_assignment -name QIP_FILE $shell_path/Boards/MtGranite/ddr3_ecc/ddr3_dimm0.qip

			### Must not include if you don't want a DDR interface
			if {[getShellParam use_second_dimm] == 1} {
				set_global_assignment -name QIP_FILE $shell_path/Boards/MtGranite/ddr3_ecc/ddr3_dimm1.qip
			}
		} else {
			set_global_assignment -name QIP_FILE $shell_path/Boards/MtGranite/ddr3/ddr3_dimm0.qip

			### Must not include if you don't want a DDR interface
			if {[getShellParam use_second_dimm] == 1} {
				set_global_assignment -name QIP_FILE $shell_path/Boards/MtGranite/ddr3/ddr3_dimm1.qip
			}
		}
	}

}
