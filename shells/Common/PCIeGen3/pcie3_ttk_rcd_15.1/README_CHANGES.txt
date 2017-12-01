
Copy pcie3_ttk_rcd.qsys from PCIeGen3\pcie3_ttk_rcd folder to PCIeGen3\pcie3_ttk_rcd_15.1 folder

**************************************************************************
*** This completes initialization, now comes the generation of sources ***
**************************************************************************

Open in Qsys within Quartus 15.1.1.189 (with patches 1.02, 1.03, 1.12)

Generate HLD, generate testbench system, generate example design

In the example design, open pcie_de_gen3_x8_ast256.qsys in a text editor and look for
<parameter name="enable_pipe32_sim_hwtcl" value="0" />
and change the value to 1

Now open pcie_de_gen3_x8_ast256.qsys in Qsys and generate HLD and testbench system

***********************************************************************
*** This complete the generation, now comes integrating the changes ***
***********************************************************************

Note that pcie3_ttk_rcd.qsys already specifies the BAR0 size as 28 bits, so don't have to patch sources

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\simulation\submodules\altpcie_hip_256_pipen1b.v
-around line 4914 (Nicolas Mellis?), testbench already forces these signals

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\synthesis\pcie3_ttk_rcd.qip
-around line 1350, add sources for corrupted eds fix

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\synthesis\pcie3_ttk_rcd.v
-around line 7, add parameters
-around line 260, added outputs
-line 294, dut_hip_status_currentspeed
-line 297, DEBUG_WIDTH
-line 300, gen123_lane_rate_mode_hwtcl
-line 315, enable_power_on_rst_pulse_hwtcl
-line 341, vendor_id_hwtcl
-line 342, device_id_hwtcl
-line 502, gen3_coeff_1_hwtcl
-line 505, gen3_coeff_1_nxtber_more_ptr_hwtcl
-line 520, gen3_coeff_3_hwtcl
-line 1078, debug
-line 1323, coreclkout_hip

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\synthesis\submodules\altpcie_hip_256_pipen1b.v
-line 20, altera message off, added 10242
-line 24, DEBUG_WIDTH
-around line 921, debug
-line 1950, altera_attribute SDC_STATEMENT
-around line 3245, testin1hip
-around line 1909 to end of file, PCIe EoS + Malformed TLP Error Detection

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\synthesis\submodules\altpcie_reconfig_driver.sv
-line 18, altera message_off

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\synthesis\submodules\altpcie_sv_hip_ast_hwtcl.v
-line 20, DEBUG_WIDTH
-line 224, gen3_coeff_3_hwtcl
-around line 949, debug
-line 1379, gen3_coeff_1
-line 1382, gen3_coeff_1_nxtber_more_ptr
-line 1399, gen3_coeff_3
-line 2479, DEBUG_WIDTH
-line 3326, debug

\PCIeGen3\pcie3_ttk_rcd_15.1\pcie3_ttk_rcd\synthesis\submodules\sv_xcvr_pipe_native.sv
-around line 1390, Shao Yang






