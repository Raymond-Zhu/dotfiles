#!/bin/sh

status=$(amixer get Master | egrep -o '\[on\]')

if [ $status == '[on]' ]; then
    popup.sh -e "Unmute" -w 150 -x 1670
else
    popup.sh -e "Mute" -w 150 -x 1670
fi
