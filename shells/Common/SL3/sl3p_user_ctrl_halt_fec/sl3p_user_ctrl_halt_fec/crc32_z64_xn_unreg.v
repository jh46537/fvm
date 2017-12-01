module crc32_z64_xn_unreg #(
    parameter TARGET_CHIP = 2,
    parameter NUM_EVOS = 1
)(
    input force_vcc,   // change the result to all 1
    input [31:0] xtra0, // xor with result
    input [31:0] xtra1, // xor with result
    input [31:0] d, // previous CRC
    output [31:0] c  // evolved through 64 bits of zero data x 0 rounds
);
generate

/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 1) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[2], d[5], d[12], d[13], 
            d[15], d[16], d[18], d[21], d[22], d[23], 
            d[26], d[28], d[29], d[31]})); 
    defparam x0 .WIDTH = 17;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[2], d[3], d[5], d[6], 
            d[12], d[14], d[15], d[17], d[18], d[19], 
            d[21], d[24], d[26], d[27], d[28], d[30], 
            d[31]})); 
    defparam x1 .WIDTH = 20;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[3], d[4], d[5], d[6], 
            d[7], d[12], d[19], d[20], d[21], d[23], 
            d[25], d[26], d[27]})); 
    defparam x2 .WIDTH = 16;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[4], d[5], d[6], 
            d[7], d[8], d[13], d[20], d[21], d[22], 
            d[24], d[26], d[27], d[28]})); 
    defparam x3 .WIDTH = 17;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[6], d[7], d[8], d[9], 
            d[12], d[13], d[14], d[15], d[16], d[18], 
            d[25], d[26], d[27], d[31]})); 
    defparam x4 .WIDTH = 17;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[5], d[7], d[8], d[9], d[10], 
            d[12], d[14], d[17], d[18], d[19], d[21], 
            d[22], d[23], d[27], d[29], d[31]})); 
    defparam x5 .WIDTH = 18;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[6], d[8], d[9], d[10], d[11], 
            d[13], d[15], d[18], d[19], d[20], d[22], 
            d[23], d[24], d[28], d[30]})); 
    defparam x6 .WIDTH = 17;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[2], d[5], d[7], d[9], 
            d[10], d[11], d[13], d[14], d[15], d[18], 
            d[19], d[20], d[22], d[24], d[25], d[26], 
            d[28]})); 
    defparam x7 .WIDTH = 20;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[2], d[3], d[5], 
            d[6], d[8], d[10], d[11], d[13], d[14], 
            d[18], d[19], d[20], d[22], d[25], d[27], 
            d[28], d[31]})); 
    defparam x8 .WIDTH = 21;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[7], d[9], d[11], d[12], d[14], 
            d[15], d[19], d[20], d[21], d[23], d[26], 
            d[28], d[29]})); 
    defparam x9 .WIDTH = 21;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[3], d[4], d[7], 
            d[8], d[10], d[18], d[20], d[23], d[24], 
            d[26], d[27], d[28], d[30], d[31]})); 
    defparam x10 .WIDTH = 18;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[1], d[4], d[8], d[9], d[11], 
            d[12], d[13], d[15], d[16], d[18], d[19], 
            d[22], d[23], d[24], d[25], d[26], d[27]})); 
    defparam x11 .WIDTH = 19;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[9], d[10], d[14], d[15], d[17], 
            d[18], d[19], d[20], d[21], d[22], d[24], 
            d[25], d[27], d[29], d[31]})); 
    defparam x12 .WIDTH = 17;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[10], d[11], d[15], d[16], 
            d[18], d[19], d[20], d[21], d[22], d[23], 
            d[25], d[26], d[28], d[30]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[11], d[12], d[16], 
            d[17], d[19], d[20], d[21], d[22], d[23], 
            d[24], d[26], d[27], d[29], d[31]})); 
    defparam x14 .WIDTH = 18;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[2], d[12], d[13], d[17], 
            d[18], d[20], d[21], d[22], d[23], d[24], 
            d[25], d[27], d[28], d[30]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[3], d[5], d[12], d[14], 
            d[15], d[16], d[19], d[24], d[25]})); 
    defparam x16 .WIDTH = 12;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[1], d[4], d[6], d[13], d[15], 
            d[16], d[17], d[20], d[25], d[26]})); 
    defparam x17 .WIDTH = 12;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[2], d[5], d[7], d[14], 
            d[16], d[17], d[18], d[21], d[26], d[27]})); 
    defparam x18 .WIDTH = 13;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[3], d[6], d[8], 
            d[15], d[17], d[18], d[19], d[22], d[27], 
            d[28]})); 
    defparam x19 .WIDTH = 14;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[1], d[2], d[4], d[7], d[9], 
            d[16], d[18], d[19], d[20], d[23], d[28], 
            d[29]})); 
    defparam x20 .WIDTH = 14;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[2], d[3], d[5], d[8], d[10], 
            d[17], d[19], d[20], d[21], d[24], d[29], 
            d[30]})); 
    defparam x21 .WIDTH = 14;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[2], d[3], d[4], d[5], d[6], 
            d[9], d[11], d[12], d[13], d[15], d[16], 
            d[20], d[23], d[25], d[26], d[28], d[29], 
            d[30]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[2], d[3], d[4], d[6], d[7], 
            d[10], d[14], d[15], d[17], d[18], d[22], 
            d[23], d[24], d[27], d[28], d[30]})); 
    defparam x23 .WIDTH = 18;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[0], d[3], d[4], d[5], d[7], 
            d[8], d[11], d[15], d[16], d[18], d[19], 
            d[23], d[24], d[25], d[28], d[29], d[31]})); 
    defparam x24 .WIDTH = 19;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[1], d[4], d[5], d[6], d[8], 
            d[9], d[12], d[16], d[17], d[19], d[20], 
            d[24], d[25], d[26], d[29], d[30]})); 
    defparam x25 .WIDTH = 18;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[6], d[7], d[9], d[10], d[12], 
            d[15], d[16], d[17], d[20], d[22], d[23], 
            d[25], d[27], d[28], d[29], d[30]})); 
    defparam x26 .WIDTH = 18;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[7], d[8], d[10], d[11], 
            d[13], d[16], d[17], d[18], d[21], d[23], 
            d[24], d[26], d[28], d[29], d[30], d[31]})); 
    defparam x27 .WIDTH = 19;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[8], d[9], d[11], d[12], 
            d[14], d[17], d[18], d[19], d[22], d[24], 
            d[25], d[27], d[29], d[30], d[31]})); 
    defparam x28 .WIDTH = 18;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[2], d[9], d[10], d[12], d[13], 
            d[15], d[18], d[19], d[20], d[23], d[25], 
            d[26], d[28], d[30], d[31]})); 
    defparam x29 .WIDTH = 17;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[3], d[10], d[11], d[13], 
            d[14], d[16], d[19], d[20], d[21], d[24], 
            d[26], d[27], d[29], d[31]})); 
    defparam x30 .WIDTH = 17;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[4], d[11], d[12], d[14], 
            d[15], d[17], d[20], d[21], d[22], d[25], 
            d[27], d[28], d[30]})); 
    defparam x31 .WIDTH = 16;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 2) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[8], d[10], d[14], d[15], d[17], 
            d[18], d[20], d[21], d[22], d[23], d[27], 
            d[29], d[30], d[31]})); 
    defparam x0 .WIDTH = 22;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[4], d[5], d[6], d[7], d[9], 
            d[10], d[11], d[14], d[16], d[17], d[19], 
            d[20], d[24], d[27], d[28], d[29]})); 
    defparam x1 .WIDTH = 18;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[2], d[3], d[6], 
            d[11], d[12], d[14], d[22], d[23], d[25], 
            d[27], d[28], d[31]})); 
    defparam x2 .WIDTH = 16;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[2], d[3], d[4], d[7], 
            d[12], d[13], d[15], d[23], d[24], d[26], 
            d[28], d[29]})); 
    defparam x3 .WIDTH = 15;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[4], d[7], d[10], d[13], 
            d[15], d[16], d[17], d[18], d[20], d[21], 
            d[22], d[23], d[24], d[25], d[31]})); 
    defparam x4 .WIDTH = 18;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[3], d[7], d[10], d[11], 
            d[15], d[16], d[19], d[20], d[24], d[25], 
            d[26], d[27], d[29], d[30], d[31]})); 
    defparam x5 .WIDTH = 18;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[2], d[4], d[8], d[11], d[12], 
            d[16], d[17], d[20], d[21], d[25], d[26], 
            d[27], d[28], d[30], d[31]})); 
    defparam x6 .WIDTH = 17;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[2], d[7], d[8], d[9], 
            d[10], d[12], d[13], d[14], d[15], d[20], 
            d[23], d[26], d[28], d[30]})); 
    defparam x7 .WIDTH = 17;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[5], d[7], d[9], d[11], 
            d[13], d[16], d[17], d[18], d[20], d[22], 
            d[23], d[24], d[30]})); 
    defparam x8 .WIDTH = 16;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[2], d[6], d[8], d[10], 
            d[12], d[14], d[17], d[18], d[19], d[21], 
            d[23], d[24], d[25], d[31]})); 
    defparam x9 .WIDTH = 17;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[2], d[5], d[8], d[9], 
            d[10], d[11], d[13], d[14], d[17], d[19], 
            d[21], d[23], d[24], d[25], d[26], d[27], 
            d[29], d[30], d[31]})); 
    defparam x10 .WIDTH = 22;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[2], d[5], d[6], d[7], d[8], 
            d[9], d[11], d[12], d[17], d[21], d[23], 
            d[24], d[25], d[26], d[28], d[29]})); 
    defparam x11 .WIDTH = 18;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[1], d[2], d[5], d[6], 
            d[9], d[12], d[13], d[14], d[15], d[17], 
            d[20], d[21], d[23], d[24], d[25], d[26], 
            d[31]})); 
    defparam x12 .WIDTH = 20;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[2], d[3], d[6], d[7], 
            d[10], d[13], d[14], d[15], d[16], d[18], 
            d[21], d[22], d[24], d[25], d[26], d[27]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[2], d[3], d[4], d[7], 
            d[8], d[11], d[14], d[15], d[16], d[17], 
            d[19], d[22], d[23], d[25], d[26], d[27], 
            d[28]})); 
    defparam x14 .WIDTH = 20;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[3], d[4], d[5], d[8], 
            d[9], d[12], d[15], d[16], d[17], d[18], 
            d[20], d[23], d[24], d[26], d[27], d[28], 
            d[29]})); 
    defparam x15 .WIDTH = 20;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[3], d[4], d[6], d[7], 
            d[8], d[9], d[13], d[14], d[15], d[16], 
            d[19], d[20], d[22], d[23], d[24], d[25], 
            d[28], d[31]})); 
    defparam x16 .WIDTH = 21;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[2], d[4], d[5], d[7], d[8], 
            d[9], d[10], d[14], d[15], d[16], d[17], 
            d[20], d[21], d[23], d[24], d[25], d[26], 
            d[29]})); 
    defparam x17 .WIDTH = 20;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[3], d[5], d[6], d[8], 
            d[9], d[10], d[11], d[15], d[16], d[17], 
            d[18], d[21], d[22], d[24], d[25], d[26], 
            d[27], d[30]})); 
    defparam x18 .WIDTH = 21;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[4], d[6], d[7], d[9], 
            d[10], d[11], d[12], d[16], d[17], d[18], 
            d[19], d[22], d[23], d[25], d[26], d[27], 
            d[28], d[31]})); 
    defparam x19 .WIDTH = 21;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[2], d[5], d[7], d[8], d[10], 
            d[11], d[12], d[13], d[17], d[18], d[19], 
            d[20], d[23], d[24], d[26], d[27], d[28], 
            d[29]})); 
    defparam x20 .WIDTH = 20;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[3], d[6], d[8], d[9], 
            d[11], d[12], d[13], d[14], d[18], d[19], 
            d[20], d[21], d[24], d[25], d[27], d[28], 
            d[29], d[30]})); 
    defparam x21 .WIDTH = 21;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[2], d[3], d[4], d[5], d[8], 
            d[9], d[12], d[13], d[17], d[18], d[19], 
            d[23], d[25], d[26], d[27], d[28]})); 
    defparam x22 .WIDTH = 18;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[13], d[15], d[17], 
            d[19], d[21], d[22], d[23], d[24], d[26], 
            d[28], d[30], d[31]})); 
    defparam x23 .WIDTH = 22;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[2], d[3], d[5], d[7], 
            d[8], d[9], d[10], d[14], d[16], d[18], 
            d[20], d[22], d[23], d[24], d[25], d[27], 
            d[29], d[31]})); 
    defparam x24 .WIDTH = 21;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[2], d[3], d[4], d[6], d[8], 
            d[9], d[10], d[11], d[15], d[17], d[19], 
            d[21], d[23], d[24], d[25], d[26], d[28], 
            d[30]})); 
    defparam x25 .WIDTH = 20;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[2], d[4], d[8], d[9], 
            d[11], d[12], d[14], d[15], d[16], d[17], 
            d[21], d[23], d[24], d[25], d[26], d[30]})); 
    defparam x26 .WIDTH = 19;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[3], d[5], d[9], 
            d[10], d[12], d[13], d[15], d[16], d[17], 
            d[18], d[22], d[24], d[25], d[26], d[27], 
            d[31]})); 
    defparam x27 .WIDTH = 20;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[3], d[4], d[6], d[10], 
            d[11], d[13], d[14], d[16], d[17], d[18], 
            d[19], d[23], d[25], d[26], d[27], d[28]})); 
    defparam x28 .WIDTH = 19;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[2], d[4], d[5], d[7], 
            d[11], d[12], d[14], d[15], d[17], d[18], 
            d[19], d[20], d[24], d[26], d[27], d[28], 
            d[29]})); 
    defparam x29 .WIDTH = 20;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[3], d[5], d[6], 
            d[8], d[12], d[13], d[15], d[16], d[18], 
            d[19], d[20], d[21], d[25], d[27], d[28], 
            d[29], d[30]})); 
    defparam x30 .WIDTH = 21;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[9], d[13], d[14], d[16], d[17], 
            d[19], d[20], d[21], d[22], d[26], d[28], 
            d[29], d[30], d[31]})); 
    defparam x31 .WIDTH = 22;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 3) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[2], d[6], d[7], d[9], 
            d[10], d[11], d[12], d[22], d[23], d[26], 
            d[28], d[30], d[31]})); 
    defparam x0 .WIDTH = 16;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[3], d[6], d[8], d[9], 
            d[13], d[22], d[24], d[26], d[27], d[28], 
            d[29], d[30]})); 
    defparam x1 .WIDTH = 15;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[4], d[6], d[11], 
            d[12], d[14], d[22], d[25], d[26], d[27], 
            d[29]})); 
    defparam x2 .WIDTH = 14;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[2], d[5], d[7], 
            d[12], d[13], d[15], d[23], d[26], d[27], 
            d[28], d[30]})); 
    defparam x3 .WIDTH = 15;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[3], d[7], d[8], d[9], d[10], 
            d[11], d[12], d[13], d[14], d[16], d[22], 
            d[23], d[24], d[26], d[27], d[29], d[30]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[2], d[4], d[6], d[7], 
            d[8], d[13], d[14], d[15], d[17], d[22], 
            d[24], d[25], d[26], d[27]})); 
    defparam x5 .WIDTH = 17;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[2], d[3], d[5], d[7], 
            d[8], d[9], d[14], d[15], d[16], d[18], 
            d[23], d[25], d[26], d[27], d[28]})); 
    defparam x6 .WIDTH = 18;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[2], d[3], d[4], d[7], d[8], 
            d[11], d[12], d[15], d[16], d[17], d[19], 
            d[22], d[23], d[24], d[27], d[29], d[30], 
            d[31]})); 
    defparam x7 .WIDTH = 20;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[7], d[8], d[10], d[11], 
            d[13], d[16], d[17], d[18], d[20], d[22], 
            d[24], d[25], d[26]})); 
    defparam x8 .WIDTH = 22;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[11], d[12], 
            d[14], d[17], d[18], d[19], d[21], d[23], 
            d[25], d[26], d[27]})); 
    defparam x9 .WIDTH = 22;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[3], d[4], d[5], 
            d[8], d[11], d[13], d[15], d[18], d[19], 
            d[20], d[23], d[24], d[27], d[30], d[31]})); 
    defparam x10 .WIDTH = 19;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[4], d[5], d[7], d[10], 
            d[11], d[14], d[16], d[19], d[20], d[21], 
            d[22], d[23], d[24], d[25], d[26], d[30]})); 
    defparam x11 .WIDTH = 19;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[2], d[5], d[7], d[8], d[9], 
            d[10], d[15], d[17], d[20], d[21], d[24], 
            d[25], d[27], d[28], d[30]})); 
    defparam x12 .WIDTH = 17;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[3], d[6], d[8], d[9], d[10], 
            d[11], d[16], d[18], d[21], d[22], d[25], 
            d[26], d[28], d[29], d[31]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[4], d[7], d[9], d[10], 
            d[11], d[12], d[17], d[19], d[22], d[23], 
            d[26], d[27], d[29], d[30]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[1], d[5], d[8], d[10], 
            d[11], d[12], d[13], d[18], d[20], d[23], 
            d[24], d[27], d[28], d[30], d[31]})); 
    defparam x15 .WIDTH = 18;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[7], d[10], d[13], d[14], 
            d[19], d[21], d[22], d[23], d[24], d[25], 
            d[26], d[29], d[30]})); 
    defparam x16 .WIDTH = 16;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[1], d[8], d[11], d[14], d[15], 
            d[20], d[22], d[23], d[24], d[25], d[26], 
            d[27], d[30], d[31]})); 
    defparam x17 .WIDTH = 16;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[2], d[9], d[12], d[15], d[16], 
            d[21], d[23], d[24], d[25], d[26], d[27], 
            d[28], d[31]})); 
    defparam x18 .WIDTH = 15;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[3], d[10], d[13], d[16], 
            d[17], d[22], d[24], d[25], d[26], d[27], 
            d[28], d[29]})); 
    defparam x19 .WIDTH = 15;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[4], d[11], d[14], 
            d[17], d[18], d[23], d[25], d[26], d[27], 
            d[28], d[29], d[30]})); 
    defparam x20 .WIDTH = 16;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[5], d[12], 
            d[15], d[18], d[19], d[24], d[26], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x21 .WIDTH = 17;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[3], d[7], d[9], d[10], d[11], 
            d[12], d[13], d[16], d[19], d[20], d[22], 
            d[23], d[25], d[26], d[27], d[29]})); 
    defparam x22 .WIDTH = 18;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[13], d[14], d[17], 
            d[20], d[21], d[22], d[24], d[27], d[31]})); 
    defparam x23 .WIDTH = 19;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[8], d[9], d[10], d[14], d[15], 
            d[18], d[21], d[22], d[23], d[25], d[28]})); 
    defparam x24 .WIDTH = 19;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[1], d[2], d[3], d[4], d[6], 
            d[8], d[9], d[10], d[11], d[15], d[16], 
            d[19], d[22], d[23], d[24], d[26], d[29]})); 
    defparam x25 .WIDTH = 19;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[3], d[4], d[5], 
            d[6], d[16], d[17], d[20], d[22], d[24], 
            d[25], d[26], d[27], d[28], d[31]})); 
    defparam x26 .WIDTH = 18;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[4], d[5], d[6], 
            d[7], d[17], d[18], d[21], d[23], d[25], 
            d[26], d[27], d[28], d[29]})); 
    defparam x27 .WIDTH = 17;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[2], d[3], d[5], d[6], d[7], 
            d[8], d[18], d[19], d[22], d[24], d[26], 
            d[27], d[28], d[29], d[30]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[3], d[4], d[6], d[7], d[8], 
            d[9], d[19], d[20], d[23], d[25], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x29 .WIDTH = 17;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[4], d[5], d[7], d[8], 
            d[9], d[10], d[20], d[21], d[24], d[26], 
            d[28], d[29], d[30], d[31]})); 
    defparam x30 .WIDTH = 17;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[5], d[6], d[8], 
            d[9], d[10], d[11], d[21], d[22], d[25], 
            d[27], d[29], d[30], d[31]})); 
    defparam x31 .WIDTH = 17;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 4) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[2], d[3], d[4], d[6], 
            d[10], d[13], d[19], d[24], d[28], d[31]})); 
    defparam x0 .WIDTH = 13;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[2], d[5], d[6], 
            d[7], d[10], d[11], d[13], d[14], d[19], 
            d[20], d[24], d[25], d[28], d[29], d[31]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[4], d[7], d[8], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[19], d[20], d[21], d[24], d[25], d[26], 
            d[28], d[29], d[30], d[31]})); 
    defparam x2 .WIDTH = 23;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[2], d[5], d[8], d[9], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[20], d[21], d[22], d[25], d[26], d[27], 
            d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 22;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[4], d[9], d[12], d[14], 
            d[15], d[16], d[17], d[19], d[21], d[22], 
            d[23], d[24], d[26], d[27], d[30]})); 
    defparam x4 .WIDTH = 18;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[15], d[16], d[17], d[18], 
            d[19], d[20], d[22], d[23], d[25], d[27]})); 
    defparam x5 .WIDTH = 19;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[16], d[17], d[18], d[19], 
            d[20], d[21], d[23], d[24], d[26], d[28]})); 
    defparam x6 .WIDTH = 19;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[5], d[7], d[8], d[10], 
            d[13], d[17], d[18], d[20], d[21], d[22], 
            d[25], d[27], d[28], d[29], d[31]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[3], d[4], d[8], 
            d[9], d[10], d[11], d[13], d[14], d[18], 
            d[21], d[22], d[23], d[24], d[26], d[29], 
            d[30], d[31]})); 
    defparam x8 .WIDTH = 21;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[2], d[3], d[4], d[5], 
            d[9], d[10], d[11], d[12], d[14], d[15], 
            d[19], d[22], d[23], d[24], d[25], d[27], 
            d[30], d[31]})); 
    defparam x9 .WIDTH = 21;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[2], d[5], d[11], 
            d[12], d[15], d[16], d[19], d[20], d[23], 
            d[25], d[26]})); 
    defparam x10 .WIDTH = 15;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[1], d[4], d[10], d[12], d[16], 
            d[17], d[19], d[20], d[21], d[26], d[27], 
            d[28], d[31]})); 
    defparam x11 .WIDTH = 15;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[3], d[4], d[5], d[6], d[10], 
            d[11], d[17], d[18], d[19], d[20], d[21], 
            d[22], d[24], d[27], d[29], d[31]})); 
    defparam x12 .WIDTH = 18;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[4], d[5], d[6], d[7], d[11], 
            d[12], d[18], d[19], d[20], d[21], d[22], 
            d[23], d[25], d[28], d[30]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[5], d[6], d[7], d[8], 
            d[12], d[13], d[19], d[20], d[21], d[22], 
            d[23], d[24], d[26], d[29], d[31]})); 
    defparam x14 .WIDTH = 18;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[6], d[7], d[8], d[9], 
            d[13], d[14], d[20], d[21], d[22], d[23], 
            d[24], d[25], d[27], d[30]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[3], d[4], d[6], d[7], d[8], 
            d[9], d[13], d[14], d[15], d[19], d[21], 
            d[22], d[23], d[25], d[26]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[4], d[5], d[7], d[8], 
            d[9], d[10], d[14], d[15], d[16], d[20], 
            d[22], d[23], d[24], d[26], d[27]})); 
    defparam x17 .WIDTH = 18;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[5], d[6], d[8], 
            d[9], d[10], d[11], d[15], d[16], d[17], 
            d[21], d[23], d[24], d[25], d[27], d[28]})); 
    defparam x18 .WIDTH = 19;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[2], d[6], d[7], 
            d[9], d[10], d[11], d[12], d[16], d[17], 
            d[18], d[22], d[24], d[25], d[26], d[28], 
            d[29]})); 
    defparam x19 .WIDTH = 20;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[2], d[3], d[7], 
            d[8], d[10], d[11], d[12], d[13], d[17], 
            d[18], d[19], d[23], d[25], d[26], d[27], 
            d[29], d[30]})); 
    defparam x20 .WIDTH = 21;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[3], d[4], 
            d[8], d[9], d[11], d[12], d[13], d[14], 
            d[18], d[19], d[20], d[24], d[26], d[27], 
            d[28], d[30], d[31]})); 
    defparam x21 .WIDTH = 22;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[1], d[5], d[6], d[9], d[12], 
            d[14], d[15], d[20], d[21], d[24], d[25], 
            d[27], d[29]})); 
    defparam x22 .WIDTH = 15;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[3], d[4], d[7], d[15], 
            d[16], d[19], d[21], d[22], d[24], d[25], 
            d[26], d[30], d[31]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[0], d[1], d[4], d[5], d[8], 
            d[16], d[17], d[20], d[22], d[23], d[25], 
            d[26], d[27], d[31]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[1], d[2], d[5], d[6], d[9], 
            d[17], d[18], d[21], d[23], d[24], d[26], 
            d[27], d[28]})); 
    defparam x25 .WIDTH = 15;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[4], d[7], d[13], d[18], 
            d[22], d[25], d[27], d[29], d[31]})); 
    defparam x26 .WIDTH = 12;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[5], d[8], d[14], d[19], 
            d[23], d[26], d[28], d[30]})); 
    defparam x27 .WIDTH = 11;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[2], d[6], d[9], d[15], 
            d[20], d[24], d[27], d[29], d[31]})); 
    defparam x28 .WIDTH = 12;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[3], d[7], d[10], 
            d[16], d[21], d[25], d[28], d[30]})); 
    defparam x29 .WIDTH = 12;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[2], d[4], d[8], 
            d[11], d[17], d[22], d[26], d[29], d[31]})); 
    defparam x30 .WIDTH = 13;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[2], d[3], d[5], d[9], 
            d[12], d[18], d[23], d[27], d[30]})); 
    defparam x31 .WIDTH = 12;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 5) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[2], d[4], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[14], 
            d[15], d[17], d[21], d[22], d[24], d[27], 
            d[29], d[30], d[31]})); 
    defparam x0 .WIDTH = 22;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[13], d[14], d[16], d[17], d[18], 
            d[21], d[23], d[24], d[25], d[27], d[28], 
            d[29]})); 
    defparam x1 .WIDTH = 20;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[3], d[5], d[8], d[9], 
            d[10], d[11], d[12], d[18], d[19], d[21], 
            d[25], d[26], d[27], d[28], d[31]})); 
    defparam x2 .WIDTH = 18;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[4], d[6], d[9], d[10], 
            d[11], d[12], d[13], d[19], d[20], d[22], 
            d[26], d[27], d[28], d[29]})); 
    defparam x3 .WIDTH = 17;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[4], d[5], d[6], d[8], d[9], 
            d[13], d[15], d[17], d[20], d[22], d[23], 
            d[24], d[28], d[31]})); 
    defparam x4 .WIDTH = 16;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[2], d[4], d[5], d[8], 
            d[11], d[12], d[15], d[16], d[17], d[18], 
            d[22], d[23], d[25], d[27], d[30], d[31]})); 
    defparam x5 .WIDTH = 19;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[3], d[5], d[6], 
            d[9], d[12], d[13], d[16], d[17], d[18], 
            d[19], d[23], d[24], d[26], d[28], d[31]})); 
    defparam x6 .WIDTH = 19;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[8], d[9], d[11], 
            d[12], d[13], d[15], d[18], d[19], d[20], 
            d[21], d[22], d[25], d[30], d[31]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[4], d[6], d[7], d[8], 
            d[11], d[13], d[15], d[16], d[17], d[19], 
            d[20], d[23], d[24], d[26], d[27], d[29], 
            d[30]})); 
    defparam x8 .WIDTH = 20;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[2], d[5], d[7], d[8], d[9], 
            d[12], d[14], d[16], d[17], d[18], d[20], 
            d[21], d[24], d[25], d[27], d[28], d[30], 
            d[31]})); 
    defparam x9 .WIDTH = 20;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[2], d[3], d[4], d[7], d[11], 
            d[12], d[13], d[14], d[18], d[19], d[24], 
            d[25], d[26], d[27], d[28], d[30]})); 
    defparam x10 .WIDTH = 18;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[2], d[3], d[5], d[6], d[7], 
            d[9], d[10], d[11], d[13], d[17], d[19], 
            d[20], d[21], d[22], d[24], d[25], d[26], 
            d[28], d[30]})); 
    defparam x11 .WIDTH = 21;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[2], d[3], d[9], d[15], d[17], 
            d[18], d[20], d[23], d[24], d[25], d[26], 
            d[30]})); 
    defparam x12 .WIDTH = 14;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[3], d[4], d[10], d[16], d[18], 
            d[19], d[21], d[24], d[25], d[26], d[27], 
            d[31]})); 
    defparam x13 .WIDTH = 14;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[4], d[5], d[11], d[17], d[19], 
            d[20], d[22], d[25], d[26], d[27], d[28]})); 
    defparam x14 .WIDTH = 13;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[5], d[6], d[12], d[18], d[20], 
            d[21], d[23], d[26], d[27], d[28], d[29]})); 
    defparam x15 .WIDTH = 13;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[2], d[4], d[8], d[9], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[17], d[19], d[28], d[31]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[3], d[5], d[9], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[16], d[18], d[20], d[29]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[2], d[4], d[6], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[16], d[17], d[19], d[21], d[30]})); 
    defparam x18 .WIDTH = 18;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[2], d[3], d[5], d[7], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[17], d[18], d[20], d[22], d[31]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[12], d[13], d[14], d[15], d[16], 
            d[17], d[18], d[19], d[21], d[23]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[1], d[3], d[4], d[5], d[7], 
            d[9], d[13], d[14], d[15], d[16], d[17], 
            d[18], d[19], d[20], d[22], d[24]})); 
    defparam x21 .WIDTH = 18;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[5], d[7], d[9], d[11], d[12], 
            d[16], d[18], d[19], d[20], d[22], d[23], 
            d[24], d[25], d[27], d[29], d[30], d[31]})); 
    defparam x22 .WIDTH = 19;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[2], d[4], d[7], d[9], 
            d[11], d[13], d[14], d[15], d[19], d[20], 
            d[22], d[23], d[25], d[26], d[27], d[28], 
            d[29]})); 
    defparam x23 .WIDTH = 20;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[3], d[5], d[8], d[10], 
            d[12], d[14], d[15], d[16], d[20], d[21], 
            d[23], d[24], d[26], d[27], d[28], d[29], 
            d[30]})); 
    defparam x24 .WIDTH = 20;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[2], d[4], d[6], d[9], 
            d[11], d[13], d[15], d[16], d[17], d[21], 
            d[22], d[24], d[25], d[27], d[28], d[29], 
            d[30], d[31]})); 
    defparam x25 .WIDTH = 21;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[8], d[9], d[11], d[15], 
            d[16], d[18], d[21], d[23], d[24], d[25], 
            d[26], d[27], d[28]})); 
    defparam x26 .WIDTH = 22;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[9], d[10], d[12], d[16], 
            d[17], d[19], d[22], d[24], d[25], d[26], 
            d[27], d[28], d[29]})); 
    defparam x27 .WIDTH = 22;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[10], d[11], d[13], 
            d[17], d[18], d[20], d[23], d[25], d[26], 
            d[27], d[28], d[29], d[30]})); 
    defparam x28 .WIDTH = 23;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[11], d[12], d[14], 
            d[18], d[19], d[21], d[24], d[26], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x29 .WIDTH = 23;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[2], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[12], d[13], 
            d[15], d[19], d[20], d[22], d[25], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x30 .WIDTH = 23;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[3], d[5], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[13], d[14], 
            d[16], d[20], d[21], d[23], d[26], d[28], 
            d[29], d[30], d[31]})); 
    defparam x31 .WIDTH = 22;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 6) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[5], d[6], d[7], d[10], 
            d[11], d[14], d[16], d[17], d[20], d[22], 
            d[24], d[26], d[29]})); 
    defparam x0 .WIDTH = 16;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[2], d[5], d[8], d[10], 
            d[12], d[14], d[15], d[16], d[18], d[20], 
            d[21], d[22], d[23], d[24], d[25], d[26], 
            d[27], d[29], d[30]})); 
    defparam x1 .WIDTH = 22;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[2], d[3], d[5], d[7], 
            d[9], d[10], d[13], d[14], d[15], d[19], 
            d[20], d[21], d[23], d[25], d[27], d[28], 
            d[29], d[30], d[31]})); 
    defparam x2 .WIDTH = 22;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[10], d[11], d[14], d[15], d[16], 
            d[20], d[21], d[22], d[24], d[26], d[28], 
            d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 22;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[3], d[4], d[6], d[9], d[10], 
            d[12], d[14], d[15], d[20], d[21], d[23], 
            d[24], d[25], d[26], d[27], d[30], d[31]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[4], d[6], d[13], 
            d[14], d[15], d[17], d[20], d[21], d[25], 
            d[27], d[28], d[29], d[31]})); 
    defparam x5 .WIDTH = 17;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[1], d[2], d[5], d[7], d[14], 
            d[15], d[16], d[18], d[21], d[22], d[26], 
            d[28], d[29], d[30]})); 
    defparam x6 .WIDTH = 16;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[8], d[10], d[11], d[14], d[15], 
            d[19], d[20], d[23], d[24], d[26], d[27], 
            d[30], d[31]})); 
    defparam x7 .WIDTH = 21;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[2], d[3], d[4], d[5], d[7], 
            d[8], d[9], d[10], d[12], d[14], d[15], 
            d[17], d[21], d[22], d[25], d[26], d[27], 
            d[28], d[29], d[31]})); 
    defparam x8 .WIDTH = 22;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[3], d[4], d[5], d[6], d[8], 
            d[9], d[10], d[11], d[13], d[15], d[16], 
            d[18], d[22], d[23], d[26], d[27], d[28], 
            d[29], d[30]})); 
    defparam x9 .WIDTH = 21;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[4], d[9], d[12], d[19], 
            d[20], d[22], d[23], d[26], d[27], d[28], 
            d[30], d[31]})); 
    defparam x10 .WIDTH = 15;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[2], d[6], d[7], 
            d[11], d[13], d[14], d[16], d[17], d[21], 
            d[22], d[23], d[26], d[27], d[28], d[31]})); 
    defparam x11 .WIDTH = 19;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[2], d[3], d[5], d[6], d[8], 
            d[10], d[11], d[12], d[15], d[16], d[18], 
            d[20], d[23], d[26], d[27], d[28]})); 
    defparam x12 .WIDTH = 18;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[3], d[4], d[6], d[7], 
            d[9], d[11], d[12], d[13], d[16], d[17], 
            d[19], d[21], d[24], d[27], d[28], d[29]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[4], d[5], d[7], d[8], 
            d[10], d[12], d[13], d[14], d[17], d[18], 
            d[20], d[22], d[25], d[28], d[29], d[30]})); 
    defparam x14 .WIDTH = 19;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[2], d[5], d[6], d[8], d[9], 
            d[11], d[13], d[14], d[15], d[18], d[19], 
            d[21], d[23], d[26], d[29], d[30], d[31]})); 
    defparam x15 .WIDTH = 19;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[3], d[5], d[9], d[11], 
            d[12], d[15], d[17], d[19], d[26], d[27], 
            d[29], d[30], d[31]})); 
    defparam x16 .WIDTH = 16;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[2], d[4], d[6], d[10], d[12], 
            d[13], d[16], d[18], d[20], d[27], d[28], 
            d[30], d[31]})); 
    defparam x17 .WIDTH = 15;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[3], d[5], d[7], d[11], d[13], 
            d[14], d[17], d[19], d[21], d[28], d[29], 
            d[31]})); 
    defparam x18 .WIDTH = 14;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[4], d[6], d[8], d[12], 
            d[14], d[15], d[18], d[20], d[22], d[29], 
            d[30]})); 
    defparam x19 .WIDTH = 14;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[5], d[7], d[9], 
            d[13], d[15], d[16], d[19], d[21], d[23], 
            d[30], d[31]})); 
    defparam x20 .WIDTH = 15;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[6], d[8], 
            d[10], d[14], d[16], d[17], d[20], d[22], 
            d[24], d[31]})); 
    defparam x21 .WIDTH = 15;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[2], d[3], d[5], d[6], d[9], 
            d[10], d[14], d[15], d[16], d[18], d[20], 
            d[21], d[22], d[23], d[24], d[25], d[26], 
            d[29]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[3], d[4], d[5], d[14], 
            d[15], d[19], d[20], d[21], d[23], d[25], 
            d[27], d[29], d[30]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[4], d[5], d[6], d[15], 
            d[16], d[20], d[21], d[22], d[24], d[26], 
            d[28], d[30], d[31]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[3], d[5], d[6], d[7], d[16], 
            d[17], d[21], d[22], d[23], d[25], d[27], 
            d[29], d[31]})); 
    defparam x25 .WIDTH = 15;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[4], d[5], d[8], 
            d[10], d[11], d[14], d[16], d[18], d[20], 
            d[23], d[28], d[29], d[30]})); 
    defparam x26 .WIDTH = 17;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[1], d[2], d[5], d[6], 
            d[9], d[11], d[12], d[15], d[17], d[19], 
            d[21], d[24], d[29], d[30], d[31]})); 
    defparam x27 .WIDTH = 18;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[2], d[3], d[6], d[7], 
            d[10], d[12], d[13], d[16], d[18], d[20], 
            d[22], d[25], d[30], d[31]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[2], d[3], d[4], d[7], d[8], 
            d[11], d[13], d[14], d[17], d[19], d[21], 
            d[23], d[26], d[31]})); 
    defparam x29 .WIDTH = 16;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[3], d[4], d[5], d[8], d[9], 
            d[12], d[14], d[15], d[18], d[20], d[22], 
            d[24], d[27]})); 
    defparam x30 .WIDTH = 15;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[4], d[5], d[6], d[9], 
            d[10], d[13], d[15], d[16], d[19], d[21], 
            d[23], d[25], d[28]})); 
    defparam x31 .WIDTH = 16;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 7) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[2], d[3], d[6], d[8], 
            d[17], d[18], d[20], d[21], d[28]})); 
    defparam x0 .WIDTH = 12;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[17], d[19], d[20], 
            d[22], d[28], d[29]})); 
    defparam x1 .WIDTH = 16;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[5], d[6], d[7], d[9], 
            d[10], d[17], d[23], d[28], d[29], d[30]})); 
    defparam x2 .WIDTH = 13;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[2], d[6], d[7], d[8], 
            d[10], d[11], d[18], d[24], d[29], d[30], 
            d[31]})); 
    defparam x3 .WIDTH = 14;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[2], d[6], d[7], 
            d[9], d[11], d[12], d[17], d[18], d[19], 
            d[20], d[21], d[25], d[28], d[30], d[31]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[6], d[7], d[10], d[12], 
            d[13], d[17], d[19], d[22], d[26], d[28], 
            d[29], d[31]})); 
    defparam x5 .WIDTH = 15;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[2], d[7], d[8], d[11], d[13], 
            d[14], d[18], d[20], d[23], d[27], d[29], 
            d[30]})); 
    defparam x6 .WIDTH = 14;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[2], d[6], d[9], d[12], 
            d[14], d[15], d[17], d[18], d[19], d[20], 
            d[24], d[30], d[31]})); 
    defparam x7 .WIDTH = 16;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[6], d[7], d[8], 
            d[10], d[13], d[15], d[16], d[17], d[19], 
            d[25], d[28], d[31]})); 
    defparam x8 .WIDTH = 16;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[2], d[3], d[7], d[8], 
            d[9], d[11], d[14], d[16], d[17], d[18], 
            d[20], d[26], d[29]})); 
    defparam x9 .WIDTH = 16;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[2], d[4], d[6], d[9], 
            d[10], d[12], d[15], d[19], d[20], d[27], 
            d[28], d[30]})); 
    defparam x10 .WIDTH = 15;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[5], d[6], d[7], d[8], 
            d[10], d[11], d[13], d[16], d[17], d[18], 
            d[29], d[31]})); 
    defparam x11 .WIDTH = 15;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[1], d[2], d[3], d[7], 
            d[9], d[11], d[12], d[14], d[19], d[20], 
            d[21], d[28], d[30]})); 
    defparam x12 .WIDTH = 16;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[2], d[3], d[4], 
            d[8], d[10], d[12], d[13], d[15], d[20], 
            d[21], d[22], d[29], d[31]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[9], d[11], d[13], d[14], d[16], 
            d[21], d[22], d[23], d[30]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[10], d[12], d[14], d[15], d[17], 
            d[22], d[23], d[24], d[31]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[4], d[5], d[7], d[8], 
            d[11], d[13], d[15], d[16], d[17], d[20], 
            d[21], d[23], d[24], d[25], d[28]})); 
    defparam x16 .WIDTH = 18;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[5], d[6], d[8], 
            d[9], d[12], d[14], d[16], d[17], d[18], 
            d[21], d[22], d[24], d[25], d[26], d[29]})); 
    defparam x17 .WIDTH = 19;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[2], d[6], d[7], 
            d[9], d[10], d[13], d[15], d[17], d[18], 
            d[19], d[22], d[23], d[25], d[26], d[27], 
            d[30]})); 
    defparam x18 .WIDTH = 20;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[2], d[3], d[7], 
            d[8], d[10], d[11], d[14], d[16], d[18], 
            d[19], d[20], d[23], d[24], d[26], d[27], 
            d[28], d[31]})); 
    defparam x19 .WIDTH = 21;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[2], d[3], d[4], 
            d[8], d[9], d[11], d[12], d[15], d[17], 
            d[19], d[20], d[21], d[24], d[25], d[27], 
            d[28], d[29]})); 
    defparam x20 .WIDTH = 21;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[9], d[10], d[12], d[13], d[16], 
            d[18], d[20], d[21], d[22], d[25], d[26], 
            d[28], d[29], d[30]})); 
    defparam x21 .WIDTH = 22;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[1], d[4], d[5], d[8], d[10], 
            d[11], d[13], d[14], d[18], d[19], d[20], 
            d[22], d[23], d[26], d[27], d[28], d[29], 
            d[30], d[31]})); 
    defparam x22 .WIDTH = 21;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[3], d[5], d[8], d[9], 
            d[11], d[12], d[14], d[15], d[17], d[18], 
            d[19], d[23], d[24], d[27], d[29], d[30], 
            d[31]})); 
    defparam x23 .WIDTH = 20;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[4], d[6], d[9], d[10], 
            d[12], d[13], d[15], d[16], d[18], d[19], 
            d[20], d[24], d[25], d[28], d[30], d[31]})); 
    defparam x24 .WIDTH = 19;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[2], d[5], d[7], d[10], d[11], 
            d[13], d[14], d[16], d[17], d[19], d[20], 
            d[21], d[25], d[26], d[29], d[31]})); 
    defparam x25 .WIDTH = 18;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[2], d[11], d[12], d[14], 
            d[15], d[22], d[26], d[27], d[28], d[30]})); 
    defparam x26 .WIDTH = 13;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[3], d[12], d[13], d[15], 
            d[16], d[23], d[27], d[28], d[29], d[31]})); 
    defparam x27 .WIDTH = 13;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[2], d[4], d[13], d[14], d[16], 
            d[17], d[24], d[28], d[29], d[30]})); 
    defparam x28 .WIDTH = 12;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[3], d[5], d[14], d[15], 
            d[17], d[18], d[25], d[29], d[30], d[31]})); 
    defparam x29 .WIDTH = 13;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[4], d[6], d[15], 
            d[16], d[18], d[19], d[26], d[30], d[31]})); 
    defparam x30 .WIDTH = 13;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[2], d[5], d[7], d[16], 
            d[17], d[19], d[20], d[27], d[31]})); 
    defparam x31 .WIDTH = 12;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 8) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[2], d[3], d[6], 
            d[8], d[9], d[10], d[11], d[12], d[13], 
            d[14], d[15], d[20], d[21], d[22], d[26], 
            d[27], d[28], d[30], d[31]})); 
    defparam x0 .WIDTH = 23;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[4], d[6], d[7], d[8], d[16], 
            d[20], d[23], d[26], d[29], d[30]})); 
    defparam x1 .WIDTH = 12;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[2], d[3], d[5], d[6], 
            d[7], d[10], d[11], d[12], d[13], d[14], 
            d[15], d[17], d[20], d[22], d[24], d[26], 
            d[28]})); 
    defparam x2 .WIDTH = 20;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[2], d[3], d[4], d[6], d[7], 
            d[8], d[11], d[12], d[13], d[14], d[15], 
            d[16], d[18], d[21], d[23], d[25], d[27], 
            d[29]})); 
    defparam x3 .WIDTH = 20;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[7], d[10], d[11], d[16], d[17], 
            d[19], d[20], d[21], d[24], d[27], d[31]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[5], d[7], d[9], d[10], d[13], 
            d[14], d[15], d[17], d[18], d[25], d[26], 
            d[27], d[30], d[31]})); 
    defparam x5 .WIDTH = 16;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[6], d[8], d[10], d[11], d[14], 
            d[15], d[16], d[18], d[19], d[26], d[27], 
            d[28], d[31]})); 
    defparam x6 .WIDTH = 15;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[2], d[3], d[6], d[7], 
            d[8], d[10], d[13], d[14], d[16], d[17], 
            d[19], d[21], d[22], d[26], d[29], d[30], 
            d[31]})); 
    defparam x7 .WIDTH = 20;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[4], d[6], d[7], 
            d[10], d[12], d[13], d[17], d[18], d[21], 
            d[23], d[26], d[28]})); 
    defparam x8 .WIDTH = 16;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[2], d[5], d[7], 
            d[8], d[11], d[13], d[14], d[18], d[19], 
            d[22], d[24], d[27], d[29]})); 
    defparam x9 .WIDTH = 17;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[10], d[11], d[13], d[19], d[21], 
            d[22], d[23], d[25], d[26], d[27], d[31]})); 
    defparam x10 .WIDTH = 13;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[2], d[3], d[6], 
            d[8], d[9], d[10], d[13], d[15], d[21], 
            d[23], d[24], d[30], d[31]})); 
    defparam x11 .WIDTH = 17;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[4], d[6], d[7], d[8], d[12], 
            d[13], d[15], d[16], d[20], d[21], d[24], 
            d[25], d[26], d[27], d[28], d[30]})); 
    defparam x12 .WIDTH = 18;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[5], d[7], d[8], d[9], d[13], 
            d[14], d[16], d[17], d[21], d[22], d[25], 
            d[26], d[27], d[28], d[29], d[31]})); 
    defparam x13 .WIDTH = 18;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[6], d[8], d[9], d[10], d[14], 
            d[15], d[17], d[18], d[22], d[23], d[26], 
            d[27], d[28], d[29], d[30]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[7], d[9], d[10], d[11], 
            d[15], d[16], d[18], d[19], d[23], d[24], 
            d[27], d[28], d[29], d[30], d[31]})); 
    defparam x15 .WIDTH = 18;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[2], d[3], d[6], d[9], d[13], 
            d[14], d[15], d[16], d[17], d[19], d[21], 
            d[22], d[24], d[25], d[26], d[27], d[29]})); 
    defparam x16 .WIDTH = 19;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[3], d[4], d[7], d[10], 
            d[14], d[15], d[16], d[17], d[18], d[20], 
            d[22], d[23], d[25], d[26], d[27], d[28], 
            d[30]})); 
    defparam x17 .WIDTH = 20;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[4], d[5], d[8], d[11], 
            d[15], d[16], d[17], d[18], d[19], d[21], 
            d[23], d[24], d[26], d[27], d[28], d[29], 
            d[31]})); 
    defparam x18 .WIDTH = 20;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[2], d[5], d[6], d[9], d[12], 
            d[16], d[17], d[18], d[19], d[20], d[22], 
            d[24], d[25], d[27], d[28], d[29], d[30]})); 
    defparam x19 .WIDTH = 19;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[3], d[6], d[7], d[10], d[13], 
            d[17], d[18], d[19], d[20], d[21], d[23], 
            d[25], d[26], d[28], d[29], d[30], d[31]})); 
    defparam x20 .WIDTH = 19;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[4], d[7], d[8], d[11], 
            d[14], d[18], d[19], d[20], d[21], d[22], 
            d[24], d[26], d[27], d[29], d[30], d[31]})); 
    defparam x21 .WIDTH = 19;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[2], d[3], d[5], d[6], d[10], 
            d[11], d[13], d[14], d[19], d[23], d[25], 
            d[26]})); 
    defparam x22 .WIDTH = 14;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[10], d[13], d[21], d[22], d[24], 
            d[28], d[30], d[31]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[3], d[5], d[8], d[9], 
            d[10], d[11], d[14], d[22], d[23], d[25], 
            d[29], d[31]})); 
    defparam x24 .WIDTH = 15;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[3], d[4], d[6], d[9], 
            d[10], d[11], d[12], d[15], d[23], d[24], 
            d[26], d[30]})); 
    defparam x25 .WIDTH = 15;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[14], d[15], 
            d[16], d[20], d[21], d[22], d[24], d[25], 
            d[26], d[28], d[30]})); 
    defparam x26 .WIDTH = 22;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[15], d[16], 
            d[17], d[21], d[22], d[23], d[25], d[26], 
            d[27], d[29], d[31]})); 
    defparam x27 .WIDTH = 22;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[2], d[4], d[5], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[16], d[17], 
            d[18], d[22], d[23], d[24], d[26], d[27], 
            d[28], d[30]})); 
    defparam x28 .WIDTH = 21;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[3], d[5], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[17], 
            d[18], d[19], d[23], d[24], d[25], d[27], 
            d[28], d[29], d[31]})); 
    defparam x29 .WIDTH = 22;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[4], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[13], 
            d[18], d[19], d[20], d[24], d[25], d[26], 
            d[28], d[29], d[30]})); 
    defparam x30 .WIDTH = 22;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[2], d[5], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[13], 
            d[14], d[19], d[20], d[21], d[25], d[26], 
            d[27], d[29], d[30], d[31]})); 
    defparam x31 .WIDTH = 23;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 9) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[5], d[7], d[10], d[11], 
            d[12], d[13], d[14], d[16], d[17], d[19], 
            d[21], d[23], d[27], d[29], d[30], d[31]})); 
    defparam x0 .WIDTH = 19;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[2], d[5], d[6], d[7], 
            d[8], d[10], d[15], d[16], d[18], d[19], 
            d[20], d[21], d[22], d[23], d[24], d[27], 
            d[28], d[29]})); 
    defparam x1 .WIDTH = 21;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[2], d[3], d[5], 
            d[6], d[8], d[9], d[10], d[12], d[13], 
            d[14], d[20], d[22], d[24], d[25], d[27], 
            d[28], d[31]})); 
    defparam x2 .WIDTH = 21;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[7], d[9], d[10], d[11], d[13], 
            d[14], d[15], d[21], d[23], d[25], d[26], 
            d[28], d[29]})); 
    defparam x3 .WIDTH = 21;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[2], d[3], d[4], d[8], d[13], 
            d[15], d[17], d[19], d[21], d[22], d[23], 
            d[24], d[26], d[31]})); 
    defparam x4 .WIDTH = 16;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[3], d[4], d[7], d[9], 
            d[10], d[11], d[12], d[13], d[17], d[18], 
            d[19], d[20], d[21], d[22], d[24], d[25], 
            d[29], d[30], d[31]})); 
    defparam x5 .WIDTH = 22;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[2], d[4], d[5], d[8], 
            d[10], d[11], d[12], d[13], d[14], d[18], 
            d[19], d[20], d[21], d[22], d[23], d[25], 
            d[26], d[30], d[31]})); 
    defparam x6 .WIDTH = 22;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[3], d[6], d[7], d[9], d[10], 
            d[15], d[16], d[17], d[20], d[22], d[24], 
            d[26], d[29], d[30]})); 
    defparam x7 .WIDTH = 16;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[4], d[5], d[8], 
            d[12], d[13], d[14], d[18], d[19], d[25], 
            d[29]})); 
    defparam x8 .WIDTH = 14;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[5], d[6], d[9], 
            d[13], d[14], d[15], d[19], d[20], d[26], 
            d[30]})); 
    defparam x9 .WIDTH = 14;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[2], d[3], d[5], d[6], 
            d[11], d[12], d[13], d[15], d[17], d[19], 
            d[20], d[23], d[29], d[30]})); 
    defparam x10 .WIDTH = 17;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[10], d[11], d[17], d[18], 
            d[19], d[20], d[23], d[24], d[27], d[29]})); 
    defparam x11 .WIDTH = 19;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[2], d[3], d[4], d[6], 
            d[10], d[13], d[14], d[16], d[17], d[18], 
            d[20], d[23], d[24], d[25], d[27], d[28], 
            d[29], d[31]})); 
    defparam x12 .WIDTH = 21;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[3], d[4], d[5], 
            d[7], d[11], d[14], d[15], d[17], d[18], 
            d[19], d[21], d[24], d[25], d[26], d[28], 
            d[29], d[30]})); 
    defparam x13 .WIDTH = 21;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[8], d[12], d[15], d[16], d[18], 
            d[19], d[20], d[22], d[25], d[26], d[27], 
            d[29], d[30], d[31]})); 
    defparam x14 .WIDTH = 22;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[2], d[3], d[5], d[6], 
            d[7], d[9], d[13], d[16], d[17], d[19], 
            d[20], d[21], d[23], d[26], d[27], d[28], 
            d[30], d[31]})); 
    defparam x15 .WIDTH = 21;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[8], d[11], d[12], d[13], 
            d[16], d[18], d[19], d[20], d[22], d[23], 
            d[24], d[28], d[30]})); 
    defparam x16 .WIDTH = 22;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[7], d[9], d[12], d[13], 
            d[14], d[17], d[19], d[20], d[21], d[23], 
            d[24], d[25], d[29], d[31]})); 
    defparam x17 .WIDTH = 23;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[10], d[13], d[14], 
            d[15], d[18], d[20], d[21], d[22], d[24], 
            d[25], d[26], d[30]})); 
    defparam x18 .WIDTH = 22;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[2], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[11], d[14], d[15], 
            d[16], d[19], d[21], d[22], d[23], d[25], 
            d[26], d[27], d[31]})); 
    defparam x19 .WIDTH = 22;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[12], d[15], 
            d[16], d[17], d[20], d[22], d[23], d[24], 
            d[26], d[27], d[28]})); 
    defparam x20 .WIDTH = 22;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[11], d[13], 
            d[16], d[17], d[18], d[21], d[23], d[24], 
            d[25], d[27], d[28], d[29]})); 
    defparam x21 .WIDTH = 23;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[2], d[6], d[8], d[9], d[13], 
            d[16], d[18], d[21], d[22], d[23], d[24], 
            d[25], d[26], d[27], d[28], d[31]})); 
    defparam x22 .WIDTH = 18;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[3], d[5], d[9], d[11], 
            d[12], d[13], d[16], d[21], d[22], d[24], 
            d[25], d[26], d[28], d[30], d[31]})); 
    defparam x23 .WIDTH = 18;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[4], d[6], d[10], d[12], 
            d[13], d[14], d[17], d[22], d[23], d[25], 
            d[26], d[27], d[29], d[31]})); 
    defparam x24 .WIDTH = 17;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[3], d[5], d[7], d[11], d[13], 
            d[14], d[15], d[18], d[23], d[24], d[26], 
            d[27], d[28], d[30]})); 
    defparam x25 .WIDTH = 16;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[4], d[5], d[6], d[7], 
            d[8], d[10], d[11], d[13], d[15], d[17], 
            d[21], d[23], d[24], d[25], d[28], d[30]})); 
    defparam x26 .WIDTH = 19;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[5], d[6], d[7], 
            d[8], d[9], d[11], d[12], d[14], d[16], 
            d[18], d[22], d[24], d[25], d[26], d[29], 
            d[31]})); 
    defparam x27 .WIDTH = 20;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[3], d[6], d[7], d[8], 
            d[9], d[10], d[12], d[13], d[15], d[17], 
            d[19], d[23], d[25], d[26], d[27], d[30]})); 
    defparam x28 .WIDTH = 19;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[2], d[4], d[7], d[8], d[9], 
            d[10], d[11], d[13], d[14], d[16], d[18], 
            d[20], d[24], d[26], d[27], d[28], d[31]})); 
    defparam x29 .WIDTH = 19;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[3], d[5], d[8], d[9], d[10], 
            d[11], d[12], d[14], d[15], d[17], d[19], 
            d[21], d[25], d[27], d[28], d[29]})); 
    defparam x30 .WIDTH = 18;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[4], d[6], d[9], d[10], 
            d[11], d[12], d[13], d[15], d[16], d[18], 
            d[20], d[22], d[26], d[28], d[29], d[30]})); 
    defparam x31 .WIDTH = 19;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 10) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[2], d[3], d[4], d[5], 
            d[7], d[9], d[11], d[12], d[15], d[16], 
            d[18], d[21], d[22], d[24], d[28]})); 
    defparam x0 .WIDTH = 18;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[6], d[7], d[8], 
            d[9], d[10], d[11], d[13], d[15], d[17], 
            d[18], d[19], d[21], d[23], d[24], d[25], 
            d[28], d[29]})); 
    defparam x1 .WIDTH = 21;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[3], d[4], d[5], d[8], d[10], 
            d[14], d[15], d[19], d[20], d[21], d[25], 
            d[26], d[28], d[29], d[30]})); 
    defparam x2 .WIDTH = 17;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[4], d[5], d[6], d[9], d[11], 
            d[15], d[16], d[20], d[21], d[22], d[26], 
            d[27], d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 17;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[3], d[4], d[6], 
            d[9], d[10], d[11], d[15], d[17], d[18], 
            d[23], d[24], d[27], d[30], d[31]})); 
    defparam x4 .WIDTH = 18;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[9], d[10], d[15], 
            d[19], d[21], d[22], d[25], d[31]})); 
    defparam x5 .WIDTH = 12;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[2], d[10], d[11], 
            d[16], d[20], d[22], d[23], d[26]})); 
    defparam x6 .WIDTH = 12;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[4], d[5], d[7], d[9], 
            d[15], d[16], d[17], d[18], d[22], d[23], 
            d[27], d[28]})); 
    defparam x7 .WIDTH = 15;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[2], d[3], d[4], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[15], 
            d[17], d[19], d[21], d[22], d[23], d[29]})); 
    defparam x8 .WIDTH = 19;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[3], d[4], d[5], d[7], d[8], 
            d[9], d[10], d[11], d[12], d[13], d[16], 
            d[18], d[20], d[22], d[23], d[24], d[30]})); 
    defparam x9 .WIDTH = 19;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[2], d[3], d[6], 
            d[7], d[8], d[10], d[13], d[14], d[15], 
            d[16], d[17], d[18], d[19], d[22], d[23], 
            d[25], d[28], d[31]})); 
    defparam x10 .WIDTH = 22;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[5], d[8], d[12], d[14], d[17], 
            d[19], d[20], d[21], d[22], d[23], d[26], 
            d[28], d[29]})); 
    defparam x11 .WIDTH = 15;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[11], d[12], d[13], d[16], 
            d[20], d[23], d[27], d[28], d[29], d[30]})); 
    defparam x12 .WIDTH = 19;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[2], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[12], d[13], d[14], d[17], 
            d[21], d[24], d[28], d[29], d[30], d[31]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[3], d[4], d[5], d[6], d[7], 
            d[8], d[9], d[13], d[14], d[15], d[18], 
            d[22], d[25], d[29], d[30], d[31]})); 
    defparam x14 .WIDTH = 18;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[4], d[5], d[6], d[7], 
            d[8], d[9], d[10], d[14], d[15], d[16], 
            d[19], d[23], d[26], d[30], d[31]})); 
    defparam x15 .WIDTH = 18;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[2], d[3], d[4], d[6], d[8], 
            d[10], d[12], d[17], d[18], d[20], d[21], 
            d[22], d[27], d[28], d[31]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[3], d[4], d[5], d[7], 
            d[9], d[11], d[13], d[18], d[19], d[21], 
            d[22], d[23], d[28], d[29]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[4], d[5], d[6], d[8], 
            d[10], d[12], d[14], d[19], d[20], d[22], 
            d[23], d[24], d[29], d[30]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[2], d[5], d[6], d[7], 
            d[9], d[11], d[13], d[15], d[20], d[21], 
            d[23], d[24], d[25], d[30], d[31]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[3], d[6], d[7], 
            d[8], d[10], d[12], d[14], d[16], d[21], 
            d[22], d[24], d[25], d[26], d[31]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[11], d[13], d[15], d[17], d[22], 
            d[23], d[25], d[26], d[27]})); 
    defparam x21 .WIDTH = 17;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[1], d[4], d[7], d[8], d[10], 
            d[11], d[14], d[15], d[21], d[22], d[23], 
            d[26], d[27]})); 
    defparam x22 .WIDTH = 15;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[3], d[4], d[7], d[8], 
            d[18], d[21], d[23], d[27]})); 
    defparam x23 .WIDTH = 11;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[0], d[2], d[4], d[5], d[8], 
            d[9], d[19], d[22], d[24], d[28]})); 
    defparam x24 .WIDTH = 12;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[1], d[3], d[5], d[6], d[9], 
            d[10], d[20], d[23], d[25], d[29]})); 
    defparam x25 .WIDTH = 12;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[3], d[5], d[6], d[9], 
            d[10], d[12], d[15], d[16], d[18], d[22], 
            d[26], d[28], d[30]})); 
    defparam x26 .WIDTH = 16;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[4], d[6], d[7], 
            d[10], d[11], d[13], d[16], d[17], d[19], 
            d[23], d[27], d[29], d[31]})); 
    defparam x27 .WIDTH = 17;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[3], d[5], d[7], 
            d[8], d[11], d[12], d[14], d[17], d[18], 
            d[20], d[24], d[28], d[30]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[2], d[4], d[6], 
            d[8], d[9], d[12], d[13], d[15], d[18], 
            d[19], d[21], d[25], d[29], d[31]})); 
    defparam x29 .WIDTH = 18;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[9], d[10], d[13], d[14], d[16], 
            d[19], d[20], d[22], d[26], d[30]})); 
    defparam x30 .WIDTH = 18;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[8], d[10], d[11], d[14], d[15], 
            d[17], d[20], d[21], d[23], d[27], d[31]})); 
    defparam x31 .WIDTH = 19;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 11) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[2], d[3], d[8], 
            d[14], d[15], d[17], d[19], d[21], d[22], 
            d[23], d[26], d[28], d[29], d[30]})); 
    defparam x0 .WIDTH = 18;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[4], d[8], d[9], d[14], 
            d[16], d[17], d[18], d[19], d[20], d[21], 
            d[24], d[26], d[27], d[28], d[31]})); 
    defparam x1 .WIDTH = 18;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[2], d[3], d[5], d[8], d[9], 
            d[10], d[14], d[18], d[20], d[23], d[25], 
            d[26], d[27], d[30]})); 
    defparam x2 .WIDTH = 16;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[3], d[4], d[6], d[9], d[10], 
            d[11], d[15], d[19], d[21], d[24], d[26], 
            d[27], d[28], d[31]})); 
    defparam x3 .WIDTH = 16;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[3], d[4], d[5], 
            d[7], d[8], d[10], d[11], d[12], d[14], 
            d[15], d[16], d[17], d[19], d[20], d[21], 
            d[23], d[25], d[26], d[27], d[30]})); 
    defparam x4 .WIDTH = 24;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[4], d[5], d[6], d[9], 
            d[11], d[12], d[13], d[14], d[16], d[18], 
            d[19], d[20], d[23], d[24], d[27], d[29], 
            d[30], d[31]})); 
    defparam x5 .WIDTH = 21;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[2], d[5], d[6], d[7], d[10], 
            d[12], d[13], d[14], d[15], d[17], d[19], 
            d[20], d[21], d[24], d[25], d[28], d[30], 
            d[31]})); 
    defparam x6 .WIDTH = 20;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[2], d[6], d[7], d[11], 
            d[13], d[16], d[17], d[18], d[19], d[20], 
            d[23], d[25], d[28], d[30], d[31]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[7], d[12], d[15], 
            d[18], d[20], d[22], d[23], d[24], d[28], 
            d[30], d[31]})); 
    defparam x8 .WIDTH = 15;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[8], d[13], d[16], 
            d[19], d[21], d[23], d[24], d[25], d[29], 
            d[31]})); 
    defparam x9 .WIDTH = 14;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[8], d[9], d[15], 
            d[19], d[20], d[21], d[23], d[24], d[25], 
            d[28], d[29]})); 
    defparam x10 .WIDTH = 15;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[3], d[8], d[9], d[10], 
            d[14], d[15], d[16], d[17], d[19], d[20], 
            d[23], d[24], d[25], d[28]})); 
    defparam x11 .WIDTH = 17;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[2], d[3], d[4], d[8], 
            d[9], d[10], d[11], d[14], d[16], d[18], 
            d[19], d[20], d[22], d[23], d[24], d[25], 
            d[28], d[30]})); 
    defparam x12 .WIDTH = 21;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[3], d[4], d[5], d[9], 
            d[10], d[11], d[12], d[15], d[17], d[19], 
            d[20], d[21], d[23], d[24], d[25], d[26], 
            d[29], d[31]})); 
    defparam x13 .WIDTH = 21;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[2], d[4], d[5], d[6], d[10], 
            d[11], d[12], d[13], d[16], d[18], d[20], 
            d[21], d[22], d[24], d[25], d[26], d[27], 
            d[30]})); 
    defparam x14 .WIDTH = 20;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[3], d[5], d[6], d[7], 
            d[11], d[12], d[13], d[14], d[17], d[19], 
            d[21], d[22], d[23], d[25], d[26], d[27], 
            d[28], d[31]})); 
    defparam x15 .WIDTH = 21;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[2], d[3], d[4], d[6], d[7], 
            d[12], d[13], d[17], d[18], d[19], d[20], 
            d[21], d[24], d[27], d[30]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[3], d[4], d[5], d[7], 
            d[8], d[13], d[14], d[18], d[19], d[20], 
            d[21], d[22], d[25], d[28], d[31]})); 
    defparam x17 .WIDTH = 18;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[4], d[5], d[6], d[8], 
            d[9], d[14], d[15], d[19], d[20], d[21], 
            d[22], d[23], d[26], d[29]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[2], d[5], d[6], d[7], 
            d[9], d[10], d[15], d[16], d[20], d[21], 
            d[22], d[23], d[24], d[27], d[30]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[1], d[3], d[6], d[7], d[8], 
            d[10], d[11], d[16], d[17], d[21], d[22], 
            d[23], d[24], d[25], d[28], d[31]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[2], d[4], d[7], d[8], d[9], 
            d[11], d[12], d[17], d[18], d[22], d[23], 
            d[24], d[25], d[26], d[29]})); 
    defparam x21 .WIDTH = 17;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[2], d[5], d[9], 
            d[10], d[12], d[13], d[14], d[15], d[17], 
            d[18], d[21], d[22], d[24], d[25], d[27], 
            d[28], d[29]})); 
    defparam x22 .WIDTH = 21;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[6], d[8], d[10], d[11], 
            d[13], d[16], d[17], d[18], d[21], d[25]})); 
    defparam x23 .WIDTH = 13;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[7], d[9], d[11], d[12], 
            d[14], d[17], d[18], d[19], d[22], d[26]})); 
    defparam x24 .WIDTH = 13;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[2], d[8], d[10], d[12], 
            d[13], d[15], d[18], d[19], d[20], d[23], 
            d[27]})); 
    defparam x25 .WIDTH = 14;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[2], d[8], d[9], d[11], d[13], 
            d[15], d[16], d[17], d[20], d[22], d[23], 
            d[24], d[26], d[29], d[30]})); 
    defparam x26 .WIDTH = 17;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[3], d[9], d[10], d[12], d[14], 
            d[16], d[17], d[18], d[21], d[23], d[24], 
            d[25], d[27], d[30], d[31]})); 
    defparam x27 .WIDTH = 17;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[4], d[10], d[11], d[13], d[15], 
            d[17], d[18], d[19], d[22], d[24], d[25], 
            d[26], d[28], d[31]})); 
    defparam x28 .WIDTH = 16;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[5], d[11], d[12], d[14], 
            d[16], d[18], d[19], d[20], d[23], d[25], 
            d[26], d[27], d[29]})); 
    defparam x29 .WIDTH = 16;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[6], d[12], d[13], 
            d[15], d[17], d[19], d[20], d[21], d[24], 
            d[26], d[27], d[28], d[30]})); 
    defparam x30 .WIDTH = 17;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[2], d[7], d[13], 
            d[14], d[16], d[18], d[20], d[21], d[22], 
            d[25], d[27], d[28], d[29], d[31]})); 
    defparam x31 .WIDTH = 18;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 12) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[4], d[5], d[6], d[8], 
            d[11], d[12], d[14], d[17], d[19], d[20], 
            d[22], d[26], d[27], d[29], d[31]})); 
    defparam x0 .WIDTH = 18;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[4], d[7], d[8], 
            d[9], d[11], d[13], d[14], d[15], d[17], 
            d[18], d[19], d[21], d[22], d[23], d[26], 
            d[28], d[29], d[30], d[31]})); 
    defparam x1 .WIDTH = 23;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[2], d[4], d[6], 
            d[9], d[10], d[11], d[15], d[16], d[17], 
            d[18], d[23], d[24], d[26], d[30]})); 
    defparam x2 .WIDTH = 18;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[2], d[3], d[5], d[7], 
            d[10], d[11], d[12], d[16], d[17], d[18], 
            d[19], d[24], d[25], d[27], d[31]})); 
    defparam x3 .WIDTH = 18;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[2], d[3], d[5], d[13], d[14], 
            d[18], d[22], d[25], d[27], d[28], d[29], 
            d[31]})); 
    defparam x4 .WIDTH = 14;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[3], d[5], d[8], d[11], 
            d[12], d[15], d[17], d[20], d[22], d[23], 
            d[27], d[28], d[30], d[31]})); 
    defparam x5 .WIDTH = 17;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[1], d[4], d[6], d[9], d[12], 
            d[13], d[16], d[18], d[21], d[23], d[24], 
            d[28], d[29], d[31]})); 
    defparam x6 .WIDTH = 16;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[2], d[4], d[6], d[7], 
            d[8], d[10], d[11], d[12], d[13], d[20], 
            d[24], d[25], d[26], d[27], d[30], d[31]})); 
    defparam x7 .WIDTH = 19;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[3], d[4], d[6], 
            d[7], d[9], d[13], d[17], d[19], d[20], 
            d[21], d[22], d[25], d[28], d[29]})); 
    defparam x8 .WIDTH = 18;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[4], d[5], d[7], 
            d[8], d[10], d[14], d[18], d[20], d[21], 
            d[22], d[23], d[26], d[29], d[30]})); 
    defparam x9 .WIDTH = 18;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[2], d[3], d[4], d[9], 
            d[12], d[14], d[15], d[17], d[20], d[21], 
            d[23], d[24], d[26], d[29], d[30]})); 
    defparam x10 .WIDTH = 18;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[3], d[6], d[8], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[16], d[17], d[18], d[19], d[20], d[21], 
            d[24], d[25], d[26], d[29], d[30]})); 
    defparam x11 .WIDTH = 24;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[2], d[5], d[6], d[7], 
            d[8], d[9], d[13], d[15], d[16], d[18], 
            d[21], d[25], d[29], d[30]})); 
    defparam x12 .WIDTH = 17;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[2], d[3], d[6], d[7], 
            d[8], d[9], d[10], d[14], d[16], d[17], 
            d[19], d[22], d[26], d[30], d[31]})); 
    defparam x13 .WIDTH = 18;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[3], d[4], d[7], d[8], 
            d[9], d[10], d[11], d[15], d[17], d[18], 
            d[20], d[23], d[27], d[31]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[2], d[4], d[5], d[8], 
            d[9], d[10], d[11], d[12], d[16], d[18], 
            d[19], d[21], d[24], d[28]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[1], d[3], d[4], d[8], 
            d[9], d[10], d[13], d[14], d[25], d[26], 
            d[27], d[31]})); 
    defparam x16 .WIDTH = 15;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[1], d[2], d[4], d[5], d[9], 
            d[10], d[11], d[14], d[15], d[26], d[27], 
            d[28]})); 
    defparam x17 .WIDTH = 14;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[2], d[3], d[5], d[6], d[10], 
            d[11], d[12], d[15], d[16], d[27], d[28], 
            d[29]})); 
    defparam x18 .WIDTH = 14;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[3], d[4], d[6], d[7], 
            d[11], d[12], d[13], d[16], d[17], d[28], 
            d[29], d[30]})); 
    defparam x19 .WIDTH = 15;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[1], d[4], d[5], d[7], d[8], 
            d[12], d[13], d[14], d[17], d[18], d[29], 
            d[30], d[31]})); 
    defparam x20 .WIDTH = 15;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[2], d[5], d[6], d[8], d[9], 
            d[13], d[14], d[15], d[18], d[19], d[30], 
            d[31]})); 
    defparam x21 .WIDTH = 14;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[3], d[4], d[5], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[15], 
            d[16], d[17], d[22], d[26], d[27], d[29]})); 
    defparam x22 .WIDTH = 19;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[9], d[10], d[13], d[14], 
            d[16], d[18], d[19], d[20], d[22], d[23], 
            d[26], d[28], d[29], d[30], d[31]})); 
    defparam x23 .WIDTH = 18;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[0], d[2], d[10], d[11], d[14], 
            d[15], d[17], d[19], d[20], d[21], d[23], 
            d[24], d[27], d[29], d[30], d[31]})); 
    defparam x24 .WIDTH = 18;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[1], d[3], d[11], d[12], d[15], 
            d[16], d[18], d[20], d[21], d[22], d[24], 
            d[25], d[28], d[30], d[31]})); 
    defparam x25 .WIDTH = 17;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[2], d[5], d[6], d[8], 
            d[11], d[13], d[14], d[16], d[20], d[21], 
            d[23], d[25], d[27]})); 
    defparam x26 .WIDTH = 16;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[1], d[3], d[6], d[7], 
            d[9], d[12], d[14], d[15], d[17], d[21], 
            d[22], d[24], d[26], d[28]})); 
    defparam x27 .WIDTH = 17;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[2], d[4], d[7], 
            d[8], d[10], d[13], d[15], d[16], d[18], 
            d[22], d[23], d[25], d[27], d[29]})); 
    defparam x28 .WIDTH = 18;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[2], d[3], d[5], d[8], 
            d[9], d[11], d[14], d[16], d[17], d[19], 
            d[23], d[24], d[26], d[28], d[30]})); 
    defparam x29 .WIDTH = 18;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[2], d[3], d[4], d[6], d[9], 
            d[10], d[12], d[15], d[17], d[18], d[20], 
            d[24], d[25], d[27], d[29], d[31]})); 
    defparam x30 .WIDTH = 18;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[3], d[4], d[5], d[7], d[10], 
            d[11], d[13], d[16], d[18], d[19], d[21], 
            d[25], d[26], d[28], d[30]})); 
    defparam x31 .WIDTH = 17;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 13) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[2], d[3], d[4], d[6], 
            d[7], d[8], d[9], d[10], d[11], d[12], 
            d[13], d[14], d[15], d[16], d[18], d[19], 
            d[24], d[25], d[27]})); 
    defparam x0 .WIDTH = 22;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[2], d[5], d[6], 
            d[17], d[18], d[20], d[24], d[26], d[27], 
            d[28]})); 
    defparam x1 .WIDTH = 14;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[4], d[8], d[9], d[10], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[21], d[24], d[28], d[29]})); 
    defparam x2 .WIDTH = 17;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[2], d[5], d[9], d[10], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[17], d[22], d[25], d[29], d[30]})); 
    defparam x3 .WIDTH = 18;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[17], d[19], d[23], d[24], d[25], 
            d[26], d[27], d[30], d[31]})); 
    defparam x4 .WIDTH = 17;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[4], d[5], d[6], d[7], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[19], d[20], d[26], d[28], d[31]})); 
    defparam x5 .WIDTH = 18;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[5], d[6], d[7], 
            d[8], d[12], d[13], d[14], d[15], d[16], 
            d[17], d[20], d[21], d[27], d[29]})); 
    defparam x6 .WIDTH = 18;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[3], d[4], d[10], 
            d[11], d[12], d[17], d[19], d[21], d[22], 
            d[24], d[25], d[27], d[28], d[30]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[3], d[5], d[6], d[7], 
            d[8], d[9], d[10], d[14], d[15], d[16], 
            d[19], d[20], d[22], d[23], d[24], d[26], 
            d[27], d[28], d[29], d[31]})); 
    defparam x8 .WIDTH = 23;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[2], d[4], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[15], d[16], 
            d[17], d[20], d[21], d[23], d[24], d[25], 
            d[27], d[28], d[29], d[30]})); 
    defparam x9 .WIDTH = 23;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[13], d[14], d[15], d[17], d[19], 
            d[21], d[22], d[26], d[27], d[28], d[29], 
            d[30], d[31]})); 
    defparam x10 .WIDTH = 21;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[4], d[5], d[8], 
            d[9], d[10], d[11], d[12], d[13], d[19], 
            d[20], d[22], d[23], d[24], d[25], d[28], 
            d[29], d[30], d[31]})); 
    defparam x11 .WIDTH = 22;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[3], d[4], d[5], d[7], 
            d[8], d[15], d[16], d[18], d[19], d[20], 
            d[21], d[23], d[26], d[27], d[29], d[30], 
            d[31]})); 
    defparam x12 .WIDTH = 20;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[2], d[4], d[5], d[6], 
            d[8], d[9], d[16], d[17], d[19], d[20], 
            d[21], d[22], d[24], d[27], d[28], d[30], 
            d[31]})); 
    defparam x13 .WIDTH = 20;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[3], d[5], d[6], 
            d[7], d[9], d[10], d[17], d[18], d[20], 
            d[21], d[22], d[23], d[25], d[28], d[29], 
            d[31]})); 
    defparam x14 .WIDTH = 20;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[10], d[11], d[18], d[19], 
            d[21], d[22], d[23], d[24], d[26], d[29], 
            d[30]})); 
    defparam x15 .WIDTH = 20;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[4], d[5], d[6], d[10], 
            d[13], d[14], d[15], d[16], d[18], d[20], 
            d[22], d[23], d[30], d[31]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[2], d[5], d[6], d[7], 
            d[11], d[14], d[15], d[16], d[17], d[19], 
            d[21], d[23], d[24], d[31]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[3], d[6], d[7], 
            d[8], d[12], d[15], d[16], d[17], d[18], 
            d[20], d[22], d[24], d[25]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[13], d[16], d[17], d[18], d[19], 
            d[21], d[23], d[25], d[26]})); 
    defparam x19 .WIDTH = 17;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[2], d[3], d[5], d[8], d[9], 
            d[10], d[14], d[17], d[18], d[19], d[20], 
            d[22], d[24], d[26], d[27]})); 
    defparam x20 .WIDTH = 17;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[3], d[4], d[6], d[9], d[10], 
            d[11], d[15], d[18], d[19], d[20], d[21], 
            d[23], d[25], d[27], d[28]})); 
    defparam x21 .WIDTH = 17;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[2], d[3], d[5], d[6], d[8], 
            d[9], d[13], d[14], d[15], d[18], d[20], 
            d[21], d[22], d[25], d[26], d[27], d[28], 
            d[29]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[2], d[8], d[11], d[12], d[13], 
            d[18], d[21], d[22], d[23], d[24], d[25], 
            d[26], d[28], d[29], d[30]})); 
    defparam x23 .WIDTH = 17;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[3], d[9], d[12], d[13], d[14], 
            d[19], d[22], d[23], d[24], d[25], d[26], 
            d[27], d[29], d[30], d[31]})); 
    defparam x24 .WIDTH = 17;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[4], d[10], d[13], d[14], 
            d[15], d[20], d[23], d[24], d[25], d[26], 
            d[27], d[28], d[30], d[31]})); 
    defparam x25 .WIDTH = 17;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[7], d[8], d[9], d[10], 
            d[12], d[13], d[18], d[19], d[21], d[26], 
            d[28], d[29], d[31]})); 
    defparam x26 .WIDTH = 22;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[10], d[11], 
            d[13], d[14], d[19], d[20], d[22], d[27], 
            d[29], d[30]})); 
    defparam x27 .WIDTH = 21;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[10], d[11], 
            d[12], d[14], d[15], d[20], d[21], d[23], 
            d[28], d[30], d[31]})); 
    defparam x28 .WIDTH = 22;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[10], d[11], 
            d[12], d[13], d[15], d[16], d[21], d[22], 
            d[24], d[29], d[31]})); 
    defparam x29 .WIDTH = 22;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[10], d[11], 
            d[12], d[13], d[14], d[16], d[17], d[22], 
            d[23], d[25], d[30]})); 
    defparam x30 .WIDTH = 22;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[2], d[3], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[11], d[12], 
            d[13], d[14], d[15], d[17], d[18], d[23], 
            d[24], d[26], d[31]})); 
    defparam x31 .WIDTH = 22;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 14) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[3], d[4], d[5], d[7], d[9], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[17], d[19], d[22], d[23], d[25], d[26], 
            d[27], d[29]})); 
    defparam x0 .WIDTH = 21;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[3], d[6], d[7], d[8], 
            d[9], d[16], d[17], d[18], d[19], d[20], 
            d[22], d[24], d[25], d[28], d[29], d[30]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[3], d[5], d[8], 
            d[11], d[12], d[13], d[14], d[15], d[18], 
            d[20], d[21], d[22], d[27], d[30], d[31]})); 
    defparam x2 .WIDTH = 19;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[2], d[4], d[6], d[9], 
            d[12], d[13], d[14], d[15], d[16], d[19], 
            d[21], d[22], d[23], d[28], d[31]})); 
    defparam x3 .WIDTH = 18;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[2], d[4], d[9], d[11], d[12], 
            d[16], d[19], d[20], d[24], d[25], d[26], 
            d[27]})); 
    defparam x4 .WIDTH = 14;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[4], d[7], d[9], d[11], d[14], 
            d[15], d[19], d[20], d[21], d[22], d[23], 
            d[28], d[29]})); 
    defparam x5 .WIDTH = 15;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[5], d[8], d[10], d[12], 
            d[15], d[16], d[20], d[21], d[22], d[23], 
            d[24], d[29], d[30]})); 
    defparam x6 .WIDTH = 16;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[3], d[4], d[5], 
            d[6], d[7], d[10], d[12], d[14], d[15], 
            d[16], d[19], d[21], d[24], d[26], d[27], 
            d[29], d[30], d[31]})); 
    defparam x7 .WIDTH = 22;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[3], d[6], d[8], 
            d[9], d[10], d[12], d[14], d[16], d[19], 
            d[20], d[23], d[26], d[28], d[29], d[30], 
            d[31]})); 
    defparam x8 .WIDTH = 20;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[2], d[3], d[4], d[7], d[9], 
            d[10], d[11], d[13], d[15], d[17], d[20], 
            d[21], d[24], d[27], d[29], d[30], d[31]})); 
    defparam x9 .WIDTH = 19;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[7], d[8], d[9], d[13], 
            d[15], d[16], d[17], d[18], d[19], d[21], 
            d[23], d[26], d[27], d[28], d[29], d[30], 
            d[31]})); 
    defparam x10 .WIDTH = 20;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[1], d[3], d[4], d[5], d[7], 
            d[8], d[11], d[12], d[13], d[15], d[16], 
            d[18], d[20], d[23], d[24], d[25], d[26], 
            d[28], d[30], d[31]})); 
    defparam x11 .WIDTH = 22;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[2], d[3], d[6], d[7], d[8], 
            d[10], d[11], d[15], d[16], d[21], d[22], 
            d[23], d[24], d[31]})); 
    defparam x12 .WIDTH = 16;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[3], d[4], d[7], d[8], 
            d[9], d[11], d[12], d[16], d[17], d[22], 
            d[23], d[24], d[25]})); 
    defparam x13 .WIDTH = 16;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[4], d[5], d[8], d[9], 
            d[10], d[12], d[13], d[17], d[18], d[23], 
            d[24], d[25], d[26]})); 
    defparam x14 .WIDTH = 16;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[2], d[5], d[6], d[9], 
            d[10], d[11], d[13], d[14], d[18], d[19], 
            d[24], d[25], d[26], d[27]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[4], d[5], d[6], d[9], 
            d[13], d[17], d[20], d[22], d[23], d[28], 
            d[29]})); 
    defparam x16 .WIDTH = 14;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[2], d[5], d[6], d[7], 
            d[10], d[14], d[18], d[21], d[23], d[24], 
            d[29], d[30]})); 
    defparam x17 .WIDTH = 15;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[3], d[6], d[7], 
            d[8], d[11], d[15], d[19], d[22], d[24], 
            d[25], d[30], d[31]})); 
    defparam x18 .WIDTH = 16;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[12], d[16], d[20], d[23], d[25], 
            d[26], d[31]})); 
    defparam x19 .WIDTH = 15;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[2], d[3], d[5], d[8], d[9], 
            d[10], d[13], d[17], d[21], d[24], d[26], 
            d[27]})); 
    defparam x20 .WIDTH = 14;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[3], d[4], d[6], d[9], d[10], 
            d[11], d[14], d[18], d[22], d[25], d[27], 
            d[28]})); 
    defparam x21 .WIDTH = 14;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[3], d[9], d[13], d[14], d[17], 
            d[22], d[25], d[27], d[28]})); 
    defparam x22 .WIDTH = 11;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[3], d[5], d[7], d[9], d[11], 
            d[12], d[13], d[17], d[18], d[19], d[22], 
            d[25], d[27], d[28]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[4], d[6], d[8], d[10], d[12], 
            d[13], d[14], d[18], d[19], d[20], d[23], 
            d[26], d[28], d[29]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[5], d[7], d[9], d[11], 
            d[13], d[14], d[15], d[19], d[20], d[21], 
            d[24], d[27], d[29], d[30]})); 
    defparam x25 .WIDTH = 17;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[11], d[13], d[16], 
            d[17], d[19], d[20], d[21], d[23], d[26], 
            d[27], d[28], d[29], d[30], d[31]})); 
    defparam x26 .WIDTH = 24;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[12], d[14], 
            d[17], d[18], d[20], d[21], d[22], d[24], 
            d[27], d[28], d[29], d[30], d[31]})); 
    defparam x27 .WIDTH = 24;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[3], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[11], d[13], 
            d[15], d[18], d[19], d[21], d[22], d[23], 
            d[25], d[28], d[29], d[30], d[31]})); 
    defparam x28 .WIDTH = 24;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[10], d[11], d[12], 
            d[14], d[16], d[19], d[20], d[22], d[23], 
            d[24], d[26], d[29], d[30], d[31]})); 
    defparam x29 .WIDTH = 24;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[2], d[3], d[5], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[13], 
            d[15], d[17], d[20], d[21], d[23], d[24], 
            d[25], d[27], d[30], d[31]})); 
    defparam x30 .WIDTH = 23;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[2], d[3], d[4], d[6], d[8], 
            d[9], d[10], d[11], d[12], d[13], d[14], 
            d[16], d[18], d[21], d[22], d[24], d[25], 
            d[26], d[28], d[31]})); 
    defparam x31 .WIDTH = 22;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 15) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[3], d[5], d[6], d[7], d[10], 
            d[11], d[13], d[16], d[20], d[22], d[25], 
            d[26], d[27], d[30], d[31]})); 
    defparam x0 .WIDTH = 17;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[3], d[4], d[5], d[8], d[10], 
            d[12], d[13], d[14], d[16], d[17], d[20], 
            d[21], d[22], d[23], d[25], d[28], d[30]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[3], d[4], d[7], d[9], d[10], 
            d[14], d[15], d[16], d[17], d[18], d[20], 
            d[21], d[23], d[24], d[25], d[27], d[29], 
            d[30]})); 
    defparam x2 .WIDTH = 20;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[4], d[5], d[8], d[10], d[11], 
            d[15], d[16], d[17], d[18], d[19], d[21], 
            d[22], d[24], d[25], d[26], d[28], d[30], 
            d[31]})); 
    defparam x3 .WIDTH = 20;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[3], d[7], d[9], d[10], d[12], 
            d[13], d[17], d[18], d[19], d[23], d[29], 
            d[30]})); 
    defparam x4 .WIDTH = 14;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[3], d[4], d[5], d[6], d[7], 
            d[8], d[14], d[16], d[18], d[19], d[22], 
            d[24], d[25], d[26], d[27]})); 
    defparam x5 .WIDTH = 17;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[4], d[5], d[6], d[7], d[8], 
            d[9], d[15], d[17], d[19], d[20], d[23], 
            d[25], d[26], d[27], d[28]})); 
    defparam x6 .WIDTH = 17;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[3], d[8], d[9], d[11], d[13], 
            d[18], d[21], d[22], d[24], d[25], d[28], 
            d[29], d[30], d[31]})); 
    defparam x7 .WIDTH = 16;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[3], d[4], d[5], d[6], 
            d[7], d[9], d[11], d[12], d[13], d[14], 
            d[16], d[19], d[20], d[23], d[27], d[29]})); 
    defparam x8 .WIDTH = 19;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[4], d[5], d[6], 
            d[7], d[8], d[10], d[12], d[13], d[14], 
            d[15], d[17], d[20], d[21], d[24], d[28], 
            d[30]})); 
    defparam x9 .WIDTH = 20;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[2], d[3], d[8], d[9], 
            d[10], d[14], d[15], d[18], d[20], d[21], 
            d[26], d[27], d[29], d[30]})); 
    defparam x10 .WIDTH = 17;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[2], d[4], d[5], d[6], d[7], 
            d[9], d[13], d[15], d[19], d[20], d[21], 
            d[25], d[26], d[28]})); 
    defparam x11 .WIDTH = 16;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[8], d[11], d[13], d[14], 
            d[21], d[25], d[29], d[30], d[31]})); 
    defparam x12 .WIDTH = 12;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[9], d[12], d[14], 
            d[15], d[22], d[26], d[30], d[31]})); 
    defparam x13 .WIDTH = 12;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[2], d[10], d[13], d[15], 
            d[16], d[23], d[27], d[31]})); 
    defparam x14 .WIDTH = 11;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[2], d[3], d[11], d[14], d[16], 
            d[17], d[24], d[28]})); 
    defparam x15 .WIDTH = 10;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[4], d[5], d[6], d[7], d[10], 
            d[11], d[12], d[13], d[15], d[16], d[17], 
            d[18], d[20], d[22], d[26], d[27], d[29], 
            d[30], d[31]})); 
    defparam x16 .WIDTH = 21;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[5], d[6], d[7], d[8], d[11], 
            d[12], d[13], d[14], d[16], d[17], d[18], 
            d[19], d[21], d[23], d[27], d[28], d[30], 
            d[31]})); 
    defparam x17 .WIDTH = 20;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[6], d[7], d[8], d[9], 
            d[12], d[13], d[14], d[15], d[17], d[18], 
            d[19], d[20], d[22], d[24], d[28], d[29], 
            d[31]})); 
    defparam x18 .WIDTH = 20;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[7], d[8], d[9], 
            d[10], d[13], d[14], d[15], d[16], d[18], 
            d[19], d[20], d[21], d[23], d[25], d[29], 
            d[30]})); 
    defparam x19 .WIDTH = 20;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[1], d[2], d[8], d[9], d[10], 
            d[11], d[14], d[15], d[16], d[17], d[19], 
            d[20], d[21], d[22], d[24], d[26], d[30], 
            d[31]})); 
    defparam x20 .WIDTH = 20;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[2], d[3], d[9], d[10], d[11], 
            d[12], d[15], d[16], d[17], d[18], d[20], 
            d[21], d[22], d[23], d[25], d[27], d[31]})); 
    defparam x21 .WIDTH = 19;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[4], d[5], d[6], d[7], 
            d[12], d[17], d[18], d[19], d[20], d[21], 
            d[23], d[24], d[25], d[27], d[28], d[30], 
            d[31]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[1], d[3], d[8], d[10], 
            d[11], d[16], d[18], d[19], d[21], d[24], 
            d[27], d[28], d[29], d[30]})); 
    defparam x23 .WIDTH = 17;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[2], d[4], d[9], d[11], 
            d[12], d[17], d[19], d[20], d[22], d[25], 
            d[28], d[29], d[30], d[31]})); 
    defparam x24 .WIDTH = 17;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[2], d[3], d[5], d[10], 
            d[12], d[13], d[18], d[20], d[21], d[23], 
            d[26], d[29], d[30], d[31]})); 
    defparam x25 .WIDTH = 17;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[4], d[5], d[7], 
            d[10], d[14], d[16], d[19], d[20], d[21], 
            d[24], d[25], d[26]})); 
    defparam x26 .WIDTH = 16;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[1], d[2], d[5], d[6], 
            d[8], d[11], d[15], d[17], d[20], d[21], 
            d[22], d[25], d[26], d[27]})); 
    defparam x27 .WIDTH = 17;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[2], d[3], d[6], d[7], 
            d[9], d[12], d[16], d[18], d[21], d[22], 
            d[23], d[26], d[27], d[28]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[2], d[3], d[4], d[7], 
            d[8], d[10], d[13], d[17], d[19], d[22], 
            d[23], d[24], d[27], d[28], d[29]})); 
    defparam x29 .WIDTH = 18;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[3], d[4], d[5], d[8], 
            d[9], d[11], d[14], d[18], d[20], d[23], 
            d[24], d[25], d[28], d[29], d[30]})); 
    defparam x30 .WIDTH = 18;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[2], d[4], d[5], d[6], d[9], 
            d[10], d[12], d[15], d[19], d[21], d[24], 
            d[25], d[26], d[29], d[30], d[31]})); 
    defparam x31 .WIDTH = 18;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 16) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[2], d[4], d[6], d[7], 
            d[8], d[12], d[13], d[14], d[16], d[17], 
            d[19], d[20], d[23], d[24], d[26], d[27], 
            d[29]})); 
    defparam x0 .WIDTH = 20;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[9], d[12], d[15], d[16], 
            d[18], d[19], d[21], d[23], d[25], d[26], 
            d[28], d[29], d[30]})); 
    defparam x1 .WIDTH = 22;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[3], d[5], d[8], d[10], 
            d[12], d[14], d[22], d[23], d[30], d[31]})); 
    defparam x2 .WIDTH = 13;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[2], d[4], d[6], d[9], 
            d[11], d[13], d[15], d[23], d[24], d[31]})); 
    defparam x3 .WIDTH = 13;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[8], d[10], d[13], d[17], d[19], 
            d[20], d[23], d[25], d[26], d[27], d[29]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[3], d[5], d[8], d[9], 
            d[11], d[12], d[13], d[16], d[17], d[18], 
            d[19], d[21], d[23], d[28], d[29], d[30]})); 
    defparam x5 .WIDTH = 19;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[4], d[6], d[9], 
            d[10], d[12], d[13], d[14], d[17], d[18], 
            d[19], d[20], d[22], d[24], d[29], d[30], 
            d[31]})); 
    defparam x6 .WIDTH = 20;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[4], d[5], d[6], 
            d[8], d[10], d[11], d[12], d[15], d[16], 
            d[17], d[18], d[21], d[24], d[25], d[26], 
            d[27], d[29], d[30], d[31]})); 
    defparam x7 .WIDTH = 23;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[4], d[5], d[8], 
            d[9], d[11], d[14], d[18], d[20], d[22], 
            d[23], d[24], d[25], d[28], d[29], d[30], 
            d[31]})); 
    defparam x8 .WIDTH = 20;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[5], d[6], d[9], 
            d[10], d[12], d[15], d[19], d[21], d[23], 
            d[24], d[25], d[26], d[29], d[30], d[31]})); 
    defparam x9 .WIDTH = 19;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[3], d[4], d[8], d[10], 
            d[11], d[12], d[14], d[17], d[19], d[22], 
            d[23], d[25], d[29], d[30], d[31]})); 
    defparam x10 .WIDTH = 18;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[2], d[5], d[6], 
            d[7], d[8], d[9], d[11], d[14], d[15], 
            d[16], d[17], d[18], d[19], d[27], d[29], 
            d[30], d[31]})); 
    defparam x11 .WIDTH = 21;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[1], d[3], d[4], d[9], 
            d[10], d[13], d[14], d[15], d[18], d[23], 
            d[24], d[26], d[27], d[28], d[29], d[30], 
            d[31]})); 
    defparam x12 .WIDTH = 20;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[2], d[4], d[5], d[10], 
            d[11], d[14], d[15], d[16], d[19], d[24], 
            d[25], d[27], d[28], d[29], d[30], d[31]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[2], d[3], d[5], d[6], 
            d[11], d[12], d[15], d[16], d[17], d[20], 
            d[25], d[26], d[28], d[29], d[30], d[31]})); 
    defparam x14 .WIDTH = 19;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[1], d[3], d[4], d[6], 
            d[7], d[12], d[13], d[16], d[17], d[18], 
            d[21], d[26], d[27], d[29], d[30], d[31]})); 
    defparam x15 .WIDTH = 19;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[1], d[5], d[6], d[12], 
            d[16], d[18], d[20], d[22], d[23], d[24], 
            d[26], d[28], d[29], d[30], d[31]})); 
    defparam x16 .WIDTH = 18;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[2], d[6], d[7], 
            d[13], d[17], d[19], d[21], d[23], d[24], 
            d[25], d[27], d[29], d[30], d[31]})); 
    defparam x17 .WIDTH = 18;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[2], d[3], d[7], 
            d[8], d[14], d[18], d[20], d[22], d[24], 
            d[25], d[26], d[28], d[30], d[31]})); 
    defparam x18 .WIDTH = 18;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[2], d[3], d[4], 
            d[8], d[9], d[15], d[19], d[21], d[23], 
            d[25], d[26], d[27], d[29], d[31]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[9], d[10], d[16], d[20], d[22], 
            d[24], d[26], d[27], d[28], d[30]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[10], d[11], d[17], d[21], 
            d[23], d[25], d[27], d[28], d[29], d[31]})); 
    defparam x21 .WIDTH = 19;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[3], d[5], d[8], 
            d[11], d[13], d[14], d[16], d[17], d[18], 
            d[19], d[20], d[22], d[23], d[27], d[28], 
            d[30]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[7], d[8], d[9], d[13], 
            d[15], d[16], d[18], d[21], d[26], d[27], 
            d[28], d[31]})); 
    defparam x23 .WIDTH = 15;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[8], d[9], d[10], d[14], 
            d[16], d[17], d[19], d[22], d[27], d[28], 
            d[29]})); 
    defparam x24 .WIDTH = 14;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[3], d[9], d[10], d[11], 
            d[15], d[17], d[18], d[20], d[23], d[28], 
            d[29], d[30]})); 
    defparam x25 .WIDTH = 15;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[2], d[6], d[7], 
            d[8], d[10], d[11], d[13], d[14], d[17], 
            d[18], d[20], d[21], d[23], d[26], d[27], 
            d[30], d[31]})); 
    defparam x26 .WIDTH = 21;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[3], d[7], d[8], 
            d[9], d[11], d[12], d[14], d[15], d[18], 
            d[19], d[21], d[22], d[24], d[27], d[28], 
            d[31]})); 
    defparam x27 .WIDTH = 20;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[2], d[3], d[4], d[8], 
            d[9], d[10], d[12], d[13], d[15], d[16], 
            d[19], d[20], d[22], d[23], d[25], d[28], 
            d[29]})); 
    defparam x28 .WIDTH = 20;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[3], d[4], d[5], d[9], 
            d[10], d[11], d[13], d[14], d[16], d[17], 
            d[20], d[21], d[23], d[24], d[26], d[29], 
            d[30]})); 
    defparam x29 .WIDTH = 20;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[2], d[4], d[5], d[6], 
            d[10], d[11], d[12], d[14], d[15], d[17], 
            d[18], d[21], d[22], d[24], d[25], d[27], 
            d[30], d[31]})); 
    defparam x30 .WIDTH = 21;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[3], d[5], d[6], d[7], 
            d[11], d[12], d[13], d[15], d[16], d[18], 
            d[19], d[22], d[23], d[25], d[26], d[28], 
            d[31]})); 
    defparam x31 .WIDTH = 20;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 17) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[4], d[9], d[10], d[11], d[12], 
            d[15], d[17], d[18], d[20], d[23], d[25], 
            d[26], d[29]})); 
    defparam x0 .WIDTH = 15;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[4], d[5], d[9], d[13], d[15], 
            d[16], d[17], d[19], d[20], d[21], d[23], 
            d[24], d[25], d[27], d[29], d[30]})); 
    defparam x1 .WIDTH = 18;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[4], d[5], d[6], d[9], 
            d[11], d[12], d[14], d[15], d[16], d[21], 
            d[22], d[23], d[24], d[28], d[29], d[30], 
            d[31]})); 
    defparam x2 .WIDTH = 20;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[5], d[6], d[7], 
            d[10], d[12], d[13], d[15], d[16], d[17], 
            d[22], d[23], d[24], d[25], d[29], d[30], 
            d[31]})); 
    defparam x3 .WIDTH = 20;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[10], d[12], d[13], 
            d[14], d[15], d[16], d[20], d[24], d[29], 
            d[30], d[31]})); 
    defparam x4 .WIDTH = 21;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[7], d[8], d[12], d[13], d[14], 
            d[16], d[18], d[20], d[21], d[23], d[26], 
            d[29], d[30], d[31]})); 
    defparam x5 .WIDTH = 22;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[8], d[9], d[13], d[14], 
            d[15], d[17], d[19], d[21], d[22], d[24], 
            d[27], d[30], d[31]})); 
    defparam x6 .WIDTH = 22;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[2], d[3], d[5], d[6], 
            d[7], d[11], d[12], d[14], d[16], d[17], 
            d[22], d[26], d[28], d[29], d[31]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[2], d[3], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[13], d[20], 
            d[25], d[26], d[27], d[30]})); 
    defparam x8 .WIDTH = 17;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[3], d[4], d[7], d[8], 
            d[9], d[10], d[11], d[12], d[14], d[21], 
            d[26], d[27], d[28], d[31]})); 
    defparam x9 .WIDTH = 17;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[2], d[5], d[8], d[13], 
            d[17], d[18], d[20], d[22], d[23], d[25], 
            d[26], d[27], d[28]})); 
    defparam x10 .WIDTH = 16;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[3], d[4], d[6], 
            d[10], d[11], d[12], d[14], d[15], d[17], 
            d[19], d[20], d[21], d[24], d[25], d[27], 
            d[28]})); 
    defparam x11 .WIDTH = 20;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[2], d[5], d[7], d[9], 
            d[10], d[13], d[16], d[17], d[21], d[22], 
            d[23], d[28]})); 
    defparam x12 .WIDTH = 15;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[2], d[3], d[6], d[8], d[10], 
            d[11], d[14], d[17], d[18], d[22], d[23], 
            d[24], d[29]})); 
    defparam x13 .WIDTH = 15;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[3], d[4], d[7], d[9], 
            d[11], d[12], d[15], d[18], d[19], d[23], 
            d[24], d[25], d[30]})); 
    defparam x14 .WIDTH = 16;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[4], d[5], d[8], d[10], 
            d[12], d[13], d[16], d[19], d[20], d[24], 
            d[25], d[26], d[31]})); 
    defparam x15 .WIDTH = 16;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[2], d[4], d[5], d[6], 
            d[10], d[12], d[13], d[14], d[15], d[18], 
            d[21], d[23], d[27], d[29]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[1], d[3], d[5], d[6], d[7], 
            d[11], d[13], d[14], d[15], d[16], d[19], 
            d[22], d[24], d[28], d[30]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[2], d[4], d[6], d[7], 
            d[8], d[12], d[14], d[15], d[16], d[17], 
            d[20], d[23], d[25], d[29], d[31]})); 
    defparam x18 .WIDTH = 18;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[3], d[5], d[7], 
            d[8], d[9], d[13], d[15], d[16], d[17], 
            d[18], d[21], d[24], d[26], d[30]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[2], d[4], d[6], 
            d[8], d[9], d[10], d[14], d[16], d[17], 
            d[18], d[19], d[22], d[25], d[27], d[31]})); 
    defparam x20 .WIDTH = 19;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[9], d[10], d[11], d[15], d[17], 
            d[18], d[19], d[20], d[23], d[26], d[28]})); 
    defparam x21 .WIDTH = 19;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[1], d[2], d[3], d[6], d[8], 
            d[9], d[15], d[16], d[17], d[19], d[21], 
            d[23], d[24], d[25], d[26], d[27]})); 
    defparam x22 .WIDTH = 18;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[2], d[3], d[7], d[11], 
            d[12], d[15], d[16], d[22], d[23], d[24], 
            d[27], d[28], d[29]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[3], d[4], d[8], d[12], 
            d[13], d[16], d[17], d[23], d[24], d[25], 
            d[28], d[29], d[30]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[2], d[4], d[5], d[9], d[13], 
            d[14], d[17], d[18], d[24], d[25], d[26], 
            d[29], d[30], d[31]})); 
    defparam x25 .WIDTH = 16;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[3], d[4], d[5], d[6], d[9], 
            d[11], d[12], d[14], d[17], d[19], d[20], 
            d[23], d[27], d[29], d[30], d[31]})); 
    defparam x26 .WIDTH = 18;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[4], d[5], d[6], d[7], d[10], 
            d[12], d[13], d[15], d[18], d[20], d[21], 
            d[24], d[28], d[30], d[31]})); 
    defparam x27 .WIDTH = 17;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[5], d[6], d[7], d[8], 
            d[11], d[13], d[14], d[16], d[19], d[21], 
            d[22], d[25], d[29], d[31]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[6], d[7], d[8], d[9], 
            d[12], d[14], d[15], d[17], d[20], d[22], 
            d[23], d[26], d[30]})); 
    defparam x29 .WIDTH = 16;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[2], d[7], d[8], d[9], d[10], 
            d[13], d[15], d[16], d[18], d[21], d[23], 
            d[24], d[27], d[31]})); 
    defparam x30 .WIDTH = 16;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[3], d[8], d[9], d[10], d[11], 
            d[14], d[16], d[17], d[19], d[22], d[24], 
            d[25], d[28]})); 
    defparam x31 .WIDTH = 15;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 18) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[3], d[4], d[7], d[10], 
            d[12], d[13], d[14], d[16], d[17], d[18], 
            d[20], d[22], d[28], d[29]})); 
    defparam x0 .WIDTH = 17;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[3], d[5], d[7], 
            d[8], d[10], d[11], d[12], d[15], d[16], 
            d[19], d[20], d[21], d[22], d[23], d[28], 
            d[30]})); 
    defparam x1 .WIDTH = 20;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[2], d[3], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[14], d[18], 
            d[21], d[23], d[24], d[28], d[31]})); 
    defparam x2 .WIDTH = 18;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[2], d[3], d[4], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[15], 
            d[19], d[22], d[24], d[25], d[29]})); 
    defparam x3 .WIDTH = 18;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[5], d[7], d[8], 
            d[9], d[11], d[14], d[17], d[18], d[22], 
            d[23], d[25], d[26], d[28], d[29], d[30]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[2], d[3], d[4], d[6], 
            d[7], d[8], d[9], d[13], d[14], d[15], 
            d[16], d[17], d[19], d[20], d[22], d[23], 
            d[24], d[26], d[27], d[28], d[30], d[31]})); 
    defparam x5 .WIDTH = 25;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[2], d[3], d[4], d[5], 
            d[7], d[8], d[9], d[10], d[14], d[15], 
            d[16], d[17], d[18], d[20], d[21], d[23], 
            d[24], d[25], d[27], d[28], d[29], d[31]})); 
    defparam x6 .WIDTH = 25;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[5], d[6], d[7], 
            d[8], d[9], d[11], d[12], d[13], d[14], 
            d[15], d[19], d[20], d[21], d[24], d[25], 
            d[26], d[30]})); 
    defparam x7 .WIDTH = 21;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[3], d[4], d[6], 
            d[8], d[9], d[15], d[17], d[18], d[21], 
            d[25], d[26], d[27], d[28], d[29], d[31]})); 
    defparam x8 .WIDTH = 19;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[2], d[3], d[4], d[5], 
            d[7], d[9], d[10], d[16], d[18], d[19], 
            d[22], d[26], d[27], d[28], d[29], d[30]})); 
    defparam x9 .WIDTH = 19;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[5], d[6], d[7], d[8], 
            d[11], d[12], d[13], d[14], d[16], d[18], 
            d[19], d[22], d[23], d[27], d[30], d[31]})); 
    defparam x10 .WIDTH = 19;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[9], d[10], d[15], d[16], d[18], 
            d[19], d[22], d[23], d[24], d[29], d[31]})); 
    defparam x11 .WIDTH = 19;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[5], d[9], d[11], d[12], 
            d[13], d[14], d[18], d[19], d[22], d[23], 
            d[24], d[25], d[28], d[29], d[30]})); 
    defparam x12 .WIDTH = 18;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[2], d[6], d[10], d[12], 
            d[13], d[14], d[15], d[19], d[20], d[23], 
            d[24], d[25], d[26], d[29], d[30], d[31]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[3], d[7], d[11], d[13], 
            d[14], d[15], d[16], d[20], d[21], d[24], 
            d[25], d[26], d[27], d[30], d[31]})); 
    defparam x14 .WIDTH = 18;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[2], d[4], d[8], d[12], d[14], 
            d[15], d[16], d[17], d[21], d[22], d[25], 
            d[26], d[27], d[28], d[31]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[4], d[5], d[7], d[9], 
            d[10], d[12], d[14], d[15], d[20], d[23], 
            d[26], d[27]})); 
    defparam x16 .WIDTH = 15;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[1], d[5], d[6], d[8], d[10], 
            d[11], d[13], d[15], d[16], d[21], d[24], 
            d[27], d[28]})); 
    defparam x17 .WIDTH = 15;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[2], d[6], d[7], d[9], d[11], 
            d[12], d[14], d[16], d[17], d[22], d[25], 
            d[28], d[29]})); 
    defparam x18 .WIDTH = 15;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[3], d[7], d[8], d[10], d[12], 
            d[13], d[15], d[17], d[18], d[23], d[26], 
            d[29], d[30]})); 
    defparam x19 .WIDTH = 15;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[4], d[8], d[9], d[11], d[13], 
            d[14], d[16], d[18], d[19], d[24], d[27], 
            d[30], d[31]})); 
    defparam x20 .WIDTH = 15;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[5], d[9], d[10], d[12], d[14], 
            d[15], d[17], d[19], d[20], d[25], d[28], 
            d[31]})); 
    defparam x21 .WIDTH = 14;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[3], d[4], d[6], d[7], d[11], 
            d[12], d[14], d[15], d[17], d[21], d[22], 
            d[26], d[28]})); 
    defparam x22 .WIDTH = 15;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[3], d[5], d[8], d[10], 
            d[14], d[15], d[17], d[20], d[23], d[27], 
            d[28]})); 
    defparam x23 .WIDTH = 14;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[4], d[6], d[9], d[11], 
            d[15], d[16], d[18], d[21], d[24], d[28], 
            d[29]})); 
    defparam x24 .WIDTH = 14;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[2], d[5], d[7], d[10], 
            d[12], d[16], d[17], d[19], d[22], d[25], 
            d[29], d[30]})); 
    defparam x25 .WIDTH = 15;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[4], d[6], d[7], d[8], 
            d[10], d[11], d[12], d[14], d[16], d[22], 
            d[23], d[26], d[28], d[29], d[30], d[31]})); 
    defparam x26 .WIDTH = 19;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[2], d[5], d[7], d[8], d[9], 
            d[11], d[12], d[13], d[15], d[17], d[23], 
            d[24], d[27], d[29], d[30], d[31]})); 
    defparam x27 .WIDTH = 18;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[3], d[6], d[8], d[9], 
            d[10], d[12], d[13], d[14], d[16], d[18], 
            d[24], d[25], d[28], d[30], d[31]})); 
    defparam x28 .WIDTH = 18;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[4], d[7], d[9], 
            d[10], d[11], d[13], d[14], d[15], d[17], 
            d[19], d[25], d[26], d[29], d[31]})); 
    defparam x29 .WIDTH = 18;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[2], d[5], d[8], d[10], 
            d[11], d[12], d[14], d[15], d[16], d[18], 
            d[20], d[26], d[27], d[30]})); 
    defparam x30 .WIDTH = 17;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[2], d[3], d[6], d[9], d[11], 
            d[12], d[13], d[15], d[16], d[17], d[19], 
            d[21], d[27], d[28], d[31]})); 
    defparam x31 .WIDTH = 17;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 19) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[3], d[4], d[9], d[10], 
            d[11], d[12], d[13], d[15], d[16], d[17], 
            d[22], d[23], d[24], d[25], d[26], d[27], 
            d[30], d[31]})); 
    defparam x0 .WIDTH = 21;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[2], d[3], d[5], d[9], 
            d[14], d[15], d[18], d[22], d[28], d[30]})); 
    defparam x1 .WIDTH = 13;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[2], d[6], d[9], 
            d[11], d[12], d[13], d[17], d[19], d[22], 
            d[24], d[25], d[26], d[27], d[29], d[30]})); 
    defparam x2 .WIDTH = 19;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[2], d[3], d[7], 
            d[10], d[12], d[13], d[14], d[18], d[20], 
            d[23], d[25], d[26], d[27], d[28], d[30], 
            d[31]})); 
    defparam x3 .WIDTH = 20;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[2], d[8], d[9], d[10], 
            d[12], d[14], d[16], d[17], d[19], d[21], 
            d[22], d[23], d[25], d[28], d[29], d[30]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[4], d[12], d[16], d[18], d[20], 
            d[25], d[27], d[29]})); 
    defparam x5 .WIDTH = 10;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[5], d[13], d[17], d[19], d[21], 
            d[26], d[28], d[30]})); 
    defparam x6 .WIDTH = 10;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[3], d[4], d[6], 
            d[9], d[10], d[11], d[12], d[13], d[14], 
            d[15], d[16], d[17], d[18], d[20], d[23], 
            d[24], d[25], d[26], d[29], d[30]})); 
    defparam x7 .WIDTH = 24;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[2], d[3], d[5], d[7], d[9], 
            d[14], d[18], d[19], d[21], d[22], d[23]})); 
    defparam x8 .WIDTH = 13;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[3], d[4], d[6], d[8], 
            d[10], d[15], d[19], d[20], d[22], d[23], 
            d[24]})); 
    defparam x9 .WIDTH = 14;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[3], d[5], d[7], d[10], 
            d[12], d[13], d[15], d[17], d[20], d[21], 
            d[22], d[26], d[27], d[30], d[31]})); 
    defparam x10 .WIDTH = 18;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[3], d[6], d[8], d[9], d[10], 
            d[12], d[14], d[15], d[17], d[18], d[21], 
            d[24], d[25], d[26], d[28], d[30]})); 
    defparam x11 .WIDTH = 18;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[1], d[3], d[7], d[12], 
            d[17], d[18], d[19], d[23], d[24], d[29], 
            d[30]})); 
    defparam x12 .WIDTH = 14;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[2], d[4], d[8], d[13], 
            d[18], d[19], d[20], d[24], d[25], d[30], 
            d[31]})); 
    defparam x13 .WIDTH = 14;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[2], d[3], d[5], d[9], d[14], 
            d[19], d[20], d[21], d[25], d[26], d[31]})); 
    defparam x14 .WIDTH = 13;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[3], d[4], d[6], d[10], 
            d[15], d[20], d[21], d[22], d[26], d[27]})); 
    defparam x15 .WIDTH = 13;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[3], d[5], d[7], d[9], d[10], 
            d[12], d[13], d[15], d[17], d[21], d[24], 
            d[25], d[26], d[28], d[30], d[31]})); 
    defparam x16 .WIDTH = 18;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[4], d[6], d[8], d[10], d[11], 
            d[13], d[14], d[16], d[18], d[22], d[25], 
            d[26], d[27], d[29], d[31]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[5], d[7], d[9], d[11], 
            d[12], d[14], d[15], d[17], d[19], d[23], 
            d[26], d[27], d[28], d[30]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[6], d[8], d[10], 
            d[12], d[13], d[15], d[16], d[18], d[20], 
            d[24], d[27], d[28], d[29], d[31]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[1], d[2], d[7], d[9], d[11], 
            d[13], d[14], d[16], d[17], d[19], d[21], 
            d[25], d[28], d[29], d[30]})); 
    defparam x20 .WIDTH = 17;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[2], d[3], d[8], d[10], d[12], 
            d[14], d[15], d[17], d[18], d[20], d[22], 
            d[26], d[29], d[30], d[31]})); 
    defparam x21 .WIDTH = 17;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[10], d[12], d[17], 
            d[18], d[19], d[21], d[22], d[24], d[25], 
            d[26]})); 
    defparam x22 .WIDTH = 14;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[2], d[3], d[4], d[9], d[10], 
            d[12], d[15], d[16], d[17], d[18], d[19], 
            d[20], d[24], d[30], d[31]})); 
    defparam x23 .WIDTH = 17;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[3], d[4], d[5], d[10], d[11], 
            d[13], d[16], d[17], d[18], d[19], d[20], 
            d[21], d[25], d[31]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[4], d[5], d[6], d[11], 
            d[12], d[14], d[17], d[18], d[19], d[20], 
            d[21], d[22], d[26]})); 
    defparam x25 .WIDTH = 16;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[3], d[4], d[5], d[6], d[7], 
            d[9], d[10], d[11], d[16], d[17], d[18], 
            d[19], d[20], d[21], d[24], d[25], d[26], 
            d[30], d[31]})); 
    defparam x26 .WIDTH = 21;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[4], d[5], d[6], d[7], d[8], 
            d[10], d[11], d[12], d[17], d[18], d[19], 
            d[20], d[21], d[22], d[25], d[26], d[27], 
            d[31]})); 
    defparam x27 .WIDTH = 20;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[5], d[6], d[7], d[8], 
            d[9], d[11], d[12], d[13], d[18], d[19], 
            d[20], d[21], d[22], d[23], d[26], d[27], 
            d[28]})); 
    defparam x28 .WIDTH = 20;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[6], d[7], d[8], 
            d[9], d[10], d[12], d[13], d[14], d[19], 
            d[20], d[21], d[22], d[23], d[24], d[27], 
            d[28], d[29]})); 
    defparam x29 .WIDTH = 21;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[2], d[7], d[8], d[9], 
            d[10], d[11], d[13], d[14], d[15], d[20], 
            d[21], d[22], d[23], d[24], d[25], d[28], 
            d[29], d[30]})); 
    defparam x30 .WIDTH = 21;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[2], d[3], d[8], d[9], 
            d[10], d[11], d[12], d[14], d[15], d[16], 
            d[21], d[22], d[23], d[24], d[25], d[26], 
            d[29], d[30], d[31]})); 
    defparam x31 .WIDTH = 22;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 20) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[2], d[6], d[8], d[9], d[10], 
            d[15], d[16], d[17], d[19], d[21], d[27], 
            d[31]})); 
    defparam x0 .WIDTH = 14;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[2], d[3], d[6], d[7], d[8], 
            d[11], d[15], d[18], d[19], d[20], d[21], 
            d[22], d[27], d[28], d[31]})); 
    defparam x1 .WIDTH = 17;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[2], d[3], d[4], d[6], d[7], 
            d[10], d[12], d[15], d[17], d[20], d[22], 
            d[23], d[27], d[28], d[29], d[31]})); 
    defparam x2 .WIDTH = 18;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[3], d[4], d[5], d[7], d[8], 
            d[11], d[13], d[16], d[18], d[21], d[23], 
            d[24], d[28], d[29], d[30]})); 
    defparam x3 .WIDTH = 17;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[2], d[4], d[5], d[10], 
            d[12], d[14], d[15], d[16], d[21], d[22], 
            d[24], d[25], d[27], d[29], d[30]})); 
    defparam x4 .WIDTH = 18;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[2], d[3], d[5], 
            d[8], d[9], d[10], d[11], d[13], d[19], 
            d[21], d[22], d[23], d[25], d[26], d[27], 
            d[28], d[30]})); 
    defparam x5 .WIDTH = 21;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[9], d[10], d[11], d[12], d[14], 
            d[20], d[22], d[23], d[24], d[26], d[27], 
            d[28], d[29], d[31]})); 
    defparam x6 .WIDTH = 22;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[3], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[11], d[12], d[13], 
            d[16], d[17], d[19], d[23], d[24], d[25], 
            d[28], d[29], d[30], d[31]})); 
    defparam x7 .WIDTH = 23;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[4], d[5], d[7], d[12], 
            d[13], d[14], d[15], d[16], d[18], d[19], 
            d[20], d[21], d[24], d[25], d[26], d[27], 
            d[29], d[30]})); 
    defparam x8 .WIDTH = 21;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[5], d[6], d[8], d[13], 
            d[14], d[15], d[16], d[17], d[19], d[20], 
            d[21], d[22], d[25], d[26], d[27], d[28], 
            d[30], d[31]})); 
    defparam x9 .WIDTH = 21;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[7], d[8], d[10], d[14], 
            d[18], d[19], d[20], d[22], d[23], d[26], 
            d[28], d[29]})); 
    defparam x10 .WIDTH = 15;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[1], d[2], d[6], d[10], d[11], 
            d[16], d[17], d[20], d[23], d[24], d[29], 
            d[30], d[31]})); 
    defparam x11 .WIDTH = 15;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[3], d[6], d[7], d[8], 
            d[9], d[10], d[11], d[12], d[15], d[16], 
            d[18], d[19], d[24], d[25], d[27], d[30]})); 
    defparam x12 .WIDTH = 19;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[4], d[7], d[8], 
            d[9], d[10], d[11], d[12], d[13], d[16], 
            d[17], d[19], d[20], d[25], d[26], d[28], 
            d[31]})); 
    defparam x13 .WIDTH = 20;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[2], d[5], d[8], 
            d[9], d[10], d[11], d[12], d[13], d[14], 
            d[17], d[18], d[20], d[21], d[26], d[27], 
            d[29]})); 
    defparam x14 .WIDTH = 20;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[2], d[3], d[6], d[9], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[18], d[19], d[21], d[22], d[27], d[28], 
            d[30]})); 
    defparam x15 .WIDTH = 20;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[3], d[4], d[6], d[7], 
            d[8], d[9], d[11], d[12], d[13], d[14], 
            d[17], d[20], d[21], d[22], d[23], d[27], 
            d[28], d[29]})); 
    defparam x16 .WIDTH = 21;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[4], d[5], d[7], 
            d[8], d[9], d[10], d[12], d[13], d[14], 
            d[15], d[18], d[21], d[22], d[23], d[24], 
            d[28], d[29], d[30]})); 
    defparam x17 .WIDTH = 22;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[2], d[5], d[6], 
            d[8], d[9], d[10], d[11], d[13], d[14], 
            d[15], d[16], d[19], d[22], d[23], d[24], 
            d[25], d[29], d[30], d[31]})); 
    defparam x18 .WIDTH = 23;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[2], d[3], d[6], d[7], 
            d[9], d[10], d[11], d[12], d[14], d[15], 
            d[16], d[17], d[20], d[23], d[24], d[25], 
            d[26], d[30], d[31]})); 
    defparam x19 .WIDTH = 22;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[2], d[3], d[4], d[7], d[8], 
            d[10], d[11], d[12], d[13], d[15], d[16], 
            d[17], d[18], d[21], d[24], d[25], d[26], 
            d[27], d[31]})); 
    defparam x20 .WIDTH = 21;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[3], d[4], d[5], d[8], 
            d[9], d[11], d[12], d[13], d[14], d[16], 
            d[17], d[18], d[19], d[22], d[25], d[26], 
            d[27], d[28]})); 
    defparam x21 .WIDTH = 21;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[2], d[4], d[5], 
            d[8], d[12], d[13], d[14], d[16], d[18], 
            d[20], d[21], d[23], d[26], d[28], d[29], 
            d[31]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[1], d[3], d[5], d[8], 
            d[10], d[13], d[14], d[16], d[22], d[24], 
            d[29], d[30], d[31]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[2], d[4], d[6], d[9], 
            d[11], d[14], d[15], d[17], d[23], d[25], 
            d[30], d[31]})); 
    defparam x24 .WIDTH = 15;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[2], d[3], d[5], d[7], d[10], 
            d[12], d[15], d[16], d[18], d[24], d[26], 
            d[31]})); 
    defparam x25 .WIDTH = 14;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[2], d[3], d[4], d[9], 
            d[10], d[11], d[13], d[15], d[21], d[25], 
            d[31]})); 
    defparam x26 .WIDTH = 14;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[3], d[4], d[5], d[10], 
            d[11], d[12], d[14], d[16], d[22], d[26]})); 
    defparam x27 .WIDTH = 13;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[2], d[4], d[5], d[6], d[11], 
            d[12], d[13], d[15], d[17], d[23], d[27]})); 
    defparam x28 .WIDTH = 13;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[3], d[5], d[6], d[7], d[12], 
            d[13], d[14], d[16], d[18], d[24], d[28]})); 
    defparam x29 .WIDTH = 13;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[4], d[6], d[7], d[8], 
            d[13], d[14], d[15], d[17], d[19], d[25], 
            d[29]})); 
    defparam x30 .WIDTH = 14;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[5], d[7], d[8], d[9], 
            d[14], d[15], d[16], d[18], d[20], d[26], 
            d[30]})); 
    defparam x31 .WIDTH = 14;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 21) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[3], d[4], d[10], 
            d[11], d[12], d[13], d[16], d[19], d[20], 
            d[22], d[26], d[29], d[31]})); 
    defparam x0 .WIDTH = 17;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[2], d[3], d[5], d[10], 
            d[14], d[16], d[17], d[19], d[21], d[22], 
            d[23], d[26], d[27], d[29], d[30], d[31]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[6], d[10], d[12], d[13], 
            d[15], d[16], d[17], d[18], d[19], d[23], 
            d[24], d[26], d[27], d[28], d[29], d[30]})); 
    defparam x2 .WIDTH = 19;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[7], d[11], d[13], d[14], 
            d[16], d[17], d[18], d[19], d[20], d[24], 
            d[25], d[27], d[28], d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 19;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[3], d[4], d[8], 
            d[10], d[11], d[13], d[14], d[15], d[16], 
            d[17], d[18], d[21], d[22], d[25], d[28], 
            d[30]})); 
    defparam x4 .WIDTH = 20;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[2], d[5], d[9], d[10], 
            d[13], d[14], d[15], d[17], d[18], d[20], 
            d[23]})); 
    defparam x5 .WIDTH = 14;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[2], d[3], d[6], d[10], d[11], 
            d[14], d[15], d[16], d[18], d[19], d[21], 
            d[24]})); 
    defparam x6 .WIDTH = 14;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[7], d[10], d[13], 
            d[15], d[17], d[25], d[26], d[29], d[31]})); 
    defparam x7 .WIDTH = 13;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[2], d[3], d[4], d[8], d[10], 
            d[12], d[13], d[14], d[18], d[19], d[20], 
            d[22], d[27], d[29], d[30], d[31]})); 
    defparam x8 .WIDTH = 18;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[3], d[4], d[5], d[9], 
            d[11], d[13], d[14], d[15], d[19], d[20], 
            d[21], d[23], d[28], d[30], d[31]})); 
    defparam x9 .WIDTH = 18;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[3], d[5], d[6], d[11], 
            d[13], d[14], d[15], d[19], d[21], d[24], 
            d[26]})); 
    defparam x10 .WIDTH = 14;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[3], d[6], d[7], d[10], 
            d[11], d[13], d[14], d[15], d[19], d[25], 
            d[26], d[27], d[29], d[31]})); 
    defparam x11 .WIDTH = 17;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[3], d[7], d[8], d[10], d[13], 
            d[14], d[15], d[19], d[22], d[27], d[28], 
            d[29], d[30], d[31]})); 
    defparam x12 .WIDTH = 16;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[4], d[8], d[9], d[11], d[14], 
            d[15], d[16], d[20], d[23], d[28], d[29], 
            d[30], d[31]})); 
    defparam x13 .WIDTH = 15;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[5], d[9], d[10], d[12], 
            d[15], d[16], d[17], d[21], d[24], d[29], 
            d[30], d[31]})); 
    defparam x14 .WIDTH = 15;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[6], d[10], d[11], d[13], 
            d[16], d[17], d[18], d[22], d[25], d[30], 
            d[31]})); 
    defparam x15 .WIDTH = 14;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[2], d[3], d[4], d[7], 
            d[10], d[13], d[14], d[16], d[17], d[18], 
            d[20], d[22], d[23], d[29]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[2], d[3], d[4], d[5], d[8], 
            d[11], d[14], d[15], d[17], d[18], d[19], 
            d[21], d[23], d[24], d[30]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[3], d[4], d[5], d[6], 
            d[9], d[12], d[15], d[16], d[18], d[19], 
            d[20], d[22], d[24], d[25], d[31]})); 
    defparam x18 .WIDTH = 18;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[4], d[5], d[6], 
            d[7], d[10], d[13], d[16], d[17], d[19], 
            d[20], d[21], d[23], d[25], d[26]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[1], d[2], d[5], d[6], d[7], 
            d[8], d[11], d[14], d[17], d[18], d[20], 
            d[21], d[22], d[24], d[26], d[27]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[2], d[3], d[6], d[7], d[8], 
            d[9], d[12], d[15], d[18], d[19], d[21], 
            d[22], d[23], d[25], d[27], d[28]})); 
    defparam x21 .WIDTH = 18;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[7], d[8], d[9], 
            d[11], d[12], d[23], d[24], d[28], d[31]})); 
    defparam x22 .WIDTH = 13;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[2], d[3], d[4], d[8], 
            d[9], d[11], d[16], d[19], d[20], d[22], 
            d[24], d[25], d[26], d[31]})); 
    defparam x23 .WIDTH = 17;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[3], d[4], d[5], d[9], 
            d[10], d[12], d[17], d[20], d[21], d[23], 
            d[25], d[26], d[27]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[2], d[4], d[5], d[6], 
            d[10], d[11], d[13], d[18], d[21], d[22], 
            d[24], d[26], d[27], d[28]})); 
    defparam x25 .WIDTH = 17;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[4], d[5], d[6], d[7], d[10], 
            d[13], d[14], d[16], d[20], d[23], d[25], 
            d[26], d[27], d[28], d[31]})); 
    defparam x26 .WIDTH = 17;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[5], d[6], d[7], d[8], d[11], 
            d[14], d[15], d[17], d[21], d[24], d[26], 
            d[27], d[28], d[29]})); 
    defparam x27 .WIDTH = 16;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[6], d[7], d[8], d[9], 
            d[12], d[15], d[16], d[18], d[22], d[25], 
            d[27], d[28], d[29], d[30]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[7], d[8], d[9], 
            d[10], d[13], d[16], d[17], d[19], d[23], 
            d[26], d[28], d[29], d[30], d[31]})); 
    defparam x29 .WIDTH = 18;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[2], d[8], d[9], d[10], 
            d[11], d[14], d[17], d[18], d[20], d[24], 
            d[27], d[29], d[30], d[31]})); 
    defparam x30 .WIDTH = 17;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[2], d[3], d[9], d[10], 
            d[11], d[12], d[15], d[18], d[19], d[21], 
            d[25], d[28], d[30], d[31]})); 
    defparam x31 .WIDTH = 17;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 22) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[2], d[3], d[5], d[7], d[8], 
            d[9], d[10], d[12], d[14], d[17], d[20], 
            d[25], d[26], d[27], d[28], d[29], d[30]})); 
    defparam x0 .WIDTH = 19;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[2], d[4], d[5], d[6], 
            d[7], d[11], d[12], d[13], d[14], d[15], 
            d[17], d[18], d[20], d[21], d[25], d[31]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[2], d[6], d[9], 
            d[10], d[13], d[15], d[16], d[17], d[18], 
            d[19], d[20], d[21], d[22], d[25], d[27], 
            d[28], d[29], d[30]})); 
    defparam x2 .WIDTH = 22;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[2], d[3], d[7], 
            d[10], d[11], d[14], d[16], d[17], d[18], 
            d[19], d[20], d[21], d[22], d[23], d[26], 
            d[28], d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 23;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[4], d[5], d[7], 
            d[9], d[10], d[11], d[14], d[15], d[18], 
            d[19], d[21], d[22], d[23], d[24], d[25], 
            d[26], d[28], d[31]})); 
    defparam x4 .WIDTH = 22;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[3], d[6], d[7], d[9], 
            d[11], d[14], d[15], d[16], d[17], d[19], 
            d[22], d[23], d[24], d[28], d[30]})); 
    defparam x5 .WIDTH = 18;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[2], d[4], d[7], d[8], d[10], 
            d[12], d[15], d[16], d[17], d[18], d[20], 
            d[23], d[24], d[25], d[29], d[31]})); 
    defparam x6 .WIDTH = 18;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[2], d[7], d[10], d[11], d[12], 
            d[13], d[14], d[16], d[18], d[19], d[20], 
            d[21], d[24], d[27], d[28], d[29]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[2], d[5], d[7], d[9], d[10], 
            d[11], d[13], d[15], d[19], d[21], d[22], 
            d[26], d[27]})); 
    defparam x8 .WIDTH = 15;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[3], d[6], d[8], d[10], 
            d[11], d[12], d[14], d[16], d[20], d[22], 
            d[23], d[27], d[28]})); 
    defparam x9 .WIDTH = 16;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[2], d[3], d[4], d[5], 
            d[8], d[10], d[11], d[13], d[14], d[15], 
            d[20], d[21], d[23], d[24], d[25], d[26], 
            d[27], d[30]})); 
    defparam x10 .WIDTH = 21;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[4], d[6], d[7], d[8], d[10], 
            d[11], d[15], d[16], d[17], d[20], d[21], 
            d[22], d[24], d[29], d[30], d[31]})); 
    defparam x11 .WIDTH = 18;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[2], d[3], d[10], d[11], 
            d[14], d[16], d[18], d[20], d[21], d[22], 
            d[23], d[26], d[27], d[28], d[29], d[31]})); 
    defparam x12 .WIDTH = 19;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[3], d[4], d[11], 
            d[12], d[15], d[17], d[19], d[21], d[22], 
            d[23], d[24], d[27], d[28], d[29], d[30]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[2], d[4], d[5], d[12], 
            d[13], d[16], d[18], d[20], d[22], d[23], 
            d[24], d[25], d[28], d[29], d[30], d[31]})); 
    defparam x14 .WIDTH = 19;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[2], d[3], d[5], d[6], 
            d[13], d[14], d[17], d[19], d[21], d[23], 
            d[24], d[25], d[26], d[29], d[30], d[31]})); 
    defparam x15 .WIDTH = 19;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[2], d[4], d[5], d[6], 
            d[8], d[9], d[10], d[12], d[15], d[17], 
            d[18], d[22], d[24], d[28], d[29], d[31]})); 
    defparam x16 .WIDTH = 19;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[2], d[3], d[5], d[6], d[7], 
            d[9], d[10], d[11], d[13], d[16], d[18], 
            d[19], d[23], d[25], d[29], d[30]})); 
    defparam x17 .WIDTH = 18;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[3], d[4], d[6], d[7], 
            d[8], d[10], d[11], d[12], d[14], d[17], 
            d[19], d[20], d[24], d[26], d[30], d[31]})); 
    defparam x18 .WIDTH = 19;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[4], d[5], d[7], d[8], 
            d[9], d[11], d[12], d[13], d[15], d[18], 
            d[20], d[21], d[25], d[27], d[31]})); 
    defparam x19 .WIDTH = 18;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[2], d[5], d[6], d[8], 
            d[9], d[10], d[12], d[13], d[14], d[16], 
            d[19], d[21], d[22], d[26], d[28]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[1], d[3], d[6], d[7], d[9], 
            d[10], d[11], d[13], d[14], d[15], d[17], 
            d[20], d[22], d[23], d[27], d[29]})); 
    defparam x21 .WIDTH = 18;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[3], d[4], d[5], d[9], 
            d[11], d[15], d[16], d[17], d[18], d[20], 
            d[21], d[23], d[24], d[25], d[26], d[27], 
            d[29]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[2], d[3], d[4], d[6], 
            d[7], d[8], d[9], d[14], d[16], d[18], 
            d[19], d[20], d[21], d[22], d[24], d[29]})); 
    defparam x23 .WIDTH = 19;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[3], d[4], d[5], d[7], 
            d[8], d[9], d[10], d[15], d[17], d[19], 
            d[20], d[21], d[22], d[23], d[25], d[30]})); 
    defparam x24 .WIDTH = 19;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[3], d[4], d[5], d[6], 
            d[8], d[9], d[10], d[11], d[16], d[18], 
            d[20], d[21], d[22], d[23], d[24], d[26], 
            d[31]})); 
    defparam x25 .WIDTH = 20;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[2], d[3], d[4], d[6], 
            d[8], d[11], d[14], d[19], d[20], d[21], 
            d[22], d[23], d[24], d[26], d[28], d[29], 
            d[30]})); 
    defparam x26 .WIDTH = 20;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[3], d[4], d[5], 
            d[7], d[9], d[12], d[15], d[20], d[21], 
            d[22], d[23], d[24], d[25], d[27], d[29], 
            d[30], d[31]})); 
    defparam x27 .WIDTH = 21;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[3], d[4], d[5], d[6], 
            d[8], d[10], d[13], d[16], d[21], d[22], 
            d[23], d[24], d[25], d[26], d[28], d[30], 
            d[31]})); 
    defparam x28 .WIDTH = 20;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[2], d[4], d[5], d[6], 
            d[7], d[9], d[11], d[14], d[17], d[22], 
            d[23], d[24], d[25], d[26], d[27], d[29], 
            d[31]})); 
    defparam x29 .WIDTH = 20;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[3], d[5], d[6], 
            d[7], d[8], d[10], d[12], d[15], d[18], 
            d[23], d[24], d[25], d[26], d[27], d[28], 
            d[30]})); 
    defparam x30 .WIDTH = 20;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[2], d[4], d[6], d[7], 
            d[8], d[9], d[11], d[13], d[16], d[19], 
            d[24], d[25], d[26], d[27], d[28], d[29], 
            d[31]})); 
    defparam x31 .WIDTH = 20;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 23) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[7], d[8], d[9], d[10], d[11], 
            d[13], d[14], d[16], d[18], d[23], d[24], 
            d[25], d[26], d[28], d[31]})); 
    defparam x0 .WIDTH = 23;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[5], d[6], d[12], d[13], d[15], 
            d[16], d[17], d[18], d[19], d[23], d[27], 
            d[28], d[29], d[31]})); 
    defparam x1 .WIDTH = 16;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[2], d[3], d[4], d[8], 
            d[9], d[10], d[11], d[17], d[19], d[20], 
            d[23], d[25], d[26], d[29], d[30], d[31]})); 
    defparam x2 .WIDTH = 19;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[2], d[3], d[4], d[5], d[9], 
            d[10], d[11], d[12], d[18], d[20], d[21], 
            d[24], d[26], d[27], d[30], d[31]})); 
    defparam x3 .WIDTH = 18;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[5], d[7], d[8], 
            d[9], d[12], d[14], d[16], d[18], d[19], 
            d[21], d[22], d[23], d[24], d[26], d[27]})); 
    defparam x4 .WIDTH = 19;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[4], d[7], d[11], d[14], 
            d[15], d[16], d[17], d[18], d[19], d[20], 
            d[22], d[26], d[27], d[31]})); 
    defparam x5 .WIDTH = 17;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[2], d[5], d[8], d[12], 
            d[15], d[16], d[17], d[18], d[19], d[20], 
            d[21], d[23], d[27], d[28]})); 
    defparam x6 .WIDTH = 17;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[2], d[4], d[7], d[8], d[10], 
            d[11], d[14], d[17], d[19], d[20], d[21], 
            d[22], d[23], d[25], d[26], d[29], d[31]})); 
    defparam x7 .WIDTH = 19;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[7], d[10], d[12], d[13], d[14], 
            d[15], d[16], d[20], d[21], d[22], d[25], 
            d[27], d[28], d[30], d[31]})); 
    defparam x8 .WIDTH = 23;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[2], d[3], d[5], 
            d[6], d[7], d[8], d[11], d[13], d[14], 
            d[15], d[16], d[17], d[21], d[22], d[23], 
            d[26], d[28], d[29], d[31]})); 
    defparam x9 .WIDTH = 23;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[10], d[11], d[12], d[13], 
            d[15], d[17], d[22], d[25], d[26], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x10 .WIDTH = 17;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[2], d[3], d[4], d[6], d[7], 
            d[8], d[9], d[10], d[12], d[24], d[25], 
            d[27], d[29], d[30]})); 
    defparam x11 .WIDTH = 16;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[2], d[5], d[6], d[14], 
            d[16], d[18], d[23], d[24], d[30]})); 
    defparam x12 .WIDTH = 12;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[2], d[3], d[6], d[7], d[15], 
            d[17], d[19], d[24], d[25], d[31]})); 
    defparam x13 .WIDTH = 12;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[3], d[4], d[7], d[8], d[16], 
            d[18], d[20], d[25], d[26]})); 
    defparam x14 .WIDTH = 11;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[4], d[5], d[8], d[9], d[17], 
            d[19], d[21], d[26], d[27]})); 
    defparam x15 .WIDTH = 11;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[2], d[3], d[4], d[5], 
            d[7], d[8], d[11], d[13], d[14], d[16], 
            d[20], d[22], d[23], d[24], d[25], d[26], 
            d[27], d[31]})); 
    defparam x16 .WIDTH = 21;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[2], d[3], d[4], d[5], d[6], 
            d[8], d[9], d[12], d[14], d[15], d[17], 
            d[21], d[23], d[24], d[25], d[26], d[27], 
            d[28]})); 
    defparam x17 .WIDTH = 20;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[3], d[4], d[5], d[6], 
            d[7], d[9], d[10], d[13], d[15], d[16], 
            d[18], d[22], d[24], d[25], d[26], d[27], 
            d[28], d[29]})); 
    defparam x18 .WIDTH = 21;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[4], d[5], d[6], d[7], 
            d[8], d[10], d[11], d[14], d[16], d[17], 
            d[19], d[23], d[25], d[26], d[27], d[28], 
            d[29], d[30]})); 
    defparam x19 .WIDTH = 21;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[2], d[5], d[6], d[7], 
            d[8], d[9], d[11], d[12], d[15], d[17], 
            d[18], d[20], d[24], d[26], d[27], d[28], 
            d[29], d[30], d[31]})); 
    defparam x20 .WIDTH = 22;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[3], d[6], d[7], 
            d[8], d[9], d[10], d[12], d[13], d[16], 
            d[18], d[19], d[21], d[25], d[27], d[28], 
            d[29], d[30], d[31]})); 
    defparam x21 .WIDTH = 22;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[3], d[6], d[16], d[17], 
            d[18], d[19], d[20], d[22], d[23], d[24], 
            d[25], d[29], d[30]})); 
    defparam x22 .WIDTH = 16;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[2], d[3], d[6], d[8], d[9], 
            d[10], d[11], d[13], d[14], d[16], d[17], 
            d[19], d[20], d[21], d[28], d[30]})); 
    defparam x23 .WIDTH = 18;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[3], d[4], d[7], d[9], d[10], 
            d[11], d[12], d[14], d[15], d[17], d[18], 
            d[20], d[21], d[22], d[29], d[31]})); 
    defparam x24 .WIDTH = 18;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[4], d[5], d[8], d[10], d[11], 
            d[12], d[13], d[15], d[16], d[18], d[19], 
            d[21], d[22], d[23], d[30]})); 
    defparam x25 .WIDTH = 17;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[7], d[8], d[10], d[12], d[17], 
            d[18], d[19], d[20], d[22], d[25], d[26], 
            d[28]})); 
    defparam x26 .WIDTH = 20;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[8], d[9], d[11], d[13], d[18], 
            d[19], d[20], d[21], d[23], d[26], d[27], 
            d[29]})); 
    defparam x27 .WIDTH = 20;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[9], d[10], d[12], d[14], 
            d[19], d[20], d[21], d[22], d[24], d[27], 
            d[28], d[30]})); 
    defparam x28 .WIDTH = 21;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[10], d[11], d[13], 
            d[15], d[20], d[21], d[22], d[23], d[25], 
            d[28], d[29], d[31]})); 
    defparam x29 .WIDTH = 22;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[7], d[8], d[9], d[11], d[12], 
            d[14], d[16], d[21], d[22], d[23], d[24], 
            d[26], d[29], d[30]})); 
    defparam x30 .WIDTH = 22;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[2], d[3], d[5], 
            d[6], d[7], d[8], d[9], d[10], d[12], 
            d[13], d[15], d[17], d[22], d[23], d[24], 
            d[25], d[27], d[30], d[31]})); 
    defparam x31 .WIDTH = 23;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 24) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[2], d[4], d[8], d[10], 
            d[13], d[15], d[18], d[19], d[21], d[23], 
            d[26], d[27], d[28], d[29], d[30]})); 
    defparam x0 .WIDTH = 18;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[3], d[4], d[5], 
            d[8], d[9], d[10], d[11], d[13], d[14], 
            d[15], d[16], d[18], d[20], d[21], d[22], 
            d[23], d[24], d[26], d[31]})); 
    defparam x1 .WIDTH = 23;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[5], d[6], d[8], d[9], 
            d[11], d[12], d[13], d[14], d[16], d[17], 
            d[18], d[22], d[24], d[25], d[26], d[28], 
            d[29], d[30]})); 
    defparam x2 .WIDTH = 21;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[6], d[7], d[9], d[10], 
            d[12], d[13], d[14], d[15], d[17], d[18], 
            d[19], d[23], d[25], d[26], d[27], d[29], 
            d[30], d[31]})); 
    defparam x3 .WIDTH = 21;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[4], d[7], d[11], d[14], 
            d[16], d[20], d[21], d[23], d[24], d[29], 
            d[31]})); 
    defparam x4 .WIDTH = 14;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[4], d[5], d[10], d[12], 
            d[13], d[17], d[18], d[19], d[22], d[23], 
            d[24], d[25], d[26], d[27], d[28], d[29]})); 
    defparam x5 .WIDTH = 19;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[2], d[5], d[6], d[11], 
            d[13], d[14], d[18], d[19], d[20], d[23], 
            d[24], d[25], d[26], d[27], d[28], d[29], 
            d[30]})); 
    defparam x6 .WIDTH = 20;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[2], d[3], d[4], d[6], d[7], 
            d[8], d[10], d[12], d[13], d[14], d[18], 
            d[20], d[23], d[24], d[25], d[31]})); 
    defparam x7 .WIDTH = 18;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[9], d[10], d[11], d[14], d[18], 
            d[23], d[24], d[25], d[27], d[28], d[29], 
            d[30]})); 
    defparam x8 .WIDTH = 20;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[3], d[4], d[6], 
            d[8], d[10], d[11], d[12], d[15], d[19], 
            d[24], d[25], d[26], d[28], d[29], d[30], 
            d[31]})); 
    defparam x9 .WIDTH = 20;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[3], d[5], d[7], 
            d[8], d[9], d[10], d[11], d[12], d[15], 
            d[16], d[18], d[19], d[20], d[21], d[23], 
            d[25], d[28], d[31]})); 
    defparam x10 .WIDTH = 22;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[6], d[9], d[11], d[12], 
            d[15], d[16], d[17], d[18], d[20], d[22], 
            d[23], d[24], d[27], d[28], d[30]})); 
    defparam x11 .WIDTH = 18;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[2], d[4], d[7], d[8], d[12], 
            d[15], d[16], d[17], d[24], d[25], d[26], 
            d[27], d[30], d[31]})); 
    defparam x12 .WIDTH = 16;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[3], d[5], d[8], d[9], 
            d[13], d[16], d[17], d[18], d[25], d[26], 
            d[27], d[28], d[31]})); 
    defparam x13 .WIDTH = 16;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[4], d[6], d[9], 
            d[10], d[14], d[17], d[18], d[19], d[26], 
            d[27], d[28], d[29]})); 
    defparam x14 .WIDTH = 16;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[2], d[5], d[7], d[10], 
            d[11], d[15], d[18], d[19], d[20], d[27], 
            d[28], d[29], d[30]})); 
    defparam x15 .WIDTH = 16;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[1], d[3], d[4], d[6], 
            d[10], d[11], d[12], d[13], d[15], d[16], 
            d[18], d[20], d[23], d[26], d[27], d[31]})); 
    defparam x16 .WIDTH = 19;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[2], d[4], d[5], 
            d[7], d[11], d[12], d[13], d[14], d[16], 
            d[17], d[19], d[21], d[24], d[27], d[28]})); 
    defparam x17 .WIDTH = 19;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[2], d[3], d[5], d[6], 
            d[8], d[12], d[13], d[14], d[15], d[17], 
            d[18], d[20], d[22], d[25], d[28], d[29]})); 
    defparam x18 .WIDTH = 19;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[2], d[3], d[4], d[6], d[7], 
            d[9], d[13], d[14], d[15], d[16], d[18], 
            d[19], d[21], d[23], d[26], d[29], d[30]})); 
    defparam x19 .WIDTH = 19;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[3], d[4], d[5], d[7], 
            d[8], d[10], d[14], d[15], d[16], d[17], 
            d[19], d[20], d[22], d[24], d[27], d[30], 
            d[31]})); 
    defparam x20 .WIDTH = 20;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[1], d[4], d[5], d[6], d[8], 
            d[9], d[11], d[15], d[16], d[17], d[18], 
            d[20], d[21], d[23], d[25], d[28], d[31]})); 
    defparam x21 .WIDTH = 19;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[12], d[13], d[15], 
            d[16], d[17], d[22], d[23], d[24], d[27], 
            d[28], d[30]})); 
    defparam x22 .WIDTH = 21;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[4], d[5], d[6], d[7], d[9], 
            d[14], d[15], d[16], d[17], d[19], d[21], 
            d[24], d[25], d[26], d[27], d[30], d[31]})); 
    defparam x23 .WIDTH = 19;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[5], d[6], d[7], d[8], d[10], 
            d[15], d[16], d[17], d[18], d[20], d[22], 
            d[25], d[26], d[27], d[28], d[31]})); 
    defparam x24 .WIDTH = 18;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[6], d[7], d[8], d[9], 
            d[11], d[16], d[17], d[18], d[19], d[21], 
            d[23], d[26], d[27], d[28], d[29]})); 
    defparam x25 .WIDTH = 18;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[2], d[4], d[7], d[9], d[12], 
            d[13], d[15], d[17], d[20], d[21], d[22], 
            d[23], d[24], d[26]})); 
    defparam x26 .WIDTH = 16;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[3], d[5], d[8], d[10], d[13], 
            d[14], d[16], d[18], d[21], d[22], d[23], 
            d[24], d[25], d[27]})); 
    defparam x27 .WIDTH = 16;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[4], d[6], d[9], d[11], 
            d[14], d[15], d[17], d[19], d[22], d[23], 
            d[24], d[25], d[26], d[28]})); 
    defparam x28 .WIDTH = 17;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[5], d[7], d[10], d[12], 
            d[15], d[16], d[18], d[20], d[23], d[24], 
            d[25], d[26], d[27], d[29]})); 
    defparam x29 .WIDTH = 17;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[2], d[6], d[8], d[11], 
            d[13], d[16], d[17], d[19], d[21], d[24], 
            d[25], d[26], d[27], d[28], d[30]})); 
    defparam x30 .WIDTH = 18;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[3], d[7], d[9], 
            d[12], d[14], d[17], d[18], d[20], d[22], 
            d[25], d[26], d[27], d[28], d[29], d[31]})); 
    defparam x31 .WIDTH = 19;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 25) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[2], d[4], d[5], d[6], 
            d[7], d[8], d[10], d[11], d[12], d[14], 
            d[15], d[17], d[19], d[20], d[22], d[26], 
            d[29]})); 
    defparam x0 .WIDTH = 20;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[3], d[4], d[9], d[10], 
            d[13], d[14], d[16], d[17], d[18], d[19], 
            d[21], d[22], d[23], d[26], d[27], d[29], 
            d[30]})); 
    defparam x1 .WIDTH = 20;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[1], d[6], d[7], d[8], 
            d[12], d[18], d[23], d[24], d[26], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x2 .WIDTH = 17;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[1], d[2], d[7], d[8], 
            d[9], d[13], d[19], d[24], d[25], d[27], 
            d[28], d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 17;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[3], d[4], d[5], d[6], d[7], 
            d[9], d[11], d[12], d[15], d[17], d[19], 
            d[22], d[25], d[28], d[30], d[31]})); 
    defparam x4 .WIDTH = 18;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[2], d[11], d[13], d[14], 
            d[15], d[16], d[17], d[18], d[19], d[22], 
            d[23], d[31]})); 
    defparam x5 .WIDTH = 15;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[2], d[3], d[12], d[14], 
            d[15], d[16], d[17], d[18], d[19], d[20], 
            d[23], d[24]})); 
    defparam x6 .WIDTH = 15;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[2], d[3], d[5], d[6], 
            d[7], d[8], d[10], d[11], d[12], d[13], 
            d[14], d[16], d[18], d[21], d[22], d[24], 
            d[25], d[26], d[29]})); 
    defparam x7 .WIDTH = 22;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[2], d[3], d[5], d[9], 
            d[10], d[13], d[20], d[23], d[25], d[27], 
            d[29], d[30]})); 
    defparam x8 .WIDTH = 15;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[3], d[4], d[6], 
            d[10], d[11], d[14], d[21], d[24], d[26], 
            d[28], d[30], d[31]})); 
    defparam x9 .WIDTH = 16;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[6], d[8], d[10], d[14], 
            d[17], d[19], d[20], d[25], d[26], d[27], 
            d[31]})); 
    defparam x10 .WIDTH = 14;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[2], d[4], d[5], d[6], 
            d[8], d[9], d[10], d[12], d[14], d[17], 
            d[18], d[19], d[21], d[22], d[27], d[28], 
            d[29]})); 
    defparam x11 .WIDTH = 20;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[2], d[3], d[4], d[8], 
            d[9], d[12], d[13], d[14], d[17], d[18], 
            d[23], d[26], d[28], d[30]})); 
    defparam x12 .WIDTH = 17;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[3], d[4], d[5], d[9], 
            d[10], d[13], d[14], d[15], d[18], d[19], 
            d[24], d[27], d[29], d[31]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[2], d[4], d[5], d[6], 
            d[10], d[11], d[14], d[15], d[16], d[19], 
            d[20], d[25], d[28], d[30]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[1], d[3], d[5], d[6], 
            d[7], d[11], d[12], d[15], d[16], d[17], 
            d[20], d[21], d[26], d[29], d[31]})); 
    defparam x15 .WIDTH = 18;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[5], d[10], d[11], d[13], 
            d[14], d[15], d[16], d[18], d[19], d[20], 
            d[21], d[26], d[27], d[29], d[30]})); 
    defparam x16 .WIDTH = 18;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[6], d[11], d[12], 
            d[14], d[15], d[16], d[17], d[19], d[20], 
            d[21], d[22], d[27], d[28], d[30], d[31]})); 
    defparam x17 .WIDTH = 19;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[2], d[7], d[12], d[13], 
            d[15], d[16], d[17], d[18], d[20], d[21], 
            d[22], d[23], d[28], d[29], d[31]})); 
    defparam x18 .WIDTH = 18;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[2], d[3], d[8], d[13], d[14], 
            d[16], d[17], d[18], d[19], d[21], d[22], 
            d[23], d[24], d[29], d[30]})); 
    defparam x19 .WIDTH = 17;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[3], d[4], d[9], d[14], 
            d[15], d[17], d[18], d[19], d[20], d[22], 
            d[23], d[24], d[25], d[30], d[31]})); 
    defparam x20 .WIDTH = 18;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[1], d[4], d[5], d[10], d[15], 
            d[16], d[18], d[19], d[20], d[21], d[23], 
            d[24], d[25], d[26], d[31]})); 
    defparam x21 .WIDTH = 17;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[4], d[7], d[8], 
            d[10], d[12], d[14], d[15], d[16], d[21], 
            d[24], d[25], d[27], d[29]})); 
    defparam x22 .WIDTH = 17;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[4], d[6], d[7], d[9], d[10], 
            d[12], d[13], d[14], d[16], d[19], d[20], 
            d[25], d[28], d[29], d[30]})); 
    defparam x23 .WIDTH = 17;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[5], d[7], d[8], d[10], d[11], 
            d[13], d[14], d[15], d[17], d[20], d[21], 
            d[26], d[29], d[30], d[31]})); 
    defparam x24 .WIDTH = 17;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[6], d[8], d[9], d[11], d[12], 
            d[14], d[15], d[16], d[18], d[21], d[22], 
            d[27], d[30], d[31]})); 
    defparam x25 .WIDTH = 16;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[2], d[4], d[5], 
            d[6], d[8], d[9], d[11], d[13], d[14], 
            d[16], d[20], d[23], d[26], d[28], d[29], 
            d[31]})); 
    defparam x26 .WIDTH = 20;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[1], d[2], d[3], d[5], 
            d[6], d[7], d[9], d[10], d[12], d[14], 
            d[15], d[17], d[21], d[24], d[27], d[29], 
            d[30]})); 
    defparam x27 .WIDTH = 20;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[7], d[8], d[10], d[11], d[13], 
            d[15], d[16], d[18], d[22], d[25], d[28], 
            d[30], d[31]})); 
    defparam x28 .WIDTH = 21;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[2], d[3], d[4], d[5], 
            d[7], d[8], d[9], d[11], d[12], d[14], 
            d[16], d[17], d[19], d[23], d[26], d[29], 
            d[31]})); 
    defparam x29 .WIDTH = 20;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[2], d[3], d[4], d[5], 
            d[6], d[8], d[9], d[10], d[12], d[13], 
            d[15], d[17], d[18], d[20], d[24], d[27], 
            d[30]})); 
    defparam x30 .WIDTH = 20;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[3], d[4], d[5], 
            d[6], d[7], d[9], d[10], d[11], d[13], 
            d[14], d[16], d[18], d[19], d[21], d[25], 
            d[28], d[31]})); 
    defparam x31 .WIDTH = 21;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 26) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[2], d[6], d[7], d[8], d[13], 
            d[15], d[16], d[18], d[20], d[23], d[25], 
            d[28], d[30]})); 
    defparam x0 .WIDTH = 15;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[2], d[3], d[6], d[9], d[13], 
            d[14], d[15], d[17], d[18], d[19], d[20], 
            d[21], d[23], d[24], d[25], d[26], d[28], 
            d[29], d[30], d[31]})); 
    defparam x1 .WIDTH = 22;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[10], d[13], d[14], d[19], d[21], 
            d[22], d[23], d[24], d[26], d[27], d[28], 
            d[29], d[31]})); 
    defparam x2 .WIDTH = 21;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[3], d[4], d[5], d[7], 
            d[9], d[11], d[14], d[15], d[20], d[22], 
            d[23], d[24], d[25], d[27], d[28], d[29], 
            d[30]})); 
    defparam x3 .WIDTH = 20;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[4], d[5], d[7], d[10], 
            d[12], d[13], d[18], d[20], d[21], d[24], 
            d[26], d[29], d[31]})); 
    defparam x4 .WIDTH = 16;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[1], d[2], d[5], d[7], d[11], 
            d[14], d[15], d[16], d[18], d[19], d[20], 
            d[21], d[22], d[23], d[27], d[28]})); 
    defparam x5 .WIDTH = 18;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[2], d[3], d[6], d[8], d[12], 
            d[15], d[16], d[17], d[19], d[20], d[21], 
            d[22], d[23], d[24], d[28], d[29]})); 
    defparam x6 .WIDTH = 18;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[9], d[15], d[17], d[21], d[22], 
            d[24], d[28], d[29]})); 
    defparam x7 .WIDTH = 16;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[8], d[9], d[10], d[13], d[15], 
            d[20], d[22], d[28], d[29]})); 
    defparam x8 .WIDTH = 17;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[2], d[3], d[4], d[5], d[6], 
            d[7], d[9], d[10], d[11], d[14], d[16], 
            d[21], d[23], d[29], d[30]})); 
    defparam x9 .WIDTH = 17;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[2], d[3], d[4], d[5], d[10], 
            d[11], d[12], d[13], d[16], d[17], d[18], 
            d[20], d[22], d[23], d[24], d[25], d[28], 
            d[31]})); 
    defparam x10 .WIDTH = 20;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[2], d[3], d[4], d[5], 
            d[7], d[8], d[11], d[12], d[14], d[15], 
            d[16], d[17], d[19], d[20], d[21], d[24], 
            d[26], d[28], d[29], d[30]})); 
    defparam x11 .WIDTH = 23;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[7], d[9], d[12], d[17], d[21], 
            d[22], d[23], d[27], d[28], d[29], d[31]})); 
    defparam x12 .WIDTH = 19;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[8], d[10], d[13], d[18], 
            d[22], d[23], d[24], d[28], d[29], d[30]})); 
    defparam x13 .WIDTH = 19;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[6], d[7], d[9], d[11], d[14], 
            d[19], d[23], d[24], d[25], d[29], d[30], 
            d[31]})); 
    defparam x14 .WIDTH = 20;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[2], d[3], d[4], d[5], 
            d[6], d[7], d[8], d[10], d[12], d[15], 
            d[20], d[24], d[25], d[26], d[30], d[31]})); 
    defparam x15 .WIDTH = 19;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[3], d[4], d[5], d[9], 
            d[11], d[15], d[18], d[20], d[21], d[23], 
            d[26], d[27], d[28], d[30], d[31]})); 
    defparam x16 .WIDTH = 18;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[1], d[4], d[5], d[6], d[10], 
            d[12], d[16], d[19], d[21], d[22], d[24], 
            d[27], d[28], d[29], d[31]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[2], d[5], d[6], d[7], 
            d[11], d[13], d[17], d[20], d[22], d[23], 
            d[25], d[28], d[29], d[30]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[3], d[6], d[7], d[8], 
            d[12], d[14], d[18], d[21], d[23], d[24], 
            d[26], d[29], d[30], d[31]})); 
    defparam x19 .WIDTH = 17;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[2], d[4], d[7], d[8], d[9], 
            d[13], d[15], d[19], d[22], d[24], d[25], 
            d[27], d[30], d[31]})); 
    defparam x20 .WIDTH = 16;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[3], d[5], d[8], d[9], 
            d[10], d[14], d[16], d[20], d[23], d[25], 
            d[26], d[28], d[31]})); 
    defparam x21 .WIDTH = 16;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[10], d[11], d[13], d[16], d[17], 
            d[18], d[20], d[21], d[23], d[24], d[25], 
            d[26], d[27], d[28], d[29], d[30]})); 
    defparam x22 .WIDTH = 24;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[3], d[5], d[6], d[7], d[9], 
            d[10], d[11], d[12], d[13], d[14], d[15], 
            d[16], d[17], d[19], d[20], d[21], d[22], 
            d[23], d[24], d[26], d[27], d[29], d[31]})); 
    defparam x23 .WIDTH = 25;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[4], d[6], d[7], d[8], d[10], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[17], d[18], d[20], d[21], d[22], d[23], 
            d[24], d[25], d[27], d[28], d[30]})); 
    defparam x24 .WIDTH = 24;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[5], d[7], d[8], d[9], 
            d[11], d[12], d[13], d[14], d[15], d[16], 
            d[17], d[18], d[19], d[21], d[22], d[23], 
            d[24], d[25], d[26], d[28], d[29], d[31]})); 
    defparam x25 .WIDTH = 25;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[2], d[7], d[9], 
            d[10], d[12], d[14], d[17], d[19], d[22], 
            d[24], d[26], d[27], d[28], d[29]})); 
    defparam x26 .WIDTH = 18;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[3], d[8], d[10], 
            d[11], d[13], d[15], d[18], d[20], d[23], 
            d[25], d[27], d[28], d[29], d[30]})); 
    defparam x27 .WIDTH = 18;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[2], d[3], d[4], d[9], d[11], 
            d[12], d[14], d[16], d[19], d[21], d[24], 
            d[26], d[28], d[29], d[30], d[31]})); 
    defparam x28 .WIDTH = 18;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[3], d[4], d[5], d[10], d[12], 
            d[13], d[15], d[17], d[20], d[22], d[25], 
            d[27], d[29], d[30], d[31]})); 
    defparam x29 .WIDTH = 17;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[4], d[5], d[6], d[11], 
            d[13], d[14], d[16], d[18], d[21], d[23], 
            d[26], d[28], d[30], d[31]})); 
    defparam x30 .WIDTH = 17;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[5], d[6], d[7], d[12], 
            d[14], d[15], d[17], d[19], d[22], d[24], 
            d[27], d[29], d[31]})); 
    defparam x31 .WIDTH = 16;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 27) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[3], d[6], d[7], 
            d[9], d[12], d[13], d[14], d[15], d[17], 
            d[18], d[20], d[21], d[22], d[27], d[28], 
            d[31]})); 
    defparam x0 .WIDTH = 20;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[9], d[10], d[12], d[16], d[17], 
            d[19], d[20], d[23], d[27], d[29], d[31]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[4], d[5], d[6], d[10], d[11], 
            d[12], d[14], d[15], d[22], d[24], d[27], 
            d[30], d[31]})); 
    defparam x2 .WIDTH = 15;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[5], d[6], d[7], d[11], 
            d[12], d[13], d[15], d[16], d[23], d[25], 
            d[28], d[31]})); 
    defparam x3 .WIDTH = 15;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[3], d[8], d[9], d[15], d[16], 
            d[18], d[20], d[21], d[22], d[24], d[26], 
            d[27], d[28], d[29], d[31]})); 
    defparam x4 .WIDTH = 17;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[3], d[4], d[6], 
            d[7], d[10], d[12], d[13], d[14], d[15], 
            d[16], d[18], d[19], d[20], d[23], d[25], 
            d[29], d[30], d[31]})); 
    defparam x5 .WIDTH = 22;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[1], d[2], d[4], d[5], d[7], 
            d[8], d[11], d[13], d[14], d[15], d[16], 
            d[17], d[19], d[20], d[21], d[24], d[26], 
            d[30], d[31]})); 
    defparam x6 .WIDTH = 21;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[2], d[5], d[7], d[8], 
            d[13], d[16], d[25], d[28]})); 
    defparam x7 .WIDTH = 11;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[7], d[8], d[12], 
            d[13], d[15], d[18], d[20], d[21], d[22], 
            d[26], d[27], d[28], d[29], d[31]})); 
    defparam x8 .WIDTH = 18;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[2], d[3], d[8], d[9], d[13], 
            d[14], d[16], d[19], d[21], d[22], d[23], 
            d[27], d[28], d[29], d[30]})); 
    defparam x9 .WIDTH = 17;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[4], d[6], d[7], 
            d[10], d[12], d[13], d[18], d[21], d[23], 
            d[24], d[27], d[29], d[30]})); 
    defparam x10 .WIDTH = 17;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[2], d[3], d[5], d[6], d[8], 
            d[9], d[11], d[12], d[15], d[17], d[18], 
            d[19], d[20], d[21], d[24], d[25], d[27], 
            d[30]})); 
    defparam x11 .WIDTH = 20;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[4], d[10], d[14], d[15], 
            d[16], d[17], d[19], d[25], d[26], d[27]})); 
    defparam x12 .WIDTH = 13;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[2], d[5], d[11], d[15], 
            d[16], d[17], d[18], d[20], d[26], d[27], 
            d[28]})); 
    defparam x13 .WIDTH = 14;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[1], d[3], d[6], d[12], 
            d[16], d[17], d[18], d[19], d[21], d[27], 
            d[28], d[29]})); 
    defparam x14 .WIDTH = 15;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[1], d[2], d[4], d[7], 
            d[13], d[17], d[18], d[19], d[20], d[22], 
            d[28], d[29], d[30]})); 
    defparam x15 .WIDTH = 16;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[2], d[5], d[6], d[7], d[8], 
            d[9], d[12], d[13], d[15], d[17], d[19], 
            d[22], d[23], d[27], d[28], d[29], d[30]})); 
    defparam x16 .WIDTH = 19;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[3], d[6], d[7], d[8], 
            d[9], d[10], d[13], d[14], d[16], d[18], 
            d[20], d[23], d[24], d[28], d[29], d[30], 
            d[31]})); 
    defparam x17 .WIDTH = 20;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[4], d[7], d[8], 
            d[9], d[10], d[11], d[14], d[15], d[17], 
            d[19], d[21], d[24], d[25], d[29], d[30], 
            d[31]})); 
    defparam x18 .WIDTH = 20;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[2], d[5], d[8], 
            d[9], d[10], d[11], d[12], d[15], d[16], 
            d[18], d[20], d[22], d[25], d[26], d[30], 
            d[31]})); 
    defparam x19 .WIDTH = 20;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[2], d[3], d[6], 
            d[9], d[10], d[11], d[12], d[13], d[16], 
            d[17], d[19], d[21], d[23], d[26], d[27], 
            d[31]})); 
    defparam x20 .WIDTH = 20;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[3], d[4], 
            d[7], d[10], d[11], d[12], d[13], d[14], 
            d[17], d[18], d[20], d[22], d[24], d[27], 
            d[28]})); 
    defparam x21 .WIDTH = 20;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[2], d[4], d[5], d[6], 
            d[7], d[8], d[9], d[11], d[17], d[19], 
            d[20], d[22], d[23], d[25], d[27], d[29], 
            d[31]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[5], d[8], d[10], d[13], d[14], 
            d[15], d[17], d[22], d[23], d[24], d[26], 
            d[27], d[30], d[31]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[6], d[9], d[11], d[14], d[15], 
            d[16], d[18], d[23], d[24], d[25], d[27], 
            d[28], d[31]})); 
    defparam x24 .WIDTH = 15;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[7], d[10], d[12], d[15], d[16], 
            d[17], d[19], d[24], d[25], d[26], d[28], 
            d[29]})); 
    defparam x25 .WIDTH = 14;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[1], d[3], d[6], d[7], 
            d[8], d[9], d[11], d[12], d[14], d[15], 
            d[16], d[21], d[22], d[25], d[26], d[28], 
            d[29], d[30], d[31]})); 
    defparam x26 .WIDTH = 22;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[1], d[2], d[4], d[7], d[8], 
            d[9], d[10], d[12], d[13], d[15], d[16], 
            d[17], d[22], d[23], d[26], d[27], d[29], 
            d[30], d[31]})); 
    defparam x27 .WIDTH = 21;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[2], d[3], d[5], d[8], d[9], 
            d[10], d[11], d[13], d[14], d[16], d[17], 
            d[18], d[23], d[24], d[27], d[28], d[30], 
            d[31]})); 
    defparam x28 .WIDTH = 20;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[3], d[4], d[6], d[9], 
            d[10], d[11], d[12], d[14], d[15], d[17], 
            d[18], d[19], d[24], d[25], d[28], d[29], 
            d[31]})); 
    defparam x29 .WIDTH = 20;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[4], d[5], d[7], d[10], 
            d[11], d[12], d[13], d[15], d[16], d[18], 
            d[19], d[20], d[25], d[26], d[29], d[30]})); 
    defparam x30 .WIDTH = 19;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[2], d[5], d[6], d[8], 
            d[11], d[12], d[13], d[14], d[16], d[17], 
            d[19], d[20], d[21], d[26], d[27], d[30], 
            d[31]})); 
    defparam x31 .WIDTH = 20;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 28) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[1], d[2], d[5], d[8], d[9], 
            d[11], d[14], d[18], d[20], d[23], d[26], 
            d[29], d[30]})); 
    defparam x0 .WIDTH = 15;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[1], d[3], d[5], d[6], 
            d[8], d[10], d[11], d[12], d[14], d[15], 
            d[18], d[19], d[20], d[21], d[23], d[24], 
            d[26], d[27], d[29], d[31]})); 
    defparam x1 .WIDTH = 23;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[4], d[5], d[6], d[7], 
            d[8], d[12], d[13], d[14], d[15], d[16], 
            d[18], d[19], d[21], d[22], d[23], d[24], 
            d[25], d[26], d[27], d[28], d[29]})); 
    defparam x2 .WIDTH = 24;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[5], d[6], d[7], d[8], 
            d[9], d[13], d[14], d[15], d[16], d[17], 
            d[19], d[20], d[22], d[23], d[24], d[25], 
            d[26], d[27], d[28], d[29], d[30]})); 
    defparam x3 .WIDTH = 24;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[5], d[6], d[7], 
            d[10], d[11], d[15], d[16], d[17], d[21], 
            d[24], d[25], d[27], d[28], d[31]})); 
    defparam x4 .WIDTH = 18;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[5], d[6], d[7], d[9], d[12], 
            d[14], d[16], d[17], d[20], d[22], d[23], 
            d[25], d[28], d[30]})); 
    defparam x5 .WIDTH = 16;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[6], d[7], d[8], d[10], 
            d[13], d[15], d[17], d[18], d[21], d[23], 
            d[24], d[26], d[29], d[31]})); 
    defparam x6 .WIDTH = 17;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[2], d[5], d[7], d[16], 
            d[19], d[20], d[22], d[23], d[24], d[25], 
            d[26], d[27], d[29]})); 
    defparam x7 .WIDTH = 16;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[2], d[3], d[5], d[6], d[9], 
            d[11], d[14], d[17], d[18], d[21], d[24], 
            d[25], d[27], d[28], d[29]})); 
    defparam x8 .WIDTH = 17;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[3], d[4], d[6], d[7], d[10], 
            d[12], d[15], d[18], d[19], d[22], d[25], 
            d[26], d[28], d[29], d[30]})); 
    defparam x9 .WIDTH = 17;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[2], d[4], d[7], d[9], 
            d[13], d[14], d[16], d[18], d[19], d[27], 
            d[31]})); 
    defparam x10 .WIDTH = 14;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[3], d[9], d[10], 
            d[11], d[15], d[17], d[18], d[19], d[23], 
            d[26], d[28], d[29], d[30]})); 
    defparam x11 .WIDTH = 17;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[4], d[5], d[8], d[9], 
            d[10], d[12], d[14], d[16], d[19], d[23], 
            d[24], d[26], d[27], d[31]})); 
    defparam x12 .WIDTH = 17;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[1], d[5], d[6], d[9], 
            d[10], d[11], d[13], d[15], d[17], d[20], 
            d[24], d[25], d[27], d[28]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[2], d[6], d[7], d[10], 
            d[11], d[12], d[14], d[16], d[18], d[21], 
            d[25], d[26], d[28], d[29]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[2], d[3], d[7], d[8], 
            d[11], d[12], d[13], d[15], d[17], d[19], 
            d[22], d[26], d[27], d[29], d[30]})); 
    defparam x15 .WIDTH = 18;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[2], d[3], d[4], d[5], d[11], 
            d[12], d[13], d[16], d[26], d[27], d[28], 
            d[29], d[31]})); 
    defparam x16 .WIDTH = 15;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[3], d[4], d[5], d[6], d[12], 
            d[13], d[14], d[17], d[27], d[28], d[29], 
            d[30]})); 
    defparam x17 .WIDTH = 14;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[4], d[5], d[6], d[7], 
            d[13], d[14], d[15], d[18], d[28], d[29], 
            d[30], d[31]})); 
    defparam x18 .WIDTH = 15;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[5], d[6], d[7], d[8], 
            d[14], d[15], d[16], d[19], d[29], d[30], 
            d[31]})); 
    defparam x19 .WIDTH = 14;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[2], d[6], d[7], d[8], 
            d[9], d[15], d[16], d[17], d[20], d[30], 
            d[31]})); 
    defparam x20 .WIDTH = 14;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[1], d[3], d[7], d[8], d[9], 
            d[10], d[16], d[17], d[18], d[21], d[31]})); 
    defparam x21 .WIDTH = 13;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[4], d[5], d[10], 
            d[14], d[17], d[19], d[20], d[22], d[23], 
            d[26], d[29], d[30]})); 
    defparam x22 .WIDTH = 16;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[6], d[8], d[9], d[14], 
            d[15], d[21], d[24], d[26], d[27], d[29], 
            d[31]})); 
    defparam x23 .WIDTH = 14;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[7], d[9], d[10], d[15], 
            d[16], d[22], d[25], d[27], d[28], d[30]})); 
    defparam x24 .WIDTH = 13;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[2], d[8], d[10], d[11], 
            d[16], d[17], d[23], d[26], d[28], d[29], 
            d[31]})); 
    defparam x25 .WIDTH = 14;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[2], d[3], d[5], d[8], d[12], 
            d[14], d[17], d[20], d[23], d[24], d[26], 
            d[27]})); 
    defparam x26 .WIDTH = 14;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[3], d[4], d[6], d[9], 
            d[13], d[15], d[18], d[21], d[24], d[25], 
            d[27], d[28]})); 
    defparam x27 .WIDTH = 15;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[4], d[5], d[7], d[10], 
            d[14], d[16], d[19], d[22], d[25], d[26], 
            d[28], d[29]})); 
    defparam x28 .WIDTH = 15;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[2], d[5], d[6], d[8], d[11], 
            d[15], d[17], d[20], d[23], d[26], d[27], 
            d[29], d[30]})); 
    defparam x29 .WIDTH = 15;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[3], d[6], d[7], d[9], 
            d[12], d[16], d[18], d[21], d[24], d[27], 
            d[28], d[30], d[31]})); 
    defparam x30 .WIDTH = 16;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[1], d[4], d[7], d[8], 
            d[10], d[13], d[17], d[19], d[22], d[25], 
            d[28], d[29], d[31]})); 
    defparam x31 .WIDTH = 16;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 29) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[2], d[4], d[5], d[7], d[8], 
            d[11], d[14], d[21], d[23], d[24], d[25], 
            d[28]})); 
    defparam x0 .WIDTH = 14;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[2], d[3], d[4], d[6], 
            d[7], d[9], d[11], d[12], d[14], d[15], 
            d[21], d[22], d[23], d[26], d[28], d[29]})); 
    defparam x1 .WIDTH = 19;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[1], d[2], d[3], d[10], d[11], 
            d[12], d[13], d[14], d[15], d[16], d[21], 
            d[22], d[25], d[27], d[28], d[29], d[30]})); 
    defparam x2 .WIDTH = 19;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[2], d[3], d[4], d[11], d[12], 
            d[13], d[14], d[15], d[16], d[17], d[22], 
            d[23], d[26], d[28], d[29], d[30], d[31]})); 
    defparam x3 .WIDTH = 19;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[2], d[3], d[7], d[8], d[11], 
            d[12], d[13], d[15], d[16], d[17], d[18], 
            d[21], d[25], d[27], d[28], d[29], d[30], 
            d[31]})); 
    defparam x4 .WIDTH = 20;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[2], d[3], d[5], d[7], 
            d[9], d[11], d[12], d[13], d[16], d[17], 
            d[18], d[19], d[21], d[22], d[23], d[24], 
            d[25], d[26], d[29], d[30], d[31]})); 
    defparam x5 .WIDTH = 24;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[3], d[4], d[6], 
            d[8], d[10], d[12], d[13], d[14], d[17], 
            d[18], d[19], d[20], d[22], d[23], d[24], 
            d[25], d[26], d[27], d[30], d[31]})); 
    defparam x6 .WIDTH = 24;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[8], d[9], d[13], 
            d[15], d[18], d[19], d[20], d[26], d[27], 
            d[31]})); 
    defparam x7 .WIDTH = 14;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[4], d[5], d[7], 
            d[8], d[9], d[10], d[11], d[16], d[19], 
            d[20], d[23], d[24], d[25], d[27]})); 
    defparam x8 .WIDTH = 18;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[1], d[2], d[5], d[6], d[8], 
            d[9], d[10], d[11], d[12], d[17], d[20], 
            d[21], d[24], d[25], d[26], d[28]})); 
    defparam x9 .WIDTH = 18;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[3], d[4], d[5], d[6], 
            d[8], d[9], d[10], d[12], d[13], d[14], 
            d[18], d[22], d[23], d[24], d[26], d[27], 
            d[28], d[29]})); 
    defparam x10 .WIDTH = 21;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[1], d[2], d[6], d[8], 
            d[9], d[10], d[13], d[15], d[19], d[21], 
            d[27], d[29], d[30]})); 
    defparam x11 .WIDTH = 16;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[1], d[3], d[4], d[5], 
            d[8], d[9], d[10], d[16], d[20], d[21], 
            d[22], d[23], d[24], d[25], d[30], d[31]})); 
    defparam x12 .WIDTH = 19;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[2], d[4], d[5], d[6], 
            d[9], d[10], d[11], d[17], d[21], d[22], 
            d[23], d[24], d[25], d[26], d[31]})); 
    defparam x13 .WIDTH = 18;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[2], d[3], d[5], d[6], d[7], 
            d[10], d[11], d[12], d[18], d[22], d[23], 
            d[24], d[25], d[26], d[27]})); 
    defparam x14 .WIDTH = 17;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[0], d[3], d[4], d[6], d[7], 
            d[8], d[11], d[12], d[13], d[19], d[23], 
            d[24], d[25], d[26], d[27], d[28]})); 
    defparam x15 .WIDTH = 18;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[1], d[2], d[9], d[11], 
            d[12], d[13], d[20], d[21], d[23], d[26], 
            d[27], d[29]})); 
    defparam x16 .WIDTH = 15;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[2], d[3], d[10], 
            d[12], d[13], d[14], d[21], d[22], d[24], 
            d[27], d[28], d[30]})); 
    defparam x17 .WIDTH = 16;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[2], d[3], d[4], d[11], 
            d[13], d[14], d[15], d[22], d[23], d[25], 
            d[28], d[29], d[31]})); 
    defparam x18 .WIDTH = 16;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[2], d[3], d[4], d[5], d[12], 
            d[14], d[15], d[16], d[23], d[24], d[26], 
            d[29], d[30]})); 
    defparam x19 .WIDTH = 15;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[3], d[4], d[5], d[6], 
            d[13], d[15], d[16], d[17], d[24], d[25], 
            d[27], d[30], d[31]})); 
    defparam x20 .WIDTH = 16;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[4], d[5], d[6], 
            d[7], d[14], d[16], d[17], d[18], d[25], 
            d[26], d[28], d[31]})); 
    defparam x21 .WIDTH = 16;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[1], d[4], d[6], d[11], 
            d[14], d[15], d[17], d[18], d[19], d[21], 
            d[23], d[24], d[25], d[26], d[27], d[28], 
            d[29]})); 
    defparam x22 .WIDTH = 20;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[4], d[8], d[11], d[12], 
            d[14], d[15], d[16], d[18], d[19], d[20], 
            d[21], d[22], d[23], d[26], d[27], d[29], 
            d[30]})); 
    defparam x23 .WIDTH = 20;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[5], d[9], d[12], d[13], 
            d[15], d[16], d[17], d[19], d[20], d[21], 
            d[22], d[23], d[24], d[27], d[28], d[30], 
            d[31]})); 
    defparam x24 .WIDTH = 20;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[0], d[3], d[6], d[10], d[13], 
            d[14], d[16], d[17], d[18], d[20], d[21], 
            d[22], d[23], d[24], d[25], d[28], d[29], 
            d[31]})); 
    defparam x25 .WIDTH = 20;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[2], d[5], d[8], d[15], 
            d[17], d[18], d[19], d[22], d[26], d[28], 
            d[29], d[30]})); 
    defparam x26 .WIDTH = 15;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[3], d[6], d[9], 
            d[16], d[18], d[19], d[20], d[23], d[27], 
            d[29], d[30], d[31]})); 
    defparam x27 .WIDTH = 16;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[3], d[4], d[7], 
            d[10], d[17], d[19], d[20], d[21], d[24], 
            d[28], d[30], d[31]})); 
    defparam x28 .WIDTH = 16;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[1], d[2], d[4], d[5], d[8], 
            d[11], d[18], d[20], d[21], d[22], d[25], 
            d[29], d[31]})); 
    defparam x29 .WIDTH = 15;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[2], d[3], d[5], d[6], 
            d[9], d[12], d[19], d[21], d[22], d[23], 
            d[26], d[30]})); 
    defparam x30 .WIDTH = 15;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[3], d[4], d[6], d[7], 
            d[10], d[13], d[20], d[22], d[23], d[24], 
            d[27], d[31]})); 
    defparam x31 .WIDTH = 15;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 30) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[3], d[4], d[5], d[6], 
            d[10], d[12], d[15], d[16], d[22]})); 
    defparam x0 .WIDTH = 12;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[1], d[3], d[7], d[10], d[11], 
            d[12], d[13], d[15], d[17], d[22], d[23]})); 
    defparam x1 .WIDTH = 13;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[2], d[3], d[5], d[6], d[8], 
            d[10], d[11], d[13], d[14], d[15], d[18], 
            d[22], d[23], d[24]})); 
    defparam x2 .WIDTH = 16;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[3], d[4], d[6], d[7], d[9], 
            d[11], d[12], d[14], d[15], d[16], d[19], 
            d[23], d[24], d[25]})); 
    defparam x3 .WIDTH = 16;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[3], d[6], d[7], d[8], 
            d[13], d[17], d[20], d[22], d[24], d[25], 
            d[26]})); 
    defparam x4 .WIDTH = 14;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[1], d[3], d[5], d[6], 
            d[7], d[8], d[9], d[10], d[12], d[14], 
            d[15], d[16], d[18], d[21], d[22], d[23], 
            d[25], d[26], d[27]})); 
    defparam x5 .WIDTH = 22;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[10], d[11], d[13], 
            d[15], d[16], d[17], d[19], d[22], d[23], 
            d[24], d[26], d[27], d[28]})); 
    defparam x6 .WIDTH = 23;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[11], d[14], d[15], 
            d[17], d[18], d[20], d[22], d[23], d[24], 
            d[25], d[27], d[28], d[29]})); 
    defparam x7 .WIDTH = 23;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[2], d[4], d[6], 
            d[7], d[8], d[9], d[18], d[19], d[21], 
            d[22], d[23], d[24], d[25], d[26], d[28], 
            d[29], d[30]})); 
    defparam x8 .WIDTH = 21;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[8], d[9], d[10], d[19], d[20], 
            d[22], d[23], d[24], d[25], d[26], d[27], 
            d[29], d[30], d[31]})); 
    defparam x9 .WIDTH = 22;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[1], d[2], d[5], d[8], d[9], 
            d[11], d[12], d[15], d[16], d[20], d[21], 
            d[22], d[23], d[24], d[25], d[26], d[27], 
            d[28], d[30], d[31]})); 
    defparam x10 .WIDTH = 22;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[0], d[2], d[4], d[5], d[9], 
            d[13], d[15], d[17], d[21], d[23], d[24], 
            d[25], d[26], d[27], d[28], d[29], d[31]})); 
    defparam x11 .WIDTH = 19;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[4], d[12], d[14], d[15], 
            d[18], d[24], d[25], d[26], d[27], d[28], 
            d[29], d[30]})); 
    defparam x12 .WIDTH = 15;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[2], d[5], d[13], d[15], d[16], 
            d[19], d[25], d[26], d[27], d[28], d[29], 
            d[30], d[31]})); 
    defparam x13 .WIDTH = 15;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[0], d[3], d[6], d[14], d[16], 
            d[17], d[20], d[26], d[27], d[28], d[29], 
            d[30], d[31]})); 
    defparam x14 .WIDTH = 15;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[1], d[4], d[7], d[15], d[17], 
            d[18], d[21], d[27], d[28], d[29], d[30], 
            d[31]})); 
    defparam x15 .WIDTH = 14;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[0], d[2], d[3], d[4], d[6], 
            d[8], d[10], d[12], d[15], d[18], d[19], 
            d[28], d[29], d[30], d[31]})); 
    defparam x16 .WIDTH = 17;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[1], d[3], d[4], d[5], 
            d[7], d[9], d[11], d[13], d[16], d[19], 
            d[20], d[29], d[30], d[31]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[1], d[2], d[4], d[5], d[6], 
            d[8], d[10], d[12], d[14], d[17], d[20], 
            d[21], d[30], d[31]})); 
    defparam x18 .WIDTH = 16;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[2], d[3], d[5], d[6], d[7], 
            d[9], d[11], d[13], d[15], d[18], d[21], 
            d[22], d[31]})); 
    defparam x19 .WIDTH = 15;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[3], d[4], d[6], d[7], 
            d[8], d[10], d[12], d[14], d[16], d[19], 
            d[22], d[23]})); 
    defparam x20 .WIDTH = 15;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[4], d[5], d[7], 
            d[8], d[9], d[11], d[13], d[15], d[17], 
            d[20], d[23], d[24]})); 
    defparam x21 .WIDTH = 16;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[1], d[2], d[3], d[4], d[8], 
            d[9], d[14], d[15], d[18], d[21], d[22], 
            d[24], d[25]})); 
    defparam x22 .WIDTH = 15;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[2], d[6], d[9], d[12], 
            d[19], d[23], d[25], d[26]})); 
    defparam x23 .WIDTH = 11;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[3], d[7], d[10], d[13], 
            d[20], d[24], d[26], d[27]})); 
    defparam x24 .WIDTH = 11;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[2], d[4], d[8], d[11], d[14], 
            d[21], d[25], d[27], d[28]})); 
    defparam x25 .WIDTH = 11;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[0], d[4], d[6], d[9], d[10], 
            d[16], d[26], d[28], d[29]})); 
    defparam x26 .WIDTH = 11;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[1], d[5], d[7], d[10], 
            d[11], d[17], d[27], d[29], d[30]})); 
    defparam x27 .WIDTH = 12;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[2], d[6], d[8], 
            d[11], d[12], d[18], d[28], d[30], d[31]})); 
    defparam x28 .WIDTH = 13;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[2], d[3], d[7], 
            d[9], d[12], d[13], d[19], d[29], d[31]})); 
    defparam x29 .WIDTH = 13;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[1], d[2], d[3], d[4], d[8], 
            d[10], d[13], d[14], d[20], d[30]})); 
    defparam x30 .WIDTH = 12;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[2], d[3], d[4], d[5], d[9], 
            d[11], d[14], d[15], d[21], d[31]})); 
    defparam x31 .WIDTH = 12;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 31) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[2], d[3], d[4], d[5], d[8], 
            d[9], d[17], d[18], d[21], d[25], d[26], 
            d[31]})); 
    defparam x0 .WIDTH = 14;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[2], d[6], d[8], d[10], d[17], 
            d[19], d[21], d[22], d[25], d[27], d[31]})); 
    defparam x1 .WIDTH = 13;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[2], d[4], d[5], d[7], d[8], 
            d[11], d[17], d[20], d[21], d[22], d[23], 
            d[25], d[28], d[31]})); 
    defparam x2 .WIDTH = 16;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[0], d[3], d[5], d[6], d[8], 
            d[9], d[12], d[18], d[21], d[22], d[23], 
            d[24], d[26], d[29]})); 
    defparam x3 .WIDTH = 16;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[1], d[2], d[3], d[5], d[6], 
            d[7], d[8], d[10], d[13], d[17], d[18], 
            d[19], d[21], d[22], d[23], d[24], d[26], 
            d[27], d[30], d[31]})); 
    defparam x4 .WIDTH = 22;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[5], d[6], d[7], d[11], d[14], 
            d[17], d[19], d[20], d[21], d[22], d[23], 
            d[24], d[26], d[27], d[28]})); 
    defparam x5 .WIDTH = 17;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[0], d[6], d[7], d[8], d[12], 
            d[15], d[18], d[20], d[21], d[22], d[23], 
            d[24], d[25], d[27], d[28], d[29]})); 
    defparam x6 .WIDTH = 18;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[0], d[1], d[2], d[3], d[4], 
            d[5], d[7], d[13], d[16], d[17], d[18], 
            d[19], d[22], d[23], d[24], d[28], d[29], 
            d[30], d[31]})); 
    defparam x7 .WIDTH = 21;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[0], d[1], d[6], d[9], d[14], 
            d[19], d[20], d[21], d[23], d[24], d[26], 
            d[29], d[30]})); 
    defparam x8 .WIDTH = 15;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[1], d[2], d[7], d[10], 
            d[15], d[20], d[21], d[22], d[24], d[25], 
            d[27], d[30], d[31]})); 
    defparam x9 .WIDTH = 16;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[0], d[1], d[4], d[5], d[9], 
            d[11], d[16], d[17], d[18], d[22], d[23], 
            d[28]})); 
    defparam x10 .WIDTH = 14;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[1], d[3], d[4], d[6], d[8], 
            d[9], d[10], d[12], d[19], d[21], d[23], 
            d[24], d[25], d[26], d[29], d[31]})); 
    defparam x11 .WIDTH = 18;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[0], d[3], d[7], d[8], d[10], 
            d[11], d[13], d[17], d[18], d[20], d[21], 
            d[22], d[24], d[27], d[30], d[31]})); 
    defparam x12 .WIDTH = 18;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[1], d[4], d[8], d[9], d[11], 
            d[12], d[14], d[18], d[19], d[21], d[22], 
            d[23], d[25], d[28], d[31]})); 
    defparam x13 .WIDTH = 17;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[2], d[5], d[9], d[10], d[12], 
            d[13], d[15], d[19], d[20], d[22], d[23], 
            d[24], d[26], d[29]})); 
    defparam x14 .WIDTH = 16;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[3], d[6], d[10], d[11], d[13], 
            d[14], d[16], d[20], d[21], d[23], d[24], 
            d[25], d[27], d[30]})); 
    defparam x15 .WIDTH = 16;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[2], d[3], d[5], d[7], d[8], 
            d[9], d[11], d[12], d[14], d[15], d[18], 
            d[22], d[24], d[28]})); 
    defparam x16 .WIDTH = 16;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[3], d[4], d[6], d[8], d[9], 
            d[10], d[12], d[13], d[15], d[16], d[19], 
            d[23], d[25], d[29]})); 
    defparam x17 .WIDTH = 16;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[4], d[5], d[7], d[9], 
            d[10], d[11], d[13], d[14], d[16], d[17], 
            d[20], d[24], d[26], d[30]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[1], d[5], d[6], d[8], d[10], 
            d[11], d[12], d[14], d[15], d[17], d[18], 
            d[21], d[25], d[27], d[31]})); 
    defparam x19 .WIDTH = 17;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[2], d[6], d[7], d[9], d[11], 
            d[12], d[13], d[15], d[16], d[18], d[19], 
            d[22], d[26], d[28]})); 
    defparam x20 .WIDTH = 16;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[3], d[7], d[8], d[10], d[12], 
            d[13], d[14], d[16], d[17], d[19], d[20], 
            d[23], d[27], d[29]})); 
    defparam x21 .WIDTH = 16;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[2], d[3], d[5], d[11], 
            d[13], d[14], d[15], d[20], d[24], d[25], 
            d[26], d[28], d[30], d[31]})); 
    defparam x22 .WIDTH = 17;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[1], d[2], d[5], d[6], d[8], 
            d[9], d[12], d[14], d[15], d[16], d[17], 
            d[18], d[27], d[29]})); 
    defparam x23 .WIDTH = 16;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[2], d[3], d[6], d[7], d[9], 
            d[10], d[13], d[15], d[16], d[17], d[18], 
            d[19], d[28], d[30]})); 
    defparam x24 .WIDTH = 16;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[3], d[4], d[7], d[8], d[10], 
            d[11], d[14], d[16], d[17], d[18], d[19], 
            d[20], d[29], d[31]})); 
    defparam x25 .WIDTH = 16;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[2], d[3], d[11], d[12], d[15], 
            d[19], d[20], d[25], d[26], d[30], d[31]})); 
    defparam x26 .WIDTH = 13;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[3], d[4], d[12], d[13], 
            d[16], d[20], d[21], d[26], d[27], d[31]})); 
    defparam x27 .WIDTH = 13;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[0], d[1], d[4], d[5], d[13], 
            d[14], d[17], d[21], d[22], d[27], d[28]})); 
    defparam x28 .WIDTH = 13;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[0], d[1], d[2], d[5], d[6], 
            d[14], d[15], d[18], d[22], d[23], d[28], 
            d[29]})); 
    defparam x29 .WIDTH = 14;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[0], d[1], d[2], d[3], d[6], 
            d[7], d[15], d[16], d[19], d[23], d[24], 
            d[29], d[30]})); 
    defparam x30 .WIDTH = 15;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[1], d[2], d[3], d[4], d[7], 
            d[8], d[16], d[17], d[20], d[24], d[25], 
            d[30], d[31]})); 
    defparam x31 .WIDTH = 15;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end


