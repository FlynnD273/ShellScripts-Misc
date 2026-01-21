#!/usr/bin/env bash

file="${1%_[0-9].jpg}"
align_image_stack "$file"* -o "$2"
ffmpeg -i "$2.hdr" "$2.tiff" -y && rm "$2.hdr"
