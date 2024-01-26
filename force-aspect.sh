#!/usr/bin/bash

mkdir bordered
find . -type f -exec {} -vf "scale=4088:3064:force_original_aspect_ratio=decrease,pad=4088:3064:(ow-iw)/2:(oh-ih)/2,setsar=1" bordered/{} \;
