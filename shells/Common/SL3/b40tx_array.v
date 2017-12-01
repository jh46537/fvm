// Copyright 2013 Altera Corporation. All rights reserved.  
// Altera products are protected under numerous U.S. and foreign patents, 
// maskwork rights, copyrights and other intellectual property laws.  
//
// This reference design file, and your use thereof, is subject to and governed
// by the terms and conditions of the applicable Altera Reference Design 
// License Agreement (either as signed by you or found at www.altera.com).  By
// using this reference design file, you indicate your acceptance of such terms
// and conditions between you and Altera Corporation.  In the event that you do
// not agree with such terms and conditions, you may not use the reference 
// design file and please promptly destroy any copies you have made.
//
// This reference design file is being provided on an "as-is" basis and as an 
// accommodation and therefore all warranties, representations or guarantees of 
// any kind (whether express, implied or statutory) including, without 
// limitation, warranties of merchantability, non-infringement, or fitness for
// a particular purpose, are specifically disclaimed.  By making this reference
// design file available, Altera expressly does not recommend, suggest or 
// require that this reference design file be used in combination with any 
// other product not provided by Altera.
/////////////////////////////////////////////////////////////////////////////


// baeckler - 04-15-2013
// basic 40 bit TX with FIFO in phase comp mode

`timescale 1 ps / 1 ps
module b40tx_array #(
	parameter NUM_LN = 4,
	parameter RX_REF = "644.53125 MHz", // "322.265625 MHz",
	parameter DRATE = "10312.5 Mbps"
)(
	input pll_powerdown,
	input rst_txa,
	input rst_txd,
	input [NUM_LN-1:0] ext_pll_clk,
	output [NUM_LN-1:0] tx_pin,
	input clk_tx_core,
	output [NUM_LN-1:0] clk_tx_out,
	input [NUM_LN-1:0] sloop,
	
	input [NUM_LN*40-1:0] tx_data,
	
	input  [NUM_LN*1*70-1:0] reconfig_to_xcvr,       
	output [NUM_LN*1*46-1:0] reconfig_from_xcvr      
);

wire [NUM_LN*64-1:0] tx_parallel_data;
wire [NUM_LN*9-1:0] tx_control;

genvar i;
generate
	for (i=0; i<NUM_LN; i=i+1) begin : lp
		altera_xcvr_native_sv #(
				.tx_enable                       (1),
				.rx_enable                       (0),
				.enable_std                      (0),
				.enable_teng                     (1),
				.data_path_select                ("10G"),
				.channels                        (1),
				.bonded_mode                     ("non_bonded"),
				.data_rate                       (DRATE),
				.pma_width                       (40),
				.tx_pma_clk_div                  (1),
				.tx_pma_txdetectrx_ctrl          (0),
				.pll_reconfig_enable             (0),
				.pll_external_enable             (1),
				.pll_data_rate                   (DRATE),
				.pll_type                        ("CMU"),
				
				.plls                            (1), // this is wrong, pll is external, but errors out with 0
				
				.pll_select                      (0),
				.pll_refclk_cnt                  (1),
				.pll_refclk_select               ("0"),
				.pll_refclk_freq                 ("unused"),
				.pll_feedback_path               ("internal"),
				.cdr_reconfig_enable             (0),
				.cdr_refclk_cnt                  (1),
				.cdr_refclk_select               (0),
				.cdr_refclk_freq                 (RX_REF),
				.rx_ppm_detect_threshold         ("1000"),
				.rx_clkslip_enable               (0),
				.std_protocol_hint               ("basic"),
				.std_pcs_pma_width               (10),
				.std_low_latency_bypass_enable   (0),
				.std_tx_pcfifo_mode              ("low_latency"),
				.std_rx_pcfifo_mode              ("low_latency"),
				.std_rx_byte_order_enable        (0),
				.std_rx_byte_order_mode          ("manual"),
				.std_rx_byte_order_width         (10),
				.std_rx_byte_order_symbol_count  (1),
				.std_rx_byte_order_pattern       ("0"),
				.std_rx_byte_order_pad           ("0"),
				.std_tx_byte_ser_enable          (0),
				.std_rx_byte_deser_enable        (0),
				.std_tx_8b10b_enable             (0),
				.std_tx_8b10b_disp_ctrl_enable   (0),
				.std_rx_8b10b_enable             (0),
				.std_rx_rmfifo_enable            (0),
				.std_rx_rmfifo_pattern_p         ("00000"),
				.std_rx_rmfifo_pattern_n         ("00000"),
				.std_tx_bitslip_enable           (0),
				.std_rx_word_aligner_mode        ("bit_slip"),
				.std_rx_word_aligner_pattern_len (7),
				.std_rx_word_aligner_pattern     ("0000000000"),
				.std_rx_word_aligner_rknumber    (3),
				.std_rx_word_aligner_renumber    (3),
				.std_rx_word_aligner_rgnumber    (3),
				.std_rx_run_length_val           (31),
				.std_tx_bitrev_enable            (0),
				.std_rx_bitrev_enable            (0),
				.std_rx_byterev_enable           (0),
				.std_tx_polinv_enable            (0),
				.std_rx_polinv_enable            (0),
				.teng_protocol_hint              ("basic"),
				.teng_pcs_pma_width              (40),
				.teng_pld_pcs_width              (40),
				.teng_txfifo_mode                ("phase_comp"),
				.teng_txfifo_full                (31),
				.teng_txfifo_empty               (0),
				.teng_txfifo_pfull               (23),
				.teng_txfifo_pempty              (2),
				.teng_rxfifo_mode                ("register"),
				.teng_rxfifo_full                (31),
				.teng_rxfifo_empty               (0),
				.teng_rxfifo_pfull               (23),
				.teng_rxfifo_pempty              (2),
				.teng_rxfifo_align_del           (0),
				.teng_rxfifo_control_del         (0),
				.teng_tx_frmgen_enable           (0),
				.teng_tx_frmgen_user_length      (2048),
				.teng_tx_frmgen_burst_enable     (0),
				.teng_rx_frmsync_enable          (0),
				.teng_rx_frmsync_user_length     (2048),
				.teng_frmgensync_diag_word       ("6400000000000000"),
				.teng_frmgensync_scrm_word       ("2800000000000000"),
				.teng_frmgensync_skip_word       ("1e1e1e1e1e1e1e1e"),
				.teng_frmgensync_sync_word       ("78f678f678f678f6"),
				.teng_tx_sh_err                  (0),
				.teng_tx_crcgen_enable           (0),
				.teng_rx_crcchk_enable           (0),
				.teng_tx_64b66b_enable           (0),
				.teng_rx_64b66b_enable           (0),
				.teng_tx_scram_enable            (0),
				
				//.teng_tx_scram_user_seed         ("123456789abcde"),
				.teng_tx_scram_user_seed         (58'h123456789abcde),
				
				.teng_rx_descram_enable          (0),
				.teng_tx_dispgen_enable          (0),
				.teng_rx_dispchk_enable          (0),
				.teng_rx_blksync_enable          (0),
				.teng_tx_polinv_enable           (0),
				.teng_tx_bitslip_enable          (0),
				.teng_rx_polinv_enable           (0),
				.teng_rx_bitslip_enable          (0)
			) tx (
				.pll_powerdown             (pll_powerdown),                                                                        
				.tx_analogreset            (rst_txa),                                                                       
				.tx_digitalreset           (rst_txd),                                                                      
				.tx_serial_data            (tx_pin[i]),                                                                       
				.ext_pll_clk               (ext_pll_clk[i]),                                                                          
				.tx_parallel_data(tx_parallel_data[(i+1)*64-1:i*64]),         
				.tx_10g_coreclkin          (clk_tx_core),                                                                     
				.tx_10g_clkout             (clk_tx_out[i]),                                                                        
				.tx_10g_control(tx_control[(i+1)*9-1:i*9]),           
				.tx_10g_data_valid         (1'b1),                                                                    
				.tx_cal_busy               (),                                                                          
				.reconfig_to_xcvr({reconfig_to_xcvr[(i+1)*1*70-1:i*1*70]}),         
				.reconfig_from_xcvr({reconfig_from_xcvr[(i+1)*1*46-1:i*1*46]}),        
				.tx_pma_clkout             (),                                                                                     
				.tx_pma_parallel_data      (80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000), 
				.pll_locked                (),                                                                                     
				.rx_analogreset            (1'b0),                                                                                 
				.rx_digitalreset           (1'b0),                                                                                 
				.rx_cdr_refclk             (1'b0),                                                                                 
				.rx_pma_clkout             (),                                                                                     
				.rx_serial_data            (1'b0),                                                                                 
				.rx_pma_parallel_data      (),                                                                                     
				.rx_clkslip                (1'b0),                                                                                 
				.rx_clklow                 (),                                                                                     
				.rx_fref                   (),                                                                                     
				.rx_set_locktodata         (1'b0),                                                                                 
				.rx_set_locktoref          (1'b0),                                                                                 
				.rx_is_lockedtoref         (),                                                                                     
				.rx_is_lockedtodata        (),                                                                                     
				.rx_seriallpbken           (sloop[i]),                                                                                 
				.rx_signaldetect           (),                                                                                     
				.rx_pma_qpipulldn          (1'b0),                                                                                 
				.tx_pma_qpipullup          (1'b0),                                                                                 
				.tx_pma_qpipulldn          (1'b0),                                                                                 
				.tx_pma_txdetectrx         (1'b0),                                                                                 
				.tx_pma_rxfound            (),                                                                                     
				.rx_parallel_data          (),                                                                                     
				.tx_std_coreclkin          (1'b0),                                                                                 
				.rx_std_coreclkin          (1'b0),                                                                                 
				.tx_std_clkout             (),                                                                                     
				.rx_std_clkout             (),                                                                                     
				.tx_std_pcfifo_full        (),                                                                                     
				.tx_std_pcfifo_empty       (),                                                                                     
				.rx_std_pcfifo_full        (),                                                                                     
				.rx_std_pcfifo_empty       (),                                                                                     
				.rx_std_byteorder_ena      (1'b0),                                                                                 
				.rx_std_byteorder_flag     (),                                                                                     
				.rx_std_rmfifo_full        (),                                                                                     
				.rx_std_rmfifo_empty       (),                                                                                     
				.rx_std_wa_patternalign    (1'b0),                                                                                 
				.rx_std_wa_a1a2size        (1'b0),                                                                                 
				.tx_std_bitslipboundarysel (5'b00000),                                                                             
				.rx_std_bitslipboundarysel (),                                                                                     
				.rx_std_bitslip            (1'b0),                                                                                 
				.rx_std_runlength_err      (),                                                                                     
				.rx_std_bitrev_ena         (1'b0),                                                                                 
				.rx_std_byterev_ena        (1'b0),                                                                                 
				.tx_std_polinv             (1'b0),                                                                                 
				.rx_std_polinv             (1'b0),                                                                                 
				.tx_std_elecidle           (1'b0),                                                                                 
				.rx_std_signaldetect       (),                                                                                     
				.rx_10g_coreclkin          (1'b0),                                                                                 
				.rx_10g_clkout             (),                                                                                     
				.rx_10g_clk33out           (),                                                                                     
				.rx_10g_control            (),                                                                                     
				
				.tx_10g_fifo_full(),         
				.tx_10g_fifo_pfull(),        
				.tx_10g_fifo_empty(),        
				.tx_10g_fifo_pempty(),       
			
				.tx_10g_fifo_del           (),                                                                                     
				.tx_10g_fifo_insert        (),                                                                                     
				.rx_10g_fifo_rd_en         (1'b0),                                                                                 
				.rx_10g_data_valid         (),                                                                                     
				.rx_10g_fifo_full          (),                                                                                     
				.rx_10g_fifo_pfull         (),                                                                                     
				.rx_10g_fifo_empty         (),                                                                                     
				.rx_10g_fifo_pempty        (),                                                                                     
				.rx_10g_fifo_del           (),                                                                                     
				.rx_10g_fifo_insert        (),                                                                                     
				.rx_10g_fifo_align_val     (),                                                                                     
				.rx_10g_fifo_align_clr     (1'b0),                                                                                 
				.rx_10g_fifo_align_en      (1'b0),                                                                                 
				.tx_10g_frame              (),                                                                                     
				.tx_10g_frame_diag_status  (2'b00),                                                                                
				.tx_10g_frame_burst_en     (1'b0),                                                                                 
				.rx_10g_frame              (),                                                                                     
				.rx_10g_frame_lock         (),                                                                                     
				.rx_10g_frame_mfrm_err     (),                                                                                     
				.rx_10g_frame_sync_err     (),                                                                                     
				.rx_10g_frame_skip_ins     (),                                                                                     
				.rx_10g_frame_pyld_ins     (),                                                                                     
				.rx_10g_frame_skip_err     (),                                                                                     
				.rx_10g_frame_diag_err     (),                                                                                     
				.rx_10g_frame_diag_status  (),                                                                                     
				.rx_10g_crc32_err          (),                                                                                     
				.rx_10g_descram_err        (),                                                                                     
				.rx_10g_blk_lock           (),                                                                                     
				.rx_10g_blk_sh_err         (),                                                                                     
				.tx_10g_bitslip            (7'b0000000),                                                                           
				.rx_10g_bitslip            (1'b0),                                                                                 
				.rx_10g_highber            (),                                                                                     
				.rx_10g_highber_clr_cnt    (1'b0),                                                                                 
				.rx_10g_clr_errblk_count   (1'b0),                                                                                 
				.rx_cal_busy               ()                                                                                      
			);

		assign 	{tx_parallel_data[(i+1)*64-1:i*64]} =  
			{24'b0,tx_data[40*(i+1)-1:40*i]};
		assign 	tx_control[9*i+8:9*i] = 9'h0;
	end
	
endgenerate

endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Total registers : N/A until Partition Merge
// BENCHMARK INFO :  Total pins : N/A until Partition Merge
// BENCHMARK INFO :  Total virtual pins : N/A until Partition Merge
// BENCHMARK INFO :  Total block memory bits : N/A until Partition Merge
