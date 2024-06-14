#!/bin/sh

export DISPLAY=:0
export DBUS_SESSIONS_BUS_ADDRESS="unix:path=/run/user/1000/bus"


WARNING_LEVEL=25
BATTERY_DISCHARGING=`acpi -b | grep -c 'Discharging' ` 
BTTERY_LEVEL=`acpi -b | grep -P -o '[0-9]+(?=%)'`

echo "$WARNING_LEVEL"
echo "$BATTERY_LEVEL"


EMPTY_FILE=/tmp/batteryempty
FULL_FILE=/tmp/batteryfull 


if [[ "$BATTER_DISCHARGING" -eq 1 ]] && [[ -f "$FULL_FILE" ]] ; then 
	rm $FULL_FILE 	

elif [[ $BATTER_DISCHARGING -eq 0 ]] && [[ -f $EMPTY_FILE ]] ; then 
	rm $EMPTY_FILE

fi 


if [[ $BATTERY_LEVEL -gt 95 ]] && [[ $BATTERY_DISCHARGING -eq 0 ]] && [[ ! -f $FULL_FILE ]] ; then 
	notify-send "Battery Charged" "Battery is fully Charged." -r 99991  
	touch $FULL_FILE

elif [[ $BATTERY_LEVEL -le $WARNING_LEVEL ]] && [[ $BATTERY_DISCHARGING -eq 1 ]] && [[ ! -f $EMPTY_FILE ]] ; then 
	notify-send "Low battery" "${BATTERY_LEVEL}% of battery remaining." -u critical -r 9991  
	touch $EMPTY_FILE

fi 
