// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

////////////////////////////////////////////////
// Generic FIFO with simple parameters
////////////////////////////////////////////////

module FIFO
#(
    parameter LOG_DEPTH      = 10,
    parameter WIDTH          = 32,
    parameter ALMOSTFULL_VAL = (2**LOG_DEPTH)/2,
    parameter ALMOSTEMPTY_VAL= 1,
    parameter USE_LUTRAM     = 0,
    parameter USE_OUTREG     = 1,
    parameter DBG_ENABLE     = 0
)
(
    input                       clock,
    input                       reset_n,

    input                       wrreq,
    input [WIDTH-1:0]           data,
    output                      full,
    output                      almost_full,
    output [LOG_DEPTH:0]        usedw,

    input                       rdreq,
    output                      empty,
    output                      almost_empty,
    output [WIDTH-1:0]          q

    //output                      dbg_underflow,
    //output                      dbg_overflow
);

    scfifo FIFO_Inst
    (
        .clock          (clock),
        .sclr           (~reset_n),
        .aclr           (1'b0),

        .wrreq          (wrreq),
        .data           (data),
        .full           (full),
        .almost_full    (almost_full),
        .usedw          (usedw[LOG_DEPTH-1:0]),

        .rdreq          (rdreq),
        .empty          (empty),
        .almost_empty   (almost_empty),
        .q              (q),

		.eccstatus      ()
    );

    assign usedw[LOG_DEPTH] = full;

	defparam
		FIFO_Inst.add_ram_output_register = (USE_OUTREG == 1) ? "ON" : "OFF",
		FIFO_Inst.almost_full_value = ALMOSTFULL_VAL,
        FIFO_Inst.almost_empty_value = ALMOSTEMPTY_VAL,
		FIFO_Inst.intended_device_family = "Stratix V",
		FIFO_Inst.lpm_hint = USE_LUTRAM ? "RAM_BLOCK_TYPE=MLAB" : "RAM_BLOCK_TYPE=M20K",
		FIFO_Inst.lpm_numwords = 2**LOG_DEPTH,
		FIFO_Inst.lpm_showahead = "ON",
		FIFO_Inst.lpm_type = "scfifo",
		FIFO_Inst.lpm_width = WIDTH,
		FIFO_Inst.lpm_widthu = LOG_DEPTH,
		FIFO_Inst.overflow_checking = "OFF",
		FIFO_Inst.underflow_checking = "OFF",
		FIFO_Inst.use_eab = "ON";

    //////////////////////////////////////////////////////
    // Values for signaltap
    //////////////////////////////////////////////////////

    

    generate

        if(DBG_ENABLE) begin
            reg dbg_fifo_overflow  /* synthesis noprune */;
            reg dbg_fifo_underflow /* synthesis noprune */;

            //assign dbg_underflow = dbg_fifo_underflow;
            //assign dbg_overflow  = dbg_fifo_overflow;

            //reg dbg_fifo_overflow;
            //reg dbg_fifo_underflow;

            reg wrreq_piped;
            reg full_piped;
            reg rdreq_piped;
            reg empty_piped;

            always@(posedge clock) begin
                wrreq_piped <= wrreq;
                full_piped  <= full;
                rdreq_piped <= rdreq;
                empty_piped <= empty;
            end

            always@(posedge clock) begin
                if(reset_n) begin
                    if(wrreq_piped & full_piped & ~rdreq_piped)  dbg_fifo_overflow  <= 1'b1;
                    if(rdreq_piped & empty_piped & ~wrreq_piped) dbg_fifo_underflow <= 1'b1;
                end
                else begin
                    dbg_fifo_overflow  <= 1'b0;
                    dbg_fifo_underflow <= 1'b0;
                end
            end

            // synopsys translate off
			// coverage off
            always@(negedge clock) begin
                if(wrreq_piped & full_piped & ~rdreq_piped) begin
`ifdef CATAPULT_DV_ENABLE
                    $error("[FIFO] overflow!, File: %s Line: %d", `__FILE__, `__LINE__);
`else
                    $display("[FIFO] overflow!");
                    $finish(0);
`endif
                end
                if(rdreq_piped & empty_piped & ~wrreq_piped) begin
`ifdef CATAPULT_DV_ENABLE
                    $error("[FIFO] underflow!, File: %s Line: %d", `__FILE__, `__LINE__);
`else
                    $display("[FIFO] underflow!");
                    $finish(0);
`endif
                end
            end
			// coverage on
            // synopsys translate on

        end
        else begin
            //assign dbg_underflow = 1'b0;
            //assign dbg_overflow  = 1'b0;
        end

    endgenerate

endmodule
