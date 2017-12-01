################  2014.11.13 Altera - added SDC constraints from TTK #####################

# ***************************************************************************************************************************************************
# acaulfie - Altera fix for slow changing tl_cfg_ctl signal compared to tl_cfg_add
#Arria10 Version -- Note: Will create ignored SDC warnings on StratixV
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_a10_hip_pipen1b:altpcie_a10_hip_pipen1b|wys|tl_cfg_add[*]}] -hold -end 2
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_a10_hip_pipen1b:altpcie_a10_hip_pipen1b|wys|tl_cfg_add[*]}] -setup -end 2
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_a10_hip_pipen1b:altpcie_a10_hip_pipen1b|wys|tl_cfg_ctl[*]}] -hold -end 2
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_a10_hip_pipen1b:altpcie_a10_hip_pipen1b|wys|tl_cfg_ctl[*]}] -setup -end 2

#StratixV Version -- Note: will create ignored SDC warnings on A10
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip|tlcfgadd[*]}] -hold -end 2
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip|tlcfgadd[*]}] -setup -end 2
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip|tlcfgctl[*]}] -hold -end 2
set_multicycle_path -through [get_pins -compatibility_mode -nocase {*|altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip|tlcfgctl[*]}] -setup -end 2

# ***************************************************************************************************************************************************
# SAM - cut any_rst_rr to npor, async reset, get two nodes
set_max_delay -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG*] 10.0
set_false_path -hold -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG1?]
# another path, syncd internally so cut
set_max_delay -from {*altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to [get_registers *altpcie_reconfig_driver:pcie_reconfig_driver_0|reset_sync_pldclk_r[?]] 10.0
set_false_path -hold -from {*altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to [get_registers *altpcie_reconfig_driver:pcie_reconfig_driver_0|reset_sync_pldclk_r[?]]
# and another
set_max_delay -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_soft_reset.altpcie_rs_serdes|arst_r[?]] 10.0
set_false_path -hold -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_soft_reset.altpcie_rs_serdes|arst_r[?]]
# SAM - some wierd adce path with apparent synchro, cut
set_max_delay -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG*} -to [get_registers *altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_off_r[?]] 10.0
set_false_path -hold -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG*} -to [get_registers *altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_off_r[?]] 
set_max_delay -from {*|altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_on_r[0]} -to {*|altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_on_rr[0]} 10.0
set_false_path -hold -from {*|altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_on_r[0]} -to {*|altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_on_rr[0]}

set_max_delay -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|arst_r[?]] 10.0
set_false_path -hold -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|arst_r[?]] 

set_max_delay -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_soft_reset.altpcie_rs_serdes|any_rstn_*] 10.0
set_false_path -hold -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_soft_reset.altpcie_rs_serdes|any_rstn_*]
# Othernode
set_max_delay -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|pld_clk_inuse} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_soft_reset.altpcie_rs_serdes|any_rstn_*] 10.0
set_false_path -hold -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|pld_clk_inuse} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_soft_reset.altpcie_rs_serdes|any_rstn_*]

# sync registers for AEQ are named _r[] and _rr[]
set_false_path -from * -to *altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_off_r*
set_false_path -from * -to *altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.adce_on_r*
# ***************************************************************************************************************************************************

# ***************************************************************************************************************************************************
# prerakpatel - Enable AEQ workaround - median CTLE
set_false_path -to *|altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.aeq_cvg_done_r[0]
set_false_path -to *|altpcie_reconfig_driver:pcie_reconfig_driver_0|g_reconfig_ip.start_cvg_timer_r[0]

# ***************************************************************************************************************************************************
# jasonthong - quartus 15.1 cut paths to async resets

set_max_delay -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|arst_r[?]] 10.0
set_false_path -hold -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|arst_r[?]]

set_max_delay -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|any_rstn_*] 10.0
set_false_path -hold -from {any_rstn_rr} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|any_rstn_*]

set_max_delay -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|pld_clk_inuse} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|any_rstn_*] 10.0
set_false_path -hold -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|pld_clk_inuse} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|any_rstn_*]

set_max_delay -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|g_npor_int.dly_cnt[?]*} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|arst_r[?]] 10.0
set_false_path -hold -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|g_npor_int.dly_cnt[?]*} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|arst_r[?]]

set_max_delay -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|g_npor_int.dly_cnt[?]*} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|any_rstn_*] 10.0
set_false_path -hold -from {*altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|g_npor_int.dly_cnt[?]*} -to [get_registers *altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|altpcie_rs_serdes:g_hiprst.altpcie_rs_serdes|any_rstn_*]

# ***************************************************************************************************************************************************


