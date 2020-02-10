#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer set Master 5%+ > /dev/null
	;;
    down)
	amixer set Master on > /dev/null
	amixer set Master 5%- > /dev/null
	;;
    mute)
    	# Toggle mute
    amixer set Master toggle > /dev/null
	#amixer set Master 100%- > /dev/null
	#amixer set Speaker toggle > /dev/null
	;;
esac
