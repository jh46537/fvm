`timescale 1ns/10ps
module  core_clk_pll_0002(

	// interface 'refclk'
	input wire refclk,

	// interface 'reset'
	input wire rst,

	// interface 'outclk0'
	output wire outclk_0,

	// interface 'outclk1'
	output wire outclk_1,

	// interface 'outclk2'
	output wire outclk_2,

	// interface 'outclk3'
	output wire outclk_3,

	// interface 'locked'
	output wire locked
);

	localparam FPGA_USER_CLOCK = `FPGA_USER_CLOCK;
	localparam CLKSTR = FPGA_USER_CLOCK == 25 ? "25.000000 MHz" :
					   FPGA_USER_CLOCK == 50 ? "50.000000 MHz" :
					   FPGA_USER_CLOCK == 75 ? "75.000000 MHz" :
					   FPGA_USER_CLOCK == 100 ? "100.000000 MHz" :
					   FPGA_USER_CLOCK == 125 ? "125.000000 MHz" :
					   FPGA_USER_CLOCK == 133 ? "133.333333 MHz" :
					   FPGA_USER_CLOCK == 150 ? "150.000000 MHz" :
					   FPGA_USER_CLOCK == 160 ? "160.000000 MHz" :
					   FPGA_USER_CLOCK == 166 ? "166.666666 MHz" :
					   FPGA_USER_CLOCK == 175 ? "175.000000 MHz" :
					   FPGA_USER_CLOCK == 180 ? "180.000000 MHz" :
					   FPGA_USER_CLOCK == 187 ? "187.500000 MHz" :
					   FPGA_USER_CLOCK == 200 ? "200.000000 MHz" :
					   FPGA_USER_CLOCK == 220 ? "220.000000 MHz" :
					   FPGA_USER_CLOCK == 233 ? "233.333333 MHz" :
					   FPGA_USER_CLOCK == 250 ? "250.000000 MHz" :
					   FPGA_USER_CLOCK == 275 ? "275.000000 MHz" :
					   FPGA_USER_CLOCK == 300 ? "300.000000 MHz" : "100.000000 MHz";

    localparam ASMI_RSU_CLKSTR = "20.000000 MHz";   //no longer supporting 50 MHz

	altera_pll #(
		.fractional_vco_multiplier("false"),
		.reference_clock_frequency("100.0 MHz"),
		.operation_mode("normal"),
		.number_of_clocks(4),
		.output_clock_frequency0("100.000000 MHz"),
		.phase_shift0("0 ps"),
		.duty_cycle0(50),
		.output_clock_frequency1(CLKSTR),
		.phase_shift1("0 ps"),
		.duty_cycle1(50),
		.output_clock_frequency2("50.000000 MHz"),
		.phase_shift2("0 ps"),
		.duty_cycle2(50),
		.output_clock_frequency3(ASMI_RSU_CLKSTR),
		.phase_shift3("0 ps"),
		.duty_cycle3(50),
		.output_clock_frequency4("0 MHz"),
		.phase_shift4("0 ps"),
		.duty_cycle4(50),
		.output_clock_frequency5("0 MHz"),
		.phase_shift5("0 ps"),
		.duty_cycle5(50),
		.output_clock_frequency6("0 MHz"),
		.phase_shift6("0 ps"),
		.duty_cycle6(50),
		.output_clock_frequency7("0 MHz"),
		.phase_shift7("0 ps"),
		.duty_cycle7(50),
		.output_clock_frequency8("0 MHz"),
		.phase_shift8("0 ps"),
		.duty_cycle8(50),
		.output_clock_frequency9("0 MHz"),
		.phase_shift9("0 ps"),
		.duty_cycle9(50),
		.output_clock_frequency10("0 MHz"),
		.phase_shift10("0 ps"),
		.duty_cycle10(50),
		.output_clock_frequency11("0 MHz"),
		.phase_shift11("0 ps"),
		.duty_cycle11(50),
		.output_clock_frequency12("0 MHz"),
		.phase_shift12("0 ps"),
		.duty_cycle12(50),
		.output_clock_frequency13("0 MHz"),
		.phase_shift13("0 ps"),
		.duty_cycle13(50),
		.output_clock_frequency14("0 MHz"),
		.phase_shift14("0 ps"),
		.duty_cycle14(50),
		.output_clock_frequency15("0 MHz"),
		.phase_shift15("0 ps"),
		.duty_cycle15(50),
		.output_clock_frequency16("0 MHz"),
		.phase_shift16("0 ps"),
		.duty_cycle16(50),
		.output_clock_frequency17("0 MHz"),
		.phase_shift17("0 ps"),
		.duty_cycle17(50),
		.pll_type("General"),
		.pll_subtype("General")
	) altera_pll_i (
		.rst	(rst),
		.outclk	({outclk_3, outclk_2, outclk_1, outclk_0}),
		.locked	(locked),
		.fboutclk	( ),
		.fbclk	(1'b0),
		.refclk	(refclk)
	);
endmodule

