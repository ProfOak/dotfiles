#!/bin/bash

# Clickable i3bar
case "$BLOCK_BUTTON" in
2) mpc toggle &>/dev/null ;; # middle click
1) mpc next &>/dev/null ;;   # left click
3) mpc prev &>/dev/null ;;   # right click
esac

text="$(mpc)"
if [[ "$(echo "$text" | wc -l)" -eq 1 ]]; then
  echo ' stopped'
  exit 0
fi

song="$(echo "$text" | head -1)"
status="$(echo "$text" | sed -n '2 p' | grep -oP '(playing|paused)')"
time_stamp=$(echo "$text" | grep -oP '\d{1,2}:\d{2}\/\d{1,2}:\d{2}')
now_playing_text="${song} - ${time_stamp}"

case "$status" in
'playing') echo " $now_playing_text" ;;
'paused') echo " $now_playing_text" ;;
*) echo '???' ;;
esac
