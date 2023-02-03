sudo pacman -S mtpfs

yay -s jmtpfs || echo "some problem with yay exiting" && exit 1

sudo pacman -S gvfs-mtp

sudo pacman -Sy gvfs-gphoto2

printf "Do you wanto restart now? [y/N] " && read -r prom
[ ! "$prom" = "y" ] && echo "Remember to reboot or file transfer wont happend" && exit 0 || reboot
