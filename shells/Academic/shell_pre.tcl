#Shell Preprocessing Step
#This is run before user project parameters are setup, etc.


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


# Verify that the Target Board is supported
if { [ file exists $shell_path/Boards/$target_board ] == 0} {
	return -code error "This shell does not support the chosen target board: $target_board"
}


# Include the set-up for the shell-specific parameters dictionary including the default values
if {[info exists allow_override_of_fixed_parameters] && $allow_override_of_fixed_parameters != 0} {
    set allow_override_of_fixed_parameters 1
    post_message -type info "NOTE: allow_override_of_fixed_parameters flag has been set.  Allowing projects to override fixed shell parameters."
} else {
    set allow_override_of_fixed_parameters 0
}

source $shell_path/shell_parameters.tcl


#restore shell path for old script compatibility
set shell_path $saved_shell_path