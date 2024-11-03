#!/bin/env bash

conf_dir="$HOME/.config"

for prog in $*; do
	prog=$(echo "$prog" | sed 's/\/$//')
	echo "Linking '$prog' files"

	mkdir -p "$conf_dir/$prog"

	for c in "$prog/"*; do
		if [ -d "$c" ]; then
			echo "$c is a direcotry skipping"
			continue
		fi
		ln -s "$PWD/$c" "$conf_dir/$c"
	done
	echo "Done"
	echo
done
