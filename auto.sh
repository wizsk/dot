! /bin/sh
printf "Have you installed Yay? [Y/n] " && read -r prom
[ "$prom" = "n" ] && echo "Nothing will be installed install yay There is instruction in help.txt" && exit 0

printf "\nInstalling\033[1;31m dwm dependencies \033[0m\n\n"

sudo pacman -S xorg-xinit xorg-server xorg-xrandr xorg-xsetroot base-devel git vim libx11 libxinerama webkit2gtk picom ttf-roboto-mono

printf "\n NOTE: while installing libxft-bgra There will be a promt saying if you want to \033[1;31mremove libxft write y and enter\033[0m\n\n"

yay -S libxft-bgra

printf "\nInstalling\033[1;31m dwm more dependencies \033[0m\n\n"
sudo pacman -S dunst sxhkd redshift alacritty light pamixer xwallpaper zsh zsh-syntax-highlighting ttf-cascadia-code ttf-roboto-mono noto-fonts-emoji 

printf "\nAdding\033[1;31m user to video group \033[0m\n\n"
sudo light -a -G video $USER && printf "\nUser added to video group\n\n"


printf "\ncpoing\033[1;31m dot files \033[0m\n\n"
cp .* ~/
mkdir -p ~/.config
cp -r .config/* ~/.config

printf "\ncloning\033[1;31m dwm,st,dmenu \033[0m\n\n"
git clone https://github.com/sakibulxyz/dwm
git clone https://github.com/sakibulxyz/st
git clone https://github.com/sakibulxyz/dmenu
git clone https://github.com/sakibulxyz/dwmblocks

printf "\ncloning\033[1;31m and moving bin \033[0m\n\n"
mkdir -p ~/.local
git clone https://github.com/sakibulxyz/bin && mv bin ~/.local/ && printf "\nbin moved to .local/bin\n\n"
