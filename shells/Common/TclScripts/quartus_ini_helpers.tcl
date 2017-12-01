
#These functions manipulate quartus.ini which should be located in the 
# same directory as the project.  These assume the script is being run
# with the current working directory set to the project directory.
# NOTE: will not handle the case where QUARTUS_INI environment variable 
# overrides the expected quartus.ini location.

proc setQuartusIniVariable {varname value} {
    
    #Deal with concurrency ugliness with a lock file (lock file is put in current working directory)
    set waitcount 0
    while {1} {
        if {[catch {set lockfile [open "quartus.ini.lock" {CREAT EXCL RDWR}]}]} {
            after 10
            set waitcount [expr $waitcount + 1]
            if {$waitcount > 100} {
                file delete "quartus.ini.lock"
            }
        } else {
            close $lockfile
            break
        }
    }

    #if file doesn't exist, just add the line
    if { [file exists "quartus.ini"] == 0 } {
        set qini [open "quartus.ini" a+]
        puts $qini "$varname=$value"
        close $qini
        file delete "quartus.ini.lock"
        return 1
    }

    set qini_var_set 0

    set qini [open "quartus.ini" r]
    set qini_new [open "quartus.ini.new" w]
    while { [gets $qini line] > 0 } {
        if {[regexp "$varname\\s*=\\s*(\\S+)" $line matched existingval]} {  ; # \s*=\s*(\S+)
            if {"$existingval" eq "$value"} {
                puts $qini_new $line
            } else {
                post_message -type info "Changing quartus.ini setting $varname. $existingval ==> $value"
                puts "Changing quartus.ini setting $varname. $existingval ==> $value"
                puts $qini_new "$varname=$value"
            }
            set qini_var_set 1
        } else {
            #just copy line to new file
            puts $qini_new $line
        }
    }
    close $qini

    #If we haven't seen an existing line for this setting, it must be new, add it now
    if {$qini_var_set == 0} {
        post_message -type info "Adding quartus.ini setting $varname.  Set to $value"
        puts "Adding quartus.ini setting $varname.  Set to $value"
        puts $qini_new "$varname=$value"
    }
    close $qini_new


    #save and then unset readonly attribute on quartus.ini
    set saved_read_only_state [file attributes "quartus.ini" -readonly]
    file attributes "quartus.ini" -readonly 0

    #try and clean up old quartus.ini.delete* files
    if { [catch {file delete "quartus.ini.delete1"}]} {}
    if { [catch {file delete "quartus.ini.delete2"}]} {}

    #make the old quartus ini go away. Either delete or rename it (for cases where file handle is open)
    if { [catch {file delete "quartus.ini"}]} {
        #rename if we can't delete
        if { [catch {file rename "quartus.ini" "quartus.ini.delete1"}]} {
            file rename "quartus.ini" "quartus.ini.delete2"
        }
    }

    #drop new file in place of old one
    file rename "quartus.ini.new" "quartus.ini"

    #restore readonly attribute
    file attributes "quartus.ini" -readonly $saved_read_only_state
    
    file delete "quartus.ini.lock"
    return 0
}

proc readQuartusIni {} {
    post_message -type info "begin quartus.ini file content"
    post_message -type info "-------------------------------------"
    puts "begin quartus.ini file content"
    puts "-------------------------------------"
    if {[file exists "quartus.ini"]} {
        set qini [open "quartus.ini" r]
        while { [gets $qini line] > 0 } {
            post_message -type info "$line"
            puts $line
        }
        close $qini
    } else {
        puts "quartus.ini does not exist"
    }
    post_message -type info "-------------------------------------"
    puts "-------------------------------------"
}
