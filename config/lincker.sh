#!/bin/env bash

set -e

conf_dir="$HOME/.config"

for prog in $*; do
	prog=$(echo "$prog" | sed 's/\/$//')
	[ ! -d "$prog" ] && echo "$prog: don't exit bye!" && exit

	echo "$PWD/$prog -> $conf_dir/$prog"

	ln -fs "$PWD/$prog" "$conf_dir/$prog"
done
