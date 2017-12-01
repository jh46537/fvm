# Set TCL variables to point to the appropriate paths given the root 
# directory and chosen shell version

set shell_path 			$catapult_hardware_home/Shells/$shell_version
set shell_common_path 	$catapult_hardware_home/Shells/Common
# Remove this next line once all projects are migrated and shell.tcl updated
set shell_common 		$shell_common_path
set common_path 		$catapult_hardware_home/Common

# Include the set-up for the shell-specific parameters dictionary including the default values
source $catapult_hardware_home/Shells/$shell_version/shell_parameters.tcl
