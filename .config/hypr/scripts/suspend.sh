#!/bin/sh

swayidle -w timeout 180 ' swaylock -f -c 000000 ' timeout 210 ' hyprctl dispatch dpms off' timeout 600 'systemctl suspend' resume ' hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'