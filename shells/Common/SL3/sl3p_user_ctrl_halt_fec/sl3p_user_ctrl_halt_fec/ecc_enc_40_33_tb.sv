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

// baeckler - 03-17-2013

module ecc_enc_40_33_tb ();

reg clk = 1'b0;

localparam SYM_WIDTH = 40;
localparam DAT_WIDTH = 33;

////////////////////////////////////////

reg [DAT_WIDTH-1:0] din = {DAT_WIDTH{1'b0}};
wire [SYM_WIDTH-1:0] dout;
reg [SYM_WIDTH-1:0] err_mask = {SYM_WIDTH{1'b0}};
    
ecc_enc_40_33 dut_e (
    .clk,
    .din,
    .dout   
);
defparam dut_e .TARGET_CHIP = 0;

wire [DAT_WIDTH-1:0] recovered;
wire dout_err, dout_fail;

ecc_dec_40_33 dut_d (
    .clk,
    .din(dout ^ err_mask),
    .dout(recovered),
    .dout_err,
    .dout_fail
);
defparam dut_d .TARGET_CHIP = 0;

////////////////////////////////////////

always @(negedge clk) begin
	din = (din << 16) ^ $random;
end

wire [DAT_WIDTH-1:0] din_lag;
delay_regs dr0 (
	.clk(clk),
	.din(din),
	.dout(din_lag)
);
defparam dr0 .WIDTH = DAT_WIDTH;
defparam dr0 .LATENCY = 6;

integer n = 0;
integer k = 0;

reg fail = 1'b0;
initial begin
	// flush out
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	// test good symbols
	for (n=0; n<500; n=n+1) begin
		@(posedge clk);
		if (din_lag !== recovered) begin
			$display ("Mismatch in good transfer at time %d",$time);
			fail = 1'b1;
		end		
		if (dout_err) begin
			$display ("Error flag in good transfer at time %d",$time);
			fail = 1'b1;
		end
	end
	
	// test fixable errors
	for (err_mask = 1; err_mask != 0; err_mask = err_mask << 1) begin
		for (n=0; n<500; n=n+1) begin
			@(posedge clk);
			if (din_lag !== recovered) begin
				$display ("Mismatch in repairable transfer at time %d",$time);
				fail = 1'b1;
			end	
			if (n > 20 && !dout_err) begin
				$display ("This should be identified as an error at time %d",$time);
				fail = 1'b1;
			end	
		end
	end
	
	// test unfixable errors
	err_mask = 3;
	for (n=0; n<500; n=n+1) begin
		@(negedge clk);
		err_mask = {err_mask[SYM_WIDTH-2:0],err_mask[SYM_WIDTH-1]}; 
		@(posedge clk);
		if (n > 20 && !dout_fail) begin
			$display ("This should be identified as an unrecovered error at time %d",$time);
			fail = 1'b1;
		end	
	end
	
	if (!fail) $display ("PASS");
	$stop();
end

always begin
	#1000 clk = ~clk;
end

endmodule
