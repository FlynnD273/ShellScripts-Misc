#!/usr/bin/env bash
mkdir -p ~/.local/bin

find $PWD -name "*.sh" -type f -not -name "link-all-scripts.sh" | while read -r file; do
	file_name=$(basename "$file")
	file_name_without_extension="${file_name%.*}"
	echo "Linking $file_name..."
	ln -sf "$file" ~/.local/bin/$file_name_without_extension
done
