#################################################################
# Serial Lite 3 (Torus Network Links)
#
# 
#################################################################
#Dependencies

#Local imports
set curdir [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

if { ![info exists SIMULATION] } {
    set_global_assignment -name VERILOG_FILE $curdir/SL3_Types.sv
    set_global_assignment -name MIF_FILE $curdir/Reconfig_Init.mif
    set_global_assignment -name VERILOG_FILE $curdir/xor_ur2_v.v
    set_global_assignment -name VERILOG_FILE $curdir/xor_r.v
    set_global_assignment -name VERILOG_FILE $curdir/xor_lut_v.v
    set_global_assignment -name VERILOG_FILE $curdir/xor_lut.v
    set_global_assignment -name VERILOG_FILE $curdir/xor_2tick.v
    set_global_assignment -name VERILOG_FILE $curdir/wys_lut.v
    set_global_assignment -name VERILOG_FILE $curdir/watchdog_timer.v
    set_global_assignment -name SYSTEMVERILOG_FILE $curdir/Transceiver_Reconfig_Controller.sv
    set_global_assignment -name VERILOG_FILE $curdir/sync_regs.v
    set_global_assignment -name VERILOG_FILE $curdir/Start_Reconfig.v
    set_global_assignment -name VERILOG_FILE $curdir/sl3p_serdes_2ln.v
    set_global_assignment -name VERILOG_FILE $curdir/sl3_core.v
    set_global_assignment -name VERILOG_FILE $curdir/sl3_core_credits.v
    set_global_assignment -name VERILOG_FILE $curdir/sl3p_2ln.v -library ntv_serdes_2ln
    set_global_assignment -name VERILOG_FILE $curdir/scrambler.v
    set_global_assignment -name VERILOG_FILE $curdir/s5mlab.v
    set_global_assignment -name VERILOG_FILE $curdir/s5_temp_sense.v
    set_global_assignment -name VERILOG_FILE $curdir/reset_delay.v
    set_global_assignment -name VERILOG_FILE $curdir/Reconfig_RAM.v
    set_global_assignment -name VERILOG_FILE $curdir/mismatch_32.v
    set_global_assignment -name VERILOG_FILE $curdir/grace_period_8.v
    set_global_assignment -name VERILOG_FILE $curdir/eq_66_const.v
    set_global_assignment -name VERILOG_FILE $curdir/eq_18.v
    set_global_assignment -name VERILOG_FILE $curdir/eq_6_const.v
    set_global_assignment -name VERILOG_FILE $curdir/eq_3.v
    set_global_assignment -name VERILOG_FILE $curdir/dip8_48.v
    set_global_assignment -name VERILOG_FILE $curdir/deskew_2ln.v
    set_global_assignment -name VERILOG_FILE $curdir/descrambler_wys.v
    set_global_assignment -name VERILOG_FILE $curdir/delay_regs.v
    set_global_assignment -name VERILOG_FILE $curdir/delay_mlab.v
    set_global_assignment -name VERILOG_FILE $curdir/cross_strobe.v
    set_global_assignment -name VERILOG_FILE $curdir/cross_sparse_valid.v
    set_global_assignment -name VERILOG_FILE $curdir/cross_handshake.v
    set_global_assignment -name VERILOG_FILE $curdir/crc32_z64_xn_unreg.v
    set_global_assignment -name VERILOG_FILE $curdir/crc32_d64_sig_x1.v
    set_global_assignment -name VERILOG_FILE $curdir/crc32_d64_sig.v
    set_global_assignment -name VERILOG_FILE $curdir/crc32_2word.v
    set_global_assignment -name VERILOG_FILE $curdir/Config_Read_RAM.v
    set_global_assignment -name VERILOG_FILE $curdir/asc_to_lcd.v
    set_global_assignment -name VERILOG_FILE $curdir/and_r.v
    set_global_assignment -name VERILOG_FILE $curdir/armored40_dec.v
    set_global_assignment -name VERILOG_FILE $curdir/armored40_enc.v
    set_global_assignment -name VERILOG_FILE $curdir/armored40_rx.v
    set_global_assignment -name VERILOG_FILE $curdir/armored40_tx.v
    set_global_assignment -name VERILOG_FILE $curdir/armored66_rx.v
    set_global_assignment -name VERILOG_FILE $curdir/armored66_tx.v -library ntv_serdes_2ln
    set_global_assignment -name VERILOG_FILE $curdir/b40rx_array.v
    set_global_assignment -name VERILOG_FILE $curdir/b40tx_array.v
    set_global_assignment -name VERILOG_FILE $curdir/descrambler_33.v
    set_global_assignment -name VERILOG_FILE $curdir/dlv2.v
    set_global_assignment -name VERILOG_FILE $curdir/ecc_dec_40_33.v
    set_global_assignment -name VERILOG_FILE $curdir/ecc_enc_40_33.v
    set_global_assignment -name VERILOG_FILE $curdir/f_xor.v
    set_global_assignment -name VERILOG_FILE $curdir/grace_period_64.v
    set_global_assignment -name VERILOG_FILE $curdir/ilv2.v
    set_global_assignment -name VERILOG_FILE $curdir/mix_odd_even.v
    set_global_assignment -name VERILOG_FILE $curdir/or_r.v
    set_global_assignment -name VERILOG_FILE $curdir/scrambler_33.v
    set_global_assignment -name VERILOG_FILE $curdir/sep_odd_even.v
    set_global_assignment -name VERILOG_FILE $curdir/sl3p_deskew.v
    set_global_assignment -name VERILOG_FILE $curdir/sl3p_serdes_2ln_ecc.v -library ntv_serdes_2ln
    set_global_assignment -name VERILOG_FILE $curdir/SL3_User.v
    set_global_assignment -name VERILOG_FILE $curdir/EdgeCount.v
    set_global_assignment -name QIP_FILE $curdir/AlteraIP_14/Sl3pFifo.qip
    set_global_assignment -name QIP_FILE $curdir/AlteraIP_14/reco_4ln.qip
    set_global_assignment -name QIP_FILE $curdir/AlteraIP_14/ntv_serdes_2ln.qip
    set_global_assignment -name VERILOG_FILE $curdir/SL3_Network.sv
}