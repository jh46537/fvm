module crc32_d64_sig_x1 #(
    parameter TARGET_CHIP = 2
)(
    input clk,
    input [63:0] d, // used left to right, lsbit first per byte
    output [31:0] c
);

xor_2tick x0 (.clk(clk), .dout(c[0]), .din({
        d[3], d[4], d[5], d[6], d[8], 
        d[14], d[15], d[16], d[18], d[19], d[20], 
        d[21], d[22], d[24], d[25], d[32], d[34], 
        d[36], d[37], d[38], d[39], d[40], d[41], 
        d[45], d[47], d[48], d[49], d[50], d[51], 
        d[53], d[54], d[56], d[57], d[58], d[60]})); 
defparam x0 .TARGET_CHIP = TARGET_CHIP;
defparam x0 .WIDTH = 35;

xor_2tick x1 (.clk(clk), .dout(c[1]), .din({
        d[2], d[6], d[7], d[8], d[13], 
        d[15], d[16], d[17], d[22], d[23], d[25], 
        d[31], d[32], d[33], d[34], d[35], d[41], 
        d[44], d[45], d[46], d[51], d[52], d[54], 
        d[55], d[58], d[59], d[60], d[63]})); 
defparam x1 .TARGET_CHIP = TARGET_CHIP;
defparam x1 .WIDTH = 28;

xor_2tick x2 (.clk(clk), .dout(c[2]), .din({
        d[1], d[3], d[4], d[7], d[8], 
        d[12], d[15], d[18], d[19], d[20], d[23], 
        d[25], d[30], d[31], d[33], d[36], d[37], 
        d[38], d[39], d[41], d[43], d[44], d[48], 
        d[49], d[56], d[59], d[60], d[62]})); 
defparam x2 .TARGET_CHIP = TARGET_CHIP;
defparam x2 .WIDTH = 28;

xor_2tick x3 (.clk(clk), .dout(c[3]), .din({
        d[0], d[2], d[3], d[6], d[11], 
        d[14], d[17], d[18], d[19], d[22], d[23], 
        d[24], d[29], d[30], d[32], d[35], d[36], 
        d[37], d[38], d[40], d[42], d[43], d[48], 
        d[58], d[59], d[61], d[63]})); 
defparam x3 .TARGET_CHIP = TARGET_CHIP;
defparam x3 .WIDTH = 27;

xor_2tick x4 (.clk(clk), .dout(c[4]), .din({
        d[1], d[2], d[3], d[4], d[6], 
        d[8], d[10], d[13], d[14], d[17], d[19], 
        d[20], d[24], d[25], d[28], d[29], d[32], 
        d[35], d[38], d[40], d[42], d[45], d[48], 
        d[49], d[50], d[51], d[53], d[54], d[55], 
        d[56], d[62], d[63]})); 
defparam x4 .TARGET_CHIP = TARGET_CHIP;
defparam x4 .WIDTH = 32;

xor_2tick x5 (.clk(clk), .dout(c[5]), .din({
        d[0], d[1], d[2], d[4], d[6], 
        d[7], d[8], d[9], d[12], d[13], d[14], 
        d[15], d[20], d[21], d[22], d[23], d[25], 
        d[27], d[28], d[32], d[36], d[38], d[40], 
        d[44], d[45], d[51], d[52], d[55], d[56], 
        d[57], d[58], d[60], d[61], d[62], d[63]})); 
defparam x5 .TARGET_CHIP = TARGET_CHIP;
defparam x5 .WIDTH = 35;

xor_2tick x6 (.clk(clk), .dout(c[6]), .din({
        d[0], d[1], d[3], d[5], d[6], 
        d[7], d[8], d[11], d[12], d[13], d[14], 
        d[15], d[19], d[20], d[21], d[22], d[23], 
        d[24], d[26], d[27], d[35], d[37], d[43], 
        d[44], d[47], d[50], d[51], d[54], d[55], 
        d[56], d[57], d[59], d[60], d[61], d[62]})); 
defparam x6 .TARGET_CHIP = TARGET_CHIP;
defparam x6 .WIDTH = 35;

xor_2tick x7 (.clk(clk), .dout(c[7]), .din({
        d[0], d[2], d[3], d[8], d[10], 
        d[11], d[12], d[13], d[16], d[23], d[24], 
        d[26], d[32], d[37], d[38], d[40], d[41], 
        d[42], d[43], d[45], d[46], d[47], d[48], 
        d[51], d[57], d[59], d[61]})); 
defparam x7 .TARGET_CHIP = TARGET_CHIP;
defparam x7 .WIDTH = 27;

