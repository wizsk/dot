dirname=$(echo "$PWD" | rev | cut -d\/ -f 1 | rev)
echo "$dirname"

# if [ "$dirname" != "dot" ] || [ "$dirname" != "files" ]
if [ "$dirname" != "dot" ] 
then
    exit -1
fi


echo "Copying sway/conf"
cp ~/.config/sway/config ./.config/sway/.

echo "Copying waybar/*"
rm -rf ./.config/waybar
cp -r ~/.config/waybar ./.config/waybar 

echo "Copying alacritty/alacritty.yml"
rm -rf ./.config/alacritty 
cp -r ~/.config/alacritty ./.config/alacritty 

echo "Copying mpv/*"
cp ~/.config/mpv/*.conf ./.config/mpv/.

echo "Copying wofi/*"
cp ~/.config/wofi/* ./.config/wofi/.

printf "\nShould .zsh copied? [y/N] "
read -r promt
if [ "$promt" = "y" ]
then
    echo ".zsh* and tmux is being copied"
    cp ~/.zshrc .
    cp ~/.zprofile .
    cp ~/.tmux.conf .
fi 

