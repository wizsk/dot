printf "Do you Reallay wanna install These pakages? [Y/n] " && read -r prom
[ "$prom" = "n" ] && echo "Nothing will be installed" && exit 0


sudo pamcman -S zsh zsh-syntax-highlighting  ttf-cascadia-code ttf-roboto-mono noto-fonts-emoji bat fzf htop jq lxappearance maim man-db mpv nautilus neofetch neovim python-pywal sxiv syncthing termdown ueberzug xclip yt-dlp zathura zathura-cb zathura-pdf-poppler  bluez bluez-utils pulseaudio-bluetooth 

yay -S ttf-freebanglafont
