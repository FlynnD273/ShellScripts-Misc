#!/usr/bin/bash

rotate=false
input_file=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    -r|--rotate)
      rotate=true
      shift
      ;;
    *)
      input_file="$1"
      shift
      ;;
  esac
done

if $rotate; then
  echo "hello"
else
  if [ -n "$input_file" ]; then
		if [ $rotate ]; then
			ffmpeg -i "$1" -filter_complex "asplit [a]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1.5:mode=lissajous_xy:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]" -map "[out0]" -codec:v libx264 -crf 1 -bf 2 -flags +cgop -pix_fmt yuv420p -map 0:a "$2" -y
		else
			ffmpeg -i "$1" -filter_complex "asplit [a]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1.5:mode=lissajous_xy:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]" -map "[out0]" -codec:v libx264 -crf 1 -bf 2 -flags +cgop -pix_fmt yuv420p -map 0:a "$2" -y
		fi
  else
    echo "Input file not provided."
  fi
fi
