#!/bin/sh

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

xrandr --dpi 184

xautolock -time 10 -locker "i3lock" &

exec i3
