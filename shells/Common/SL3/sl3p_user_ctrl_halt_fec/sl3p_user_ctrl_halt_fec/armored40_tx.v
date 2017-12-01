`timescale 1 ps / 1 ps
// baeckler - 04-02-2013

module armored40_tx #(
	parameter NUM_LN = 4,
	parameter LANES_PER_PLL = 4,
	parameter TX_REF = "644.53125 MHz", 
	parameter RX_REF = TX_REF, 
	parameter DRATE = "10312.5 Mbps",
	parameter TARGET_CHIP = 2,
	parameter SCRAM_INIT = 33'h12345678,
	parameter RST_CNTR = 16, // nominal 16/20 or 6 for fast simulation of reset seq
		
	// no override
	parameter GUESS_PLLS = NUM_LN / LANES_PER_PLL,
	parameter NUM_PLLS = (GUESS_PLLS*LANES_PER_PLL == NUM_LN) ?
						GUESS_PLLS : GUESS_PLLS + 1
)(
	input clk100, // reset control
	input rst100,  // fires whole reset sequence
	input clk_ref, // TX PLL reference
	
	input [NUM_LN*33-1:0] din,
	output [NUM_LN-1:0] din_clk,
	output [NUM_LN-1:0] tx_pin, // hsio
	
	input [NUM_LN-1:0] sloop,  // internal TX->RX loop
	output [NUM_LN-1:0] tx_pll_locked,
	
	input  [NUM_LN*70-1:0] reconfig_to_xcvr,       
	output [NUM_LN*46-1:0] reconfig_from_xcvr,
	input  [NUM_PLLS*70-1:0] reconfig_to_pll,       
	output [NUM_PLLS*46-1:0] reconfig_from_pll      
);

wire rst_txd;

//////////////////////////////////////////////////////////////
// line encoders

wire [NUM_LN*40-1:0] din_enc;
genvar i;
generate
	for (i=0; i<NUM_LN; i=i+1) begin : el
		wire local_sclr;
		sync_regs sr (
			.clk(din_clk[i]),
			.din(rst_txd),
			.dout(local_sclr)
		);
		defparam sr .WIDTH = 1;
				
		armored40_enc ae (
			.clk(din_clk[i]),
			.sclr(local_sclr),
			.din(din[(i+1)*33-1:i*33]),
			.dout(din_enc[(i+1)*40-1:i*40])
		);
		defparam ae .TARGET_CHIP = TARGET_CHIP;
		defparam ae .SCRAM_INIT = SCRAM_INIT ^ {i[5:0],i[5:0],i[5:0],i[5:0],i[5:0]} ;
	end
endgenerate

//////////////////////////////////////////////////////////////
// tx pins

wire pll_powerdown;
wire rst_txa;
wire [NUM_LN-1:0] ext_pll_clk;

r40tx_array ta (
	.pll_powerdown(pll_powerdown),
	.rst_txa(rst_txa),
	.rst_txd(rst_txd),
	.ext_pll_clk(ext_pll_clk),
	.tx_pin(tx_pin),
	.clk_tx_core(din_clk),
	.clk_tx_out(din_clk),
	.sloop(sloop),
	.tx_data(din_enc),
	.reconfig_to_xcvr(reconfig_to_xcvr),       
	.reconfig_from_xcvr(reconfig_from_xcvr)      
);
defparam ta .NUM_LN = NUM_LN;
defparam ta .RX_REF = RX_REF;
defparam ta .DRATE = DRATE;

//////////////////////////////////////////////////////////////
// one ATX PLL is going to service 6 lanes (give or take)

wire [NUM_PLLS-1:0] tx_pll_clk;
wire [NUM_PLLS-1:0] pll_locki;

generate 
	for (i=0; i<NUM_LN; i=i+1) begin : lp
		assign tx_pll_locked[i] = pll_locki[i/LANES_PER_PLL];
		assign ext_pll_clk[i] = tx_pll_clk[i/LANES_PER_PLL];
	end
endgenerate

//////////////////////////////////////////////////////////////
// reset schedule

wire it_rdy_0;
reset_delay itd0 (
    .clk(clk100),
    .ready_in(!rst100),
    .ready_out(it_rdy_0)
);
defparam itd0 .CNTR_BITS = RST_CNTR;
assign pll_powerdown = !it_rdy_0;

wire it_rdy_1;
reset_delay itd1 (
    .clk(clk100),
    .ready_in(it_rdy_0 & (&tx_pll_locked)),
    .ready_out(it_rdy_1)
);
defparam itd1 .CNTR_BITS = RST_CNTR;
assign rst_txa = !it_rdy_1;

wire it_rdy_2;
reset_delay itd2 (
    .clk(clk100),
    .ready_in(it_rdy_1),
    .ready_out(it_rdy_2)
);
defparam itd2 .CNTR_BITS = RST_CNTR;
assign rst_txd = !it_rdy_2;

//////////////////////////////////////////////////////////////
// PLL array

generate
	for (i=0; i<NUM_PLLS; i=i+1) begin : p
		wire fbclk;
		sv_xcvr_plls #(
			.plls                                 (1),
			.pll_type                             ("ATX"),
			.pll_reconfig                         (1),
			.refclks                              (1),
			.reference_clock_frequency            (TX_REF),
			.reference_clock_select               ("0"),
			.output_clock_datarate                (DRATE),
			.output_clock_frequency               ("0 ps"),
			.feedback_clk                         ("internal"),
			.sim_additional_refclk_cycles_to_lock (0),
			.duty_cycle                           (50),
			.phase_shift                          ("0 ps"),
			.enable_hclk                          ("0"),
			.enable_avmm                          (1),
			.use_generic_pll                      (0),
			.att_mode                             (0),
			.enable_mux                           (1)
		) tx_pll (
			.rst (pll_powerdown),    
			.refclk (clk_ref), 
			.fbclk (fbclk),        
			.fboutclk(fbclk),                   
			.outclk (tx_pll_clk[i]),   
			.locked (pll_locki[i]),   
			.reconfig_to_xcvr   (reconfig_to_pll[70*(i+1)-1:70*i]),   
			.reconfig_from_xcvr (reconfig_from_pll[46*(i+1)-1:46*i]), 
			.pll_fb_sw          (1'b0),               
			.hclk               ()                    
		);
	end
endgenerate


endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Total registers : N/A until Partition Merge
// BENCHMARK INFO :  Total pins : N/A until Partition Merge
// BENCHMARK INFO :  Total virtual pins : N/A until Partition Merge
// BENCHMARK INFO :  Total block memory bits : N/A until Partition Merge
