#!/usr/bin/bash

ffmpeg -i "$1" -filter_complex "asplit [a]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1.5:mode=lissajous_xy:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]" -map "[out0]" -codec:v libx264 -crf 1 -bf 2 -flags +cgop -pix_fmt yuv420p -map 0:a "$2" -y
