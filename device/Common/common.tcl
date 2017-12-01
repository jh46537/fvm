
set common_path [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

set_global_assignment -name VERILOG_FILE       $common_path/altera_ram.v
set_global_assignment -name VERILOG_FILE       $common_path/arb4.v
set_global_assignment -name VERILOG_FILE       $common_path/arbiter_altera.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/Arbiter.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/ArbiterRoundRobin.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/ArbiterWithFairness.sv
set_global_assignment -name VERILOG_FILE       $common_path/AsyncFIFO.v

set_global_assignment -name SYSTEMVERILOG_FILE $common_path/BitShifter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/ByteShifter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/ByteAccessFIFO.sv

set_global_assignment -name VERILOG_FILE       $common_path/Counter.v
set_global_assignment -name VERILOG_FILE       $common_path/Cycle_Count_FIFO.v

set_global_assignment -name VERILOG_FILE       $common_path/Dual_Port_BRAM.v
set_global_assignment -name VERILOG_FILE       $common_path/Dual_Port_RAMB18.v

set_global_assignment -name VERILOG_FILE       $common_path/EdgeDetector.v

set_global_assignment -name SYSTEMVERILOG_FILE $common_path/FastArbiter.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/FastArbiter4.sv
set_global_assignment -name VERILOG_FILE       $common_path/ff.v
set_global_assignment -name VERILOG_FILE       $common_path/FIFO.v
set_global_assignment -name VERILOG_FILE       $common_path/FIFOFast.v
set_global_assignment -name VERILOG_FILE       $common_path/FIFOPipe.v
set_global_assignment -name VERILOG_FILE       $common_path/FIFO_Combiner.v
set_global_assignment -name VERILOG_FILE       $common_path/FIFO_Combiner_4to1.v
set_global_assignment -name VERILOG_FILE       $common_path/FIFO_Pipeline_Regs.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/FIFOMixed.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/scfifo_retimed.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/dcfifo_retimed.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/fp_cmp.sv

source                                         $common_path/Gearbox/Gearbox.tcl
set_global_assignment -name VERILOG_FILE       $common_path/GTX_Interface_FIFO.v
set_global_assignment -name VERILOG_FILE       $common_path/GTX_Interface_FIFO_Big.v

set_global_assignment -name VERILOG_FILE       $common_path/id_rom.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/iterative_divider.v

set_global_assignment -name SYSTEMVERILOG_FILE $common_path/LFSR.sv
set_global_assignment -name VERILOG_FILE       $common_path/lfsrN.v
set_global_assignment -name VERILOG_FILE       $common_path/local_reset.v
set_global_assignment -name VERILOG_FILE       $common_path/lutram_dual.v

set_global_assignment -name SYSTEMVERILOG_FILE $common_path/MaskArbiter.sv
set_global_assignment -name VERILOG_FILE       $common_path/mlab.v
set_global_assignment -name VERILOG_FILE       $common_path/mram.v
set_global_assignment -name VERILOG_FILE       $common_path/mram_dual.v
set_global_assignment -name VERILOG_FILE       $common_path/mram_mixed.v
set_global_assignment -name VERILOG_FILE       $common_path/mram_out_reg.v
set_global_assignment -name VERILOG_FILE       $common_path/mram_single.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/MultiSkidBuffer.sv
set_global_assignment -name VERILOG_FILE       $common_path/Multibit_Synchronizer.v

set_global_assignment -name VERILOG_FILE       $common_path/PacketHeaderDetector.v
set_global_assignment -name VERILOG_FILE       $common_path/pipelined_stall.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/pipemux.sv
set_global_assignment -name VERILOG_FILE       $common_path/pipemux1024.v
set_global_assignment -name VERILOG_FILE       $common_path/pipemux16.v
set_global_assignment -name VERILOG_FILE       $common_path/pipemux256.v
set_global_assignment -name VERILOG_FILE       $common_path/pipemux512.v
set_global_assignment -name VERILOG_FILE       $common_path/pipemux64.v
set_global_assignment -name VERILOG_FILE       $common_path/pipemux_prim.v
set_global_assignment -name VERILOG_FILE       $common_path/PopCount.v
set_global_assignment -name VERILOG_FILE       $common_path/PopCount100.v
set_global_assignment -name VERILOG_FILE       $common_path/PopCount256.v
set_global_assignment -name VERILOG_FILE       $common_path/PopCount5.v
set_global_assignment -name VERILOG_FILE       $common_path/PopCount512.v
set_global_assignment -name VERILOG_FILE       $common_path/PopCount6.v
set_global_assignment -name VERILOG_FILE       $common_path/posedgedet.v
set_global_assignment -name VERILOG_FILE       $common_path/PriorityDecoder.v
set_global_assignment -name VERILOG_FILE       $common_path/PriorityDecoder10.v

set_global_assignment -name SYSTEMVERILOG_FILE $common_path/QueueManagerLite/QueueManagerLiteTypes.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/QueueManagerLite/QueueManagerLite.sv


set_global_assignment -name VERILOG_FILE       $common_path/ram1kx36.v
set_global_assignment -name VERILOG_FILE       $common_path/ram512x32.v
set_global_assignment -name VERILOG_FILE       $common_path/reducer.v
set_global_assignment -name VERILOG_FILE       $common_path/reducer_dual.v
set_global_assignment -name VERILOG_FILE       $common_path/reducer64.v
set_global_assignment -name VERILOG_FILE       $common_path/regfifo.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/RegisterCrosser.sv
set_global_assignment -name VERILOG_FILE       $common_path/RegisterFIFO.v
set_global_assignment -name VERILOG_FILE       $common_path/RegisterFIFODual.v
set_global_assignment -name VERILOG_FILE       $common_path/RegisterFIFOFast.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/RegisterFIFOSkid.sv
set_global_assignment -name VERILOG_FILE       $common_path/reset_synchronizer.v

set_global_assignment -name VERILOG_FILE       $common_path/shift_reg.v 
set_global_assignment -name VERILOG_FILE       $common_path/shift_reg_clr.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/SkidBuffer.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/StreamPipelineRegs.v
set_global_assignment -name VERILOG_FILE       $common_path/sync_regs.v
set_global_assignment -name VERILOG_FILE       $common_path/syncregs.sv
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/SyncReset.sv


if { [info exists SIMULATION] } {
	set_global_assignment -name SYSTEMVERILOG_FILE $common_path/UmiDramSim.sv
	set_global_assignment -name SYSTEMVERILOG_FILE $common_path/AvalonDramSim.sv
}

set_global_assignment -name VERILOG_FILE       $common_path/UpDownCounter.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/UserMemoryInterfaceSwitch.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/UserMemoryInterfaceToAVL.v
set_global_assignment -name SYSTEMVERILOG_FILE $common_path/UserMemoryInterfaceMerge.sv

set_global_assignment -name VERILOG_FILE       $common_path/watchdog_ctr.v


set_global_assignment -name SYSTEMVERILOG_FILE $common_path/reset_default_nettype.sv
source                                         $common_path/UMI2/UserMemoryInterface2.tcl
