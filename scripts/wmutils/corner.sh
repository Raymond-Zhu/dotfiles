#!/bin/sh
# move windows to the corners
#
# Created by Dylan Araps
# https://github.com/dylanaraps/dotfiles

# Focused window
wid=$(pfw)

# Set padding around corners
padding=80

# Window info
window=($(wattr whb $wid))

# Get window size
w=${window[0]}
h=${window[1]}

# Border width
bw=${window[2]}

# Default x/y values
x=$padding
y=$padding

# Hardcoded multimonitor
if [[ $(wattr y $wid) -gt 1080 ]]; then
    case $1 in
        tl) y=$((1080 + padding)) ;;

        tr) x=$((1920 - padding - w - bw*2))
            y=$((1080 + padding)) ;;

        bl) y=$((1080*2 - padding - h - bw*2)) ;;

        br) x=$((1920 - padding - w - bw*2))
            y=$((1080*2 - padding - h - bw*2)) ;;

        ml) y=$((1080 + 1080/2 - h/2 - bw)) ;;

        mr) x=$((1920 - padding - w - bw*2))
            y=$((1080 + 1080/2 - h/2 - bw)) ;;

        mt) x=$((1920/2 - w/2 - bw))
            y=$((1080 + padding)) ;;

        mb) x=$((1920/2 - w/2 - bw))
            y=$((1080*2 - padding - h - bw*2)) ;;

        mm) x=$((1920/2 - w/2 - bw))
            y=$((1080 + 1080/2 - h/2 - bw)) ;;

    esac
elif [[ $(wattr x $wid) -gt 1920 ]]; then
    case $1 in
        tl) x=$((1920 + padding)) ;;

        tr) x=$((1920 + 1280 - padding - w - bw*2)) ;;

        bl) x=$((1920 + padding))
            y=$((1024 - padding - h - bw*2)) ;;

        br) x=$((1920 + 1280 - padding - w - bw*2))
            y=$((1024 - padding - h - bw*2)) ;;

        ml) x=$((1920 + padding))
            y=$((1024/2 - h/2 - bw)) ;;

        mr) x=$((1920 + 1280 - padding - w - bw*2))
            y=$((1024/2 - h/2 - bw)) ;;

        mt) x=$((1920+1280/2 - w/2 - bw))
            y=$padding ;;

        mb) x=$((1920+1280/2 - w/2 - bw))
            y=$((1024 - padding - h - bw*2)) ;;

        mm) x=$((1920+1280/2 - w/2 - bw))
            y=$((1024/2 - h/2 - bw)) ;;

    esac
else
    case $1 in
        # Keeping this here for readability
        tl) x=$padding
            y=$padding ;;

        tr) x=$((1920 - padding - w - bw*2)) ;;

        bl) y=$((1080 - padding - h - bw*2)) ;;

        br) x=$((1920 - padding - w - bw*2))
            y=$((1080 - padding - h - bw*2)) ;;

        ml) y=$((1080/2 - h/2 - bw)) ;;

        mr) x=$((1920 - padding - w - bw*2))
            y=$((1080/2 - h/2 - bw)) ;;

        mt) x=$((1920/2 - w/2 - bw))
            y=$padding ;;

        mb) x=$((1920/2 - w/2 - bw))
            y=$((1080 - padding - h - bw*2)) ;;

        mm) x=$((1920/2 - w/2 - bw))
            y=$((1080/2 - h/2 - bw)) ;;
    esac
fi

# Ingore windows from tiling
ignorefile="/tmp/.ignore-$wid"
touch "$ignorefile"

# Move the window
wtp $x $y $w $h $wid
