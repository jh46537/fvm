`timescale 1ps/1ps

// baeckler 04-02-2013

module armored40_tb ();

parameter NUM_LN = 6;
parameter LANES_PER_PLL = 6;
parameter TX_REF = "625 MHz"; 
parameter RX_REF = TX_REF; 
parameter DRATE = "12500 Mbps";
parameter TARGET_CHIP = 0;
parameter SCRAM_INIT = 33'h12345678;
parameter RST_CNTR = 6; // nominal 16/20 or 6 for fast simulation of reset seq

// no override
parameter GUESS_PLLS = NUM_LN / LANES_PER_PLL;
parameter NUM_PLLS = (GUESS_PLLS*LANES_PER_PLL == NUM_LN) ?
					GUESS_PLLS : GUESS_PLLS + 1;

reg clk100 = 1'b0; // reset control
reg rst100 = 1'b0;  // fires whole reset sequence
reg clk_ref  = 1'b0; // TX PLL reference

reg [NUM_LN*33-1:0] din = 0;
wire [NUM_LN-1:0] din_clk;
wire [NUM_LN-1:0] tx_pin; // hsio

reg [NUM_LN-1:0] sloop = 0;  // internal TX->RX loop
wire [NUM_LN-1:0] tx_pll_locked;

reg  [(NUM_LN+NUM_PLLS)*70-1:0] reconfig_to_xcvr = 0;       
wire [(NUM_LN+NUM_PLLS)*46-1:0] reconfig_from_xcvr;  

//BKK added to make compile
wire  [NUM_PLLS*70-1:0] reconfig_to_pll = 0;      
wire [NUM_PLLS*46-1:0] reconfig_from_pll;    

armored40_tx dut_t (.*);

defparam dut_t .NUM_LN = NUM_LN;
defparam dut_t .LANES_PER_PLL = LANES_PER_PLL;
defparam dut_t .TX_REF = TX_REF; 
defparam dut_t .RX_REF = TX_REF; 
defparam dut_t .DRATE = DRATE;
defparam dut_t .TARGET_CHIP = TARGET_CHIP;
defparam dut_t .SCRAM_INIT = SCRAM_INIT;
defparam dut_t .RST_CNTR = RST_CNTR; // nominal 16/20 or 6 for fast simulation of reset seq


wire [NUM_LN-1:0] rx_pin = tx_pin;		// to HS pin

wire [NUM_LN-1:0] dout_clk;
wire [NUM_LN*33-1:0] dout;
wire [NUM_LN-1:0] dout_fix;  // corrected error
wire [NUM_LN-1:0] dout_fail;  // uncorrected error

wire [NUM_LN-1:0] rx_freqlock;
wire [NUM_LN-1:0] rx_wordlock;

wire [NUM_LN*46-1:0] reconfig_from_xcvr_r;	
wire [NUM_LN*70-1:0] reconfig_to_xcvr_r;	

armored40_rx dut_r (
	.reconfig_to_xcvr(reconfig_to_xcvr_r),
	.reconfig_from_xcvr(reconfig_from_xcvr_r),
	.*
);
defparam dut_r .NUM_LN = NUM_LN;
defparam dut_r .RX_REF = RX_REF;
defparam dut_r .DRATE = DRATE;
defparam dut_r .RST_CNTR = RST_CNTR; // nominal 16/20 or 6 for fast simulation of reset seq
defparam dut_r .TARGET_CHIP = TARGET_CHIP;

//////////////////////////////////////////////////////////
// quickie test

reg [NUM_LN-1:0] match = 0;

genvar i;
generate
	for (i=0; i<NUM_LN; i=i+1) begin : txp
		always @(posedge din_clk[i]) begin
			din[(i+1)*33-1:i*33] <= din[(i+1)*33-1:i*33] + 1'b1;
		end
	end
	
	for (i=0; i<NUM_LN; i=i+1) begin : rxp
		reg [32:0] last_dout = 33'h0;
		always @(posedge dout_clk[i]) begin
			 last_dout <= dout[(i+1)*33-1:i*33];
			 match[i] <= dout[(i+1)*33-1:i*33] == (last_dout + 1'b1);
		end
	end
endgenerate


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

// 625
always begin
    #800 clk_ref = ~clk_ref;
end


endmodule