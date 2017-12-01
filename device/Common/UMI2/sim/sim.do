
set common_path ../../
set shell_path ../../../Shells/Bedrock

################################################
# Compile sources
################################################
vlib work

vlog -lint -sv -work work +define+USE_ECC_DDR $shell_path/Types/ShellTypes.sv

vlog -lint -sv -work work $common_path/syncregs.sv
vlog -lint -sv -work work $common_path/reset_synchronizer.v
vlog -lint -sv -work work $common_path/dcfifo_retimed.sv
vlog -lint -sv -work work $common_path/scfifo_retimed.sv
vlog -lint -sv -work work $common_path/AsyncFIFO.v
vlog -lint -sv -work work $common_path/AvalonDramSim.sv
vlog -lint -sv -work work $common_path/arbiter_altera.v
vlog -lint -sv -work work $common_path/ArbiterRoundRobin.sv
vlog -lint -sv -work work $common_path/UMI2/UserMemoryInterface2Types.sv
vlog -lint -sv -work work $common_path/UMI2/UserMemoryInterface2.sv

################################################
# Call vsim to invoke simulator
################################################
vsim -voptargs="+acc" -t 1ps -L altera_lnsim_ver -L altera_ver -L altera_mf_ver \
 -L lpm_ver -L sgate_ver -L stratixv_ver -L twentynm_ver -L twentynm_hssi_ver \
 -L twentynm_hip_ver -L work work.UserMemoryInterface2_tb

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
