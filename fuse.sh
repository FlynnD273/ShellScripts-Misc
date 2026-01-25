#!/usr/bin/env bash

output="$2"
if [ ! "$output" ]; then
	name="$(basename "$1")"
	output="${name%_[0-9].jpg}_hdr"
fi
file="${1%_[0-9].jpg}"

for f in "$file"_[0-9]*.jpg; do
	t=$(mktemp --suffix .jpg)
	ffmpeg -i "$f" "$t" -y
	exiftool -overwrite_Original -TagsFromFile "$f" -All:All "$t"
	mv "$t" "$f" -f
done

align_image_stack "$file"_[0-9]*.jpg -o "$output"
ffmpeg -i "$output.hdr" "$output.tiff" -y && rm "$output.hdr"
