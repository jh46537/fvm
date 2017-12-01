#ifndef _CORE_DEBUG_DEFINES_H_
#define _CORE_DEBUG_DEFINES_H_

#define SEQ_CORE_DEBUG_BASE 0x000161ac
#define INDIRECT_SEQ_CORE_DEBUG_BASE 0x70004
#define AC_ROM_MR1_MIRR 0000000100100
#define AC_ROM_MR1_OCD_ENABLE 
#define AC_ROM_MR2_MIRR 0010000010000
#define AC_ROM_MR3_MIRR 0000000000000
#define AC_ROM_MR0_CALIB 
#define AC_ROM_MR0_DLL_RESET_MIRR 1100011001000
#define AC_ROM_MR0_DLL_RESET 1100100110000
#define AC_ROM_MR0_MIRR 1100001001001
#define AC_ROM_MR0 1100000110001
#define AC_ROM_MR1 0000001000100
#define AC_ROM_MR2 0010000001000
#define AC_ROM_MR3 0000000000000
#define AFI_CLK_FREQ 134
#define AFI_RATE_RATIO 4
#define ARRIAVGZ 0
#define ARRIAV 0
#define AVL_CLK_FREQ 67
#define BFM_MODE 0
#define BURST2 0
#define CALIBRATE_BIT_SLIPS 0
#define CALIB_LFIFO_OFFSET 5
#define CALIB_VFIFO_OFFSET 23
#define CYCLONEV 0
#define DDR2 0
#define DDR3 1
#define DDRX 1
#define DM_PINS_ENABLED 1
#define ENABLE_ASSERT 0
#define ENABLE_BRINGUP_DEBUGGING 0
#define ENABLE_DELAY_CHAIN_WRITE 0
#define ENABLE_DQS_IN_CENTERING 1
#define ENABLE_DQS_OUT_CENTERING 0
#define ENABLE_EXPORT_SEQ_DEBUG_BRIDGE 1
#define ENABLE_INST_ROM_WRITE 0
#define ENABLE_MARGIN_REPORT_GEN 0
#define ENABLE_NON_DESTRUCTIVE_CALIB 0
#define ENABLE_SUPER_QUICK_CALIBRATION 0
#define ENABLE_TCL_DEBUG 1
#define FAKE_CAL_FAIL 0
#define FULL_RATE 0
#define GUARANTEED_READ_BRINGUP_TEST 0
#define HALF_RATE 0
#define HARD_PHY 0
#define HARD_VFIFO 0
#define HCX_COMPAT_MODE 0
#define HHP_HPS_SIMULATION 0
#define HHP_HPS_VERIFICATION 0
#define HHP_HPS 0
#define HPS_HW 0
#define HR_DDIO_OUT_HAS_THREE_REGS 0
#define IO_DELAY_PER_DCHAIN_TAP 11
#define IO_DELAY_PER_DQS_EN_DCHAIN_TAP 11
#define IO_DELAY_PER_OPA_TAP 234
#define IO_DLL_CHAIN_LENGTH 8
#define IO_DM_OUT_RESERVE 0
#define IO_DQDQS_OUT_PHASE_MAX 21
#define IO_DQS_EN_DELAY_MAX 127
#define IO_DQS_EN_DELAY_OFFSET 128
#define IO_DQS_EN_PHASE_MAX 7
#define IO_DQS_IN_DELAY_MAX 63
#define IO_DQS_IN_RESERVE 7
#define IO_DQS_OUT_RESERVE 30
#define IO_DQ_OUT_RESERVE 0
#define IO_IO_IN_DELAY_MAX 63
#define IO_IO_OUT1_DELAY_MAX 63
#define IO_IO_OUT2_DELAY_MAX 63
#define IO_SHIFT_DQS_EN_WHEN_SHIFT_DQS 0
#define LPDDR1 0
#define LPDDR2 0
#define LRDIMM 0
#define M10_DQ_WIDTH_8 0
#define M10_DQ_WIDTH_16 0
#define M10_DQ_WIDTH_24 0
#define MARGIN_VARIATION_TEST 0
#define MAX_LATENCY_COUNT_WIDTH 4
#define MEM_ADDR_WIDTH 13
#define MRS_MIRROR_PING_PONG_ATSO 0
#define MULTIPLE_AFI_WLAT 0
#define NUM_SHADOW_REGS 2
#define QDRII 0
#define QUARTER_RATE 1
#define RDIMM 0
#define READ_AFTER_WRITE_CALIBRATION 1
#define READ_VALID_FIFO_SIZE 16
#define REG_FILE_INIT_SEQ_SIGNATURE 0x5555048c
#define RLDRAM3 0
#define RLDRAMII 0
#define RLDRAMX 0
#define RUNTIME_CAL_REPORT 0
#define RW_MGR_MEM_ADDRESS_MIRRORING 0
#define RW_MGR_MEM_ADDRESS_WIDTH 15
#define RW_MGR_MEM_BANK_WIDTH 3
#define RW_MGR_MEM_CHIP_SELECT_WIDTH 2
#define RW_MGR_MEM_CLK_EN_WIDTH 2
#define RW_MGR_MEM_CONTROL_WIDTH 1
#define RW_MGR_MEM_DATA_MASK_WIDTH 9
#define RW_MGR_MEM_DATA_WIDTH 72
#define RW_MGR_MEM_DQ_PER_READ_DQS 8
#define RW_MGR_MEM_DQ_PER_WRITE_DQS 8
#define RW_MGR_MEM_IF_READ_DQS_WIDTH 9
#define RW_MGR_MEM_IF_WRITE_DQS_WIDTH 9
#define RW_MGR_MEM_NUMBER_OF_CS_PER_DIMM 2
#define RW_MGR_MEM_NUMBER_OF_RANKS 2
#define RW_MGR_MEM_ODT_WIDTH 2
#define RW_MGR_MEM_VIRTUAL_GROUPS_PER_READ_DQS 1
#define RW_MGR_MEM_VIRTUAL_GROUPS_PER_WRITE_DQS 1
#define RW_MGR_MR0_BL 1
#define RW_MGR_MR0_CAS_LATENCY 3
#define RW_MGR_TRUE_MEM_DATA_MASK_WIDTH 9
#define RW_MGR_WRITE_TO_DEBUG_READ 2.0
#define SKEW_CALIBRATION 0
#define STATIC_FULL_CALIBRATION 1
#define STATIC_SIM_FILESET 0
#define STATIC_SKIP_MEM_INIT 0
#define STRATIXV 1
#define TINIT_CNTR1_VAL 44
#define TINIT_CNTR2_VAL 44
#define TINIT_CNTR0_VAL 32
#define TRACKING_ERROR_TEST 0
#define TRACKING_WATCH_TEST 0
#define TRESET_CNTR1_VAL 99
#define TRESET_CNTR2_VAL 10
#define TRESET_CNTR0_VAL 32
#define TW0_CAPTURE_CLOCKS 0
#define USE_DQS_TRACKING 0
#define USE_SHADOW_REGS 1
#define USE_USER_RDIMM_VALUE 0

#include "core_debug.h"
#endif /* _CORE_DEBUG_DEFINES_H_ */