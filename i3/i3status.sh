i3status --config ~/.i3/i3status.conf | while :
do
        read line
        # this is like #mpd_smart in conky
        # displays fliename if no id3 info
        playing=$(mpc|line)
        echo "$playing | $line" || exit 1
done
