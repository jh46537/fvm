onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /UserMemoryInterface2_tb/VERBOSITY
add wave -noupdate /UserMemoryInterface2_tb/N_UMI_REQS
add wave -noupdate /UserMemoryInterface2_tb/CLOCK_RATE_MHZ
add wave -noupdate /UserMemoryInterface2_tb/HALF_CLOCK_PERIOD
add wave -noupdate /UserMemoryInterface2_tb/DDR_CLOCK_RATE_MHZ
add wave -noupdate /UserMemoryInterface2_tb/DDR_HALF_CLOCK_PERIOD
add wave -noupdate /UserMemoryInterface2_tb/AVL_DATA_BYTES
add wave -noupdate /UserMemoryInterface2_tb/AVL_MEM_DEPTH
add wave -noupdate /UserMemoryInterface2_tb/AVL_MEM_BYTES
add wave -noupdate /UserMemoryInterface2_tb/UMI_DATA_BYTES
add wave -noupdate /UserMemoryInterface2_tb/UMI_PORT_MRANGE_BYTES
add wave -noupdate /UserMemoryInterface2_tb/UMI_PORT_MAXSIZE_BYTES
add wave -noupdate /UserMemoryInterface2_tb/umi_clk
add wave -noupdate /UserMemoryInterface2_tb/umi_rst
add wave -noupdate /UserMemoryInterface2_tb/umi_cmd_raise
add wave -noupdate /UserMemoryInterface2_tb/umi_cmd_grant
add wave -noupdate /UserMemoryInterface2_tb/umi_cmd
add wave -noupdate /UserMemoryInterface2_tb/umi_wr_afull
add wave -noupdate /UserMemoryInterface2_tb/umi_wr_wren
add wave -noupdate /UserMemoryInterface2_tb/umi_wr
add wave -noupdate /UserMemoryInterface2_tb/umi_rd_afull
add wave -noupdate /UserMemoryInterface2_tb/umi_rd_wren
add wave -noupdate /UserMemoryInterface2_tb/umi_rd
add wave -noupdate /UserMemoryInterface2_tb/umi_timeout_wrreq
add wave -noupdate /UserMemoryInterface2_tb/umi_timeout_data
add wave -noupdate /UserMemoryInterface2_tb/umi_clear
add wave -noupdate /UserMemoryInterface2_tb/umi_error
add wave -noupdate /UserMemoryInterface2_tb/umi_mem
add wave -noupdate /UserMemoryInterface2_tb/avl_clk
add wave -noupdate /UserMemoryInterface2_tb/avl_rst
add wave -noupdate /UserMemoryInterface2_tb/avl_ready
add wave -noupdate /UserMemoryInterface2_tb/avl_read
add wave -noupdate /UserMemoryInterface2_tb/avl_write
add wave -noupdate /UserMemoryInterface2_tb/avl_address
add wave -noupdate /UserMemoryInterface2_tb/avl_readdata
add wave -noupdate /UserMemoryInterface2_tb/avl_writedata
add wave -noupdate /UserMemoryInterface2_tb/avl_burstcount
add wave -noupdate /UserMemoryInterface2_tb/avl_byteenable
add wave -noupdate /UserMemoryInterface2_tb/avl_readdatavalid
add wave -noupdate /UserMemoryInterface2_tb/start_time
add wave -noupdate /UserMemoryInterface2_tb/end_time
add wave -noupdate /UserMemoryInterface2_tb/clk_tick_cnt
add wave -noupdate -expand /UserMemoryInterface2_tb/total_reqs
add wave -noupdate /UserMemoryInterface2_tb/total_size
add wave -noupdate /UserMemoryInterface2_tb/total_reads
add wave -noupdate /UserMemoryInterface2_tb/umi_state
add wave -noupdate /UserMemoryInterface2_tb/bad_port
add wave -noupdate /UserMemoryInterface2_tb/inj_error
add wave -noupdate /UserMemoryInterface2_tb/n_tests
add wave -noupdate /UserMemoryInterface2_tb/test_count
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/FIFO_LOG_DEPTH
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/FIFO_USE_LUTRAM
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/FIFO_DBG_ENABLE
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/DEFAULT_TIMEOUT_TICKS
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/FIFO_DEPTH
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/MAX_BURST
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/WATERMARK
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/BYTES_PER_BEAT
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/LOG_BYTES_PER_BEAT
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/MAX_BURST_BYTES
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_clk
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rst
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_timeout_wrreq_in
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_timeout_data_in
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_cmd_raise_in
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_cmd_grant_out
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_cmd_in
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_afull_out
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_wren_in
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_in
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_afull_in
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_wren_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_out
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_clear_in
add wave -noupdate -expand /UserMemoryInterface2_tb/UserMemoryInterface2/umi_error_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_clk
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_rst
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_ready_in
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_read_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_write_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_address_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_readdata_in
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_writedata_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_burstcount_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_byteenable_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_readdatavalid_in
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/error_out
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rdreq_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rdreq_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_error_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_error_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/reqQ
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/reqQ2
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/req_state_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/req_state_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/address_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/address_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/bytesleft_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/bytesleft_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/iswrite_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/iswrite_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/req_port_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/req_port_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_port_error
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_port_enabled
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_timeout_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_state_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_state_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_afull_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_afull_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_wren_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wr_wren_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_wren_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_wren_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_first_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_first_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_last_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_last_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_rd_data_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_write_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_write_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_port_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_wrport_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_port_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_size_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_size_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_data_count_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_data_count_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_idle_count_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/umi_idle_count_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/writeQ
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/readQ
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_burstcount_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/readQ_wrreq_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/read_req_cap
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/reads_pending
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/reads_outstanding
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_state_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/avl_state_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/beats_rem_ff
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/beats_rem_nxt
add wave -noupdate /UserMemoryInterface2_tb/UserMemoryInterface2/er
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8582797 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 508
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {25170488 ps}
