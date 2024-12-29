#!/bin/env bash

conf_dir="$HOME/.config"

for prog in $*; do
	prog=$(echo "$prog" | sed 's/\/$//')
	[ -f "$prog" ] && echo -e "$prog is file skipping\n" && continue

	echo "Linking '$prog' files:"
	if [ -d "$conf_dir/$prog" ]; then
		echo -n "Do you want to overwrite it? [y/N] "
		read p
		if [[ "$p" != "y" ]]; then
			echo -e "\t$conf_dir/$prog skipping!"
			echo
			continue
		fi
		echo -e "\tremoving $conf_dir/$prog!"
		rm -rf "$conf_dir/$prog"
	fi
	mkdir -p "$conf_dir/$prog"

	for c in "$prog/"*; do
		if [ -d "$c" ]; then
			echo -e "\t$c is a direcotry. cp $PWD/$c -> $conf_dir/$c"
			cp -r "$PWD/$c" "$conf_dir/$c"
			continue
		fi
		echo -e "\tlink $PWD/$c -> $conf_dir/$c"
		ln -s "$PWD/$c" "$conf_dir/$c"
	done
	echo "Done"
	echo
done
