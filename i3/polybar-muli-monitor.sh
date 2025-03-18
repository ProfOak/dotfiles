#!/bin/bash
# Whichever bar gets created first and requests the systray first gets that systray.
# Force the primary monitor's bar to get created first.
# https://github.com/polybar/polybar/issues/1070
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)
declare -a displays=("${PRIMARY[@]}" "${OTHERS[@]}")

for m in "${displays[@]}"; do
    MONITOR=$m polybar --reload main &
done
