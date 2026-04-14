#!/usr/bin/env bash

set -e

output="$2"
ext="${1##*.}"
if [ ! "$output" ]; then
	output="${1%_[0-9].*}_hdr"
fi
file="${1%_[0-9].*}"

for f in "$file"_[0-9]*."$ext"; do
	if [[ -f "${f%.*}.tiff" ]]; then
		continue
	fi
	t=$(mktemp --suffix .tiff)
	magick "$f" "$t"
	exiftool -overwrite_Original -TagsFromFile "$f" -All:All "$t"
	mv "$t" "${f%.*}.tiff" -f
done

tmp=$(mktemp --suffix=.hdr)
align_image_stack "$file"_[0-9].tiff -o "$tmp" 2>/dev/null
tmpout=$(mktemp --suffix=.tiff)
magick "$tmp" "$tmpout"
echo "done"
mv "$tmpout" "$output.tiff"
rm "$tmp"
# rm "$file"_+([0-9]).tiff
