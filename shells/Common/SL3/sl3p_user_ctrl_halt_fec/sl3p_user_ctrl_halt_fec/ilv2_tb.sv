`timescale 1 ps / 1 ps
// baeckler - 04-10-2013

module ilv2_tb ();

parameter WIDTH = 16;
reg [WIDTH-1:0] cnt = 0;
wire [WIDTH-1:0] line;
reg clk = 1'b0;

ilv2 dut_i (
	.clk,
	.din(cnt),
	.dout(line)
);
defparam dut_i .WIDTH = WIDTH;

wire [WIDTH-1:0] recover;
dlv2 dut_d (
	.clk,
	.din(line),
	.dout(recover)
);
defparam dut_d .WIDTH = WIDTH;

always @(negedge clk) cnt <= cnt + 1'b1;

reg [WIDTH-1:0] last_cnt = 0;
reg fail = 1'b0;
always @(posedge clk) begin
	last_cnt <= cnt;
	if (recover !== last_cnt) begin
		$display ("Mismatch at time %d",$time);
		fail = 1'b1;
	end
end

initial begin
	#100000 if (!fail) $display ("PASS");
	$stop();
end

always begin
	#1000 clk = ~clk;
end

endmodule
