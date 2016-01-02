#!/bin/sh
tmouse() {
    local newval=0
    synclient -l | grep -q 'TouchpadOff.*=.*0' && let newval=2
    synclient TouchpadOff=$newval
}

tmouse

