#!/bin/sh

trap 'jobs -p | xargs kill' EXIT

DE="${1:-bspwm}"

dbus-update-activation-environment --all

# Use KeePassXC's secret service integration instead
#exec --no-startup-id gnome-keyring-daemon --start --components=secrets,pkcs11

# Redshift
# Make sure geoclue user service is running!
redshift-gtk &

picom &
~/scripts/notifications-daemon.sh &
nm-applet --indicator &
blueman-tray &
xfsettingsd --sm-client-disable &
xfce4-power-manager --sm-client-disable &

# Polkit
#/usr/lib/lxpolkit/lxpolkit &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

~/scripts/wallpaper.sh

# Desktop/XDG autostart
dex -a -e "${DE}"

wait
