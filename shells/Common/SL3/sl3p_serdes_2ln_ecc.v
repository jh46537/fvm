// Copyright 2012 Altera Corporation. All rights reserved.  
// Altera products are protected under numerous U.S. and foreign patents, 
// maskwork rights, copyrights and other intellectual property laws.  
//
// This reference design file, and your use thereof, is subject to and governed
// by the terms and conditions of the applicable Altera Reference Design 
// License Agreement (either as signed by you or found at www.altera.com).  By
// using this reference design file, you indicate your acceptance of such terms
// and conditions between you and Altera Corporation.  In the event that you do
// not agree with such terms and conditions, you may not use the reference 
// design file and please promptly destroy any copies you have made.
//
// This reference design file is being provided on an "as-is" basis and as an 
// accommodation and therefore all warranties, representations or guarantees of 
// any kind (whether express, implied or statutory) including, without 
// limitation, warranties of merchantability, non-infringement, or fitness for
// a particular purpose, are specifically disclaimed.  By making this reference
// design file available, Altera expressly does not recommend, suggest or 
// require that this reference design file be used in combination with any 
// other product not provided by Altera.
/////////////////////////////////////////////////////////////////////////////

// baeckler - 10-25-2012
//DV_FIX default_nettype//`default_nettype wire

module sl3p_serdes_2ln_ecc #(
	parameter LANES = 2, // to override you would need to modify the Serdes
	parameter NUM_PLLS = 1,
	parameter CNTR_BITS = 16,  // reset pacing
	parameter REF_CLK = "625 MHz",
	//parameter DRATE = "2500 Mbps"
	parameter DRATE = "6250 Mbps"
	//parameter DRATE = "10000 Mbps"
	//parameter DRATE = "12500 Mbps"
)(
	// no domain
	input sys_arst,
	input sloop,
		
	// pins
	input pll_ref_clk,
	output [LANES-1:0] tx_pin,
	input [LANES-1:0] rx_pin,
	
	// tx port
	output tx_srst,
	output tx_clk_out,
	output tx_phase,
	input [LANES*66-1:0] tx_din,  // bit 0 sent first, to tx_pin[0] 
	
	// rx port
	output rx_srst,
	output rx_clk_out,
	output [LANES*66-1:0] rx_dout,  // bit 0 sent first, from rx_pin[0] 		
	output rx_valid,
	output [LANES-1:0] rx_fix,  // corrected error
	output [LANES-1:0] rx_fail,  // uncorrected error

	output wire [LANES-1:0] word_lock,
	output deskew_locked,
	
	output wire rx_underflow,
	output wire rx_overflow,
	
	// SERDES reconfig port
	input           mgmt_clk_clk,  // also used for reset sequencing
        input  wire [349:0] reconfig_to_xcvr,   //   reconfig_to_xcvr.reconfig_to_xcvr
        output wire [229:0] reconfig_from_xcvr,  // reconfig_from_xcvr.reconfig_from_xcvr
        input wire reconfig_busy, tx_cal_busy_r, rx_cal_busy_r
    //input   [6:0]   reconfig_mgmt_address,
    //input           reconfig_mgmt_read,
    //output  [31:0]  reconfig_mgmt_readdata,
    //output          reconfig_mgmt_waitrequest,
    //input           reconfig_mgmt_write,
    //input   [31:0]  reconfig_mgmt_writedata    
);


localparam NUM_LN = LANES;
/////////////////////////////////////////////////////////////////////////
// serdes with ECC - 66 bit 

wire clk100 = mgmt_clk_clk;
wire rst100;

wire [NUM_LN-1:0] tx_pll_locked;

wire  [NUM_LN*70-1:0] reconfig_to_tx;       
wire [NUM_LN*46-1:0] reconfig_from_tx;
wire  [NUM_PLLS*70-1:0] reconfig_to_pll;       
wire [NUM_PLLS*46-1:0] reconfig_from_pll;      

armored66_tx txl (
	.clk100(clk100), // reset control
	.rst100(rst100),  // fires whole reset sequence
	.clk_ref(pll_ref_clk), // TX PLL reference
	
	.din(tx_din),
	.din_phase(tx_phase),
	.din_clk(tx_clk_out),
	.tx_pin(tx_pin), // hsio
	
	.sloop({NUM_LN{sloop}}),  // internal TX->RX loop
	.tx_pll_locked(tx_pll_locked),
	
	.reconfig_to_xcvr(reconfig_to_tx),       
	.reconfig_from_xcvr(reconfig_from_tx),
	.reconfig_to_pll(reconfig_to_pll),       
	.reconfig_from_pll(reconfig_from_pll)      
);
defparam txl .NUM_LN = LANES;
defparam txl .LANES_PER_PLL = 6;
defparam txl .TX_REF = REF_CLK; 
defparam txl .RX_REF = REF_CLK; 
defparam txl .DRATE = DRATE;
defparam txl .TARGET_CHIP = 2;
defparam txl .RST_CNTR = CNTR_BITS; // nominal 16/20 or 6 for fast simulation of reset seq

wire  [NUM_LN*70-1:0] reconfig_to_rx;       
wire [NUM_LN*46-1:0] reconfig_from_rx;
	
armored66_rx rxl (
	.clk100(clk100),  // reset management + reconfig
	.rst100(rst100), // this fires the entire cycle
	
	.clk_ref(pll_ref_clk),  // to CDR
	
	.rx_pin(rx_pin),		// to HS pin
	.dout_clk(rx_clk_out),
	.dout(rx_dout),
	.dout_valid(rx_valid),
	.dout_fix(rx_fix),  // corrected error
	.dout_fail(rx_fail),  // uncorrected error
	
	.sloop({LANES{sloop}}),
	.rx_freqlock(),
	.rx_wordlock(word_lock),
	.deskew_locked(deskew_locked),

	.rx_overflow(rx_overflow),
	.rx_underflow(rx_underflow),
			
	.reconfig_to_xcvr(reconfig_to_rx),
	.reconfig_from_xcvr(reconfig_from_rx)	
);
defparam rxl .NUM_LN = LANES;
defparam rxl .RX_REF = REF_CLK;
defparam rxl .DRATE = DRATE;
defparam rxl .RST_CNTR = CNTR_BITS; // nominal 16/20 or 6 for fast simulation of reset seq
defparam rxl .TARGET_CHIP = 2;


/////////////////////////////////////////////////////////////////////////
// reconfig and calibration
assign {reconfig_to_pll,reconfig_to_tx,reconfig_to_rx}       = reconfig_to_xcvr;
assign reconfig_from_xcvr = {reconfig_from_pll,reconfig_from_tx,reconfig_from_rx};
localparam RECO_PORTS = 2*NUM_LN+NUM_PLLS;
/////////////////////////////////////////////////////////////////////////
// common reset control

wire rd0_ready;
reset_delay rd0 (
	.clk(clk100),
	.ready_in (!tx_cal_busy_r && !rx_cal_busy_r && !sys_arst),
	.ready_out(rd0_ready)
);
defparam rd0 .CNTR_BITS = CNTR_BITS;
assign rst100 = !rd0_ready;

sync_regs sr0 (
	.clk(tx_clk_out),
	.din (~&tx_pll_locked),
	.dout(tx_srst)
);
defparam sr0 .WIDTH = 1;

sync_regs sr2 (
	.clk(rx_clk_out),
	.din (~deskew_locked),
	.dout(rx_srst)
);
defparam sr2 .WIDTH = 1;

endmodule
