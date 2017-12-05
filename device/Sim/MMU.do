

echo "Creating library"
vlib work
vmap work ./work


echo "Adding Altera MegaFunction library"
vlib altera_mf_ver
vmap altera_mf_ver ./altera_mf_ver

#echo "Adding Altera ??? library"
#vlib lpm_ver
#vmap lpm_ver ./lpm_ver

echo "Compiling Altera Megafunction library"
vlog -work ./altera_mf_ver C:/altera/15.1/quartus/eda/sim_lib/altera_mf.v

#echo "Compiling Altera ???? library"
#vlog -work ./lpm_ver C:/altera/15.1/quartus/eda/sim_lib/220model.v

# Add Typing files
echo "Compiling Catapult type/parameter files"
vlog -incr -sv ../../shells/Common/SL3/SL3_Types.sv
vlog -incr -sv ../../shells/Academic/Types/ShellTypes.sv
vlog -incr -sv SimParams.sv

# Add library files one by one (ugh)
echo "Compiling Catapult library files"
vlog -incr -L work -L altera_mf_ver -sv ../Common/FIFO.v

# Add Role files
echo "Compiling Catapult user role files"
vlog -incr -sv ../RTL/SimpleDram.sv
vlog -incr -sv ../RTL/DramInterleaver.sv
vlog -incr -sv ../RTL/Role.sv
vlog -incr -sv ../RTL/SimpleRole.sv
vlog -incr -sv ../RTL/SimpleRoleApp.sv
vlog -incr -sv ../RTL/MMU.sv

# Incrementally compile top-level simulation model
echo "Compiling Catapult top-level simulation file"
vlog -incr -sv -L altera_mf_ver SimMMU.sv

# Loading design in simulator
echo "Loading design"
vsim SimMMU -t ns -L altera_mf_ver

echo "Running simulation"
run -all
