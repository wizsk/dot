#!/bin/sh

set -e

d="$HOME/.config/foot"
td="$d/themes"

t=$(ls "$td" | fzf)

ln -fs "$td/$t" "$HOME/.cache/foot-theme.ini"
