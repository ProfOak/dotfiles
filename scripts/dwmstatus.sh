#!/bin/bash

# Add this script in the .xinitrc file
# mpd > volume > cpu > mem > battery > time/date

# seconds
interval=2
#color1=#66CCCC
#color2=#CC6666

mpd_status() {
    ~/.i3/now_playing.sh
}

volume_levels() {
    echo " $(amixer get Master | grep -oE '[[:digit:]]*%' | head -1)"
}

cpu_usage() {
    # TODO
    echo ''
}

memory_usage() {
    # modified version based on i3blocks-contrib
    # https://github.com/vivien/i3blocks-contrib/blob/master/memory/memory
    awk '
    /^MemTotal:/ {
        mem_total=$2
    }
    /^MemAvailable:/ {
        mem_free=$2
    }
    END {
        free=mem_free/1024/1024
        used=(mem_total-mem_free)/1024/1024
        total=mem_total/1024/1024

        pct=0
        if (total > 0) {
            pct=used/total*100
        }

        printf(" %.f%%\n", pct)
    }
    ' /proc/meminfo
}

battery_level() {
    ~/.i3/battery.sh
}

now_date() {
    echo " $(date '+%m/%d')"
}

now_time() {
    echo " $(date '+%I:%M %P')"
}

while true; do
    xsetroot -name "$(mpd_status) $(volume_levels) $(memory_usage) $(battery_level) $(now_date) $(now_time)"
    sleep "$interval"
done
