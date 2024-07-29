#!/usr/bin/bash

mkdir bordered
find *.png -exec ffmpeg -i "{}" -vf "scale=4088:3064:force_original_aspect_ratio=decrease,pad=4088:3064:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/{}" \;
find *.jpg -exec ffmpeg -i "{}" -vf "scale=4088:3064:force_original_aspect_ratio=decrease,pad=4088:3064:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/{}" \;
find *.jpeg -exec ffmpeg -i "{}" -vf "scale=4088:3064:force_original_aspect_ratio=decrease,pad=4088:3064:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/{}" \;
