#!/usr/bin/bash

file=$(ls ~/Pictures/Wallpapers/*.* | shuf -n 1)

gsettings set org.gnome.desktop.background picture-uri-dark "$file"
