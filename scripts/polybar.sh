#!/bin/sh

HOSTNAME=`hostname -s`

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if [ -x "${HOME}/scripts/polybar.${HOSTNAME}.sh" ]; then
    exec ${HOME}/scripts/polybar.${HOSTNAME}.sh
else
    polybar Bar &
fi
