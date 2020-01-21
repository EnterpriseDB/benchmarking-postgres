#!/bin/tclsh
proc runtimer { seconds } {
set x 0
set timerstop 0
while {!$timerstop} {
incr x
after 1000
  if { ![ expr {$x % 60} ] } {
          set y [ expr $x / 60 ]
          puts "Timer: $y minutes elapsed"
  }
update
if {  [ vucomplete ] || $x eq $seconds } { set timerstop 1 }
    }
return
}

if { $argc != 3 } {
        puts "Error: The pgrun.tcl script requires following four arguments."
		puts "Usage: source pgrun.tcl \[pg_rampup] \[pg_duration] \[pg_vacuum]"
        puts "Please try again."
		exit
    } else {
#        puts [expr [lindex $argv 0] + [lindex $argv 1] + 10]
        }
puts "SETTING CONFIGURATION"
dbset db pg
#diset connection pg_host localhost
#diset connection pg_port 5432
diset tpcc pg_driver timed
diset tpcc pg_rampup [expr [lindex $argv 0]]
diset tpcc pg_duration [expr [lindex $argv 1]]
diset tpcc pg_vacuum [expr [lindex $argv 2]]
print dict
vuset logtotemp 1
loadscript
puts "SEQUENCE STARTED"
foreach z { 1 16 32 48 64 96 128 } {
puts "$z VU TEST"
vuset vu $z
vucreate
vurun
runtimer [expr [lindex $argv 0] * 60 + [lindex $argv 1] * 60 + 120 * 60]
vudestroy
after 5000
}
puts "TEST SEQUENCE COMPLETE"
exit
