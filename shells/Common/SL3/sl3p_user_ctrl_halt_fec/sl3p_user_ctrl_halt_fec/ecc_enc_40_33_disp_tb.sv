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

module ecc_enc_40_33_disp_tb ();

parameter TARGET_CHIP = 0;

//////////////////////////////////////////////////////////
// ecc encoder

reg clk = 1'b0;
reg [32:0] din = 0;
wire [39:0] dout; 

ecc_enc_40_33 dut (
    .clk(clk),
    .din(din),
    .dout(dout)
);
defparam dut .TARGET_CHIP = TARGET_CHIP;
defparam dut .PINVERT = 1'b1;

integer n = 0, k = 0;
integer ones = 0;

integer highest_ones = 0;
integer lowest_ones = 40;

always @(posedge clk) begin
	#1 
	ones = 0;
	for (n=0; n<40; n=n+1) begin
		ones = ones + dout[n];
	end
	if (ones > highest_ones) highest_ones = ones;
	if (ones < lowest_ones) lowest_ones = ones;	
end


initial begin
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);

	highest_ones = 0;
	lowest_ones = 40;

	din = {33{1'b1}};
	@(negedge clk);
	din[0] = 1'b0;
	for (k=1; k<33; k=k+1) begin
		@(negedge clk);
		din = {din[31:0],din[32]};
	end	

	@(negedge clk);
	din = {33{1'b1}};
	@(negedge clk);
	din[0] = 1'b0;
	din[1] = 1'b0;
	for (k=1; k<33; k=k+1) begin
		@(negedge clk);
		din = {din[31:0],din[32]};
	end	

	@(negedge clk);
	din = {33{1'b0}};
	@(negedge clk);
	din[0] = 1'b1;
	for (k=1; k<33; k=k+1) begin
		@(negedge clk);
		din = {din[31:0],din[32]};
	end	

	@(negedge clk);
	din = {33{1'b0}};
	@(negedge clk);
	din[0] = 1'b1;
	din[1] = 1'b1;
	for (k=1; k<33; k=k+1) begin
		@(negedge clk);
		din = {din[31:0],din[32]};
	end	
		
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);

	for (k=0; k<10000; k=k+1) begin
		@(negedge clk);
		din = {$random,$random} | {$random,$random} | {$random,$random} | {$random,$random};
	end	
	
	for (k=0; k<10000; k=k+1) begin
		@(negedge clk);
		din = {$random,$random} & {$random,$random} & {$random,$random} & {$random,$random};
	end	
	
	if (highest_ones == 37 && lowest_ones == 3) $display ("PASS");
	$stop();

end

always begin 
	#1000 clk = ~clk;
end


endmodule