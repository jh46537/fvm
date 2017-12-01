
set PARTNUMBER "5SGSMD5H2F35I3L"
set DEVFAMILY "Stratix V"

set_global_assignment -name VERILOG_MACRO "BOARD_IDENTIFIER=176"

setQuartusIniVariable "RBCGEN_ERROR_TO_CRITICAL_WARNING" "on"
setQuartusIniVariable "debug_msg" "off"
setQuartusIniVariable "quartus_global_optimization" "on"
setQuartusIniVariable "quartus_high_density_optimization" "on"
readQuartusIni

# Disable PLL auto-merging
set_global_assignment -name AUTO_MERGE_PLLS OFF