# +---------------------------------------------------
# | Cut the async clear paths
# +---------------------------------------------------
set aclr_counter 0
set clrn_counter 0
set aclr_collection [get_pins -compatibility_mode -nocase -nowarn *|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|aclr]
set clrn_collection [get_pins -compatibility_mode -nocase -nowarn *|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn]
foreach_in_collection aclr_pin $aclr_collection {
    set aclr_counter [expr $aclr_counter + 1]
}
foreach_in_collection clrn_pin $clrn_collection {
    set clrn_counter [expr $clrn_counter + 1]
}
if {$aclr_counter > 0} {
    set_false_path -to [get_pins -compatibility_mode -nocase *|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|aclr]
}

if {$clrn_counter > 0} {
    set_false_path -to [get_pins -compatibility_mode -nocase *|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn]
}
# (C) 2001-2013 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# SDC file for alt_xcvr_reconfig
# You will need to adjust the constraints based on your design
#**************************************************************
# Create Clock
#  -enable and edit these two constraints to fit your design
#**************************************************************

# Note - the source for the mgmt_clk_clk should be set to whatever parent port drives the alt_xcvr_reconfig's mgmt_clk_clk port
#create_clock -period 10ns  -name {mgmt_clk_clk} [get_ports {mgmt_clk_clk}]

# Note that the source clock should be the mgmt_clk_clk, or whichever parent clock is driving it
#create_generated_clock -name sv_reconfig_pma_testbus_clk -source [get_ports {mgmt_clk_clk}] -divide_by 1  [get_registers *sv_xcvr_reconfig_basic:s5|*alt_xcvr_arbiter:pif*|*grant*]

# The following constraint is a TCL loop used to generate clocks for the basic block in 
# the reconfiguration controller.  However, if the constraints are already in place
# then comment out this loop, as timequest will report warnings for overwriting 
# clocks.  An alternative is to use the commented constraint above.  It needs to be 
# modified to fit the design.
#
# Procedure: 
# First, Report a collection of clocks to reg_init[0], which is the reconfig clk.  
# Next, for each item in the collection, we report the upper hierarchy up to reg_init[0], 
# and concatenate pif[0]*|*grant* to create the destination.  We use the value of
# count to create unique names of the clock instince.  Then increment count.

# Set constraint variables
# Determines if the BER is enabled in the design.
set ber_exists [get_registers -nowarn *alt_xcvr_reconfig*alt_xcvr_reconfig_eyemon_ctrl*xreconfig_ctrl*ber_fifo*]

set count 0

# If the generated clocks for the pmatestbus (grant[0]) already exist, then do not regenerate them.
if { [get_collection_size [get_clocks -nowarn sv_reconfig_pma_testbus_clk_?]] eq 0 } {
  set grant_clk [get_pins -compatibility_mode -no_duplicates *\|basic\|s5\|reg_init\[0\]\|clk]
  foreach_in_collection reconfig_clk $grant_clk {
    set reconfig_clk [get_object_info -name $reconfig_clk]
    if [regexp {^(.*.)(?=reg_init)} $reconfig_clk grant_clk] {
      create_generated_clock -add -name sv_reconfig_pma_testbus_clk_$count -source [get_pins -compatibility_mode -no_duplicates $reconfig_clk] -divide_by 1  [get_registers $grant_clk*pif[0]*\|*grant*]
      set_clock_groups -exclusive -group [get_clocks sv_reconfig_pma_testbus_clk_$count]

      # If the BER Counter exists, then set a false path to it from the generated clock to avoid timing registers to multiple clocks
      if { [get_collection_size $ber_exists] > 0 } {
        # If there is a custom sv_reconfig_pma_testbus_clk in place, then tailor this constraint to match the clock
        set_false_path -from [get_clocks sv_reconfig_pma_testbus_clk_$count] -to [get_registers -nowarn *alt_xcvr_reconfig*alt_xcvr_reconfig_eyemon_ctrl*xreconfig_ctrl*ber_fifo*]
      }
      incr count
    }
  }
}

#**************************************************************
# False paths
#**************************************************************
# testbus not an actual clock - set asynchronous to all other clocks
# Comment this back in if you are using the commented constraints above
# for creating generated clocks.
#set_clock_groups -exclusive -group [get_clocks {sv_reconfig_pma_testbus_clk}]



# The derive_pll_clocks constraint needs to be run before the following constraints are read, or certain constraints may be ignored.
# Generally, derive_pll_clocks is run as a part of a top-level sdc file, which should be ordered to be read before
# the reconfig *.qip file in the *.qsf.

