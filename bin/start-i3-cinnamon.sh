#!/bin/sh

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
#
xrandr --dpi 184

# Register with gnome-session so that it does not kill the whole session thinking it is dead.
test -n "$DESKTOP_AUTOSTART_ID" && {
	dbus-send --session --dest=org.gnome.SessionManager "/org/gnome/SessionManager" org.gnome.SessionManager.RegisterClient "string:i3-cinnamon" "string:$DESKTOP_AUTOSTART_ID"
}

exec i3