xor_2tick x8 (.clk(clk), .dout(c[8]), .din({
        d[1], d[2], d[3], d[4], d[5], 
        d[6], d[8], d[9], d[10], d[11], d[12], 
        d[14], d[16], d[18], d[19], d[20], d[21], 
        d[23], d[24], d[31], d[32], d[34], d[38], 
        d[42], d[44], d[46], d[48], d[49], d[51], 
        d[53], d[54], d[55], d[57], d[63]})); 
defparam x8 .TARGET_CHIP = TARGET_CHIP;
defparam x8 .WIDTH = 34;

xor_2tick x9 (.clk(clk), .dout(c[9]), .din({
        d[0], d[1], d[2], d[3], d[4], 
        d[5], d[7], d[8], d[9], d[10], d[11], 
        d[13], d[17], d[18], d[19], d[20], d[22], 
        d[23], d[30], d[31], d[33], d[37], d[39], 
        d[41], d[43], d[45], d[47], d[48], d[50], 
        d[52], d[53], d[54], d[56], d[62], d[63]})); 
defparam x9 .TARGET_CHIP = TARGET_CHIP;
defparam x9 .WIDTH = 35;

xor_2tick x10 (.clk(clk), .dout(c[10]), .din({
        d[0], d[1], d[2], d[5], d[9], 
        d[10], d[12], d[14], d[17], d[20], d[23], 
        d[24], d[25], d[29], d[30], d[34], d[37], 
        d[39], d[41], d[42], d[44], d[45], d[46], 
        d[47], d[48], d[50], d[52], d[54], d[56], 
        d[57], d[58], d[60], d[61], d[62], d[63]})); 
defparam x10 .TARGET_CHIP = TARGET_CHIP;
defparam x10 .WIDTH = 35;

xor_2tick x11 (.clk(clk), .dout(c[11]), .din({
        d[0], d[1], d[3], d[5], d[6], 
        d[7], d[9], d[11], d[13], d[14], d[18], 
        d[20], d[21], d[25], d[28], d[29], d[32], 
        d[33], d[34], d[37], d[43], d[44], d[46], 
        d[47], d[48], d[50], d[54], d[58], d[59], 
        d[61], d[62], d[63]})); 
defparam x11 .TARGET_CHIP = TARGET_CHIP;
defparam x11 .WIDTH = 32;

xor_2tick x12 (.clk(clk), .dout(c[12]), .din({
        d[0], d[2], d[3], d[10], d[12], 
        d[13], d[14], d[16], d[17], d[18], d[21], 
        d[22], d[25], d[27], d[28], d[33], d[34], 
        d[37], d[38], d[39], d[40], d[41], d[42], 
        d[43], d[46], d[48], d[50], d[51], d[54], 
        d[56], d[61], d[62], d[63]})); 
defparam x12 .TARGET_CHIP = TARGET_CHIP;
defparam x12 .WIDTH = 33;

xor_2tick x13 (.clk(clk), .dout(c[13]), .din({
        d[1], d[2], d[7], d[9], d[11], 
        d[12], d[13], d[15], d[16], d[17], d[20], 
        d[21], d[24], d[26], d[27], d[31], d[32], 
        d[33], d[36], d[37], d[38], d[40], d[41], 
        d[42], d[45], d[49], d[50], d[53], d[55], 
        d[60], d[61], d[62], d[63]})); 
defparam x13 .TARGET_CHIP = TARGET_CHIP;
defparam x13 .WIDTH = 33;

xor_2tick x14 (.clk(clk), .dout(c[14]), .din({
        d[0], d[1], d[6], d[8], d[10], 
        d[11], d[12], d[14], d[16], d[19], d[20], 
        d[25], d[26], d[30], d[31], d[32], d[35], 
        d[36], d[37], d[39], d[40], d[41], d[44], 
        d[47], d[48], d[49], d[52], d[54], d[55], 
        d[59], d[60], d[61], d[62]})); 
defparam x14 .TARGET_CHIP = TARGET_CHIP;
defparam x14 .WIDTH = 33;

xor_2tick x15 (.clk(clk), .dout(c[15]), .din({
        d[0], d[5], d[7], d[9], d[10], 
        d[11], d[13], d[15], d[18], d[19], d[23], 
        d[24], d[25], d[29], d[30], d[31], d[34], 
        d[35], d[36], d[38], d[40], d[43], d[46], 
        d[47], d[48], d[51], d[53], d[54], d[55], 
        d[58], d[59], d[60], d[61], d[63]})); 
defparam x15 .TARGET_CHIP = TARGET_CHIP;
defparam x15 .WIDTH = 34;

