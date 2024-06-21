#!/bin/bash 

export XAUTHORITY=$HOME/.Xauthority 
export DISPLAY=:0 
export DBUS_SESSIONS_BUS_ADDRESS="unix:path=/run/user/1000/bus" 


BATTERY_CHARGING=$1 
BATTERY_LEVEL=` acpi -b | grep -P -o '[0-9]+(?=%)'`


if [[ $BATTERY_CHARGING -eq 1 ]] ; then 
	/usr/bin/notify-send "Charging" "${BATTERY_LEVEL}% of battery charged." -u low -t 5000 -r 9991   

elif [[ $BATTERY_CAHRGING -eq 0 ]] ; then 
	/usr/bin/notify-send "Discharging" "${BATTERY_LEVEL}% of battery remaining." -u low -t 5000 -r 9991 

fi 
