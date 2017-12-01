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

// baeckler 11-05-2012

`timescale 1ps / 1ps

module sl3p_2ln_tb ();

parameter LANES = 2;
parameter RST_CNTR_BITS = 6;

// no domain
reg sys_arst = 1'b0;
reg sloop = 1'b0;

// pins
reg pll_ref_clk = 1'b0;
wire [LANES-1:0] tx_pin;
wire [LANES-1:0] rx_pin;

// tx port
wire tx_srst;
wire tx_clk;
reg tx_tlast = 1'b0;
reg tx_tvalid = 1'b0;
reg [LANES*8-1:0] tx_tkeep = 1'b0;
reg [LANES*64-1:0] tx_tdata = 0;  // bit 0 sent first; to tx_pin[0] 
reg [5:0] tx_vcid;
reg [1:0] tx_flit_type;
wire tx_tready;
reg tx_halt = 1'b0;

// tx in band flow control
reg [7:0] tx_flow_control = 0;
reg [LANES*48-1:0] tx_user_ctrl = 0;
reg tx_user_ctrl_req = 0;
wire tx_user_ctrl_ack;
wire tx_auto_am;

reg [3:0] ctrl;
reg [8:0] req_cnt;

wire tx_hard_error;

// rx port
wire rx_srst;
wire rx_clk;
wire rx_tlast;
wire [LANES*8-1:0] rx_tkeep;
wire [5:0] rx_vcid;
wire [1:0] rx_flit_type; 
wire [LANES*64-1:0] rx_tdata;  // bit 0 sent first; from rx_pin[0] 		
wire rx_tvalid;

// rx in band flow control
wire [7:0] rx_flow_control;
wire [LANES*48-1:0] rx_user_ctrl;
wire rx_user_ctrl_valid;

wire rx_hard_error;
wire rx_soft_error;
wire rx_crc_error;
wire rx_crc_valid;
wire rx_halted;

wire [LANES-1:0] framing_err;
wire [LANES-1:0] word_lock;
wire deskew_locked;

// reconfig port
reg           mgmt_clk_clk = 1'b0;  // also used for reset sequencing
reg   [6:0]   reconfig_mgmt_address = 0;
reg           reconfig_mgmt_read = 0;
wire  [31:0]  reconfig_mgmt_readdata;
wire          reconfig_mgmt_waitrequest;
reg           reconfig_mgmt_write = 0;
reg   [31:0]  reconfig_mgmt_writedata = 0;    

/////////////////////////////////////////////
// disturb the propagation delay...

genvar g;
generate
for (g=0; g<LANES; g=g+1) begin : lag
    reg [9:0] lag_dist;
    initial lag_dist = $random;
    reg [1023:0] lags = 0;
    always begin
        #5 lags = (lags << 1) | tx_pin[g];
    end
    assign rx_pin[g] = lags[lag_dist];
end
endgenerate

/////////////////////////////////////////////
// dut

sl3p_2ln dut (
	.*
);
defparam dut .RST_CNTR_BITS = RST_CNTR_BITS;

/////////////////////////////////////////////
// provide some tx data

reg tx_test_pattern = 1'b0;
reg [1:0] tx_rbits = 0;
reg [4:0] tx_serial = 0;

always @(posedge tx_clk) begin
	if (tx_srst) begin
		tx_tdata <= 0;
		tx_tkeep <= 0;
		tx_tvalid <= 1'b0;
		tx_tlast <= 1'b0;		
		tx_serial <= 1'b0;
    tx_vcid <= 6'd0;
    tx_flit_type <= 2'd0;
	end
	else begin
		tx_rbits <= $random;
		if (tx_tready) begin
			
			if (tx_test_pattern) begin
				if (!tx_tlast) begin
					tx_tdata <= 128'h0;
					tx_tvalid <= 1'b1;
					tx_tlast <= 1'b1;
          // BKK test new inputs
          tx_vcid <= tx_vcid + 1;
          tx_flit_type <= tx_flit_type + 1;
					tx_tkeep <= {LANES{8'h00}};
				end
				else begin
					tx_tdata <= 128'h64656c7461202020_636861726c696520;
					tx_tvalid <= 1'b1;
					tx_tlast <= 1'b0;
					tx_tkeep <= {LANES{8'hff}};				
				end	
			end
			else begin			
				case (tx_rbits) 
					2'b00 : begin
						// TX user not ready
						tx_tdata <= 0;
						tx_tkeep <= 0;
						tx_tvalid <= 1'b0;
						tx_tlast <= 1'b0;
					end		
					2'b01 : begin
						// data words
						tx_tdata <= {LANES{"data    "}};
						tx_tdata[7:0] <= tx_serial + "A";
						tx_serial <= (tx_serial + 1'b1) % 26;
						tx_tkeep <= {LANES{8'hff}};
						tx_tvalid <= 1'b1;
						tx_tlast <= 1'b0;
					end		
					2'b10 : begin
						// finish with additional data
						tx_tdata <= {64'h0,"final wd"};
						tx_tkeep <= {8'h0,8'hff};
						tx_tvalid <= 1'b1;
						tx_tlast <= 1'b1;
            //BKK test new inputs
            tx_vcid <= tx_vcid + 1;
            tx_flit_type <= tx_flit_type + 1;
					end		
					2'b11 : begin
						// finish right away
						tx_tdata <= {64'h0,64'h0};
						tx_tkeep <= {8'h0,8'h0};
						tx_tvalid <= 1'b1;
						tx_tlast <= 1'b1;
            //BKK test new inputs
            tx_vcid <= tx_vcid + 1;
            tx_flit_type <= tx_flit_type + 1;            
					end		
				endcase
			end
		end
	end
end

//initial 
//begin
//  tx_user_ctrl = 96'h0;
//  tx_user_ctrl_req = 1'b0;
//  #50000000;
//  tx_user_ctrl = 96'h111111111111111111111111;
//  tx_user_ctrl_req = 1'b1; 
//  #3200;
//  tx_user_ctrl = 96'h222222222222222222222222;
//  #3200;
//  tx_user_ctrl = 96'h333333333333333333333333;
//  tx_user_ctrl_req = 1'b0;
//end
  
// thow out some User Control data and a few manual requests
always @(posedge tx_clk) begin
  if (tx_srst) begin
    tx_user_ctrl = 96'h111111111111111111111111;
    tx_user_ctrl_req = 1'b0;
    req_cnt <= 10'b0;
    ctrl <= 10'b0;
  end
  else if ($time < 50000000) begin
    tx_user_ctrl = 96'h111111111111111111111111;
  end else if ($time < 60000000) begin
    if (tx_user_ctrl_ack) begin
      if (ctrl == 3) begin
        // test a back-to-back request
        tx_user_ctrl_req <= 1'b1;
        tx_user_ctrl = {92'h12345678901234567890000, ctrl};
        ctrl <= ctrl + 1;
      end else
        tx_user_ctrl_req <= 1'b0;
    end else begin
      if (req_cnt == 0) begin
        tx_user_ctrl_req <= 1'b1;
        tx_user_ctrl = {92'h12345678901234567890000, ctrl};
        ctrl <= ctrl + 1;        
      end
      req_cnt <= req_cnt + 1; 
    end  
  end else if ($time < 70000000)
    tx_user_ctrl = 96'h111111111111111111111111;
  else if ($time < 80000000)
    tx_user_ctrl = 96'h222222222222222222222222;    
  else if ($time < 90000000)
    tx_user_ctrl = 96'h333333333333333333333333;      
  else if ($time < 100000000)
    tx_user_ctrl = 96'h444444444444444444444444;     
end

initial begin
	#1 sys_arst = 1'b1;
	#10000 sys_arst = 1'b0;
end


/////////////////////////////////////////////
// sniff the RX stream

reg [7:0] rx_expected = 0;
reg fail = 1'b0;

always @(posedge rx_clk) begin
	if (rx_srst) begin
		rx_expected <= 0;
	end
	else begin
		if (rx_tvalid && rx_tkeep[0]) begin
			if (rx_tdata[7:0] >= "A" && rx_tdata[7:0] <= "Z") begin
				if (rx_tdata[7:0] != rx_expected) begin
					if (rx_expected != 0) begin
						$display ("Problem with RX data sequence at time %d",$time);
						fail = 1'b1;
					end
				end
				rx_expected <= (((rx_tdata[7:0] - "A") + 1) % 26) + "A";
			end
		end	
	end
end

/////////////////////////////////////////////
// exercise the flow control communication

reg [7:0] previous_rx_flow_control = 0;
reg [15:0] fc_cycles = 0;

always @(posedge rx_clk) begin
	if (rx_srst) begin
		// wait
	end
	else begin
		if (!tx_test_pattern) begin
			if (rx_flow_control == tx_flow_control) begin
				// success - change it
				fc_cycles = fc_cycles + 1'b1;
				@(negedge tx_clk);
				previous_rx_flow_control = rx_flow_control;
				tx_flow_control = $random;
			end	
			else begin
				if (rx_flow_control == previous_rx_flow_control) begin
					// hasn't updated yet.
				end	
				else begin
					$display ("Error - RX flow control is neither new or previous value");
					fail = 1'b1;
				end
			end	
		end
	end
end

/////////////////////////////////////////////
// clocks

always begin
	#5000 mgmt_clk_clk = ~mgmt_clk_clk;
end

always begin
//	#776 pll_ref_clk = ~pll_ref_clk;
	#800 pll_ref_clk = ~pll_ref_clk; 
end

initial begin
	#1 sys_arst = 1'b1;
	#10000 sys_arst = 1'b0;
end

endmodule