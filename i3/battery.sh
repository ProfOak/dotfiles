#!/bin/bash

# Display the battery information in a nice way with icons depending on the status.
# This script relies on acpi, which might need to be installed separately.

MESSAGE=' n/a'

# There's a strange issue where acpi doesn't have all the information immediately,
# when it switches from charging<-> discharging, which causes the message to be
# wrong for a couple seconds.
if [[ -f "/sys/class/power_supply/BAT0/present" ]]; then
    battery_info=$(acpi)
    battery_status="$(echo "$battery_info" | grep -oP '(Charging|Discharging)')"
    battery_level="$(echo "$battery_info" | sed -nE 's/.*, ([0-9]*)%.*/\1/p')"
    #battery_time=$(echo "$battery_info" | grep -oP '\d{2}:\d{2}:\d{2}')
    battery_time="$(echo "$battery_info" | grep -oP '\d{2}:\d{2}')"
    if [[ "$battery_status" = 'Charging' ]]; then
        MESSAGE=''
    elif [[ "$battery_level" -ge 75 ]]; then
        MESSAGE=''
    elif [[ "$battery_level" -ge 50 ]]; then
        MESSAGE=''
    elif [[ "$battery_level" -ge 25 ]]; then
        MESSAGE=''
    else
        MESSAGE=''
    fi
    MESSAGE="$MESSAGE $battery_level% ($battery_time)"
fi

echo "$MESSAGE"
