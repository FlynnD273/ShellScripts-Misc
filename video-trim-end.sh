#!/usr/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 input_video.mp4 <seconds to trim>"
    exit 1
fi

input_file="$1"
output_file="${input_file%.*}_cut.mp4"

duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$input_file")
trim_duration=$(echo "$duration - $2" | bc)

ffmpeg -i "$input_file" -ss 0 -t "$trim_duration" -c:a copy "$output_file" -y
