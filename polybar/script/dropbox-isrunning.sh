#!/bin/bash

case "$1" in
    --toggle)
        if pgrep -x "dropbox" > /dev/null; then
            pkill -f dropbox
        else
            #(dropbox)
            exec dropbox &
            sleep 5
        fi
        ;;
    *)
		if pgrep -x "dropbox" > /dev/null; then
            #echo "%{F#ccffffff} "
            STATUS="$(echo `dropbox-cli status` | awk '{print $1;}')"
            #echo $STATUS
			DROPBOX_ICON=""
			if [[ $STATUS == *"Up"* ]]; then
			  echo "%{F#ccffffff} "
			elif [[ $STATUS == *"Starting"* ]]; then
			  #statements
			  ICON=
			elif [[ $STATUS == *"Syncing"* ]]; then
			  echo "%{F#ccffffff} "
			elif [[ $STATUS == *"Connecting"* ]]; then
			  echo "%{F#ccffffff} Connecting..."
			else
			  exit 0
			fi
        else
            echo "%{F#66} "
        fi
        ;;
esac

