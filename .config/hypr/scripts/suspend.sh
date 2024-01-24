#!/bin/sh

swayidle -w \
timeout 120 ' swaylock -f -c 000000 ' \ # 2min
timeout 210 ' hyprctl dispatch dpms off' \ # 2.5min
timeout 600 'systemctl suspend' \ # 10min
resume ' hyprctl dispatch dpms on' \
before-sleep 'swaylock -f -c 000000'
