#!/bin/sh

picom --backend glx &
sxhkd &
dunst &
xmodmap ~/.Xmodmap &
light -S $(cat ~/.cache/light_set | cut -d "." -f 1 | sed "s/^0/1/") &
xwallpaper --zoom ~/pix/wal/$(ls ~/pix/wal | shuf -n 1) &
redshift -l 24.244968:89.911305 &
# dwmblocks &
# exec dwm
exec i3
