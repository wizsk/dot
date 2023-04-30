dirname=$(echo "$PWD" | rev | cut -d\/ -f 1 | rev)
echo "$dirname"

# if [ "$dirname" != "dot" ] || [ "$dirname" != "files" ]
if [ "$dirname" != "dot" ] 
then
    exit -1
fi


echo "Copying Nvim"
rm -rf ./.config/nvim
cp -r ~/.config/nvim ./.config/.

echo "Copying sway/conf"
rm -r ./.config/sway
cp -r ~/.config/sway ./.config/.

echo "Copying waybar/*"
rm -rf ./.config/waybar
cp -r ~/.config/waybar ./.config/waybar 

echo "Copying zathura/*"
cp -r ~/.config/zathura/* ./.config/zathura 

echo "Copying yt-dlp/*"
cp -r ~/.config/yt-dlp/* ./.config/yt-dlp 

echo "Copying alacritty/alacritty.yml"
rm -rf ./.config/alacritty 
cp -r ~/.config/alacritty ./.config/alacritty 

echo "Copying foo t"
cp ~/.config/foot/foot.ini ./.config/foot


echo "Copying mpv/*"
cp ~/.config/mpv/*.conf ./.config/mpv/.

echo "Copying ytfzf/*"
cp ~/.config/ytfzf/* ./.config/ytfzf/.


echo "Copying wofi/*"
cp ~/.config/wofi/* ./.config/wofi/.

echo "Copying tmux/*"
cp ~/.config/tmux/* ./.config/tmux/.


printf "\nShould .zsh copied? [y/N] "
read -r promt
if [ "$promt" = "y" ]
then
    echo ".zsh, bash and tmux is being copied"
    cp ~/.zshrc .
    cp ~/.zprofile .
    cp ~/.bashrc .
    cp ~/.bash_profile .
fi 

