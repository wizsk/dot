#!/bin/bash

swayidle -w \
timeout 180 ' swaylock ' \
timeout 180 ' hyprctl dispatch dpms off' \
timeout 600 'systemctl suspend' \
resume ' hyprctl dispatch dpms on' \
before-sleep 'swaylock -f -c 000000'
