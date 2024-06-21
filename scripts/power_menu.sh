#!/bin/sh

# Power menu script using tofi

CHOSEN=$(printf " \n\U0020\U23FB\n \U1F5D8\n\U0020\U23FB\n\U1F4E4" | rofi -dmenu -i -theme-str '@import "/home/dt/code/dotfiles-rice/bspwm/rofi/power.rasi" ') 

case "$CHOSEN" in
	"Lock") lockscreen ;;
	"Suspend") systemctl suspend;;
	"Reboot") reboot ;;
	"Shutdown") shutdown now ;;
	"Log Out") pkill -u $USER  exit ;;
	*) exit 1 ;;
esac 
