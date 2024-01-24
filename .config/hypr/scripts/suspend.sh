#!/bin/sh

swayidle -w \
timeout 180 ' swaylock -f -c 000000 ' \ # 3min
timeout 210 ' hyprctl dispatch dpms off' \ # 3.5min
timeout 600 'systemctl suspend' \ # 10min
resume ' hyprctl dispatch dpms on' \
before-sleep 'swaylock -f -c 000000'
