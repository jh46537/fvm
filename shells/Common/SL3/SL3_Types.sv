package SL3Types;

`ifndef SL3_LANES
`define SL3_LANES 2
`endif 

parameter PHIT_WIDTH          = 128;

typedef struct
{
    logic                     force_dfe [3:0];
    logic                     rx_halt [3:0];
    logic [7:0]               node_id;
    logic                     clear_ecc_err_cnt;
    logic                     sl3_reset_NS;
    logic                     sl3_reset_EW;
} SlConfig;

typedef struct
{
    logic [7:0]               neighbor_node_id [3:0];
    logic [`SL3_LANES-1:0]    word_lock [3:0];
    logic                     hard_error [3:0];
 	logic [31:0]              single_bit_ecc_err_cnt [3:0];
    logic [31:0]              double_bit_ecc_err_cnt [3:0];
    logic [31:0]              link_status [3:0];
    logic                     present [3:0];
    logic                     healthy [3:0];
} SlStatus;

typedef struct packed
{
    logic                   valid;
    logic [PHIT_WIDTH-1:0]  data;
    logic                   last;
} SL3DataInterface;

typedef struct packed
{
    logic                   valid;
    logic [14:0]            data;
} SL3OOBInterface;

typedef enum logic [1:0]
{
    kNorth         = 2'd0,
    kSouth         = 2'd1,
    kEast          = 2'd2,
    kWest          = 2'd3
} SL3Ports;

endpackage
