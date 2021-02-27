#!/bin/sh

HOSTNAME=`hostname -s`
WALLPAPER_DIR="${HOME}/.config/wallpapers"

if [ -f "${WALLPAPER_DIR}/${HOSTNAME}" ]; then
    feh --bg-scale "${WALLPAPER_DIR}/${HOSTNAME}"
elif [ -f "${WALLPAPER_DIR}/default" ]; then
    feh --bg-scale "${WALLPAPER_DIR}/default"
fi