xor_2tick x16 (.clk(clk), .dout(c[16]), .din({
        d[3], d[5], d[9], d[10], d[12], 
        d[16], d[17], d[19], d[20], d[21], d[25], 
        d[28], d[29], d[30], d[32], d[33], d[35], 
        d[36], d[38], d[40], d[41], d[42], d[46], 
        d[47], d[48], d[49], d[51], d[52], d[55], 
        d[56], d[59], d[62], d[63]})); 
defparam x16 .TARGET_CHIP = TARGET_CHIP;
defparam x16 .WIDTH = 33;

xor_2tick x17 (.clk(clk), .dout(c[17]), .din({
        d[2], d[4], d[8], d[9], d[11], 
        d[16], d[18], d[19], d[20], d[24], d[27], 
        d[28], d[29], d[31], d[32], d[34], d[35], 
        d[37], d[40], d[41], d[45], d[46], d[47], 
        d[48], d[50], d[51], d[54], d[55], d[58], 
        d[61], d[62], d[63]})); 
defparam x17 .TARGET_CHIP = TARGET_CHIP;
defparam x17 .WIDTH = 32;

xor_2tick x18 (.clk(clk), .dout(c[18]), .din({
        d[1], d[3], d[8], d[10], d[17], 
        d[18], d[19], d[23], d[26], d[27], d[28], 
        d[30], d[31], d[33], d[34], d[36], d[39], 
        d[40], d[44], d[45], d[46], d[47], d[49], 
        d[50], d[53], d[54], d[55], d[57], d[60], 
        d[61], d[62], d[63]})); 
defparam x18 .TARGET_CHIP = TARGET_CHIP;
defparam x18 .WIDTH = 32;

xor_2tick x19 (.clk(clk), .dout(c[19]), .din({
        d[0], d[2], d[9], d[16], d[17], 
        d[18], d[22], d[23], d[25], d[26], d[27], 
        d[29], d[30], d[32], d[33], d[35], d[38], 
        d[43], d[44], d[45], d[46], d[48], d[49], 
        d[52], d[53], d[54], d[55], d[56], d[59], 
        d[60], d[61], d[62]})); 
defparam x19 .TARGET_CHIP = TARGET_CHIP;
defparam x19 .WIDTH = 32;

xor_2tick x20 (.clk(clk), .dout(c[20]), .din({
        d[1], d[8], d[15], d[16], d[17], 
        d[21], d[22], d[24], d[25], d[26], d[28], 
        d[29], d[31], d[32], d[34], d[37], d[42], 
        d[43], d[44], d[45], d[47], d[48], d[51], 
        d[52], d[53], d[54], d[58], d[59], d[60], 
        d[61], d[63]})); 
defparam x20 .TARGET_CHIP = TARGET_CHIP;
defparam x20 .WIDTH = 31;

xor_2tick x21 (.clk(clk), .dout(c[21]), .din({
        d[0], d[14], d[16], d[20], d[21], 
        d[23], d[24], d[25], d[27], d[28], d[30], 
        d[31], d[33], d[36], d[39], d[41], d[42], 
        d[43], d[44], d[46], d[47], d[50], d[51], 
        d[52], d[53], d[57], d[58], d[59], d[60], 
        d[62], d[63]})); 
defparam x21 .TARGET_CHIP = TARGET_CHIP;
defparam x21 .WIDTH = 31;

xor_2tick x22 (.clk(clk), .dout(c[22]), .din({
        d[3], d[4], d[5], d[6], d[8], 
        d[13], d[14], d[16], d[18], d[21], d[25], 
        d[26], d[27], d[29], d[30], d[31], d[34], 
        d[35], d[36], d[37], d[42], d[43], d[46], 
        d[47], d[48], d[52], d[53], d[54], d[59], 
        d[60], d[61], d[62]})); 
defparam x22 .TARGET_CHIP = TARGET_CHIP;
defparam x22 .WIDTH = 32;

wire h23 = d[2] ^d[6] ^d[8] ^d[12];
xor_2tick x23 (.clk(clk), .dout(c[23]), .din({
        h23, d[13], d[14], d[15], d[16], 
        d[17], d[18], d[19], d[21], d[22], d[23], 
        d[26], d[28], d[29], d[30], d[31], d[32], 
        d[33], d[35], d[37], d[38], d[39], d[40], 
        d[42], d[46], d[47], d[48], d[49], d[50], 
        d[52], d[54], d[56], d[57], d[59], d[61], 
        d[63]})); 
defparam x23 .TARGET_CHIP = TARGET_CHIP;
defparam x23 .WIDTH = 36;

