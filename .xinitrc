#!/bin/sh

picom --backend glx &
sxhkd &
dunst &
xmodmap ~/.Xmodmap &
light -S 50 &
xwallpaper --zoom ~/pix/wal/$(ls ~/pix/wal | shuf -n 1) &
redshift -l 24.244968:89.911305 &
dwmblocks &
# wal -i ~/pix/wal/wallhaven-k7e766.jpg
wal -i ~/pix/wal/wallhaven-dgryeg.png
exec dwm
