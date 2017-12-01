#########################################################################################
# CreateLocalCopyOfSDCs.tcl
# acaulfie - 2016-07-11
# Microsoft (C) 2016
# 
# This script creates a local copy of all of the SDC files used in a quartus project 
# to work around a path length limitation internal to quartus
# 
#########################################################################################


set SdcFileNameBase "[get_project_directory]sdcs/"

#Find integer we should start from when creating new sdc folders to copy into
set existingsdcs [lsort -decreasing -integer [glob -directory $SdcFileNameBase -tails -nocomplain -type d *]]
if {[llength $existingsdcs] == 0} {
    set sdcnum 0
} else {
    set sdcnum [expr [lindex $existingsdcs 0] + 1]
}

set sdcs [get_all_global_assignments -name SDC_FILE]
remove_all_global_assignments -name SDC_FILE
foreach_in_collection sdc $sdcs {
    if {[string first "sdcs/" $sdc] == -1} {

        #
        # Check previously copied folders to see if this SDC is the same as a previously copied one.  
        # Update target SDC folder to point there instead of a new folder if we find a match
        #
        set targetSdc $sdcnum
        for { set checkSdc 0 } { $checkSdc < $sdcnum } { incr checkSdc } {
            set fileId [open "$SdcFileNameBase$checkSdc/src.txt" r]
            set file_data [read $fileId]
            close $fileId
            
            if {$file_data == "[lindex $sdc 2]"} {
                set targetSdc $checkSdc
            }    
        }

        #save file name
        set srcFileName [file tail [lindex $sdc 2]]
        set srcdir [file dirname [lindex $sdc 2]]

        puts "[lindex $sdc 2] --> $SdcFileNameBase$targetSdc/$srcFileName"
        catch {[file mkdir $SdcFileNameBase$targetSdc]} {}
        file attributes $SdcFileNameBase$targetSdc -readonly 0

        #write hint file with source filename
        set fileId [open "$SdcFileNameBase$targetSdc/src.txt" w]
        puts -nonewline $fileId "[lindex $sdc 2]"
        close $fileId


        #Copy SDC file to new location
        file copy -force -- [lindex $sdc 2] "$SdcFileNameBase$targetSdc/$srcFileName"
		file attributes "$SdcFileNameBase$targetSdc/$srcFileName" -readonly 0

        #Copy any tcl scripts to the same location
        
        set tcls [glob -nocomplain -directory "$srcdir" *.tcl]
        if {[llength $tcls] > 0} {
            puts "Copy tcls from $srcdir"
            foreach tclfile $tcls {
                file copy -force -- $tclfile "$SdcFileNameBase$targetSdc"
				file attributes "$SdcFileNameBase$targetSdc/[file tail $tclfile]" -readonly 0
            }
        }
        
        
        #increment sdcnum if we just created a new folder
        if {$targetSdc == $sdcnum} {
            set sdcnum [expr $sdcnum + 1]
        }

        set_global_assignment -name SDC_FILE "$SdcFileNameBase$targetSdc/$srcFileName"
    } else {
        set_global_assignment -name SDC_FILE "$sdc"
    }
}

