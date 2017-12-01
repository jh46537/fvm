// baeckler - 11-07-2012

module crc32_2word #(
	parameter TARGET_CHIP = 2,
	parameter LATE_LAST = 1'b0 // deliver din_last one tick late?
)(
	input clk,
	input din_valid,
	input din_last,
	input [127:0] din,
	output reg [63:0] crc		
);

////////////////////////////////////////////////////////////
// data signatures
////////////////////////////////////////////////////////////

wire [31:0] sig0;
crc32_d64_sig s0 (
    .clk(clk),
    .d(din[63:0]), // used left to right, lsbit first per byte
    .c(sig0)
);
defparam s0 .TARGET_CHIP = TARGET_CHIP;

wire [31:0] sig1;
crc32_d64_sig s1 (
    .clk(clk),
    .d(din[127:64]), // used left to right, lsbit first per byte
    .c(sig1)
);
defparam s1 .TARGET_CHIP = TARGET_CHIP;

wire [31:0] sig0x1;
crc32_d64_sig_x1 s0x (
    .clk(clk),
    .d(din[63:0]), // used left to right, lsbit first per byte
    .c(sig0x1)
);
defparam s0x .TARGET_CHIP = TARGET_CHIP;

////////////////////////////////////////////////////////////
// combine terms
////////////////////////////////////////////////////////////

reg [31:0] prev_crc = 32'h0;
wire [31:0] c0w,c1w;

crc32_z64_xn_unreg e1 (
    .force_vcc(1'b0),   // change the result to all 1
    .xtra0(32'h0), // xor with result
    .xtra1(sig0), // xor with result
    .d(prev_crc), // previous CRC
    .c(c0w)  // evolved through 64 bits of zero data x 0 rounds
);
defparam e1 .TARGET_CHIP = TARGET_CHIP;
defparam e1 .NUM_EVOS = 1;

wire prev_ff;
crc32_z64_xn_unreg e2 (
    .force_vcc(1'b0),   // change the result to all 1
    .xtra0(sig0x1), // xor with result
    .xtra1(sig1), // xor with result
    .d(prev_crc), // previous CRC
    .c(c1w)  // evolved through 64 bits of zero data x 0 rounds
);
defparam e2 .TARGET_CHIP = TARGET_CHIP;
defparam e2 .NUM_EVOS = 2;

initial crc = 32'h0;
reg din_last_r = 1'b0;
reg sig_last = 1'b0;
reg din_valid_r = 1'b0;
reg sig_valid = 1'b0;

always @(posedge clk) begin
	din_last_r <= din_last;
	sig_last <= (LATE_LAST ? din_last : din_last_r);
	din_valid_r <= din_valid;
	sig_valid <= din_valid_r;	
	if (sig_valid) prev_crc <= prev_ff ? 32'hffffffff : c1w;
	crc <= {c1w,c0w};
end
assign prev_ff = sig_last;

endmodule

// BENCHMARK INFO :  5SGXEA7N2F45C2ES
// BENCHMARK INFO :  Max depth :  3.0 LUTs
// BENCHMARK INFO :  Total registers : 728
// BENCHMARK INFO :  Total pins : 194
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.413 ns, From prev_crc[10]~DUPLICATE, To prev_crc[10]~DUPLICATE}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.230 ns, From prev_crc[1]~DUPLICATE, To prev_crc[3]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.261 ns, From prev_crc[17]~DUPLICATE, To prev_crc[23]}
