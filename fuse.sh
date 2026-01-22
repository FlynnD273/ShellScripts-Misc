#!/usr/bin/env bash

output="$2"
if [ ! "$output" ]; then
	name="$(basename "$1")"
	output="${name%_[0-9].jpg}_hdr"
fi
file="${1%_[0-9].jpg}"
align_image_stack "$file"_[0-9]*.jpg -o "$output"
ffmpeg -i "$output.hdr" "$output.tiff" -y && rm "$output.hdr"
