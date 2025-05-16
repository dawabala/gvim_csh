# parse inst to inst distance file 
    puts $FO_LOG "Info: parse inst to inst distance file \t [date]"
    array set a_inst2inst_dist {}
    if {$dist_csv != ""} {
        set FI [open $dist_csv r]
        while {[gets $FI line] >= 0} {
            if {[regexp {^(\S+),(\S+),(\S+)$} $line - inst_1 inst_2 dist]} {
                #set inst_1 [regsub {.*/} $inst_1 {}]
                #set inst_2 [regsub {.*/} $inst_2 {}]
                set a_inst2inst_dist(${inst_1}->${inst_2}) $dist
                set a_inst2inst_dist(${inst_2}->${inst_1}) $dist
            }
        }
        close $FI
    }