/////////////////////////////////////////////////////////////////

if (NUM_EVOS == 32) begin
    xor_ur2_v x0 (.force_vcc(force_vcc),.dout(c[0]), .din({
            xtra0[0], xtra1[0], d[0], d[1], d[5], d[7], d[9], 
            d[11], d[12], d[15], d[16], d[17], d[20], 
            d[21], d[22], d[24], d[25], d[26], d[28], 
            d[29], d[31]})); 
    defparam x0 .WIDTH = 21;
    defparam x0 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x1 (.force_vcc(force_vcc),.dout(c[1]), .din({
            xtra0[1], xtra1[1], d[0], d[2], d[5], d[6], d[7], 
            d[8], d[9], d[10], d[11], d[13], d[15], 
            d[18], d[20], d[23], d[24], d[27], d[28], 
            d[30], d[31]})); 
    defparam x1 .WIDTH = 21;
    defparam x1 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x2 (.force_vcc(force_vcc),.dout(c[2]), .din({
            xtra0[2], xtra1[2], d[0], d[3], d[5], d[6], d[8], 
            d[10], d[14], d[15], d[17], d[19], d[20], 
            d[22], d[26]})); 
    defparam x2 .WIDTH = 15;
    defparam x2 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x3 (.force_vcc(force_vcc),.dout(c[3]), .din({
            xtra0[3], xtra1[3], d[1], d[4], d[6], d[7], d[9], 
            d[11], d[15], d[16], d[18], d[20], d[21], 
            d[23], d[27]})); 
    defparam x3 .WIDTH = 15;
    defparam x3 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x4 (.force_vcc(force_vcc),.dout(c[4]), .din({
            xtra0[4], xtra1[4], d[0], d[1], d[2], d[8], d[9], 
            d[10], d[11], d[15], d[19], d[20], d[25], 
            d[26], d[29], d[31]})); 
    defparam x4 .WIDTH = 16;
    defparam x4 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x5 (.force_vcc(force_vcc),.dout(c[5]), .din({
            xtra0[5], xtra1[5], d[0], d[2], d[3], d[5], d[7], 
            d[10], d[15], d[17], d[22], d[24], d[25], 
            d[27], d[28], d[29], d[30], d[31]})); 
    defparam x5 .WIDTH = 18;
    defparam x5 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x6 (.force_vcc(force_vcc),.dout(c[6]), .din({
            xtra0[6], xtra1[6], d[1], d[3], d[4], d[6], d[8], 
            d[11], d[16], d[18], d[23], d[25], d[26], 
            d[28], d[29], d[30], d[31]})); 
    defparam x6 .WIDTH = 17;
    defparam x6 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x7 (.force_vcc(force_vcc),.dout(c[7]), .din({
            xtra0[7], xtra1[7], d[1], d[2], d[4], d[11], d[15], 
            d[16], d[19], d[20], d[21], d[22], d[25], 
            d[27], d[28], d[30]})); 
    defparam x7 .WIDTH = 16;
    defparam x7 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x8 (.force_vcc(force_vcc),.dout(c[8]), .din({
            xtra0[8], xtra1[8], d[1], d[2], d[3], d[7], d[9], 
            d[11], d[15], d[23], d[24], d[25]})); 
    defparam x8 .WIDTH = 12;
    defparam x8 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x9 (.force_vcc(force_vcc),.dout(c[9]), .din({
            xtra0[9], xtra1[9], d[0], d[2], d[3], d[4], d[8], 
            d[10], d[12], d[16], d[24], d[25], d[26]})); 
    defparam x9 .WIDTH = 13;
    defparam x9 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x10 (.force_vcc(force_vcc),.dout(c[10]), .din({
            xtra0[10], xtra1[10], d[3], d[4], d[7], d[12], d[13], 
            d[15], d[16], d[20], d[21], d[22], d[24], 
            d[27], d[28], d[29], d[31]})); 
    defparam x10 .WIDTH = 17;
    defparam x10 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x11 (.force_vcc(force_vcc),.dout(c[11]), .din({
            xtra0[11], xtra1[11], d[1], d[4], d[7], d[8], d[9], 
            d[11], d[12], d[13], d[14], d[15], d[20], 
            d[23], d[24], d[26], d[30], d[31]})); 
    defparam x11 .WIDTH = 18;
    defparam x11 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x12 (.force_vcc(force_vcc),.dout(c[12]), .din({
            xtra0[12], xtra1[12], d[1], d[2], d[7], d[8], d[10], 
            d[11], d[13], d[14], d[17], d[20], d[22], 
            d[26], d[27], d[28], d[29]})); 
    defparam x12 .WIDTH = 17;
    defparam x12 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x13 (.force_vcc(force_vcc),.dout(c[13]), .din({
            xtra0[13], xtra1[13], d[0], d[2], d[3], d[8], d[9], 
            d[11], d[12], d[14], d[15], d[18], d[21], 
            d[23], d[27], d[28], d[29], d[30]})); 
    defparam x13 .WIDTH = 18;
    defparam x13 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x14 (.force_vcc(force_vcc),.dout(c[14]), .din({
            xtra0[14], xtra1[14], d[1], d[3], d[4], d[9], d[10], 
            d[12], d[13], d[15], d[16], d[19], d[22], 
            d[24], d[28], d[29], d[30], d[31]})); 
    defparam x14 .WIDTH = 18;
    defparam x14 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x15 (.force_vcc(force_vcc),.dout(c[15]), .din({
            xtra0[15], xtra1[15], d[2], d[4], d[5], d[10], d[11], 
            d[13], d[14], d[16], d[17], d[20], d[23], 
            d[25], d[29], d[30], d[31]})); 
    defparam x15 .WIDTH = 17;
    defparam x15 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x16 (.force_vcc(force_vcc),.dout(c[16]), .din({
            xtra0[16], xtra1[16], d[1], d[3], d[6], d[7], d[9], 
            d[14], d[16], d[18], d[20], d[22], d[25], 
            d[28], d[29], d[30]})); 
    defparam x16 .WIDTH = 16;
    defparam x16 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x17 (.force_vcc(force_vcc),.dout(c[17]), .din({
            xtra0[17], xtra1[17], d[0], d[2], d[4], d[7], d[8], 
            d[10], d[15], d[17], d[19], d[21], d[23], 
            d[26], d[29], d[30], d[31]})); 
    defparam x17 .WIDTH = 17;
    defparam x17 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x18 (.force_vcc(force_vcc),.dout(c[18]), .din({
            xtra0[18], xtra1[18], d[0], d[1], d[3], d[5], d[8], 
            d[9], d[11], d[16], d[18], d[20], d[22], 
            d[24], d[27], d[30], d[31]})); 
    defparam x18 .WIDTH = 17;
    defparam x18 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x19 (.force_vcc(force_vcc),.dout(c[19]), .din({
            xtra0[19], xtra1[19], d[0], d[1], d[2], d[4], d[6], 
            d[9], d[10], d[12], d[17], d[19], d[21], 
            d[23], d[25], d[28], d[31]})); 
    defparam x19 .WIDTH = 17;
    defparam x19 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x20 (.force_vcc(force_vcc),.dout(c[20]), .din({
            xtra0[20], xtra1[20], d[0], d[1], d[2], d[3], d[5], 
            d[7], d[10], d[11], d[13], d[18], d[20], 
            d[22], d[24], d[26], d[29]})); 
    defparam x20 .WIDTH = 17;
    defparam x20 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x21 (.force_vcc(force_vcc),.dout(c[21]), .din({
            xtra0[21], xtra1[21], d[0], d[1], d[2], d[3], d[4], 
            d[6], d[8], d[11], d[12], d[14], d[19], 
            d[21], d[23], d[25], d[27], d[30]})); 
    defparam x21 .WIDTH = 18;
    defparam x21 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x22 (.force_vcc(force_vcc),.dout(c[22]), .din({
            xtra0[22], xtra1[22], d[0], d[2], d[3], d[4], d[11], 
            d[13], d[16], d[17], d[21], d[25], d[29]})); 
    defparam x22 .WIDTH = 13;
    defparam x22 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x23 (.force_vcc(force_vcc),.dout(c[23]), .din({
            xtra0[23], xtra1[23], d[0], d[3], d[4], d[7], d[9], 
            d[11], d[14], d[15], d[16], d[18], d[20], 
            d[21], d[24], d[25], d[28], d[29], d[30], 
            d[31]})); 
    defparam x23 .WIDTH = 20;
    defparam x23 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x24 (.force_vcc(force_vcc),.dout(c[24]), .din({
            xtra0[24], xtra1[24], d[1], d[4], d[5], d[8], d[10], 
            d[12], d[15], d[16], d[17], d[19], d[21], 
            d[22], d[25], d[26], d[29], d[30], d[31]})); 
    defparam x24 .WIDTH = 19;
    defparam x24 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x25 (.force_vcc(force_vcc),.dout(c[25]), .din({
            xtra0[25], xtra1[25], d[2], d[5], d[6], d[9], d[11], 
            d[13], d[16], d[17], d[18], d[20], d[22], 
            d[23], d[26], d[27], d[30], d[31]})); 
    defparam x25 .WIDTH = 18;
    defparam x25 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x26 (.force_vcc(force_vcc),.dout(c[26]), .din({
            xtra0[26], xtra1[26], d[1], d[3], d[5], d[6], d[9], 
            d[10], d[11], d[14], d[15], d[16], d[18], 
            d[19], d[20], d[22], d[23], d[25], d[26], 
            d[27], d[29]})); 
    defparam x26 .WIDTH = 21;
    defparam x26 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x27 (.force_vcc(force_vcc),.dout(c[27]), .din({
            xtra0[27], xtra1[27], d[0], d[2], d[4], d[6], d[7], 
            d[10], d[11], d[12], d[15], d[16], d[17], 
            d[19], d[20], d[21], d[23], d[24], d[26], 
            d[27], d[28], d[30]})); 
    defparam x27 .WIDTH = 22;
    defparam x27 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x28 (.force_vcc(force_vcc),.dout(c[28]), .din({
            xtra0[28], xtra1[28], d[1], d[3], d[5], d[7], d[8], 
            d[11], d[12], d[13], d[16], d[17], d[18], 
            d[20], d[21], d[22], d[24], d[25], d[27], 
            d[28], d[29], d[31]})); 
    defparam x28 .WIDTH = 22;
    defparam x28 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x29 (.force_vcc(force_vcc),.dout(c[29]), .din({
            xtra0[29], xtra1[29], d[2], d[4], d[6], d[8], d[9], 
            d[12], d[13], d[14], d[17], d[18], d[19], 
            d[21], d[22], d[23], d[25], d[26], d[28], 
            d[29], d[30]})); 
    defparam x29 .WIDTH = 21;
    defparam x29 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x30 (.force_vcc(force_vcc),.dout(c[30]), .din({
            xtra0[30], xtra1[30], d[3], d[5], d[7], d[9], d[10], 
            d[13], d[14], d[15], d[18], d[19], d[20], 
            d[22], d[23], d[24], d[26], d[27], d[29], 
            d[30], d[31]})); 
    defparam x30 .WIDTH = 21;
    defparam x30 .TARGET_CHIP = TARGET_CHIP;

    xor_ur2_v x31 (.force_vcc(force_vcc),.dout(c[31]), .din({
            xtra0[31], xtra1[31], d[0], d[4], d[6], d[8], d[10], 
            d[11], d[14], d[15], d[16], d[19], d[20], 
            d[21], d[23], d[24], d[25], d[27], d[28], 
            d[30], d[31]})); 
    defparam x31 .WIDTH = 21;
    defparam x31 .TARGET_CHIP = TARGET_CHIP;

end

endgenerate
endmodule

