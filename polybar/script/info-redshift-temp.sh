#!/bin/bash

case "$1" in
    --toggle)
        if pgrep -x "redshift" > /dev/null; then
            pkill -f redshift
        else
            #(redshift)
            redshift &
            sleep 4
            #exec redshift & 
            #nohup redshift > /tmp/redshift.log &
        fi
        ;;
    *)
        if pgrep -x "redshift" > /dev/null; then
            echo "%{F#ccffffff} "
        else
            echo "%{F#66} "
        fi
        ;;
esac