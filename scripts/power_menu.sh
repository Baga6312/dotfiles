#!/bin/sh

# Power menu script using tofi

lockscreen="\Uf033e"
switchuser="\Uf0019"
logoutt="\Uf0343"
suspendd="\Uf04b2"
hibernate="\U2A00"
reboot="\Uf0709"
shutdown="\Uf0425"
cancel="\Uf0156"


CHOSEN=$(printf "$lockscreen\n$logoutt\n$suspendd\n$hibernate\n$reboot\n$shutdown "  | rofi -dmenu -i -theme-str '@import "/home/dt/code/dotfiles-rice/bspwm/rofi/power.rasi" ') 

case "$CHOSEN" in
	"Lock") lockscreen ;;
	"Suspend") systemctl suspend;;
	"Reboot") reboot ;;
	"Shutdown") shutdown now ;;
	"Log Out") pkill -u $USER  exit ;;
	*) exit 1 ;;
esac 
