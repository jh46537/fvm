	component pcie3_ttk_rcd is
		port (
			hip_ctrl_test_in                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- test_in
			hip_ctrl_simu_mode_pipe                           : in  std_logic                      := 'X';             -- simu_mode_pipe
			hip_serial_rx_in0                                 : in  std_logic                      := 'X';             -- rx_in0
			hip_serial_rx_in1                                 : in  std_logic                      := 'X';             -- rx_in1
			hip_serial_rx_in2                                 : in  std_logic                      := 'X';             -- rx_in2
			hip_serial_rx_in3                                 : in  std_logic                      := 'X';             -- rx_in3
			hip_serial_rx_in4                                 : in  std_logic                      := 'X';             -- rx_in4
			hip_serial_rx_in5                                 : in  std_logic                      := 'X';             -- rx_in5
			hip_serial_rx_in6                                 : in  std_logic                      := 'X';             -- rx_in6
			hip_serial_rx_in7                                 : in  std_logic                      := 'X';             -- rx_in7
			hip_serial_tx_out0                                : out std_logic;                                         -- tx_out0
			hip_serial_tx_out1                                : out std_logic;                                         -- tx_out1
			hip_serial_tx_out2                                : out std_logic;                                         -- tx_out2
			hip_serial_tx_out3                                : out std_logic;                                         -- tx_out3
			hip_serial_tx_out4                                : out std_logic;                                         -- tx_out4
			hip_serial_tx_out5                                : out std_logic;                                         -- tx_out5
			hip_serial_tx_out6                                : out std_logic;                                         -- tx_out6
			hip_serial_tx_out7                                : out std_logic;                                         -- tx_out7
			hip_pipe_sim_pipe_pclk_in                         : in  std_logic                      := 'X';             -- sim_pipe_pclk_in
			hip_pipe_sim_pipe_rate                            : out std_logic_vector(1 downto 0);                      -- sim_pipe_rate
			hip_pipe_sim_ltssmstate                           : out std_logic_vector(4 downto 0);                      -- sim_ltssmstate
			hip_pipe_eidleinfersel0                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel0
			hip_pipe_eidleinfersel1                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel1
			hip_pipe_eidleinfersel2                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel2
			hip_pipe_eidleinfersel3                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel3
			hip_pipe_eidleinfersel4                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel4
			hip_pipe_eidleinfersel5                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel5
			hip_pipe_eidleinfersel6                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel6
			hip_pipe_eidleinfersel7                           : out std_logic_vector(2 downto 0);                      -- eidleinfersel7
			hip_pipe_powerdown0                               : out std_logic_vector(1 downto 0);                      -- powerdown0
			hip_pipe_powerdown1                               : out std_logic_vector(1 downto 0);                      -- powerdown1
			hip_pipe_powerdown2                               : out std_logic_vector(1 downto 0);                      -- powerdown2
			hip_pipe_powerdown3                               : out std_logic_vector(1 downto 0);                      -- powerdown3
			hip_pipe_powerdown4                               : out std_logic_vector(1 downto 0);                      -- powerdown4
			hip_pipe_powerdown5                               : out std_logic_vector(1 downto 0);                      -- powerdown5
			hip_pipe_powerdown6                               : out std_logic_vector(1 downto 0);                      -- powerdown6
			hip_pipe_powerdown7                               : out std_logic_vector(1 downto 0);                      -- powerdown7
			hip_pipe_rxpolarity0                              : out std_logic;                                         -- rxpolarity0
			hip_pipe_rxpolarity1                              : out std_logic;                                         -- rxpolarity1
			hip_pipe_rxpolarity2                              : out std_logic;                                         -- rxpolarity2
			hip_pipe_rxpolarity3                              : out std_logic;                                         -- rxpolarity3
			hip_pipe_rxpolarity4                              : out std_logic;                                         -- rxpolarity4
			hip_pipe_rxpolarity5                              : out std_logic;                                         -- rxpolarity5
			hip_pipe_rxpolarity6                              : out std_logic;                                         -- rxpolarity6
			hip_pipe_rxpolarity7                              : out std_logic;                                         -- rxpolarity7
			hip_pipe_txcompl0                                 : out std_logic;                                         -- txcompl0
			hip_pipe_txcompl1                                 : out std_logic;                                         -- txcompl1
			hip_pipe_txcompl2                                 : out std_logic;                                         -- txcompl2
			hip_pipe_txcompl3                                 : out std_logic;                                         -- txcompl3
			hip_pipe_txcompl4                                 : out std_logic;                                         -- txcompl4
			hip_pipe_txcompl5                                 : out std_logic;                                         -- txcompl5
			hip_pipe_txcompl6                                 : out std_logic;                                         -- txcompl6
			hip_pipe_txcompl7                                 : out std_logic;                                         -- txcompl7
			hip_pipe_txdata0                                  : out std_logic_vector(7 downto 0);                      -- txdata0
			hip_pipe_txdata1                                  : out std_logic_vector(7 downto 0);                      -- txdata1
			hip_pipe_txdata2                                  : out std_logic_vector(7 downto 0);                      -- txdata2
			hip_pipe_txdata3                                  : out std_logic_vector(7 downto 0);                      -- txdata3
			hip_pipe_txdata4                                  : out std_logic_vector(7 downto 0);                      -- txdata4
			hip_pipe_txdata5                                  : out std_logic_vector(7 downto 0);                      -- txdata5
			hip_pipe_txdata6                                  : out std_logic_vector(7 downto 0);                      -- txdata6
			hip_pipe_txdata7                                  : out std_logic_vector(7 downto 0);                      -- txdata7
			hip_pipe_txdatak0                                 : out std_logic;                                         -- txdatak0
			hip_pipe_txdatak1                                 : out std_logic;                                         -- txdatak1
			hip_pipe_txdatak2                                 : out std_logic;                                         -- txdatak2
			hip_pipe_txdatak3                                 : out std_logic;                                         -- txdatak3
			hip_pipe_txdatak4                                 : out std_logic;                                         -- txdatak4
			hip_pipe_txdatak5                                 : out std_logic;                                         -- txdatak5
			hip_pipe_txdatak6                                 : out std_logic;                                         -- txdatak6
			hip_pipe_txdatak7                                 : out std_logic;                                         -- txdatak7
			hip_pipe_txdetectrx0                              : out std_logic;                                         -- txdetectrx0
			hip_pipe_txdetectrx1                              : out std_logic;                                         -- txdetectrx1
			hip_pipe_txdetectrx2                              : out std_logic;                                         -- txdetectrx2
			hip_pipe_txdetectrx3                              : out std_logic;                                         -- txdetectrx3
			hip_pipe_txdetectrx4                              : out std_logic;                                         -- txdetectrx4
			hip_pipe_txdetectrx5                              : out std_logic;                                         -- txdetectrx5
			hip_pipe_txdetectrx6                              : out std_logic;                                         -- txdetectrx6
			hip_pipe_txdetectrx7                              : out std_logic;                                         -- txdetectrx7
			hip_pipe_txelecidle0                              : out std_logic;                                         -- txelecidle0
			hip_pipe_txelecidle1                              : out std_logic;                                         -- txelecidle1
			hip_pipe_txelecidle2                              : out std_logic;                                         -- txelecidle2
			hip_pipe_txelecidle3                              : out std_logic;                                         -- txelecidle3
			hip_pipe_txelecidle4                              : out std_logic;                                         -- txelecidle4
			hip_pipe_txelecidle5                              : out std_logic;                                         -- txelecidle5
			hip_pipe_txelecidle6                              : out std_logic;                                         -- txelecidle6
			hip_pipe_txelecidle7                              : out std_logic;                                         -- txelecidle7
			hip_pipe_txdeemph0                                : out std_logic;                                         -- txdeemph0
			hip_pipe_txdeemph1                                : out std_logic;                                         -- txdeemph1
			hip_pipe_txdeemph2                                : out std_logic;                                         -- txdeemph2
			hip_pipe_txdeemph3                                : out std_logic;                                         -- txdeemph3
			hip_pipe_txdeemph4                                : out std_logic;                                         -- txdeemph4
			hip_pipe_txdeemph5                                : out std_logic;                                         -- txdeemph5
			hip_pipe_txdeemph6                                : out std_logic;                                         -- txdeemph6
			hip_pipe_txdeemph7                                : out std_logic;                                         -- txdeemph7
			hip_pipe_txmargin0                                : out std_logic_vector(2 downto 0);                      -- txmargin0
			hip_pipe_txmargin1                                : out std_logic_vector(2 downto 0);                      -- txmargin1
			hip_pipe_txmargin2                                : out std_logic_vector(2 downto 0);                      -- txmargin2
			hip_pipe_txmargin3                                : out std_logic_vector(2 downto 0);                      -- txmargin3
			hip_pipe_txmargin4                                : out std_logic_vector(2 downto 0);                      -- txmargin4
			hip_pipe_txmargin5                                : out std_logic_vector(2 downto 0);                      -- txmargin5
			hip_pipe_txmargin6                                : out std_logic_vector(2 downto 0);                      -- txmargin6
			hip_pipe_txmargin7                                : out std_logic_vector(2 downto 0);                      -- txmargin7
			hip_pipe_txswing0                                 : out std_logic;                                         -- txswing0
			hip_pipe_txswing1                                 : out std_logic;                                         -- txswing1
			hip_pipe_txswing2                                 : out std_logic;                                         -- txswing2
			hip_pipe_txswing3                                 : out std_logic;                                         -- txswing3
			hip_pipe_txswing4                                 : out std_logic;                                         -- txswing4
			hip_pipe_txswing5                                 : out std_logic;                                         -- txswing5
			hip_pipe_txswing6                                 : out std_logic;                                         -- txswing6
			hip_pipe_txswing7                                 : out std_logic;                                         -- txswing7
			hip_pipe_phystatus0                               : in  std_logic                      := 'X';             -- phystatus0
			hip_pipe_phystatus1                               : in  std_logic                      := 'X';             -- phystatus1
			hip_pipe_phystatus2                               : in  std_logic                      := 'X';             -- phystatus2
			hip_pipe_phystatus3                               : in  std_logic                      := 'X';             -- phystatus3
			hip_pipe_phystatus4                               : in  std_logic                      := 'X';             -- phystatus4
			hip_pipe_phystatus5                               : in  std_logic                      := 'X';             -- phystatus5
			hip_pipe_phystatus6                               : in  std_logic                      := 'X';             -- phystatus6
			hip_pipe_phystatus7                               : in  std_logic                      := 'X';             -- phystatus7
			hip_pipe_rxdata0                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata0
			hip_pipe_rxdata1                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata1
			hip_pipe_rxdata2                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata2
			hip_pipe_rxdata3                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata3
			hip_pipe_rxdata4                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata4
			hip_pipe_rxdata5                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata5
			hip_pipe_rxdata6                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata6
			hip_pipe_rxdata7                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rxdata7
			hip_pipe_rxdatak0                                 : in  std_logic                      := 'X';             -- rxdatak0
			hip_pipe_rxdatak1                                 : in  std_logic                      := 'X';             -- rxdatak1
			hip_pipe_rxdatak2                                 : in  std_logic                      := 'X';             -- rxdatak2
			hip_pipe_rxdatak3                                 : in  std_logic                      := 'X';             -- rxdatak3
			hip_pipe_rxdatak4                                 : in  std_logic                      := 'X';             -- rxdatak4
			hip_pipe_rxdatak5                                 : in  std_logic                      := 'X';             -- rxdatak5
			hip_pipe_rxdatak6                                 : in  std_logic                      := 'X';             -- rxdatak6
			hip_pipe_rxdatak7                                 : in  std_logic                      := 'X';             -- rxdatak7
			hip_pipe_rxelecidle0                              : in  std_logic                      := 'X';             -- rxelecidle0
			hip_pipe_rxelecidle1                              : in  std_logic                      := 'X';             -- rxelecidle1
			hip_pipe_rxelecidle2                              : in  std_logic                      := 'X';             -- rxelecidle2
			hip_pipe_rxelecidle3                              : in  std_logic                      := 'X';             -- rxelecidle3
			hip_pipe_rxelecidle4                              : in  std_logic                      := 'X';             -- rxelecidle4
			hip_pipe_rxelecidle5                              : in  std_logic                      := 'X';             -- rxelecidle5
			hip_pipe_rxelecidle6                              : in  std_logic                      := 'X';             -- rxelecidle6
			hip_pipe_rxelecidle7                              : in  std_logic                      := 'X';             -- rxelecidle7
			hip_pipe_rxstatus0                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus0
			hip_pipe_rxstatus1                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus1
			hip_pipe_rxstatus2                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus2
			hip_pipe_rxstatus3                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus3
			hip_pipe_rxstatus4                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus4
			hip_pipe_rxstatus5                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus5
			hip_pipe_rxstatus6                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus6
			hip_pipe_rxstatus7                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus7
			hip_pipe_rxvalid0                                 : in  std_logic                      := 'X';             -- rxvalid0
			hip_pipe_rxvalid1                                 : in  std_logic                      := 'X';             -- rxvalid1
			hip_pipe_rxvalid2                                 : in  std_logic                      := 'X';             -- rxvalid2
			hip_pipe_rxvalid3                                 : in  std_logic                      := 'X';             -- rxvalid3
			hip_pipe_rxvalid4                                 : in  std_logic                      := 'X';             -- rxvalid4
			hip_pipe_rxvalid5                                 : in  std_logic                      := 'X';             -- rxvalid5
			hip_pipe_rxvalid6                                 : in  std_logic                      := 'X';             -- rxvalid6
			hip_pipe_rxvalid7                                 : in  std_logic                      := 'X';             -- rxvalid7
			refclk_clk                                        : in  std_logic                      := 'X';             -- clk
			pcie_rstn_npor                                    : in  std_logic                      := 'X';             -- npor
			pcie_rstn_pin_perst                               : in  std_logic                      := 'X';             -- pin_perst
			clk_clk                                           : in  std_logic                      := 'X';             -- clk
			reset_reset_n                                     : in  std_logic                      := 'X';             -- reset_n
			dut_rx_st_startofpacket                           : out std_logic_vector(0 downto 0);                      -- startofpacket
			dut_rx_st_endofpacket                             : out std_logic_vector(0 downto 0);                      -- endofpacket
			dut_rx_st_error                                   : out std_logic_vector(0 downto 0);                      -- error
			dut_rx_st_valid                                   : out std_logic_vector(0 downto 0);                      -- valid
			dut_rx_st_empty                                   : out std_logic_vector(1 downto 0);                      -- empty
			dut_rx_st_ready                                   : in  std_logic                      := 'X';             -- ready
			dut_rx_st_data                                    : out std_logic_vector(255 downto 0);                    -- data
			dut_rx_bar_be_rx_st_bar                           : out std_logic_vector(7 downto 0);                      -- rx_st_bar
			dut_rx_bar_be_rx_st_be                            : out std_logic_vector(31 downto 0);                     -- rx_st_be
			dut_rx_bar_be_rx_st_mask                          : in  std_logic                      := 'X';             -- rx_st_mask
			dut_tx_st_startofpacket                           : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- startofpacket
			dut_tx_st_endofpacket                             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- endofpacket
			dut_tx_st_error                                   : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- error
			dut_tx_st_valid                                   : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- valid
			dut_tx_st_empty                                   : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- empty
			dut_tx_st_ready                                   : out std_logic;                                         -- ready
			dut_tx_st_data                                    : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			dut_tx_cred_tx_cred_datafccp                      : out std_logic_vector(11 downto 0);                     -- tx_cred_datafccp
			dut_tx_cred_tx_cred_datafcnp                      : out std_logic_vector(11 downto 0);                     -- tx_cred_datafcnp
			dut_tx_cred_tx_cred_datafcp                       : out std_logic_vector(11 downto 0);                     -- tx_cred_datafcp
			dut_tx_cred_tx_cred_fchipcons                     : out std_logic_vector(5 downto 0);                      -- tx_cred_fchipcons
			dut_tx_cred_tx_cred_fcinfinite                    : out std_logic_vector(5 downto 0);                      -- tx_cred_fcinfinite
			dut_tx_cred_tx_cred_hdrfccp                       : out std_logic_vector(7 downto 0);                      -- tx_cred_hdrfccp
			dut_tx_cred_tx_cred_hdrfcnp                       : out std_logic_vector(7 downto 0);                      -- tx_cred_hdrfcnp
			dut_tx_cred_tx_cred_hdrfcp                        : out std_logic_vector(7 downto 0);                      -- tx_cred_hdrfcp
			dut_int_msi_app_int_sts                           : in  std_logic                      := 'X';             -- app_int_sts
			dut_int_msi_app_msi_num                           : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- app_msi_num
			dut_int_msi_app_msi_req                           : in  std_logic                      := 'X';             -- app_msi_req
			dut_int_msi_app_msi_tc                            : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- app_msi_tc
			dut_int_msi_app_int_ack                           : out std_logic;                                         -- app_int_ack
			dut_int_msi_app_msi_ack                           : out std_logic;                                         -- app_msi_ack
			dut_power_mngt_pm_auxpwr                          : in  std_logic                      := 'X';             -- pm_auxpwr
			dut_power_mngt_pm_data                            : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- pm_data
			dut_power_mngt_pme_to_cr                          : in  std_logic                      := 'X';             -- pme_to_cr
			dut_power_mngt_pm_event                           : in  std_logic                      := 'X';             -- pm_event
			dut_power_mngt_pme_to_sr                          : out std_logic;                                         -- pme_to_sr
			dut_hip_rst_reset_status                          : out std_logic;                                         -- reset_status
			dut_hip_rst_serdes_pll_locked                     : out std_logic;                                         -- serdes_pll_locked
			dut_hip_rst_pld_clk_inuse                         : out std_logic;                                         -- pld_clk_inuse
			dut_hip_rst_pld_core_ready                        : in  std_logic                      := 'X';             -- pld_core_ready
			dut_hip_rst_testin_zero                           : out std_logic;                                         -- testin_zero
			dut_config_tl_hpg_ctrler                          : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- hpg_ctrler
			dut_config_tl_tl_cfg_add                          : out std_logic_vector(3 downto 0);                      -- tl_cfg_add
			dut_config_tl_tl_cfg_ctl                          : out std_logic_vector(31 downto 0);                     -- tl_cfg_ctl
			dut_config_tl_tl_cfg_sts                          : out std_logic_vector(52 downto 0);                     -- tl_cfg_sts
			dut_config_tl_cpl_err                             : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- cpl_err
			dut_config_tl_cpl_pending                         : in  std_logic                      := 'X';             -- cpl_pending
			pcie_reconfig_driver_hip_status_derr_cor_ext_rcv  : in  std_logic                      := 'X';             -- derr_cor_ext_rcv
			pcie_reconfig_driver_hip_status_derr_cor_ext_rpl  : in  std_logic                      := 'X';             -- derr_cor_ext_rpl
			pcie_reconfig_driver_hip_status_derr_rpl          : in  std_logic                      := 'X';             -- derr_rpl
			pcie_reconfig_driver_hip_status_dlup_exit         : in  std_logic                      := 'X';             -- dlup_exit
			pcie_reconfig_driver_hip_status_ev128ns           : in  std_logic                      := 'X';             -- ev128ns
			pcie_reconfig_driver_hip_status_ev1us             : in  std_logic                      := 'X';             -- ev1us
			pcie_reconfig_driver_hip_status_hotrst_exit       : in  std_logic                      := 'X';             -- hotrst_exit
			pcie_reconfig_driver_hip_status_int_status        : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- int_status
			pcie_reconfig_driver_hip_status_l2_exit           : in  std_logic                      := 'X';             -- l2_exit
			pcie_reconfig_driver_hip_status_lane_act          : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- lane_act
			pcie_reconfig_driver_hip_status_ltssmstate        : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- ltssmstate
			pcie_reconfig_driver_hip_status_dlup              : in  std_logic                      := 'X';             -- dlup
			pcie_reconfig_driver_hip_status_rx_par_err        : in  std_logic                      := 'X';             -- rx_par_err
			pcie_reconfig_driver_hip_status_tx_par_err        : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- tx_par_err
			pcie_reconfig_driver_hip_status_cfg_par_err       : in  std_logic                      := 'X';             -- cfg_par_err
			pcie_reconfig_driver_hip_status_ko_cpl_spc_header : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- ko_cpl_spc_header
			pcie_reconfig_driver_hip_status_ko_cpl_spc_data   : in  std_logic_vector(11 downto 0)  := (others => 'X'); -- ko_cpl_spc_data
			dut_hip_status_derr_cor_ext_rcv                   : out std_logic;                                         -- derr_cor_ext_rcv
			dut_hip_status_derr_cor_ext_rpl                   : out std_logic;                                         -- derr_cor_ext_rpl
			dut_hip_status_derr_rpl                           : out std_logic;                                         -- derr_rpl
			dut_hip_status_dlup                               : out std_logic;                                         -- dlup
			dut_hip_status_dlup_exit                          : out std_logic;                                         -- dlup_exit
			dut_hip_status_ev128ns                            : out std_logic;                                         -- ev128ns
			dut_hip_status_ev1us                              : out std_logic;                                         -- ev1us
			dut_hip_status_hotrst_exit                        : out std_logic;                                         -- hotrst_exit
			dut_hip_status_int_status                         : out std_logic_vector(3 downto 0);                      -- int_status
			dut_hip_status_l2_exit                            : out std_logic;                                         -- l2_exit
			dut_hip_status_lane_act                           : out std_logic_vector(3 downto 0);                      -- lane_act
			dut_hip_status_ltssmstate                         : out std_logic_vector(4 downto 0);                      -- ltssmstate
			dut_hip_status_rx_par_err                         : out std_logic;                                         -- rx_par_err
			dut_hip_status_tx_par_err                         : out std_logic_vector(1 downto 0);                      -- tx_par_err
			dut_hip_status_cfg_par_err                        : out std_logic;                                         -- cfg_par_err
			dut_hip_status_ko_cpl_spc_header                  : out std_logic_vector(7 downto 0);                      -- ko_cpl_spc_header
			dut_hip_status_ko_cpl_spc_data                    : out std_logic_vector(11 downto 0)                      -- ko_cpl_spc_data
		);
	end component pcie3_ttk_rcd;

	u0 : component pcie3_ttk_rcd
		port map (
			hip_ctrl_test_in                                  => CONNECTED_TO_hip_ctrl_test_in,                                  --                        hip_ctrl.test_in
			hip_ctrl_simu_mode_pipe                           => CONNECTED_TO_hip_ctrl_simu_mode_pipe,                           --                                .simu_mode_pipe
			hip_serial_rx_in0                                 => CONNECTED_TO_hip_serial_rx_in0,                                 --                      hip_serial.rx_in0
			hip_serial_rx_in1                                 => CONNECTED_TO_hip_serial_rx_in1,                                 --                                .rx_in1
			hip_serial_rx_in2                                 => CONNECTED_TO_hip_serial_rx_in2,                                 --                                .rx_in2
			hip_serial_rx_in3                                 => CONNECTED_TO_hip_serial_rx_in3,                                 --                                .rx_in3
			hip_serial_rx_in4                                 => CONNECTED_TO_hip_serial_rx_in4,                                 --                                .rx_in4
			hip_serial_rx_in5                                 => CONNECTED_TO_hip_serial_rx_in5,                                 --                                .rx_in5
			hip_serial_rx_in6                                 => CONNECTED_TO_hip_serial_rx_in6,                                 --                                .rx_in6
			hip_serial_rx_in7                                 => CONNECTED_TO_hip_serial_rx_in7,                                 --                                .rx_in7
			hip_serial_tx_out0                                => CONNECTED_TO_hip_serial_tx_out0,                                --                                .tx_out0
			hip_serial_tx_out1                                => CONNECTED_TO_hip_serial_tx_out1,                                --                                .tx_out1
			hip_serial_tx_out2                                => CONNECTED_TO_hip_serial_tx_out2,                                --                                .tx_out2
			hip_serial_tx_out3                                => CONNECTED_TO_hip_serial_tx_out3,                                --                                .tx_out3
			hip_serial_tx_out4                                => CONNECTED_TO_hip_serial_tx_out4,                                --                                .tx_out4
			hip_serial_tx_out5                                => CONNECTED_TO_hip_serial_tx_out5,                                --                                .tx_out5
			hip_serial_tx_out6                                => CONNECTED_TO_hip_serial_tx_out6,                                --                                .tx_out6
			hip_serial_tx_out7                                => CONNECTED_TO_hip_serial_tx_out7,                                --                                .tx_out7
			hip_pipe_sim_pipe_pclk_in                         => CONNECTED_TO_hip_pipe_sim_pipe_pclk_in,                         --                        hip_pipe.sim_pipe_pclk_in
			hip_pipe_sim_pipe_rate                            => CONNECTED_TO_hip_pipe_sim_pipe_rate,                            --                                .sim_pipe_rate
			hip_pipe_sim_ltssmstate                           => CONNECTED_TO_hip_pipe_sim_ltssmstate,                           --                                .sim_ltssmstate
			hip_pipe_eidleinfersel0                           => CONNECTED_TO_hip_pipe_eidleinfersel0,                           --                                .eidleinfersel0
			hip_pipe_eidleinfersel1                           => CONNECTED_TO_hip_pipe_eidleinfersel1,                           --                                .eidleinfersel1
			hip_pipe_eidleinfersel2                           => CONNECTED_TO_hip_pipe_eidleinfersel2,                           --                                .eidleinfersel2
			hip_pipe_eidleinfersel3                           => CONNECTED_TO_hip_pipe_eidleinfersel3,                           --                                .eidleinfersel3
			hip_pipe_eidleinfersel4                           => CONNECTED_TO_hip_pipe_eidleinfersel4,                           --                                .eidleinfersel4
			hip_pipe_eidleinfersel5                           => CONNECTED_TO_hip_pipe_eidleinfersel5,                           --                                .eidleinfersel5
			hip_pipe_eidleinfersel6                           => CONNECTED_TO_hip_pipe_eidleinfersel6,                           --                                .eidleinfersel6
			hip_pipe_eidleinfersel7                           => CONNECTED_TO_hip_pipe_eidleinfersel7,                           --                                .eidleinfersel7
			hip_pipe_powerdown0                               => CONNECTED_TO_hip_pipe_powerdown0,                               --                                .powerdown0
			hip_pipe_powerdown1                               => CONNECTED_TO_hip_pipe_powerdown1,                               --                                .powerdown1
			hip_pipe_powerdown2                               => CONNECTED_TO_hip_pipe_powerdown2,                               --                                .powerdown2
			hip_pipe_powerdown3                               => CONNECTED_TO_hip_pipe_powerdown3,                               --                                .powerdown3
			hip_pipe_powerdown4                               => CONNECTED_TO_hip_pipe_powerdown4,                               --                                .powerdown4
			hip_pipe_powerdown5                               => CONNECTED_TO_hip_pipe_powerdown5,                               --                                .powerdown5
			hip_pipe_powerdown6                               => CONNECTED_TO_hip_pipe_powerdown6,                               --                                .powerdown6
			hip_pipe_powerdown7                               => CONNECTED_TO_hip_pipe_powerdown7,                               --                                .powerdown7
			hip_pipe_rxpolarity0                              => CONNECTED_TO_hip_pipe_rxpolarity0,                              --                                .rxpolarity0
			hip_pipe_rxpolarity1                              => CONNECTED_TO_hip_pipe_rxpolarity1,                              --                                .rxpolarity1
			hip_pipe_rxpolarity2                              => CONNECTED_TO_hip_pipe_rxpolarity2,                              --                                .rxpolarity2
			hip_pipe_rxpolarity3                              => CONNECTED_TO_hip_pipe_rxpolarity3,                              --                                .rxpolarity3
			hip_pipe_rxpolarity4                              => CONNECTED_TO_hip_pipe_rxpolarity4,                              --                                .rxpolarity4
			hip_pipe_rxpolarity5                              => CONNECTED_TO_hip_pipe_rxpolarity5,                              --                                .rxpolarity5
			hip_pipe_rxpolarity6                              => CONNECTED_TO_hip_pipe_rxpolarity6,                              --                                .rxpolarity6
			hip_pipe_rxpolarity7                              => CONNECTED_TO_hip_pipe_rxpolarity7,                              --                                .rxpolarity7
			hip_pipe_txcompl0                                 => CONNECTED_TO_hip_pipe_txcompl0,                                 --                                .txcompl0
			hip_pipe_txcompl1                                 => CONNECTED_TO_hip_pipe_txcompl1,                                 --                                .txcompl1
			hip_pipe_txcompl2                                 => CONNECTED_TO_hip_pipe_txcompl2,                                 --                                .txcompl2
			hip_pipe_txcompl3                                 => CONNECTED_TO_hip_pipe_txcompl3,                                 --                                .txcompl3
			hip_pipe_txcompl4                                 => CONNECTED_TO_hip_pipe_txcompl4,                                 --                                .txcompl4
			hip_pipe_txcompl5                                 => CONNECTED_TO_hip_pipe_txcompl5,                                 --                                .txcompl5
			hip_pipe_txcompl6                                 => CONNECTED_TO_hip_pipe_txcompl6,                                 --                                .txcompl6
			hip_pipe_txcompl7                                 => CONNECTED_TO_hip_pipe_txcompl7,                                 --                                .txcompl7
			hip_pipe_txdata0                                  => CONNECTED_TO_hip_pipe_txdata0,                                  --                                .txdata0
			hip_pipe_txdata1                                  => CONNECTED_TO_hip_pipe_txdata1,                                  --                                .txdata1
			hip_pipe_txdata2                                  => CONNECTED_TO_hip_pipe_txdata2,                                  --                                .txdata2
			hip_pipe_txdata3                                  => CONNECTED_TO_hip_pipe_txdata3,                                  --                                .txdata3
			hip_pipe_txdata4                                  => CONNECTED_TO_hip_pipe_txdata4,                                  --                                .txdata4
			hip_pipe_txdata5                                  => CONNECTED_TO_hip_pipe_txdata5,                                  --                                .txdata5
			hip_pipe_txdata6                                  => CONNECTED_TO_hip_pipe_txdata6,                                  --                                .txdata6
			hip_pipe_txdata7                                  => CONNECTED_TO_hip_pipe_txdata7,                                  --                                .txdata7
			hip_pipe_txdatak0                                 => CONNECTED_TO_hip_pipe_txdatak0,                                 --                                .txdatak0
			hip_pipe_txdatak1                                 => CONNECTED_TO_hip_pipe_txdatak1,                                 --                                .txdatak1
			hip_pipe_txdatak2                                 => CONNECTED_TO_hip_pipe_txdatak2,                                 --                                .txdatak2
			hip_pipe_txdatak3                                 => CONNECTED_TO_hip_pipe_txdatak3,                                 --                                .txdatak3
			hip_pipe_txdatak4                                 => CONNECTED_TO_hip_pipe_txdatak4,                                 --                                .txdatak4
			hip_pipe_txdatak5                                 => CONNECTED_TO_hip_pipe_txdatak5,                                 --                                .txdatak5
			hip_pipe_txdatak6                                 => CONNECTED_TO_hip_pipe_txdatak6,                                 --                                .txdatak6
			hip_pipe_txdatak7                                 => CONNECTED_TO_hip_pipe_txdatak7,                                 --                                .txdatak7
			hip_pipe_txdetectrx0                              => CONNECTED_TO_hip_pipe_txdetectrx0,                              --                                .txdetectrx0
			hip_pipe_txdetectrx1                              => CONNECTED_TO_hip_pipe_txdetectrx1,                              --                                .txdetectrx1
			hip_pipe_txdetectrx2                              => CONNECTED_TO_hip_pipe_txdetectrx2,                              --                                .txdetectrx2
			hip_pipe_txdetectrx3                              => CONNECTED_TO_hip_pipe_txdetectrx3,                              --                                .txdetectrx3
			hip_pipe_txdetectrx4                              => CONNECTED_TO_hip_pipe_txdetectrx4,                              --                                .txdetectrx4
			hip_pipe_txdetectrx5                              => CONNECTED_TO_hip_pipe_txdetectrx5,                              --                                .txdetectrx5
			hip_pipe_txdetectrx6                              => CONNECTED_TO_hip_pipe_txdetectrx6,                              --                                .txdetectrx6
			hip_pipe_txdetectrx7                              => CONNECTED_TO_hip_pipe_txdetectrx7,                              --                                .txdetectrx7
			hip_pipe_txelecidle0                              => CONNECTED_TO_hip_pipe_txelecidle0,                              --                                .txelecidle0
			hip_pipe_txelecidle1                              => CONNECTED_TO_hip_pipe_txelecidle1,                              --                                .txelecidle1
			hip_pipe_txelecidle2                              => CONNECTED_TO_hip_pipe_txelecidle2,                              --                                .txelecidle2
			hip_pipe_txelecidle3                              => CONNECTED_TO_hip_pipe_txelecidle3,                              --                                .txelecidle3
			hip_pipe_txelecidle4                              => CONNECTED_TO_hip_pipe_txelecidle4,                              --                                .txelecidle4
			hip_pipe_txelecidle5                              => CONNECTED_TO_hip_pipe_txelecidle5,                              --                                .txelecidle5
			hip_pipe_txelecidle6                              => CONNECTED_TO_hip_pipe_txelecidle6,                              --                                .txelecidle6
			hip_pipe_txelecidle7                              => CONNECTED_TO_hip_pipe_txelecidle7,                              --                                .txelecidle7
			hip_pipe_txdeemph0                                => CONNECTED_TO_hip_pipe_txdeemph0,                                --                                .txdeemph0
			hip_pipe_txdeemph1                                => CONNECTED_TO_hip_pipe_txdeemph1,                                --                                .txdeemph1
			hip_pipe_txdeemph2                                => CONNECTED_TO_hip_pipe_txdeemph2,                                --                                .txdeemph2
			hip_pipe_txdeemph3                                => CONNECTED_TO_hip_pipe_txdeemph3,                                --                                .txdeemph3
			hip_pipe_txdeemph4                                => CONNECTED_TO_hip_pipe_txdeemph4,                                --                                .txdeemph4
			hip_pipe_txdeemph5                                => CONNECTED_TO_hip_pipe_txdeemph5,                                --                                .txdeemph5
			hip_pipe_txdeemph6                                => CONNECTED_TO_hip_pipe_txdeemph6,                                --                                .txdeemph6
			hip_pipe_txdeemph7                                => CONNECTED_TO_hip_pipe_txdeemph7,                                --                                .txdeemph7
			hip_pipe_txmargin0                                => CONNECTED_TO_hip_pipe_txmargin0,                                --                                .txmargin0
			hip_pipe_txmargin1                                => CONNECTED_TO_hip_pipe_txmargin1,                                --                                .txmargin1
			hip_pipe_txmargin2                                => CONNECTED_TO_hip_pipe_txmargin2,                                --                                .txmargin2
			hip_pipe_txmargin3                                => CONNECTED_TO_hip_pipe_txmargin3,                                --                                .txmargin3
			hip_pipe_txmargin4                                => CONNECTED_TO_hip_pipe_txmargin4,                                --                                .txmargin4
			hip_pipe_txmargin5                                => CONNECTED_TO_hip_pipe_txmargin5,                                --                                .txmargin5
			hip_pipe_txmargin6                                => CONNECTED_TO_hip_pipe_txmargin6,                                --                                .txmargin6
			hip_pipe_txmargin7                                => CONNECTED_TO_hip_pipe_txmargin7,                                --                                .txmargin7
			hip_pipe_txswing0                                 => CONNECTED_TO_hip_pipe_txswing0,                                 --                                .txswing0
			hip_pipe_txswing1                                 => CONNECTED_TO_hip_pipe_txswing1,                                 --                                .txswing1
			hip_pipe_txswing2                                 => CONNECTED_TO_hip_pipe_txswing2,                                 --                                .txswing2
			hip_pipe_txswing3                                 => CONNECTED_TO_hip_pipe_txswing3,                                 --                                .txswing3
			hip_pipe_txswing4                                 => CONNECTED_TO_hip_pipe_txswing4,                                 --                                .txswing4
			hip_pipe_txswing5                                 => CONNECTED_TO_hip_pipe_txswing5,                                 --                                .txswing5
			hip_pipe_txswing6                                 => CONNECTED_TO_hip_pipe_txswing6,                                 --                                .txswing6
			hip_pipe_txswing7                                 => CONNECTED_TO_hip_pipe_txswing7,                                 --                                .txswing7
			hip_pipe_phystatus0                               => CONNECTED_TO_hip_pipe_phystatus0,                               --                                .phystatus0
			hip_pipe_phystatus1                               => CONNECTED_TO_hip_pipe_phystatus1,                               --                                .phystatus1
			hip_pipe_phystatus2                               => CONNECTED_TO_hip_pipe_phystatus2,                               --                                .phystatus2
			hip_pipe_phystatus3                               => CONNECTED_TO_hip_pipe_phystatus3,                               --                                .phystatus3
			hip_pipe_phystatus4                               => CONNECTED_TO_hip_pipe_phystatus4,                               --                                .phystatus4
			hip_pipe_phystatus5                               => CONNECTED_TO_hip_pipe_phystatus5,                               --                                .phystatus5
			hip_pipe_phystatus6                               => CONNECTED_TO_hip_pipe_phystatus6,                               --                                .phystatus6
			hip_pipe_phystatus7                               => CONNECTED_TO_hip_pipe_phystatus7,                               --                                .phystatus7
			hip_pipe_rxdata0                                  => CONNECTED_TO_hip_pipe_rxdata0,                                  --                                .rxdata0
			hip_pipe_rxdata1                                  => CONNECTED_TO_hip_pipe_rxdata1,                                  --                                .rxdata1
			hip_pipe_rxdata2                                  => CONNECTED_TO_hip_pipe_rxdata2,                                  --                                .rxdata2
			hip_pipe_rxdata3                                  => CONNECTED_TO_hip_pipe_rxdata3,                                  --                                .rxdata3
			hip_pipe_rxdata4                                  => CONNECTED_TO_hip_pipe_rxdata4,                                  --                                .rxdata4
			hip_pipe_rxdata5                                  => CONNECTED_TO_hip_pipe_rxdata5,                                  --                                .rxdata5
			hip_pipe_rxdata6                                  => CONNECTED_TO_hip_pipe_rxdata6,                                  --                                .rxdata6
			hip_pipe_rxdata7                                  => CONNECTED_TO_hip_pipe_rxdata7,                                  --                                .rxdata7
			hip_pipe_rxdatak0                                 => CONNECTED_TO_hip_pipe_rxdatak0,                                 --                                .rxdatak0
			hip_pipe_rxdatak1                                 => CONNECTED_TO_hip_pipe_rxdatak1,                                 --                                .rxdatak1
			hip_pipe_rxdatak2                                 => CONNECTED_TO_hip_pipe_rxdatak2,                                 --                                .rxdatak2
			hip_pipe_rxdatak3                                 => CONNECTED_TO_hip_pipe_rxdatak3,                                 --                                .rxdatak3
			hip_pipe_rxdatak4                                 => CONNECTED_TO_hip_pipe_rxdatak4,                                 --                                .rxdatak4
			hip_pipe_rxdatak5                                 => CONNECTED_TO_hip_pipe_rxdatak5,                                 --                                .rxdatak5
			hip_pipe_rxdatak6                                 => CONNECTED_TO_hip_pipe_rxdatak6,                                 --                                .rxdatak6
			hip_pipe_rxdatak7                                 => CONNECTED_TO_hip_pipe_rxdatak7,                                 --                                .rxdatak7
			hip_pipe_rxelecidle0                              => CONNECTED_TO_hip_pipe_rxelecidle0,                              --                                .rxelecidle0
			hip_pipe_rxelecidle1                              => CONNECTED_TO_hip_pipe_rxelecidle1,                              --                                .rxelecidle1
			hip_pipe_rxelecidle2                              => CONNECTED_TO_hip_pipe_rxelecidle2,                              --                                .rxelecidle2
			hip_pipe_rxelecidle3                              => CONNECTED_TO_hip_pipe_rxelecidle3,                              --                                .rxelecidle3
			hip_pipe_rxelecidle4                              => CONNECTED_TO_hip_pipe_rxelecidle4,                              --                                .rxelecidle4
			hip_pipe_rxelecidle5                              => CONNECTED_TO_hip_pipe_rxelecidle5,                              --                                .rxelecidle5
			hip_pipe_rxelecidle6                              => CONNECTED_TO_hip_pipe_rxelecidle6,                              --                                .rxelecidle6
			hip_pipe_rxelecidle7                              => CONNECTED_TO_hip_pipe_rxelecidle7,                              --                                .rxelecidle7
			hip_pipe_rxstatus0                                => CONNECTED_TO_hip_pipe_rxstatus0,                                --                                .rxstatus0
			hip_pipe_rxstatus1                                => CONNECTED_TO_hip_pipe_rxstatus1,                                --                                .rxstatus1
			hip_pipe_rxstatus2                                => CONNECTED_TO_hip_pipe_rxstatus2,                                --                                .rxstatus2
			hip_pipe_rxstatus3                                => CONNECTED_TO_hip_pipe_rxstatus3,                                --                                .rxstatus3
			hip_pipe_rxstatus4                                => CONNECTED_TO_hip_pipe_rxstatus4,                                --                                .rxstatus4
			hip_pipe_rxstatus5                                => CONNECTED_TO_hip_pipe_rxstatus5,                                --                                .rxstatus5
			hip_pipe_rxstatus6                                => CONNECTED_TO_hip_pipe_rxstatus6,                                --                                .rxstatus6
			hip_pipe_rxstatus7                                => CONNECTED_TO_hip_pipe_rxstatus7,                                --                                .rxstatus7
			hip_pipe_rxvalid0                                 => CONNECTED_TO_hip_pipe_rxvalid0,                                 --                                .rxvalid0
			hip_pipe_rxvalid1                                 => CONNECTED_TO_hip_pipe_rxvalid1,                                 --                                .rxvalid1
			hip_pipe_rxvalid2                                 => CONNECTED_TO_hip_pipe_rxvalid2,                                 --                                .rxvalid2
			hip_pipe_rxvalid3                                 => CONNECTED_TO_hip_pipe_rxvalid3,                                 --                                .rxvalid3
			hip_pipe_rxvalid4                                 => CONNECTED_TO_hip_pipe_rxvalid4,                                 --                                .rxvalid4
			hip_pipe_rxvalid5                                 => CONNECTED_TO_hip_pipe_rxvalid5,                                 --                                .rxvalid5
			hip_pipe_rxvalid6                                 => CONNECTED_TO_hip_pipe_rxvalid6,                                 --                                .rxvalid6
			hip_pipe_rxvalid7                                 => CONNECTED_TO_hip_pipe_rxvalid7,                                 --                                .rxvalid7
			refclk_clk                                        => CONNECTED_TO_refclk_clk,                                        --                          refclk.clk
			pcie_rstn_npor                                    => CONNECTED_TO_pcie_rstn_npor,                                    --                       pcie_rstn.npor
			pcie_rstn_pin_perst                               => CONNECTED_TO_pcie_rstn_pin_perst,                               --                                .pin_perst
			clk_clk                                           => CONNECTED_TO_clk_clk,                                           --                             clk.clk
			reset_reset_n                                     => CONNECTED_TO_reset_reset_n,                                     --                           reset.reset_n
			dut_rx_st_startofpacket                           => CONNECTED_TO_dut_rx_st_startofpacket,                           --                       dut_rx_st.startofpacket
			dut_rx_st_endofpacket                             => CONNECTED_TO_dut_rx_st_endofpacket,                             --                                .endofpacket
			dut_rx_st_error                                   => CONNECTED_TO_dut_rx_st_error,                                   --                                .error
			dut_rx_st_valid                                   => CONNECTED_TO_dut_rx_st_valid,                                   --                                .valid
			dut_rx_st_empty                                   => CONNECTED_TO_dut_rx_st_empty,                                   --                                .empty
			dut_rx_st_ready                                   => CONNECTED_TO_dut_rx_st_ready,                                   --                                .ready
			dut_rx_st_data                                    => CONNECTED_TO_dut_rx_st_data,                                    --                                .data
			dut_rx_bar_be_rx_st_bar                           => CONNECTED_TO_dut_rx_bar_be_rx_st_bar,                           --                   dut_rx_bar_be.rx_st_bar
			dut_rx_bar_be_rx_st_be                            => CONNECTED_TO_dut_rx_bar_be_rx_st_be,                            --                                .rx_st_be
			dut_rx_bar_be_rx_st_mask                          => CONNECTED_TO_dut_rx_bar_be_rx_st_mask,                          --                                .rx_st_mask
			dut_tx_st_startofpacket                           => CONNECTED_TO_dut_tx_st_startofpacket,                           --                       dut_tx_st.startofpacket
			dut_tx_st_endofpacket                             => CONNECTED_TO_dut_tx_st_endofpacket,                             --                                .endofpacket
			dut_tx_st_error                                   => CONNECTED_TO_dut_tx_st_error,                                   --                                .error
			dut_tx_st_valid                                   => CONNECTED_TO_dut_tx_st_valid,                                   --                                .valid
			dut_tx_st_empty                                   => CONNECTED_TO_dut_tx_st_empty,                                   --                                .empty
			dut_tx_st_ready                                   => CONNECTED_TO_dut_tx_st_ready,                                   --                                .ready
			dut_tx_st_data                                    => CONNECTED_TO_dut_tx_st_data,                                    --                                .data
			dut_tx_cred_tx_cred_datafccp                      => CONNECTED_TO_dut_tx_cred_tx_cred_datafccp,                      --                     dut_tx_cred.tx_cred_datafccp
			dut_tx_cred_tx_cred_datafcnp                      => CONNECTED_TO_dut_tx_cred_tx_cred_datafcnp,                      --                                .tx_cred_datafcnp
			dut_tx_cred_tx_cred_datafcp                       => CONNECTED_TO_dut_tx_cred_tx_cred_datafcp,                       --                                .tx_cred_datafcp
			dut_tx_cred_tx_cred_fchipcons                     => CONNECTED_TO_dut_tx_cred_tx_cred_fchipcons,                     --                                .tx_cred_fchipcons
			dut_tx_cred_tx_cred_fcinfinite                    => CONNECTED_TO_dut_tx_cred_tx_cred_fcinfinite,                    --                                .tx_cred_fcinfinite
			dut_tx_cred_tx_cred_hdrfccp                       => CONNECTED_TO_dut_tx_cred_tx_cred_hdrfccp,                       --                                .tx_cred_hdrfccp
			dut_tx_cred_tx_cred_hdrfcnp                       => CONNECTED_TO_dut_tx_cred_tx_cred_hdrfcnp,                       --                                .tx_cred_hdrfcnp
			dut_tx_cred_tx_cred_hdrfcp                        => CONNECTED_TO_dut_tx_cred_tx_cred_hdrfcp,                        --                                .tx_cred_hdrfcp
			dut_int_msi_app_int_sts                           => CONNECTED_TO_dut_int_msi_app_int_sts,                           --                     dut_int_msi.app_int_sts
			dut_int_msi_app_msi_num                           => CONNECTED_TO_dut_int_msi_app_msi_num,                           --                                .app_msi_num
			dut_int_msi_app_msi_req                           => CONNECTED_TO_dut_int_msi_app_msi_req,                           --                                .app_msi_req
			dut_int_msi_app_msi_tc                            => CONNECTED_TO_dut_int_msi_app_msi_tc,                            --                                .app_msi_tc
			dut_int_msi_app_int_ack                           => CONNECTED_TO_dut_int_msi_app_int_ack,                           --                                .app_int_ack
			dut_int_msi_app_msi_ack                           => CONNECTED_TO_dut_int_msi_app_msi_ack,                           --                                .app_msi_ack
			dut_power_mngt_pm_auxpwr                          => CONNECTED_TO_dut_power_mngt_pm_auxpwr,                          --                  dut_power_mngt.pm_auxpwr
			dut_power_mngt_pm_data                            => CONNECTED_TO_dut_power_mngt_pm_data,                            --                                .pm_data
			dut_power_mngt_pme_to_cr                          => CONNECTED_TO_dut_power_mngt_pme_to_cr,                          --                                .pme_to_cr
			dut_power_mngt_pm_event                           => CONNECTED_TO_dut_power_mngt_pm_event,                           --                                .pm_event
			dut_power_mngt_pme_to_sr                          => CONNECTED_TO_dut_power_mngt_pme_to_sr,                          --                                .pme_to_sr
			dut_hip_rst_reset_status                          => CONNECTED_TO_dut_hip_rst_reset_status,                          --                     dut_hip_rst.reset_status
			dut_hip_rst_serdes_pll_locked                     => CONNECTED_TO_dut_hip_rst_serdes_pll_locked,                     --                                .serdes_pll_locked
			dut_hip_rst_pld_clk_inuse                         => CONNECTED_TO_dut_hip_rst_pld_clk_inuse,                         --                                .pld_clk_inuse
			dut_hip_rst_pld_core_ready                        => CONNECTED_TO_dut_hip_rst_pld_core_ready,                        --                                .pld_core_ready
			dut_hip_rst_testin_zero                           => CONNECTED_TO_dut_hip_rst_testin_zero,                           --                                .testin_zero
			dut_config_tl_hpg_ctrler                          => CONNECTED_TO_dut_config_tl_hpg_ctrler,                          --                   dut_config_tl.hpg_ctrler
			dut_config_tl_tl_cfg_add                          => CONNECTED_TO_dut_config_tl_tl_cfg_add,                          --                                .tl_cfg_add
			dut_config_tl_tl_cfg_ctl                          => CONNECTED_TO_dut_config_tl_tl_cfg_ctl,                          --                                .tl_cfg_ctl
			dut_config_tl_tl_cfg_sts                          => CONNECTED_TO_dut_config_tl_tl_cfg_sts,                          --                                .tl_cfg_sts
			dut_config_tl_cpl_err                             => CONNECTED_TO_dut_config_tl_cpl_err,                             --                                .cpl_err
			dut_config_tl_cpl_pending                         => CONNECTED_TO_dut_config_tl_cpl_pending,                         --                                .cpl_pending
			pcie_reconfig_driver_hip_status_derr_cor_ext_rcv  => CONNECTED_TO_pcie_reconfig_driver_hip_status_derr_cor_ext_rcv,  -- pcie_reconfig_driver_hip_status.derr_cor_ext_rcv
			pcie_reconfig_driver_hip_status_derr_cor_ext_rpl  => CONNECTED_TO_pcie_reconfig_driver_hip_status_derr_cor_ext_rpl,  --                                .derr_cor_ext_rpl
			pcie_reconfig_driver_hip_status_derr_rpl          => CONNECTED_TO_pcie_reconfig_driver_hip_status_derr_rpl,          --                                .derr_rpl
			pcie_reconfig_driver_hip_status_dlup_exit         => CONNECTED_TO_pcie_reconfig_driver_hip_status_dlup_exit,         --                                .dlup_exit
			pcie_reconfig_driver_hip_status_ev128ns           => CONNECTED_TO_pcie_reconfig_driver_hip_status_ev128ns,           --                                .ev128ns
			pcie_reconfig_driver_hip_status_ev1us             => CONNECTED_TO_pcie_reconfig_driver_hip_status_ev1us,             --                                .ev1us
			pcie_reconfig_driver_hip_status_hotrst_exit       => CONNECTED_TO_pcie_reconfig_driver_hip_status_hotrst_exit,       --                                .hotrst_exit
			pcie_reconfig_driver_hip_status_int_status        => CONNECTED_TO_pcie_reconfig_driver_hip_status_int_status,        --                                .int_status
			pcie_reconfig_driver_hip_status_l2_exit           => CONNECTED_TO_pcie_reconfig_driver_hip_status_l2_exit,           --                                .l2_exit
			pcie_reconfig_driver_hip_status_lane_act          => CONNECTED_TO_pcie_reconfig_driver_hip_status_lane_act,          --                                .lane_act
			pcie_reconfig_driver_hip_status_ltssmstate        => CONNECTED_TO_pcie_reconfig_driver_hip_status_ltssmstate,        --                                .ltssmstate
			pcie_reconfig_driver_hip_status_dlup              => CONNECTED_TO_pcie_reconfig_driver_hip_status_dlup,              --                                .dlup
			pcie_reconfig_driver_hip_status_rx_par_err        => CONNECTED_TO_pcie_reconfig_driver_hip_status_rx_par_err,        --                                .rx_par_err
			pcie_reconfig_driver_hip_status_tx_par_err        => CONNECTED_TO_pcie_reconfig_driver_hip_status_tx_par_err,        --                                .tx_par_err
			pcie_reconfig_driver_hip_status_cfg_par_err       => CONNECTED_TO_pcie_reconfig_driver_hip_status_cfg_par_err,       --                                .cfg_par_err
			pcie_reconfig_driver_hip_status_ko_cpl_spc_header => CONNECTED_TO_pcie_reconfig_driver_hip_status_ko_cpl_spc_header, --                                .ko_cpl_spc_header
			pcie_reconfig_driver_hip_status_ko_cpl_spc_data   => CONNECTED_TO_pcie_reconfig_driver_hip_status_ko_cpl_spc_data,   --                                .ko_cpl_spc_data
			dut_hip_status_derr_cor_ext_rcv                   => CONNECTED_TO_dut_hip_status_derr_cor_ext_rcv,                   --                  dut_hip_status.derr_cor_ext_rcv
			dut_hip_status_derr_cor_ext_rpl                   => CONNECTED_TO_dut_hip_status_derr_cor_ext_rpl,                   --                                .derr_cor_ext_rpl
			dut_hip_status_derr_rpl                           => CONNECTED_TO_dut_hip_status_derr_rpl,                           --                                .derr_rpl
			dut_hip_status_dlup                               => CONNECTED_TO_dut_hip_status_dlup,                               --                                .dlup
			dut_hip_status_dlup_exit                          => CONNECTED_TO_dut_hip_status_dlup_exit,                          --                                .dlup_exit
			dut_hip_status_ev128ns                            => CONNECTED_TO_dut_hip_status_ev128ns,                            --                                .ev128ns
			dut_hip_status_ev1us                              => CONNECTED_TO_dut_hip_status_ev1us,                              --                                .ev1us
			dut_hip_status_hotrst_exit                        => CONNECTED_TO_dut_hip_status_hotrst_exit,                        --                                .hotrst_exit
			dut_hip_status_int_status                         => CONNECTED_TO_dut_hip_status_int_status,                         --                                .int_status
			dut_hip_status_l2_exit                            => CONNECTED_TO_dut_hip_status_l2_exit,                            --                                .l2_exit
			dut_hip_status_lane_act                           => CONNECTED_TO_dut_hip_status_lane_act,                           --                                .lane_act
			dut_hip_status_ltssmstate                         => CONNECTED_TO_dut_hip_status_ltssmstate,                         --                                .ltssmstate
			dut_hip_status_rx_par_err                         => CONNECTED_TO_dut_hip_status_rx_par_err,                         --                                .rx_par_err
			dut_hip_status_tx_par_err                         => CONNECTED_TO_dut_hip_status_tx_par_err,                         --                                .tx_par_err
			dut_hip_status_cfg_par_err                        => CONNECTED_TO_dut_hip_status_cfg_par_err,                        --                                .cfg_par_err
			dut_hip_status_ko_cpl_spc_header                  => CONNECTED_TO_dut_hip_status_ko_cpl_spc_header,                  --                                .ko_cpl_spc_header
			dut_hip_status_ko_cpl_spc_data                    => CONNECTED_TO_dut_hip_status_ko_cpl_spc_data                     --                                .ko_cpl_spc_data
		);

