# ========== Pin Locations & I/O Standards ==========

# Flash Configuration
set_location_assignment PIN_AN28 -to ~ALTERA_DATA0~
set_location_assignment PIN_AP25 -to ~ALTERA_DATA29~
set_location_assignment PIN_AN25 -to ~ALTERA_DATA30~
set_location_assignment PIN_AP24 -to ~ALTERA_DATA31~
set_location_assignment PIN_Y27 -to altera_reserved_ntrst
set_location_assignment PIN_AN31 -to altera_reserved_tck
set_location_assignment PIN_AL29 -to altera_reserved_tdi
set_location_assignment PIN_AK29 -to altera_reserved_tdo
set_location_assignment PIN_AJ30 -to altera_reserved_tms

# PCIe
set_location_assignment PIN_W29 -to pcie_0_refclk
set_location_assignment PIN_W30 -to "pcie_0_refclk(n)"
set_location_assignment PIN_W26 -to pcie_0_reset_n
set_location_assignment PIN_AL33 -to pcie_0_rx[0]
set_location_assignment PIN_AL34 -to "pcie_0_rx[0](n)"
set_location_assignment PIN_AJ33 -to pcie_0_rx[1]
set_location_assignment PIN_AJ34 -to "pcie_0_rx[1](n)"
set_location_assignment PIN_AG33 -to pcie_0_rx[2]
set_location_assignment PIN_AG34 -to "pcie_0_rx[2](n)"
set_location_assignment PIN_AE33 -to pcie_0_rx[3]
set_location_assignment PIN_AE34 -to "pcie_0_rx[3](n)"
set_location_assignment PIN_AA33 -to pcie_0_rx[4]
set_location_assignment PIN_AA34 -to "pcie_0_rx[4](n)"
set_location_assignment PIN_W33 -to pcie_0_rx[5]
set_location_assignment PIN_W34 -to "pcie_0_rx[5](n)"
set_location_assignment PIN_U33 -to pcie_0_rx[6]
set_location_assignment PIN_U34 -to "pcie_0_rx[6](n)"
set_location_assignment PIN_R33 -to pcie_0_rx[7]
set_location_assignment PIN_R34 -to "pcie_0_rx[7](n)"
set_location_assignment PIN_AK31 -to pcie_0_tx[0]
set_location_assignment PIN_AK32 -to "pcie_0_tx[0](n)"
set_location_assignment PIN_AH31 -to pcie_0_tx[1]
set_location_assignment PIN_AH32 -to "pcie_0_tx[1](n)"
set_location_assignment PIN_AF31 -to pcie_0_tx[2]
set_location_assignment PIN_AF32 -to "pcie_0_tx[2](n)"
set_location_assignment PIN_AD31 -to pcie_0_tx[3]
set_location_assignment PIN_AD32 -to "pcie_0_tx[3](n)"
set_location_assignment PIN_Y31 -to pcie_0_tx[4]
set_location_assignment PIN_Y32 -to "pcie_0_tx[4](n)"
set_location_assignment PIN_V31 -to pcie_0_tx[5]
set_location_assignment PIN_V32 -to "pcie_0_tx[5](n)"
set_location_assignment PIN_T31 -to pcie_0_tx[6]
set_location_assignment PIN_T32 -to "pcie_0_tx[6](n)"
set_location_assignment PIN_P31 -to pcie_0_tx[7]
set_location_assignment PIN_P32 -to "pcie_0_tx[7](n)"

# Transceivers
set_location_assignment PIN_W6 -to xcvr_refclk
set_location_assignment PIN_W5 -to "xcvr_refclk(n)"
set_location_assignment PIN_AL2 -to xcvr_rx_0[0]
set_location_assignment PIN_AL1 -to "xcvr_rx_0[0](n)"
set_location_assignment PIN_AJ2 -to xcvr_rx_0[1]
set_location_assignment PIN_AJ1 -to "xcvr_rx_0[1](n)"
set_location_assignment PIN_AG2 -to xcvr_rx_1[0]
set_location_assignment PIN_AG1 -to "xcvr_rx_1[0](n)"
set_location_assignment PIN_AE2 -to xcvr_rx_1[1]
set_location_assignment PIN_AE1 -to "xcvr_rx_1[1](n)"
set_location_assignment PIN_W2 -to xcvr_rx_2[0]
set_location_assignment PIN_W1 -to "xcvr_rx_2[0](n)"
set_location_assignment PIN_U2 -to xcvr_rx_2[1]
set_location_assignment PIN_U1 -to "xcvr_rx_2[1](n)"
set_location_assignment PIN_R2 -to xcvr_rx_3[0]
set_location_assignment PIN_R1 -to "xcvr_rx_3[0](n)"
set_location_assignment PIN_N2 -to xcvr_rx_3[1]
set_location_assignment PIN_N1 -to "xcvr_rx_3[1](n)"
set_location_assignment PIN_AK4 -to xcvr_tx_0[0]
set_location_assignment PIN_AK3 -to "xcvr_tx_0[0](n)"
set_location_assignment PIN_AH4 -to xcvr_tx_0[1]
set_location_assignment PIN_AH3 -to "xcvr_tx_0[1](n)"
set_location_assignment PIN_AF4 -to xcvr_tx_1[0]
set_location_assignment PIN_AF3 -to "xcvr_tx_1[0](n)"
set_location_assignment PIN_AD4 -to xcvr_tx_1[1]
set_location_assignment PIN_AD3 -to "xcvr_tx_1[1](n)"
set_location_assignment PIN_V4 -to xcvr_tx_2[0]
set_location_assignment PIN_V3 -to "xcvr_tx_2[0](n)"
set_location_assignment PIN_T4 -to xcvr_tx_2[1]
set_location_assignment PIN_T3 -to "xcvr_tx_2[1](n)"
set_location_assignment PIN_P4 -to xcvr_tx_3[0]
set_location_assignment PIN_P3 -to "xcvr_tx_3[0](n)"
set_location_assignment PIN_M4 -to xcvr_tx_3[1]
set_location_assignment PIN_M3 -to "xcvr_tx_3[1](n)"

