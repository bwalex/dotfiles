#!/bin/sh

if [ $# -lt 2 -o -z "$1" -o -z "$2" ]; then
	echo "Source or destination not specified"
	exit 1
fi

FROM=$1
TO=$2

if tmux list-windows | grep -q "^$TO:"; then
	while [ $FROM -lt $TO ]; do
		tmux swap-window -t +1
		FROM=$((FROM + 1))
	done

	while [ $FROM -gt $TO ]; do
		tmux swap-window -t -1
		FROM=$((FROM - 1))
	done
else
	tmux move-window -t $TO
	tmux move-window -r
	tmux refresh-client
fi
