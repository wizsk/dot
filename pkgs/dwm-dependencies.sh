printf "Have you Reallay wanna install Yay (aur helper)? [Y/n] " && read -r prom
[ "$prom" = "n" ] && echo "Nothing will be installed install yay There is instruction in help.txt" && exit 0

sudo pacman -S xorg-xinit xorg-server xorg-xrandr xorg-xsetroot base-devel git vim libx11 libxinerama webkit2gtk picom ttf-roboto-mono

yay -S libxft-bgra
