#!/bin/sh

set -e

li="$HOME/.cache/alacritty-theme.toml"
d="$HOME/.config/alacritty"
td="$d/themes"

# change it to default
if [ "$1" = "d" ]; then
	[ -f "$li" ] && echo "already exists: $li" && exit
	ln -fs "$td/rose_pine.toml" "$li"
	exit
fi

t=$(ls "$td" | fzf)

echo "$li -> $td/$t"

ln -fs "$td/$t" "$li"
