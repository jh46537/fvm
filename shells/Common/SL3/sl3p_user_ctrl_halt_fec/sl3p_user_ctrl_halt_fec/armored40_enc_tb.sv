`timescale 1 ps / 1 ps
// Copyright 2013 Altera Corporation. All rights reserved.  
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

// baeckler  - 04-02-2013

module armored40_enc_tb ();

reg clk = 1'b0;
reg sclr = 1'b0;
reg [32:0] din = 0;
wire [39:0] tx_sample;

////////////////////////////////////////
// encode 

armored40_enc dut_t (
	.clk,
	.sclr,
	.din,
	.dout(tx_sample)
);
defparam dut_t .TARGET_CHIP = 0;

wire [32:0] dout;
wire dout_fix,dout_fail;
reg [79:0] err_mask = 0;

////////////////////////////////////////
// decode 

reg [39:0] broken_sample = 0;
reg ping = 1'b0;
always @(posedge clk) begin
	broken_sample <= tx_sample ^ (ping ? err_mask[39:0] : err_mask[79:40]);
	ping <= ~ping;
end

armored40_dec dut_r (
	.clk,
	.din(broken_sample),
	.dout(dout),
	.dout_fix(dout_fix),
	.dout_fail(dout_fail)
);
defparam dut_r .TARGET_CHIP = 0;

////////////////////////////////////////
// mimic delay

wire [32:0] din_lag;
delay_regs dr0 (
	.clk,
	.din,
	.dout(din_lag)
);
defparam dr0 .WIDTH = 33;
defparam dr0 .LATENCY = 10;

////////////////////////////////////////
// stim

reg flushing = 1'b1;

initial begin
	sclr = 1'b1;
	@(negedge clk);
	@(negedge clk);
	sclr = 1'b0;
	
	// let it flush and sync up
	@(negedge clk);	@(negedge clk);	@(negedge clk);	@(negedge clk);
	@(negedge clk);	@(negedge clk);	@(negedge clk);	@(negedge clk);
	@(negedge clk);	@(negedge clk);	@(negedge clk);	@(negedge clk);
	
	flushing = 1'b0;
end

always @(negedge clk) begin
	din <= din + 1'b1;
	err_mask <= {err_mask[78:0],err_mask[79]};
end

// cycle through types of error
reg fatal_allowed = 1'b0;
reg [2:0] err_cntr = 3'b0;
always begin
	#5000000 
	@(negedge clk);
	#5
	if (err_cntr == 5) fatal_allowed = 1'b1; // this is 2 bits hitting the same word
	err_mask = {err_cntr,2'b0};
	err_cntr = err_cntr + 1'b1;
end

reg previous_fail = 1'b0;
reg fail = 1'b0;
always @(posedge clk) begin
	previous_fail <= dout_fail;
	if (!flushing) begin
		if (dout_fail && !fatal_allowed) begin
			$display ("Uninjected fatal error");
			fail = 1'b1;
		end
		if (dout !== din_lag) begin
			if (dout_fail) begin
				// this is a properly identified big error						
			end
			else if (previous_fail) begin
				// this is scrambler replication
			end
			else begin
				$display ("Mismatch at time %d",$time);
				$display ("Expected %x",din_lag);
				$display ("Recovered %x",dout);
				fail = 1'b1;
			end
		end	
	end
end

initial begin
	#100000000 
	if (!fail) $display ("PASS");
	$stop();
end

always begin 
	#1000 clk = ~clk;
end

endmodule