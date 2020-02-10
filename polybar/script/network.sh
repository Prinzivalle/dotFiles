#!/bin/bash

interface=$(ip route | grep default | awk '{ print $5 }')

if [[ $interface == enp* ]]; then
	echo " "$(ip route | grep default | awk '{ print $9 }')
	elif [[ $interface == wlp* ]]; then
		IFS=$'\n'
		profiles=($(netctl list))

		regex="^[ \*]"
		for p in "${profiles[@]}"; do
			cmd="restart"
			[[ $p =~ ^\* ]] && cmd="stop"
			while [[ "$p" =~ $regex ]]; do p=${p:1}; done
			if [[ $cmd == "stop" ]]; then
			 	echo " " $p
			fi 
		done		
	else
		echo " %{F#66}not connected"
fi