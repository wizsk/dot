#!/bin/sh

picom --backend glx &
sxhkd &
dunst &
xmodmap ~/.Xmodmap &
light -S 50 &
xwallpaper --zoom ~/pix/wal/wallhaven-e7ek7k.jpg &
redshift -l 24.244968:89.911305 &
dwmblocks &
wal -i ~/pix/wal/wallhaven-e7ek7k.jpg
exec dwm
