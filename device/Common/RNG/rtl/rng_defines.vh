//-----------------------------------------------------------------------------
// Project       : Shepard
//-----------------------------------------------------------------------------
// File          : rng_defines.vh
// Author        : Kambiz Rahimi  <krahimi@microsoft.com>
// Created       : 10.12.2012
//-----------------------------------------------------------------------------
// Description :
// Random Number Generator
//-----------------------------------------------------------------------------
// Copyright (c) 2012 by Microsoft. This model is the confidential and
// proprietary property of Microsoft and the possession or use of this
// file requires a written license from Microsoft.
//------------------------------------------------------------------------------
// Modification history:
// $Date: 2012/10/12 $
// $Author: krahimi $
// $Revision: #0 $
//-----------------------------------------------------------------------------

`define RNG_CLK_DIV_SIZE    8
`define RNG_CLK_COUNT_SIZE  16
`define RNG_DATA_SIZE       32
`define RNG_TDATA_SIZE      8
`define RNG_FIFO_ADDR_SIZE  4
`define RNG_SM_SIZE         7
`ifdef RNG_SHORTEN_RESEED_TIME
`define RNG_RESEED_LIMIT    20'h0000F
`else
`define RNG_RESEED_LIMIT    20'hFFFFF
`endif
`define RNG_DAS_ENABLED     8'hDA
`define RNG_NIBBLE_CNT      5
