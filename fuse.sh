#!/usr/bin/env bash

output="$2"
if [ ! "$output" ]; then
	output=$(uuidgen)
fi
file="${1%_[0-9].jpg}"
align_image_stack "$file"* -o "$output"
ffmpeg -i "$output.hdr" "$output.tiff" -y && rm "$output.hdr"
