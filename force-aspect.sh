#!/usr/bin/env bash

mkdir bordered
find *.png -exec ffmpeg -i "{}" -vf "scale=1080:810:force_original_aspect_ratio=decrease,pad=1080:810:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/{}" -y \;
find *.jpg -exec ffmpeg -i "{}" -vf "scale=1080:810:force_original_aspect_ratio=decrease,pad=1080:810:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/{}" -y \;
find *.jpeg -exec ffmpeg -i "{}" -vf "scale=1080:810:force_original_aspect_ratio=decrease,pad=1080:810:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/{}" -y \;
