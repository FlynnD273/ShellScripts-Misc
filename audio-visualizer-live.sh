#!/usr/bin/env bash

rotate=false
input_file=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    -r|--rotate)
      rotate=true
      shift
      ;;
    *)
      shift
      ;;
  esac
done

if $rotate; then
	ffmpeg -f pulse -i "$(pactl info | grep 'Default Sink' | cut -c 15-).monitor" -filter_complex "[0:a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1.5:mode=lissajous_xy:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]" -map "[out0]" -f sdl "Visualizer"
else
	ffmpeg -f pulse -i "$(pactl info | grep 'Default Sink' | cut -c 15-).monitor" -filter_complex "[0:a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1.5:mode=lissajous:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]" -map "[out0]" -f sdl "Visualizer"
fi
