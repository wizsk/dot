#!/bin/sh

picom --backend glx &
sxhkd &
dunst &
xmodmap ~/.Xmodmap &
light -S 50 &
while true ; do ; xwallpaper --zoom ~/pix/wal/$(ls ~/pix/wal | shuf -n 1) ; sleep 10m ; done &
redshift -l 24.244968:89.911305 &
dwmblocks &
exec dwm
