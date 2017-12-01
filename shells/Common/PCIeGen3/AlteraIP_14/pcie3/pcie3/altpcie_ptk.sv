// (C) 2001-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module altpcie_ptk #(
      parameter pcie_mode                    = "rp",
      parameter ltssmstate_num               = 36,
      parameter LANES                        = 8
) (
      // HIP reconfig AVMM signals
      input    logic                avmm_clk_i,
      input    logic                avmm_rstn_i,
      input    logic                avmm_read_i,           
      input    logic                avmm_write_i,          
      input    logic  [9:0]         avmm_address_i,
      input    logic  [31:0]        avmm_writedata_i,
      input    logic  [3:0]         avmm_byte_en_i,
      input    logic  [15:0]        avmm_readdata_hip_i,
      output   logic  [31:0]        avmm_readdata_o,
		
      // HIP status signal
      input     logic                pld_clk_i,
      input     logic                pld_rstn_i,
      input     logic [4:0]          ltssmstate_i,
      input     logic [LANES-1:0]    signaldetect_i,
      input     logic [LANES-1:0]    is_lockedtodata_i,
      input     logic [1:0]          currentspeed_i,
      input     logic [52:0]         tl_cfg_sts_i,
      input     logic [3:0]          tl_cfg_add_i,
      input     logic [31:0]         tl_cfg_ctl_i
);

logic [LANES-1:0]                  signaldetect_r;
logic [LANES-1:0]                  signaldetect_sync;
logic [LANES-1:0]                  is_lockedtodata_r;
logic [LANES-1:0]                  is_lockedtodata_sync;
logic [52:0]                       tl_cfg_sts_r;
logic [3:0]                        tl_cfg_add_r;
logic [31:0]                       tl_cfg_ctl_r;
logic [52:0]                       tl_cfg_sts_sync;
logic [3:0]                        tl_cfg_add_sync;
logic [31:0]                       tl_cfg_ctl_sync;
logic [31:0]                       addr_decode;
logic [15:0]                       cfg_add_decode;
logic [31:0]                       reg_mux_out;
logic                              avmm_read_reg;
logic                              avmm_read_rise;
logic                              avmm_read_rise_r;
logic [31:0]                       read_data_reg;  

// LTSSM info: signaldetect,lockedtodata,rate,ltssm
logic [4:0]     ltssm_reg;
logic           ltssmfifo_wrreq;
logic           ltssmfifo_rdreq;
logic [31:0]    ltssmfifo_dataout;
logic [4:0]     ltssmfifo_wrusedw;
logic [31:0]    ltssmfifo_datain;
logic           ltssmfifo_wrfull;
logic           ltssmfifo_rdempty;

logic [31:0]cfg_dev_reg;        // Device Status & Control
logic [31:0]cfg_lnk_reg;        // Link Status & Control
logic [31:0]cfg_slot_reg;       // Slot Status
logic [31:0]cfg_rt_ctl_reg;     // Root Control
logic [31:0]cfg_rt_sta_reg;     // Root Status
logic [31:0]cfg_devii_reg;      // Device Status & Control 2
logic [31:0]cfg_lnkii_reg;      // Link Status & Control 2

/* ================================================================ */
/* Address decode */
/* ================================================================ */
always_comb begin
   case (avmm_address_i)
      // yixu - TODO: clarify address assignment
      10'h200 : addr_decode[31:0] = 32'h0000_0001;
      10'h201 : addr_decode[31:0] = 32'h0000_0002; 
      10'h202 : addr_decode[31:0] = 32'h0000_0004;
      10'h203 : addr_decode[31:0] = 32'h0000_0008; 
      10'h204 : addr_decode[31:0] = 32'h0000_0010;
      10'h205 : addr_decode[31:0] = 32'h0000_0020;
      10'h206 : addr_decode[31:0] = 32'h0000_0040;
      10'h207 : addr_decode[31:0] = 32'h0000_0080;
      10'h208 : addr_decode[31:0] = 32'h0000_0100;
      default : addr_decode[31:0] = 32'h0;
   endcase

   case (tl_cfg_add_sync)
      4'h0    : cfg_add_decode    = 16'h0001;
      4'h1    : cfg_add_decode    = 16'h0002;
      4'h2    : cfg_add_decode    = 16'h0004;
      4'h3    : cfg_add_decode    = 16'h0008;
      4'h4    : cfg_add_decode    = 16'h0010;
      4'h5    : cfg_add_decode    = 16'h0020;
      4'h6    : cfg_add_decode    = 16'h0040;
      4'h7    : cfg_add_decode    = 16'h0080;
      4'h8    : cfg_add_decode    = 16'h0100;
      4'h9    : cfg_add_decode    = 16'h0200;
      4'ha    : cfg_add_decode    = 16'h0400;
      4'hb    : cfg_add_decode    = 16'h0800;
      4'hc    : cfg_add_decode    = 16'h1000;
      4'hd    : cfg_add_decode    = 16'h2000;
      4'he    : cfg_add_decode    = 16'h4000;
      4'hf    : cfg_add_decode    = 16'h8000;
      default : cfg_add_decode    = 16'h0;
   endcase
