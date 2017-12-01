create_clock -period "125 MHz" -name {mem_0_refclk}   {mem_0_refclk}
create_clock -period "100 MHz" -name {pcie_0_refclk}  {pcie_0_refclk}
create_clock -period "625 MHz" -name {xcvr_refclk}  {xcvr_refclk}

derive_pll_clocks 
derive_clock_uncertainty

# Derived clock fix for 13.0
set_clock_groups -asynchronous -group [get_clocks {*avmm*pmatestbussel[0]}]

set_false_path -from [get_ports LEDs*] 
set_false_path -to [get_ports LEDs*]
