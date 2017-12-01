`timescale 1 ps / 1 ps
// baeckler - 04-10-2013

module dlv2 #(
	parameter WIDTH = 40
)(
	input clk,
	input [WIDTH-1:0] din,
	output [WIDTH-1:0] dout
);

wire [(WIDTH/2)-1:0] din_odd, din_even;
sep_odd_even soe (
	.din(din),
	.dout({din_odd,din_even})
);
defparam soe .WIDTH = WIDTH;

reg [(WIDTH/2)-1:0] prev_even = {WIDTH{1'b0}};
always @(posedge clk) begin
	prev_even <= din_even;
end

assign dout = {din_odd,prev_even};

endmodule