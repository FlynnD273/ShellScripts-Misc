#!/usr/bin/env bash

file=$(ls ~/Pictures/Wallpapers/*.* | shuf -n 1)

# hyprctl hyprpaper preload "$file"
# hyprctl hyprpaper wallpaper ,contain:"$file"
# hyprctl hyprpaper unload all
gsettings set org.gnome.desktop.background picture-uri-dark "$file"
