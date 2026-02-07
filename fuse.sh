#!/usr/bin/env bash

set -e

output="$2"
if [ ! "$output" ]; then
	output="${1%_[0-9].dng}_hdr"
fi
file="${1%_[0-9].dng}"

for f in "$file"_[0-9]*.dng; do
	t=$(mktemp --suffix .tiff)
	ffmpeg -i "$f" "$t" -y
	exiftool -overwrite_Original -TagsFromFile "$f" -All:All "$t"
	mv "$t" "${f%.dng}.tiff" -f
done

align_image_stack "$file"_[0-9]*.tiff -o "$output"
ffmpeg -i "$output.hdr" -compression_algo 32946 "$output.tiff" -y && rm "$output.hdr"
