package require -exact sopc 10.1
sopc::preview_add_transform name preview_avalon_mm_transform

# +-----------------------------------
# | module PCI Express
# |
set_module_property NAME altera_pcie_sv_hip_de_hip_status
set_module_property DESCRIPTION "Export HIP output status pins to the external output pins"
set_module_property DATASHEET_URL "http://www.altera.com/literature/ug/ug_s5_pcie.pdf"
set_module_property AUTHOR Altera
set_module_property DISPLAY_NAME "SV HIP Status Output Bridge"
set_module_property HIDE_FROM_SOPC true
set_module_property INTERNAL false
set_module_property EDITABLE false
set_module_property ANALYZE_HDL FALSE
set_module_property TOP_LEVEL_HDL_FILE altpcie_sv_hip_ast_hip_status_bridge.v
set_module_property TOP_LEVEL_HDL_MODULE altpcie_sv_hip_ast_hip_status_bridge
set_module_property STATIC_TOP_LEVEL_MODULE_NAME altpcie_sv_hip_ast_hip_status_bridge
set_module_property instantiateInSystemModule "true"

# # +-----------------------------------
# # | QUARTUS_SYNTH design RTL files
#   |
add_fileset synth QUARTUS_SYNTH proc_quartus_synth
add_fileset sim_vhdl SIM_VHDL proc_sim_vhdl
add_fileset sim_verilog SIM_VERILOG proc_sim_verilog
set_module_property ELABORATION_CALLBACK elaboration_callback

# +-----------------------------------
# | Static IO
# |
add_interface            pld_clk clock end
add_interface_port       pld_clk pld_clk clk Input 1

add_interface            export_pld_clk clock start
add_interface_port       export_pld_clk export_pld_clk clk Output 1

add_interface            hip_status_hip conduit end
add_interface_port       hip_status_hip to_hip_derr_cor_ext_rcv   derr_cor_ext_rcv    Input 1
add_interface_port       hip_status_hip to_hip_derr_cor_ext_rpl   derr_cor_ext_rpl    Input 1
add_interface_port       hip_status_hip to_hip_derr_rpl           derr_rpl            Input 1
add_interface_port       hip_status_hip to_hip_dlup               dlup                Input 1
add_interface_port       hip_status_hip to_hip_dlup_exit          dlup_exit           Input 1
add_interface_port       hip_status_hip to_hip_ev128ns            ev128ns             Input 1
add_interface_port       hip_status_hip to_hip_ev1us              ev1us               Input 1
add_interface_port       hip_status_hip to_hip_hotrst_exit        hotrst_exit         Input 1
add_interface_port       hip_status_hip to_hip_int_status         int_status          Input 4
add_interface_port       hip_status_hip to_hip_l2_exit            l2_exit             Input 1
add_interface_port       hip_status_hip to_hip_lane_act           lane_act            Input 4
add_interface_port       hip_status_hip to_hip_ltssmstate         ltssmstate          Input 5
add_interface_port       hip_status_hip to_hip_rx_par_err         rx_par_err          Input 1
add_interface_port       hip_status_hip to_hip_tx_par_err         tx_par_err          Input 2
add_interface_port       hip_status_hip to_hip_cfg_par_err        cfg_par_err         Input 1
add_interface_port       hip_status_hip to_hip_ko_cpl_spc_header  ko_cpl_spc_header   Input 8
add_interface_port       hip_status_hip to_hip_ko_cpl_spc_data    ko_cpl_spc_data     Input 12
set_interface_assignment hip_status_hip "ui.blockdiagram.direction" "input"

add_interface            hip_status_apps conduit end
add_interface_port       hip_status_apps to_apps_derr_cor_ext_rcv   derr_cor_ext_rcv    Output 1
add_interface_port       hip_status_apps to_apps_derr_cor_ext_rpl   derr_cor_ext_rpl    Output 1
add_interface_port       hip_status_apps to_apps_derr_rpl           derr_rpl            Output 1
add_interface_port       hip_status_apps to_apps_dlup               dlup                Output 1
add_interface_port       hip_status_apps to_apps_dlup_exit          dlup_exit           Output 1
add_interface_port       hip_status_apps to_apps_ev128ns            ev128ns             Output 1
add_interface_port       hip_status_apps to_apps_ev1us              ev1us               Output 1
add_interface_port       hip_status_apps to_apps_hotrst_exit        hotrst_exit         Output 1
add_interface_port       hip_status_apps to_apps_int_status         int_status          Output 4
add_interface_port       hip_status_apps to_apps_l2_exit            l2_exit             Output 1
add_interface_port       hip_status_apps to_apps_lane_act           lane_act            Output 4
add_interface_port       hip_status_apps to_apps_ltssmstate         ltssmstate          Output 5
add_interface_port       hip_status_apps to_apps_rx_par_err         rx_par_err          Output 1
add_interface_port       hip_status_apps to_apps_tx_par_err         tx_par_err          Output 2
add_interface_port       hip_status_apps to_apps_cfg_par_err        cfg_par_err         Output 1
add_interface_port       hip_status_apps to_apps_ko_cpl_spc_header  ko_cpl_spc_header   Output 8
add_interface_port       hip_status_apps to_apps_ko_cpl_spc_data    ko_cpl_spc_data     Output 12
set_interface_assignment hip_status_apps "ui.blockdiagram.direction" "output"

