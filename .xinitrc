#!/bin/sh

picom --backend glx &
sxhkd &
dunst &
xmodmap ~/.Xmodmap &
light -S 50 &
xwallpaper --zoom ~/pix/wall/wallhaven-72rd8e.jpg &
redshift -l 24.244968:89.911305 &
dwmblocks &
#wal -i ~/pix/wall/blue-house.png
exec dwm
