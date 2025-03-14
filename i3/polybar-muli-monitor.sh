#!/bin/bash
# https://github.com/polybar/polybar/issues/763#issuecomment-331604987
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &
fi
