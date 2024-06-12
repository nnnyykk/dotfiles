xrdb $XDG_CACHE_HOME/wal/colors.Xresources
xsetroot -gray
sxhkd &
dunst &			# dunst for notifications
flameshot &
xset r rate 300 50 &
#fcitx &
dbus-update-activation-environment DISPLAY XAUTHORITY
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
shod
#while type dwm >/dev/null ; do dwm && continue || break ; done
