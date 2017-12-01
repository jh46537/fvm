set_global_assignment -entity "core_clk_pll" -library "lib_core_clk_pll" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "core_clk_pll" -library "lib_core_clk_pll" -name IP_TOOL_VERSION "14.0"
set_global_assignment -entity "core_clk_pll" -library "lib_core_clk_pll" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_core_clk_pll" -name SPD_FILE [file join $::quartus(sip_path) "core_clk_pll.spd"]

set_global_assignment -library "lib_core_clk_pll" -name MISC_FILE [file join $::quartus(sip_path) "core_clk_pll_sim/core_clk_pll.vo"]
