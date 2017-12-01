`timescale 1 ps / 1 ps
// baeckler - 04-10-2013

module ilv2 #(
	parameter WIDTH = 40
)(
	input clk,
	input [WIDTH-1:0] din,
	output [WIDTH-1:0] dout
);

wire [(WIDTH/2)-1:0] din_low, din_high;
assign {din_high,din_low} = din;

reg [(WIDTH/2)-1:0] prev_high = {WIDTH{1'b0}};
always @(posedge clk) begin
	prev_high <= din_high;
end

mix_odd_even moe (
	.din({prev_high,din_low}),
	.dout(dout)
);
defparam moe .WIDTH = WIDTH;

endmodule