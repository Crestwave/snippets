#!/usr/bin/env bash
zenity --info --text="Close this window to stop the beeping." &
while :; do printf '\007'; read -t 1 <><(:); done &
wait %1
kill %2
