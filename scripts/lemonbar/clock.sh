#!/bin/sh
# Lemonbar Clock


Battery() {
    BATPERC=$(acpi --battery | cut -d, -f2)
    echo "$BATPERC"
}

while :; do
	echo "%{c}$(date "+%a %d %b %l:%M %p") $(Battery)%{c}"
	sleep 1s
done |

lemonbar -d -g "250x40+1670+1040" -f "gohufont" -B "#00000000" -F "#898985"
