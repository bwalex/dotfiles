#!/bin/sh

if command -v wired  >/dev/null 2>&1 ; then
    wired -r &
elif [[ -x "/usr/lib/xfce4/notifyd/xfce4-notifyd" ]]; then
    /usr/lib/xfce4/notifyd/xfce4-notifyd &
elif command -v dunst >/dev/null 2>&1 ; then
    dunst -config "${HOME}/.config/dunst/nord2.dunstrc"
fi
