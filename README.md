# My dotfiles & Dwm install Things

## First run this commands to cp all the .files to ~/home
```bash
git clone https://github.com/sakibulxyz/files
cd files
cp .* ~/
# to copy .configs/files
cp .config/* ~/.config/
```

## Dwm things
### First Install yay
```bash
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### cd into pkg-to-install and run this to install dwm dependencies
```bash
sh dwm-dependencies.sh
sh important-pkgs.sh 
```
### Now install dwm, st and dmenu
```bash
## isntall Dwm
git clone https://github.com/sakibulxyz/dwm
cd dwm
sudo make install
## installing st is tedious
git clone https://github.com/sakibulxyz/st
cd st 
sudo fakeroot
make install
exit
## insatall dmenu
git clone https://github.com/sakibulxyz/dmenu
cd dmenu
sudo make install
```
