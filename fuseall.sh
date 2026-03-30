#!/usr/bin/env bash

folder=~/Pictures/Camera/

if [ ! -d ~/Downloads/a ]; then
	mkdir ~/Downloads/a
fi

for file in "$folder/"IMG_*_*_[0-9].dng; do
	if [ ! -f "$file" ]; then
		continue
	fi
	d=$(date -R -r "$file")
	output="${file%_[0-9].dng}_hdr"
	fuse "$file" "$output"
	filesize=$(stat -c%s "$output.tiff")
	while [ "$filesize" -eq 0 ]; do
		echo "Conversion for ${file%_[0-9].dng} failed. Retrying..."
		fuse "$file" "$output"
		filesize=$(stat -c%s "$output")
	done
	gio trash "${file%_[0-9].dng}"_[0-9].jpg
	gio trash "${file%_[0-9].dng}"_[0-9].dng
	touch -d "$d" "$output.tiff"
	mv "$output.tiff" ~/Downloads/a -f
done