end  
always_comb begin
   case (addr_decode[7:0])
      8'h0001:	reg_mux_out = ltssmfifo_dataout;
      8'h0002:	reg_mux_out = cfg_dev_reg; 
      8'h0004:	reg_mux_out = cfg_lnk_reg; 
      8'h0008:	reg_mux_out = cfg_slot_reg; 
      8'h0010:	reg_mux_out = cfg_rt_ctl_reg;
      8'h020:	reg_mux_out = cfg_rt_sta_reg; 
      8'h040:	reg_mux_out = cfg_devii_reg;
      8'h080:	reg_mux_out = cfg_lnkii_reg; 
      default:	reg_mux_out = 8'h0;
   endcase
end

/* ================================================================ */
/* Input capture */
/* ================================================================ */
// LTSSM state
always_ff @(posedge pld_clk_i or negedge pld_rstn_i) begin
	if(~pld_rstn_i)
		ltssm_reg <= 5'h0;
	else
		ltssm_reg <= ltssmstate_i;
end 
// Synchronizer - to pld_clk
always_ff @(posedge pld_clk_i or negedge pld_rstn_i) begin
   if (~pld_rstn_i) begin
	   signaldetect_r    <= {LANES{1'h0}};
		is_lockedtodata_r <= {LANES{1'h0}};
   end
	else begin
	   signaldetect_r       <= signaldetect_i;
		signaldetect_sync    <= signaldetect_r;
		is_lockedtodata_r    <= is_lockedtodata_i;
		is_lockedtodata_sync <= is_lockedtodata_r;
	end
end
// Synchronizer - pld_clk to avmm_clk
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
   if (~avmm_rstn_i) begin
      tl_cfg_sts_r <= 53'h0;
		tl_cfg_add_r <= 4'h0;
		tl_cfg_ctl_r <= 32'h0;
	end
   else begin
	   tl_cfg_sts_r    <= tl_cfg_sts_i;
		tl_cfg_sts_sync <= tl_cfg_sts_r;
		tl_cfg_add_r    <= tl_cfg_add_i;
		tl_cfg_add_sync <= tl_cfg_add_r;
		tl_cfg_ctl_r    <= tl_cfg_ctl_i;
		tl_cfg_ctl_sync <= tl_cfg_ctl_r;
	end
end

/* Use FIFO to store LTSSM state along with 
 * {signaldetect, lockedtodata, currentspeed, ltssmstate} 
 * Discard ealiest info if FIFO is full. */
assign	ltssmfifo_datain		= (LANES==8)? {9'h0,signaldetect_sync,is_lockedtodata_sync,currentspeed_i,ltssmstate_i}:
										  (LANES==4)? {13'h0,signaldetect_sync,4'h0,is_lockedtodata_sync,currentspeed_i,ltssmstate_i}:
										  (LANES==2)? {15'h0,signaldetect_sync,6'h0,is_lockedtodata_sync,currentspeed_i,ltssmstate_i}:
										  (LANES==1)? {16'h0,signaldetect_sync,7'h0,is_lockedtodata_sync,currentspeed_i,ltssmstate_i}: 32'h0;
assign	ltssmfifo_wrreq		= (ltssm_reg != ltssmstate_i); 
assign	ltssmfifo_rdreq		= (addr_decode[0] & avmm_read_rise) | ltssmfifo_wrfull; 

clockcross_fifo ltssm_fifo (
	.aclr			(~pld_rstn_i),
	.data			(ltssmfifo_datain),
	.rdclk		(avmm_clk_i),
	.rdreq		(ltssmfifo_rdreq),
	.wrclk		(pld_clk_i),
	.wrreq		(ltssmfifo_wrreq),
	.q				(ltssmfifo_dataout),
	.rdempty		(ltssmfifo_rdempty),
	.wrfull		(ltssmfifo_wrfull),
	.wrusedw		(ltssmfifo_wrusedw)
);
		
/* ================================================================ */
/* Registers definition */
/* ================================================================ */ 
// Device status & control
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_dev_reg <= 32'h0;
	else begin
		if (cfg_add_decode[0])
			cfg_dev_reg[15:0] <= tl_cfg_ctl_sync[31:16];
		cfg_dev_reg[31:16] <= {12'h0,tl_cfg_sts_sync[52:49]};
	end
end 
// Link status & control
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_lnk_reg <= 32'h0;
	else begin
		if (cfg_add_decode[2])
			cfg_lnk_reg[15:0] <= tl_cfg_ctl_sync[31:16];
		cfg_lnk_reg[31:16] <= tl_cfg_sts_sync[46:31];
	end
end 
// Slot status
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_slot_reg <= 32'h0;
	else if (cfg_add_decode[1])
		cfg_slot_reg <= {tl_cfg_ctl_sync[15:0],16'h0};
end 
// Root cap & control
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_rt_ctl_reg <= 32'h0;
	else if (cfg_add_decode[3])
		cfg_rt_ctl_reg <= {16'h0,tl_cfg_ctl_sync[15:0]};
end 
// Root status
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_rt_sta_reg <= 32'h0;
	else
		cfg_rt_sta_reg <= {14'h0,tl_cfg_sts_sync[23:6]};
end 
// Device status & control 2
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_devii_reg <= 32'h0;
	else if (cfg_add_decode[0])
		cfg_devii_reg <= {16'h0,tl_cfg_ctl_sync[15:0]};
end 
// Link status & control 2
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		cfg_lnkii_reg <= 32'h0;
	else if (cfg_add_decode[2])
		cfg_lnkii_reg <= {15'h0,tl_cfg_sts_sync[30],tl_cfg_ctl_sync[15:0]};
end 

/* ================================================================ */
/* Produce a single-cycle pulse if these registers been accessed (R/W) 
 * Since read will asserted for 2 cycles, use this to prevent
 * multiple FIFO read for each avmm_read request */
/* ================================================================ */ 
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		avmm_read_reg <= 1'b0;
	else
		avmm_read_reg <= avmm_read_i;
end   
  
assign avmm_read_rise = ~avmm_read_reg & avmm_read_i;

/* ================================================================ */  
/* Output */
/* ================================================================ */ 
always_ff @(posedge avmm_clk_i or negedge avmm_rstn_i) begin
	if(~avmm_rstn_i)
		read_data_reg <= 32'h0;
	else if(avmm_read_i)
		read_data_reg <= reg_mux_out;
	else
		read_data_reg <= 32'h0;
end 

assign avmm_readdata_o      = (avmm_address_i[9])? read_data_reg : {16'h0,avmm_readdata_hip_i};

endmodule

/* Cross clock domain FIFO */
module clockcross_fifo (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull,
	wrusedw);

	input	  aclr;
	input	[31:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[31:0]  q;
	output	  rdempty;
	output	  wrfull;
	output	[4:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  sub_wire0;
	wire [31:0] sub_wire1;
	wire  sub_wire2;
	wire [4:0] sub_wire3;
	wire  wrfull = sub_wire0;
	wire [31:0] q = sub_wire1[31:0];
	wire  rdempty = sub_wire2;
	wire [4:0] wrusedw = sub_wire3[4:0];

	dcfifo	dcfifo_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.wrusedw (sub_wire3),
				.rdfull (),
				.rdusedw (),
				.wrempty ());
	defparam
		dcfifo_component.intended_device_family = "Stratix V",
		dcfifo_component.lpm_numwords = 32,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 32,
		dcfifo_component.lpm_widthu = 5,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 5;


endmodule
