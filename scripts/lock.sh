#!/bin/sh


if pgrep -x lightdm >/dev/null 2>&1 && command -v light-locker >/dev/null 2>&1; then
  LOCKER=light-locker
elif command -v i3lock >/dev/null 2>&1; then
  I3LOCK_ARGS="-e -t"
  if [[ -f "$HOME/.config/wallpapers/$(hostname -s)" ]]; then
    I3LOCK_ARGS="$I3LOCK_ARGS -i $HOME/.config/wallpapers/$(hostname -s)"
  elif [[ -f "$HOME/.config/wallpapers/default" ]]; then
    I3LOCK_ARGS="$I3LOCK_ARGS -i $HOME/.config/wallpapers/default"
  fi
  LOCKER="i3lock $I3LOCK_ARGS"
elif command -v slock >/dev/null 2>&1; then
  LOCKER="slock"
fi

exec $LOCKER
