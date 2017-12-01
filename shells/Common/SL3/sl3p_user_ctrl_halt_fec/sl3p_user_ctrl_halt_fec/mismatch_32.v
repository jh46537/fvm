// baeckler - 11-11-12
// latency 3

module mismatch_32 #(
	parameter TARGET_CHIP = 2
)(
	input clk,
	input [31:0] din_a,
	input [31:0] din_b,
	input din_valid,
	output reg mismatch
);

wire match0;
eq_18 eq0 (
	.clk(clk),
	.din_a({2'b0,din_a[15:0]}),
	.din_b({2'b0,din_b[15:0]}),
	.match(match0)
);
defparam eq0 .TARGET_CHIP = TARGET_CHIP;

wire match1;
eq_18 eq1 (
	.clk(clk),
	.din_a({2'b0,din_a[31:16]}),
	.din_b({2'b0,din_b[31:16]}),
	.match(match1)
);
defparam eq1 .TARGET_CHIP = TARGET_CHIP;

reg [1:0] din_valid_r = 2'b0;
always @(posedge clk) din_valid_r <= {din_valid_r[0],din_valid};

always @(posedge clk) begin
	mismatch <= din_valid_r[1] && (!match0 || !match1);
end

endmodule