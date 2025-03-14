#!/bin/bash

# Display the battery information in a nice way with icons depending on the status.
# This script relies on acpi, which might need to be installed separately.

MESSAGE=' n/a'

get_battery_message() {
    battery_status="$1"
    battery_level="$2"
    battery_time="$3"
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
    MESSAGE="$MESSAGE $battery_level%"
    if [[ -n "$battery_time" ]]; then
        MESSAGE="$MESSAGE ($battery_time)"
    fi
    echo "$MESSAGE"
}

laptop_battery='/sys/class/power_supply/BAT0'

# This wildcard will match bluetooth id of the controller.
# NOTE: This probably breaks if multiple controllers are connected, but that's
# fine for what this is needed for.
controller_battery="$(find /sys/class/power_supply/ps-controller-battery* 2>&1)"

# There's a strange issue where acpi doesn't have all the information immediately,
# when it switches from charging<->discharging, which causes the message to be
# wrong for a couple seconds.
if [[ -f "$laptop_battery/present" ]]; then
    # This can probably be taken directly from the /sys/class/power_supply files
    battery_info=$(acpi)
    battery_status="$(echo "$battery_info" | grep -oP '(Charging|Discharging)')"
    battery_level="$(echo "$battery_info" | sed -nE 's/.*, ([0-9]*)%.*/\1/p')"
    battery_time="$(echo "$battery_info" | grep -oP '\d{2}:\d{2}')"
    MESSAGE="$(get_battery_message "$battery_status" "$battery_level" "$battery_time")"
fi

if [[ -f "$controller_battery/present" ]]; then
    battery_status="$(cat "${controller_battery}/status")"
    battery_level="$(cat "${controller_battery}/capacity")"
    # TODO: Does time to charge/discharge exist?
    battery_time=''
    MESSAGE=" $(get_battery_message "$battery_status" "$battery_level" "$battery_time")"
fi

echo "$MESSAGE"
