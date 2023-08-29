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

if [ -n "$input_file" ]; then
	if [ $rotate ]; then
	ffplay -f lavfi "amovie=$input_file, asplit [a][out1]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1:mode=lissajous_xy:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]"
	else
		ffplay -f lavfi "amovie=$input_file, asplit [a][out1]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1:mode=lissajous:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]"
	fi
else
	echo "Input file not provided."
fi