# Sets constraints to only be run during timequest to suppress timing violations.  Sets the PMATESTBUSSEL[0] as Asynchronous
if { [string equal "quartus_sta" $::TimeQuestInfo(nameofexecutable)] } {
  # If the BER is enabled in the reconfiguration controller, the following 
  # false paths will be set.  It sets false paths to the write Side of the BER Fifo
  if { [get_collection_size $ber_exists] > 0 } {
    set_false_path  -from [get_registers -nowarn *alt_xcvr_reconfig*sv_xcvr_reconfig_basic*alt_xcvr_arbiter*pif_arb*grant[0]] \
                    -to   [get_registers -nowarn *alt_xcvr_reconfig*alt_xcvr_reconfig_eyemon_ctrl*xreconfig_ctrl*ber_fifo*]
    set_false_path  -from [get_registers -nowarn *avmm*pmatestbus*] \
                    -to   [get_registers -nowarn *alt_xcvr_reconfig*alt_xcvr_reconfig_eyemon_ctrl_sv*xreconfig_ctrl*ber_fifo*]
  }

  # Sets a False path for hold time violations on the pif_interface_sel
  set_false_path -from {*|alt_xcvr_reconfig_basic:basic|sv_xcvr_reconfig_basic:s5|pif_interface_sel} -hold

# If we are not in TimeQuest, then run the constraints to maintain a max 
# skew on the pmatestbus to the write side of the BER Fifo
} else {
  if { [get_collection_size $ber_exists] > 0 } {
    set_max_skew  -from [get_registers -nowarn *xcvr_native*avmm*pmatestbus[?]] \
                  -to   [get_registers -nowarn *alt_xcvr_reconfig*alt_xcvr_reconfig_eyemon_ctrl_sv*xreconfig_ctrl*ber_fifo*porta_datain_reg?*] 2ns
  }
}

# Sets the pmatestbussel[0] clock asynchronous to all other clocks including other pmatestbussel[0] clocks sourced from other channels
foreach_in_collection pmatestbussel_clocks [get_clocks {*hssi_avmm_interface_inst|pmatestbussel[0]}] {
  set_clock_groups -asynchronous -group [get_clock_info -name $pmatestbussel_clocks]
}
# (C) 2001-2013 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# derive_pll_clock is used to calculate all clock derived from PCIe refclk
#  the derive_pll_clocks and derive clock_uncertainty should only
# be applied once across all of the SDC files used in a project
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

##############################################################################
# PHY IP reconfig controller constraints
# Set reconfig_xcvr clock
# this line will likely need to be modified to match the actual clock pin name
# used for this clock, and also changed to have the correct period set for the actually used clock
create_clock -period "125 MHz" -name {reconfig_xcvr_clk} {*reconfig_xcvr_clk*}

######################################################################
# HIP Soft reset controller SDC constraints
set_false_path -to   [get_registers *altpcie_rs_serdes|fifo_err_sync_r[0]]
set_false_path -from [get_registers *sv_xcvr_pipe_native*] -to [get_registers *altpcie_rs_serdes|*]

# HIP testin pins SDC constraints
set_false_path -from [get_pins -compatibility_mode *hip_ctrl*]

######################################################################
# Constraints for CV SIG asynchonous logic
set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_ltssm|altpcie_hip_vecsync:altpcie_hip_vecsync2|data_in_d0[*]}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_ltssm|altpcie_hip_vecsync:altpcie_hip_vecsync2|data_out[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_ltssm|altpcie_hip_vecsync:altpcie_hip_vecsync2|req_wr_clk}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_ltssm|altpcie_hip_vecsync:altpcie_hip_vecsync2|altpcie_hip_bitsync:u_req_rd_clk|sync_regs[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_tls|altpcie_hip_vecsync:altpcie_hip_vecsync2|req_rd_clk_d0}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_tls|altpcie_hip_vecsync:altpcie_hip_vecsync2|altpcie_hip_bitsync:u_ack_wr_clk|sync_regs[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_tls|altpcie_hip_vecsync:altpcie_hip_vecsync2|req_wr_clk}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_tls|altpcie_hip_vecsync:altpcie_hip_vecsync2|altpcie_hip_bitsync:u_req_rd_clk|sync_regs[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_tls|altpcie_hip_vecsync:altpcie_hip_vecsync2|data_in_d0[*]}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_tls|altpcie_hip_vecsync:altpcie_hip_vecsync2|data_out[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_ltssm|altpcie_hip_vecsync:altpcie_hip_vecsync2|req_rd_clk_d0}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hip_eq_dprio:sigtesten.hip_eq_dprio_inst|altpcie_hip_vecsync2:vecsync_ltssm|altpcie_hip_vecsync:altpcie_hip_vecsync2|altpcie_hip_bitsync:u_ack_wr_clk|sync_regs[*]}]


set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG122}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|test_out[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG122}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hd_altpe3_hip_eq_bypass_ph3:sigtesten.ep_eq_bypass_ph3_inst|test_dbg_eqout[*]}]
                                                                                                                                                
set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG122}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hd_altpe3_hip_eq_bypass_ph3:sigtesten.ep_eq_bypass_ph3_inst|test_dbg_eqber[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG122}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hd_altpe3_hip_eq_bypass_ph3:sigtesten.ep_eq_bypass_ph3_inst|test_dbg_farend_lf[*]}]

set_false_path -from [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|stratixv_hssi_gen3_pcie_hip~SYNC_DATA_REG122}] -to [get_keepers {*|altpcie_hip_256_pipen1b:altpcie_hip_256_pipen1b|hd_altpe3_hip_eq_bypass_ph3:sigtesten.ep_eq_bypass_ph3_inst|test_dbg_farend_fs[*]}]
