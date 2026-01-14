#!/usr/bin/env bash

if [ ! "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: make_blender_project <Project Name> [-a, -g, -s, -v]"
	exit
fi

src="/mnt/tertiary/Blender/Template"
name="$1"
type="$2"
projects="/mnt/tertiary/Blender/Projects/"

case "$type" in
	-a)
		type=Animations
		;;
	-g)
		type="Grease Pencil"
		;;
	-s)
		type="Still Scenes"
		;;
	-v)
		type="Video Editing"
		;;
esac

out="$(realpath "$projects/$type/$name")"
if [ -d "$out" ]; then
	echo "Project already exists!"
	exit 1
fi


cp "$src" "$out" -r
shopt -s globstar
for file in "$out"/**/Template.*; do
	ext="${file##*.}"
	mv "$file" "$(dirname "$file")/$name.$ext"
done
xdg-open "$out"