set_location_assignment PIN_E8 -to xcvr_refclk_scl
set_location_assignment PIN_E10 -to xcvr_refclk_sda 

# DDR3
set_location_assignment PIN_AB8 -to mem_0_refclk
set_location_assignment PIN_A4 -to global_reset_n
set_location_assignment PIN_AM6 -to mem_0_rzq
set_location_assignment PIN_J20 -to ddr_use_1_35v

# LEDs
set_location_assignment PIN_G21 -to LEDs[0]
set_location_assignment PIN_F21 -to LEDs[1]
set_location_assignment PIN_H20 -to LEDs[2]
set_location_assignment PIN_G20 -to LEDs[3]
set_location_assignment PIN_E21 -to LEDs[4]
set_location_assignment PIN_D21 -to LEDs[5]
set_location_assignment PIN_F20 -to LEDs[6]
set_location_assignment PIN_E20 -to LEDs[7]

set_instance_assignment -name SLEW_RATE 0 -to LEDs[0]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[1]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[2]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[3]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[4]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[5]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[6]
set_instance_assignment -name SLEW_RATE 0 -to LEDs[7]

# ========== I/O Standards ==========

# PCIe
set_instance_assignment -name IO_STANDARD HCSL -to pcie_0_refclk
set_instance_assignment -name IO_STANDARD HCSL -to "pcie_0_refclk(n)"
set_instance_assignment -name IO_STANDARD "1.5 V" -to pcie_0_reset_n
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[0]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[1]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[2]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[3]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[4]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[5]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[6]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_rx[7]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[0]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[1]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[2]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[3]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[4]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[5]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[6]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to pcie_0_tx[7]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[0](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[1](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[2](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[3](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[4](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[5](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[6](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_rx[7](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[0](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[1](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[2](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[3](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[4](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[5](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[6](n)"
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to "pcie_0_tx[7](n)"

set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[0]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[1]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[2]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[3]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[4]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[5]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[6]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to pcie_0_rx[7]
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[0](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[1](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[2](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[3](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[4](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[5](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[6](n)"
set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to "pcie_0_rx[7](n)"

set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[0]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[1]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[2]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[3]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[4]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[5]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[6]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to pcie_0_rx[7]
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[0](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[1](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[2](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[3](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[4](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[5](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[6](n)"
set_instance_assignment -name XCVR_VCCA_VOLTAGE 3_0V -to "pcie_0_rx[7](n)"

# Transceivers
set_instance_assignment -name INPUT_TERMINATION "OCT 100 OHMS" -to xcvr_refclk
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_refclk
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_refclk(n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_0[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_0[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_1[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_1[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_2[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_2[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_3[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_rx_3[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_0[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_0[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_1[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_1[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_2[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_2[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_3[0]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to xcvr_tx_3[1]
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_0[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_0[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_1[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_1[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_2[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_2[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_3[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_rx_3[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_0[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_0[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_1[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_1[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_2[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_2[1](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_3[0](n)"
set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to "xcvr_tx_3[1](n)"

set_instance_assignment -name IO_STANDARD "2.5 V" -to xcvr_refclk_scl
set_instance_assignment -name IO_STANDARD "2.5 V" -to xcvr_refclk_sda 

set_instance_assignment -name XCVR_TX_VOD 50 -to xcvr_tx_*
set_instance_assignment -name XCVR_TX_PRE_EMP_1ST_POST_TAP 0 -to xcvr_tx_*
set_instance_assignment -name XCVR_TX_PRE_EMP_PRE_TAP 0 -to xcvr_tx_*
set_instance_assignment -name XCVR_TX_PRE_EMP_INV_PRE_TAP OFF -to xcvr_tx_*
set_instance_assignment -name XCVR_TX_PRE_EMP_2ND_POST_TAP 0 -to xcvr_tx_*
set_instance_assignment -name XCVR_TX_PRE_EMP_INV_2ND_TAP OFF -to xcvr_tx_*

set_instance_assignment -name XCVR_RX_DC_GAIN 1 -to xcvr_rx_*
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_0[0]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_0[1]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_1[0]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_1[1]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_2[0]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_2[1]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_3[0]
set_instance_assignment -name XCVR_RX_LINEAR_EQUALIZER_CONTROL 10 -to xcvr_rx_3[1]