wire h24 = d[1] ^d[5] ^d[11];
xor_2tick x24 (.clk(clk), .dout(c[24]), .din({
        h24, d[12], d[13], d[14], d[16], 
        d[17], d[18], d[20], d[21], d[22], d[23], 
        d[25], d[27], d[28], d[29], d[30], d[31], 
        d[32], d[34], d[36], d[37], d[38], d[41], 
        d[45], d[46], d[47], d[48], d[49], d[51], 
        d[53], d[55], d[56], d[58], d[60], d[62], 
        d[63]})); 
defparam x24 .TARGET_CHIP = TARGET_CHIP;
defparam x24 .WIDTH = 36;

wire h25 = d[0] ^d[4] ^d[7];
xor_2tick x25 (.clk(clk), .dout(c[25]), .din({
        h25, d[10], d[11], d[12], d[13], 
        d[16], d[17], d[19], d[20], d[21], d[22], 
        d[24], d[26], d[27], d[28], d[29], d[30], 
        d[31], d[33], d[35], d[36], d[37], d[40], 
        d[44], d[45], d[46], d[47], d[48], d[50], 
        d[52], d[54], d[57], d[59], d[61], d[62], 
        d[63]})); 
defparam x25 .TARGET_CHIP = TARGET_CHIP;
defparam x25 .WIDTH = 36;

xor_2tick x26 (.clk(clk), .dout(c[26]), .din({
        d[4], d[5], d[8], d[9], d[10], 
        d[11], d[12], d[14], d[22], d[24], d[26], 
        d[27], d[28], d[29], d[30], d[31], d[35], 
        d[37], d[38], d[40], d[41], d[43], d[44], 
        d[46], d[47], d[48], d[50], d[54], d[55], 
        d[57], d[61], d[62], d[63]})); 
defparam x26 .TARGET_CHIP = TARGET_CHIP;
defparam x26 .WIDTH = 33;

xor_2tick x27 (.clk(clk), .dout(c[27]), .din({
        d[3], d[4], d[8], d[9], d[10], 
        d[11], d[13], d[21], d[23], d[25], d[26], 
        d[27], d[28], d[29], d[30], d[34], d[36], 
        d[37], d[39], d[40], d[42], d[43], d[45], 
        d[46], d[49], d[53], d[54], d[55], d[56], 
        d[60], d[61], d[62], d[63]})); 
defparam x27 .TARGET_CHIP = TARGET_CHIP;
defparam x27 .WIDTH = 33;

xor_2tick x28 (.clk(clk), .dout(c[28]), .din({
        d[2], d[3], d[7], d[8], d[9], 
        d[10], d[12], d[20], d[22], d[23], d[24], 
        d[25], d[26], d[27], d[28], d[29], d[33], 
        d[35], d[36], d[38], d[41], d[42], d[44], 
        d[45], d[48], d[52], d[53], d[54], d[55], 
        d[59], d[60], d[61], d[62]})); 
defparam x28 .TARGET_CHIP = TARGET_CHIP;
defparam x28 .WIDTH = 33;

xor_2tick x29 (.clk(clk), .dout(c[29]), .din({
        d[1], d[2], d[6], d[7], d[8], 
        d[9], d[11], d[19], d[21], d[22], d[23], 
        d[24], d[25], d[26], d[27], d[28], d[32], 
        d[34], d[35], d[37], d[39], d[40], d[41], 
        d[43], d[44], d[51], d[52], d[53], d[54], 
        d[58], d[59], d[60], d[61], d[63]})); 
defparam x29 .TARGET_CHIP = TARGET_CHIP;
defparam x29 .WIDTH = 34;

xor_2tick x30 (.clk(clk), .dout(c[30]), .din({
        d[0], d[1], d[5], d[6], d[7], 
        d[8], d[10], d[18], d[20], d[21], d[22], 
        d[23], d[24], d[25], d[26], d[27], d[33], 
        d[34], d[36], d[38], d[39], d[40], d[42], 
        d[43], d[47], d[50], d[51], d[52], d[53], 
        d[55], d[57], d[58], d[59], d[60], d[62]})); 
defparam x30 .TARGET_CHIP = TARGET_CHIP;
defparam x30 .WIDTH = 35;

xor_2tick x31 (.clk(clk), .dout(c[31]), .din({
        d[0], d[4], d[5], d[6], d[7], 
        d[9], d[15], d[17], d[19], d[20], d[21], 
        d[22], d[23], d[24], d[25], d[26], d[32], 
        d[33], d[35], d[37], d[38], d[39], d[41], 
        d[42], d[46], d[49], d[50], d[51], d[52], 
        d[54], d[55], d[56], d[57], d[58], d[59], 
        d[61]})); 
defparam x31 .TARGET_CHIP = TARGET_CHIP;
defparam x31 .WIDTH = 36;

endmodule

