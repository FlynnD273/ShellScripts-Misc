#!/usr/bin/env bash

folder=~/Pictures/Camera/

if [ ! -d ~/Downloads/a ]; then
	mkdir ~/Downloads/a
fi

for file in "$folder/"IMG_*_*_[0-9].jpg; do
	if [ ! -f "$file" ]; then
		continue
	fi
	d=$(date -R -r "$file")
	output="${file%_[0-9].jpg}_hdr"
	fuse "$file" "$output"
	gio trash "${file%_[0-9].jpg}"_[0-9].jpg
	touch -d "$d" "$output.tiff"
	cp "$output.tiff" ~/Downloads/a
done
