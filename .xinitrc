if [ -d /etc/X11/xinit/xinitrc.d]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset +fp /user/share/fonts/misc/ &
xset fp rehash &

#Rebind control to caps
#setxkbmap -option ctrl:swapcaps &

# Start urxvt daemon
#urxvtd -q -f -o &

# Start compton daemon
compton --config $HOME/dotfiles/compton.conf &
#compton -b --config $HOME/dotfiles/compton.conf &

# Focus watcher
focus_watcher.sh &

# Lemonbar
clock.sh &

# Wallpaper
feh --bg-fill $HOME/dotfiles/wallpaper/sadness.png &

# Start sxhkd
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &

#Infinite loop
exec sh -c 'while :; do sleep 10; done'
