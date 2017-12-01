#Shell Preprocessing Step
#  This is run after user project parameters are setup, etc.
#  This is the script that kicks off most of the work in adding sources for the shell


#save shell path for old script compatibility
if {[info exists shell_path]} {
	set saved_shell_path $shell_path
} else {
	set saved_shell_path ""
}

# Capture current path so we can find the shell again later
set shell_path [ file dirname [ dict get [ info frame [ info frame ] ] file ] ]

# If it exists, use the common folder located inside the shell, otherwise, look up the tree
if { [ file exists $shell_path/Common ] == 1} {
	set shell_common $shell_path/Common
} else {
	set shell_common $shell_path/../Common
}

source $shell_common/TclScripts/quartus_ini_helpers.tcl

#Verify that selected parameters are valid for this board
source $shell_path/Boards/$target_board/param_check.tcl

#Include board specific defines, etc.
source $shell_path/Boards/$target_board/board.tcl

source $shell_path/shell.tcl



#restore shell path for old script compatibility
set shell_path $saved_shell_path