#!/usr/bin/env bash

folder=~/Pictures/Camera

if [ ! -d ~/Downloads/a ]; then
	mkdir ~/Downloads/a
fi

for file in "$folder/"IMG_*_*_[0-9].jpg; do
	if [ ! -f "$file" ]; then
		continue
	fi
	d=$(date -R -r "$file")
	# output="${file%_[0-9].dng}_dng_hdr"
	# if [[ -f  "$output.tiff" ]]; then
	# 	rm "$output.tiff"
	# fi
	# fuse "$file" "$output"
	# filesize=$(stat -c%s "$output.tiff")
	# while [[ "$filesize" -eq 0 ]]; do
	# 	echo "Conversion for ${file%_[0-9].dng} failed. Retrying..."
	# 	rm "$output.tiff"
	# 	fuse "$file" "$output"
	# 	filesize=$(stat -c%s "$output.tiff")
	# done

	output_jpg="${file%_[0-9].jpg}_jpg_hdr_"
	if [[ -f  "$output_jpg.tiff" ]]; then
		rm "$output_jpg.tiff"
	fi
	fuse "$file" "$output_jpg"
	echo "Done fusing. Looking for $output_jpg.tiff"
	filesize=$(stat -c%s "$output_jpg.tiff")
	while [[ "$filesize" -eq 0 ]]; do
		echo "Conversion for ${file%_[0-9].*} failed. Retrying..."
		rm "$output_jpg.tiff"
		fuse "$file" "$output_jpg"
		filesize=$(stat -c%s "$output_jpg.tiff")
	done

	rm "${file%_[0-9].*}"_[0-9].tiff
	gio trash "${file%_[0-9].*}"_[0-9].jpg
	gio trash "${file%_[0-9].*}"_[0-9].dng
	# touch -d "$d" "$output.tiff"
	touch -d "$d" "$output_jpg.tiff"
	# mv "$output.tiff" ~/Downloads/a -f
	mv "$output_jpg.tiff" ~/Downloads/a -f
done
