#!/bin/bash

msgTag="myvolume"
volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"

if [[ "$1" == "-" ]]; then
	
    # Decrease volume
    #amixer -q set Master $2%-
    pamixer --set-volume $((volume $1 $2 ))
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
	    -h int:value:"$((volume- 5))" "Volume: $((volume - 5 ))%"

elif [[ "$1" == "+" ]]; then
	
    # Increase volume
    amixer -q set Master $2%+
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
	    -h int:value:"$((volume+ 5))" "Volume: $((volume + 5 ))%"

elif [[ "$mute" == "false" ]] ; then 
	
    # Mute audio
    amixer -q set Master toggle 
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 

elif [[ "$mute" == "true" ]] ; then  

    # Unmute audio
    amixer -q set Master unmute 
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"

fi

