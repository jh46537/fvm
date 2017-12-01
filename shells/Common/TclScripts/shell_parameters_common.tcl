##################################################
# User should use this function to override
# any shell parameters.
##################################################

proc setShellParam {param value} {
	global shell_params
    global shell_params_usereditable

	if {[dict exists $shell_params $param] == 0} { 
		return -code error "Parameter $param unsupported in this shell"
	}

    if {[dict get $shell_params $param] != $value} {
        if {[dict exists $shell_params_usereditable $param] == 0 || [dict get $shell_params_usereditable $param] == 0} {
            return -code error "Parameter $param can not be changed in this shell"    
        }

	    post_message -type info "Overriding default param $param = $value"
	    dict unset shell_params $param
	    dict set shell_params $param $value
    }
}

proc getShellParam {param} {
	global shell_params
	if {[dict exists $shell_params $param] == 0} { 
		return -code error "Parameter $param does not exist in this shell"
	}
	return [dict get $shell_params $param]
}

proc setFpgaUserClock {value} {
	set legal_clocks [dict create]
	dict set legal_clocks 25 "25.000000 MHz"
	dict set legal_clocks 50 "50.000000 MHz"
	dict set legal_clocks 75  "75.000000 MHz"
	dict set legal_clocks 100 "100.000000 MHz"
	dict set legal_clocks 125 "125.000000 MHz"
	dict set legal_clocks 133 "133.333333 MHz"
	dict set legal_clocks 150 "150.000000 MHz"
	dict set legal_clocks 160 "160.000000 MHz"
	dict set legal_clocks 166 "166.666666 MHz"
	dict set legal_clocks 175 "175.000000 MHz"
	dict set legal_clocks 180 "180.000000 MHz"
	dict set legal_clocks 187 "187.500000 MHz"
	dict set legal_clocks 200 "200.000000 MHz"
	dict set legal_clocks 220 "220.000000 MHz"
	dict set legal_clocks 233 "233.333333 MHz"
	dict set legal_clocks 250 "250.000000 MHz"
	dict set legal_clocks 275 "275.000000 MHz"
	dict set legal_clocks 300 "300.000000 MHz"

	if {[dict exists $legal_clocks $value] == 0} {
		
		post_message -type info "Illegal clock value: $value.   Allowed values (in MHz) are:"
		foreach clk [dict keys $legal_clocks] {
			set val [dict get $legal_clocks $clk]
			post_message -type info "$val"
		}
		return -code error "Aborting, invalid clock argument"
	}

	setShellParam fpga_user_clock $value
}