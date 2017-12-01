`timescale 1ps/1ps

// baeckler - 04-15-2013

module armored66_tx_tb ();

parameter NUM_LN = 4;
parameter LANES_PER_PLL = 4;
parameter TX_REF = "644.53125 MHz"; 
parameter RX_REF = TX_REF; 
parameter DRATE = "10312.5 Mbps";
parameter TARGET_CHIP = 0;
parameter SCRAM_INIT = 33'h12345678;
parameter RST_CNTR = 6; // nominal 16/20 or 6 for fast simulation of reset seq
		
// no override
parameter GUESS_PLLS = NUM_LN / LANES_PER_PLL;
parameter NUM_PLLS = (GUESS_PLLS*LANES_PER_PLL == NUM_LN) ?
					GUESS_PLLS : GUESS_PLLS + 1;

reg clk100 = 1'b0; // reset control
reg rst100 = 1'b0;  // fires whole reset sequence
reg clk_ref = 1'b0; // TX PLL reference

reg [NUM_LN*66-1:0] din = 0;
wire din_phase;
wire din_clk;
wire [NUM_LN-1:0] tx_pin; // hsio

reg [NUM_LN-1:0] sloop = 0;  // internal TX->RX loop
wire [NUM_LN-1:0] tx_pll_locked;

reg  [NUM_LN*70-1:0] reconfig_to_xcvr = 0;       
wire [NUM_LN*46-1:0] reconfig_from_xcvr;
reg  [NUM_PLLS*70-1:0] reconfig_to_pll = 0;       
wire [NUM_PLLS*46-1:0] reconfig_from_pll;

armored66_tx dut_t (
	.*	
);
defparam dut_t .TARGET_CHIP = TARGET_CHIP;
defparam dut_t .RST_CNTR = RST_CNTR;

wire [NUM_LN-1:0] rx_pin = tx_pin;		// to HS pin
wire dout_clk;
wire [NUM_LN*66-1:0] dout;
wire dout_valid;
wire [NUM_LN-1:0] dout_fix;  // corrected error
wire [NUM_LN-1:0] dout_fail;  // uncorrected error

wire [NUM_LN-1:0] rx_freqlock;
wire [NUM_LN-1:0] rx_wordlock;
wire deskew_locked;
	
wire rx_overflow;
wire rx_underflow;
	
armored66_rx dut_r (
	.reconfig_to_xcvr(0),
	.reconfig_from_xcvr(),	

	.*
);
defparam dut_r .RST_CNTR = RST_CNTR;
defparam dut_r .TARGET_CHIP = TARGET_CHIP;

//////////////////////////////////////////////////////////
// sample transmission
	
reg [65:0] rand_word = 0;
reg [7:0] tx_flow_control = 8'hff;
reg [NUM_LN*66-1:0] din_traffic = 0;

integer n = 0;

always @(posedge din_clk) begin
	rand_word[1:0] <= 2'b10;
	rand_word[65:2] <= {$random,$random};	
	
	if (din_phase) begin
		n <= (n + 1'b1) % 100;
		if (n == 50) begin
			din <= {NUM_LN{tx_flow_control,20'b0,4'b1100,32'h0,2'b01}};
		end		
		else begin
			din <= din_traffic;
			din_traffic <= (din_traffic << 66) | rand_word;
		end
	end	
end

//////////////////////////////////////////////////////////
// clocks

initial begin
    @(negedge clk100);
    rst100 = 1'b1;
    @(negedge clk100);
    @(negedge clk100);
    rst100 = 1'b0;
end

always begin
    #5000 clk100 = ~clk100;
end

// 644
always begin
    #775 clk_ref = ~clk_ref;
    #776 clk_ref = ~clk_ref;
end



endmodule