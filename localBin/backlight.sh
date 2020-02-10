#!/bin/bash

# You can call this script like this:
# $./backlight.sh up
# $./backlight.sh down

function get_light {
    sudo cat /sys/class/leds/smc::kbd_backlight/brightness
}

#function send_notification {
#    light=`get_light`
#    int=${light%.*}
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    #bar=$(seq -s "─" $(($int / 1)) | sed 's/[0-9]//g')
    # Send the notification
    #if (("$int" > 3)); then
	#	    dunstify -i notification-display-brightness-full -t 1000 -r 2593 -u normal "$bar"	
    #fi
    #if (("$int" < 3)); then
	#		dunstify -i notification-display-brightness-low -t 1000 -r 2593 -u normal "$bar"		
	#fi
#}

light=`get_light`
int=${light%.*}
destdir=/sys/class/leds/smc::kbd_backlight/brightness
inc=51

case $1 in
    up)
    #if (("$light" > 254)); then
	#  	var=255;
	#	destdir=/sys/class/leds/smc::kbd_backlight/brightness
	#	echo "$var" > "$destdir"
	#else
  		var=$(($light+$inc));
		echo "$var" > "$destdir"
	#fi
	;;
    down)
	#if (("$light" < 1));then
	#  	var=0;
	#	destdir=/sys/class/leds/smc::kbd_backlight/brightness
	#	echo "$var" > "$destdir"
	#else
  		vara=$(($light-$inc));
		echo "$vara" > "$destdir"
	#fi
	;;
esac
