#!/bin/bash
text="$(mpc)"
if [[ "$(echo "$text" | wc -l)" -eq 1 ]]; then
    echo ' stopped'
    return
fi

song="$(echo "$text" | head -1)"
status="$(echo "$text" | sed -n '2 p' | grep -oE '(playing|paused)')"
case "$status" in
'playing')
    echo " $song"
    ;;
'paused')

    echo " $song"
    ;;
*)
    echo '???'
    ;;
esac
