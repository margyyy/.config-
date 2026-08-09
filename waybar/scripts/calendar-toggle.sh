#!/bin/sh

if swaymsg -t get_tree -r 2>/dev/null | grep -q '"app_id": "waybar-calendar"'; then
    swaymsg '[app_id="waybar-calendar"] kill' >/dev/null
else
    LC_ALL=C exec /home/daniel/.config/waybar/scripts/calendar.py >/dev/null 2>&1
fi
