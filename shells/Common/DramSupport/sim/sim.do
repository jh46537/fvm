
set common_path ../../../../Common
set shell_path ../../../Bedrock
set shell_common_path ../../../Common

set er_path $common_path/ElasticRouter

################################################
# Compile sources
################################################
vlib work

vlog -sv -work work $shell_path/Types/ShellTypes.sv

vlog -sv -work work $common_path/NetworkTypes/NetworkTypes.sv
vlog -sv -work work $common_path/NetworkTypes/NetworkHeaderTypes.sv
vlog -sv -work work $common_path/FastArbiter.sv
vlog -sv -work work $common_path/pipemux.sv
vlog -sv -work work $common_path/FastArbiter4.sv
vlog -sv -work work $common_path/Gearbox/GearboxToWide.sv
vlog -sv -work work $common_path/Gearbox/GearboxToNarrow.sv 
vlog -sv -work work $common_path/shift_reg_clr.v
vlog -sv -work work $common_path/shift_reg.v
vlog -sv -work work $common_path/mram_dual.v
vlog -sv -work work $common_path/AsyncFIFO.v
vlog -sv -work work $common_path/lutram_dual.v
vlog -sv -work work $common_path/mram.v
vlog -sv -work work $common_path/FIFOFast.v
vlog -sv -work work $common_path/RegisterFIFOFast.v
vlog -sv -work work $common_path/sync_regs.v
vlog -sv -work work $common_path/lfsrN.v
vlog -sv -work work $common_path/pipemux16.v
vlog -sv -work work $common_path/pipemux_prim.v
vlog -sv -work work $common_path/RegisterFIFO.v
vlog -sv -work work $common_path/RegisterFIFODual.v
vlog -sv -work work $common_path/RegisterFIFOFast.v 
vlog -sv -work work $common_path/Arbiter.v
vlog -sv -work work $common_path/RegisterFIFOSkid.sv
vlog -sv -work work $common_path/Counter.v
vlog -sv -work work $common_path/PacketHeaderDetector.v

vlog -sv -work work $er_path/ElasticRouterTypes.sv
vlog -sv -work work $er_path/InputUnit.sv
vlog -sv -work work $er_path/OutputUnit.sv
vlog -sv -work work $er_path/Freelist.sv
vlog -sv -work work $er_path/ElasticRouterMux.sv
vlog -sv -work work $er_path/vcfifo.v
vlog -sv -work work $er_path/ElasticRouter.sv
vlog -sv -work work $er_path/ElasticRouterUserShim.sv
vlog -sv -work work $er_path/ElasticRouterUserShimAndGearbox.sv

vlog -sv -work work $shell_common_path/BasicComponents/shell_async_fifo.v
vlog -sv -work work $shell_common_path/BasicComponents/shell_async_fifo_skid.v
vlog -sv -work work $shell_common_path/BasicComponents/shell_async_fifo_fast.sv
vlog -sv -work work $shell_common_path/BasicComponents/shell_fifo.v
vlog -sv -work work $shell_common_path/BasicComponents/shell_regfifo.v
vlog -sv -work work $shell_common_path/BasicComponents/shell_regfifodual.v
vlog -sv -work work $shell_common_path/BasicComponents/shell_regfifoskid.sv
vlog -sv -work work $shell_common_path/BasicComponents/shell_regfifopipe.sv
vlog -sv -work work $shell_common_path/BasicComponents/shell_shift_reg.v

vlog -sv -work work ../shell_UmiDramSim.sv
vlog -sv -work work ../shell_AvalonDramSim.sv

vlog -sv -work work ../shell_UserMemoryInterfaceToAVL.v
vlog -sv -work work ../shell_RouterDramInterface.sv
vlog -sv -work work ../shell_UserMemoryInterfaceSwitch.sv
vlog -sv -work work ../shell_UserMemoryInterfaceRouter.sv

vlog -sv -work work ../shell_UserMemoryInterfaceToAVL_tb.sv

################################################
# Call vsim to invoke simulator
################################################
vsim -voptargs="+acc" -t 1ps -L altera_lnsim_ver -L altera_ver -L altera_mf_ver \
 -L lpm_ver -L sgate_ver -L stratixv_ver -L twentynm_ver -L twentynm_hssi_ver \
 -L twentynm_hip_ver -L work work.shell_UserMemoryInterfaceToAVL_tb

#vsim -voptargs="+acc" -t 1ps -L altera_lnsim_ver -L altera_ver -L altera_mf_ver \
# -L lpm_ver -L sgate_ver -L stratixv_ver -L twentynm_ver -L twentynm_hssi_ver \
# -L twentynm_hip_ver -L work work.shell_UserMemoryInterfaceRouter_tb;

#vsim -voptargs="+acc" -t 1ps -L altera_lnsim_ver -L altera_ver -L altera_mf_ver \
# -L lpm_ver -L sgate_ver -L stratixv_ver -L twentynm_ver -L twentynm_hssi_ver \
# -L twentynm_hip_ver -L work work.shell_async_fifo_fast_tb

################################################
# Set the window types
################################################
view wave
view structure
view signals
radix -unsigned

################################################
# Run simulation
################################################
do wave.do; run -all
