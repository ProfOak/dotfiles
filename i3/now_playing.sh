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
  return
fi

song="$(echo "$text" | head -1)"
status="$(echo "$text" | sed -n '2 p' | grep -oE '(playing|paused)')"
case "$status" in
'playing') echo " $song" ;;
'paused') echo " $song" ;;
*) echo '???' ;;
esac
