# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# (C) 2001-2011 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any output
# files any of the foregoing (including device programming or simulation
# files), and any associated documentation or information are expressly subject
# to the terms and conditions of the Altera Program License Subscription
# Agreement, Altera MegaCore Function License Agreement, or other applicable
# license agreement, including, without limitation, that your use is for the
# sole purpose of programming logic devices manufactured by Altera and sold by
# Altera or its authorized distributors.  Please refer to the applicable
# agreement for further details.


#--------------------------------------------------------------#
#
# Create quartus project from a QIP/Qsys file
#
#--------------------------------------------------------------#
#
# Load TCL package
#
load_package report
load_package flow

set project_name  [lindex $quartus(args) 0]
set ipGenerate    [lindex $quartus(args) 1]
set deviceFamily  [lindex $quartus(args) 2]

if { [ string eq "" $ipGenerate] } {
   set ipGenerate 1
}

if { $ipGenerate > 0 } {
   puts "Generating Qsys system ${project_name}: "
   puts "ip-generate --component-file=${project_name}.qsys  --submodule-naming-pattern=%o --output-directory=pcie_lib --file-set=QUARTUS_SYNTH --report-file=qip:${project_name}.qip --report-file=sopcinfo:${project_name}.sopcinfo --report-file=html:${project_name}.html"
   if { [ catch { exec ip-generate --component-file=${project_name}.qsys  --submodule-naming-pattern=%o --output-directory=pcie_lib --file-set=QUARTUS_SYNTH --report-file=qip:${project_name}.qip --report-file=sopcinfo:${project_name}.sopcinfo --report-file=html:${project_name}.html } msg ] } {
      puts "Incorrect generation $msg"
   }
}
#TODO parse device family
set deviceFamily_qsf [ expr [ regexp V $deviceFamily  ] ? "{Stratix V}" : "{Stratix V}" ]

#--------------------------------------------------------------#
#
# Create project
project_new -overwrite $project_name

#--------------------------------------------------------------#
#
# Project setting
set_global_assignment -name QIP_FILE $project_name.qip
set_global_assignment -name TOP_LEVEL_ENTITY $project_name
set_global_assignment -name FAMILY $deviceFamily_qsf

# Fitter settings
set_global_assignment -name USE_TIMEQUEST_TIMING_ANALYZER ON
set_global_assignment -name SMART_RECOMPILE ON
set_global_assignment -name OPTIMIZATION_TECHNIQUE SPEED
set_global_assignment -name FITTER_EFFORT "AUTO FIT"
set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON
set_instance_assignment -to hip_pipe_* -name VIRTUAL_PIN ON

#--------------------------------------------------------------#
#
# Close project
project_close
