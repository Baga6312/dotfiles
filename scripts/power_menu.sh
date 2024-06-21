#!/bin/sh

# Power menu script using tofi

CHOSEN=$(printf " Lock\nSuspend\nRestart\nShutdown\nLog Out" | rofi -dmenu -i -theme-str '@import "/home/dt/code/dotfiles-rice/bspwm/rofi/power.rasi" ') 

case "$CHOSEN" in
	"Lock") lockscreen ;;
	"Suspend") systemctl suspend-then-hibernate ;;
	"Reboot") reboot ;;
	"Shutdown") poweroff ;;
	"Log Out") hyprctl dispatch exit ;;
	*) exit 1 ;;
esac 