add_interface            hip_status_export conduit end
add_interface_port       hip_status_export export_derr_cor_ext_rcv   derr_cor_ext_rcv    Output 1
add_interface_port       hip_status_export export_derr_cor_ext_rpl   derr_cor_ext_rpl    Output 1
add_interface_port       hip_status_export export_derr_rpl           derr_rpl            Output 1
add_interface_port       hip_status_export export_dlup               dlup                Output 1
add_interface_port       hip_status_export export_dlup_exit          dlup_exit           Output 1
add_interface_port       hip_status_export export_ev128ns            ev128ns             Output 1
add_interface_port       hip_status_export export_ev1us              ev1us               Output 1
add_interface_port       hip_status_export export_hotrst_exit        hotrst_exit         Output 1
add_interface_port       hip_status_export export_int_status         int_status          Output 4
add_interface_port       hip_status_export export_l2_exit            l2_exit             Output 1
add_interface_port       hip_status_export export_lane_act           lane_act            Output 4
add_interface_port       hip_status_export export_ltssmstate         ltssmstate          Output 5
add_interface_port       hip_status_export export_rx_par_err         rx_par_err          Output 1
add_interface_port       hip_status_export export_tx_par_err         tx_par_err          Output 2
add_interface_port       hip_status_export export_cfg_par_err        cfg_par_err         Output 1
add_interface_port       hip_status_export export_ko_cpl_spc_header  ko_cpl_spc_header   Output 8
add_interface_port       hip_status_export export_ko_cpl_spc_data    ko_cpl_spc_data     Output 12
set_interface_assignment hip_status_export "ui.blockdiagram.direction" "output"

add_interface            config_tl_apps conduit end
add_interface_port       config_tl_apps to_apps_hpg_ctrler     hpg_ctrler      Input  5
add_interface_port       config_tl_apps to_apps_tl_cfg_add     tl_cfg_add      Output 4
add_interface_port       config_tl_apps to_apps_tl_cfg_ctl     tl_cfg_ctl      Output 32
add_interface_port       config_tl_apps to_apps_tl_cfg_sts     tl_cfg_sts      Output 53
add_interface_port       config_tl_apps to_apps_cpl_err        cpl_err         Input  7
add_interface_port       config_tl_apps to_apps_cpl_pending    cpl_pending     Input  1
set_interface_assignment config_tl_apps "ui.blockdiagram.direction" "output"

add_interface            config_tl_export conduit end
add_interface_port       config_tl_export export_tl_cfg_add     tl_cfg_add      Output 4
add_interface_port       config_tl_export export_tl_cfg_ctl     tl_cfg_ctl      Output 32
add_interface_port       config_tl_export export_tl_cfg_sts     tl_cfg_sts      Output 53
set_interface_assignment config_tl_export "ui.blockdiagram.direction" "output"

# +-----------------------------------
# | parameters
# |

add_parameter          avmm_dma_design integer 0
set_parameter_property avmm_dma_design DISPLAY_NAME "AVMM DMA design"
set_parameter_property avmm_dma_design DISPLAY_HINT boolean
set_parameter_property avmm_dma_design VISIBLE true
set_parameter_property avmm_dma_design HDL_PARAMETER false
set_parameter_property avmm_dma_design DESCRIPTION "When On, input signals 'hpg_ctrler', 'cpl_err' and 'cpl_pending' are removed from the 'config_tl_hip' conduit"


# ************** Global Variables ***************
set not_init "default"
# **************** Parameters *******************

proc elaboration_callback { } {
   proc_altera_pcie_hip_status_port_upd
}

proc proc_quartus_synth {name} {
   if {[file exists "altpcie_av_hip_ast_hip_status_bridge.v"] == 1} {
      add_fileset_file altpcie_av_hip_ast_hip_status_bridge.v        VERILOG PATH altpcie_av_hip_ast_hip_status_bridge.v
   } elseif {[file exists "pcie_lib/altpcie_av_hip_ast_hip_status_bridge.v"] == 1} {
      add_fileset_file altpcie_av_hip_ast_hip_status_bridge.v        VERILOG PATH pcie_lib/altpcie_av_hip_ast_hip_status_bridge.v
   }
}

proc proc_sim_vhdl {name} {
   proc_quartus_synth
}

proc proc_sim_verilog {name} {
   proc_quartus_synth
}

proc proc_altera_pcie_hip_status_port_upd { } {
   set avmm_dma_design [ get_parameter_value avmm_dma_design ]

   add_interface            config_tl_hip conduit end
   add_interface_port       config_tl_hip to_hip_tl_cfg_add     tl_cfg_add      Input 4
   add_interface_port       config_tl_hip to_hip_tl_cfg_ctl     tl_cfg_ctl      Input 32
   add_interface_port       config_tl_hip to_hip_tl_cfg_sts     tl_cfg_sts      Input 53
   set_interface_assignment config_tl_hip "ui.blockdiagram.direction" "input"

   if { $avmm_dma_design == 0} {
      add_interface_port    config_tl_hip to_hip_hpg_ctrler     hpg_ctrler      Output  5
      add_interface_port    config_tl_hip to_hip_cpl_err        cpl_err         Output  7
      add_interface_port    config_tl_hip to_hip_cpl_pending    cpl_pending     Output  1
   } else {
      add_interface no_connect conduit end
      add_interface_port no_connect to_hip_hpg_ctrler	 hpg_ctrler	Output 5
      add_interface_port no_connect to_hip_cpl_err	 cpl_err	Output 7
      add_interface_port no_connect to_hip_cpl_pending	 cpl_pending	Output 1
      set_port_property             to_hip_hpg_ctrler	 TERMINATION	true
      set_port_property             to_hip_cpl_err	 TERMINATION	true
      set_port_property             to_hip_cpl_pending	 TERMINATION	true
   }
}


