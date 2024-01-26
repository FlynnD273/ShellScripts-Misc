#!/usr/bin/bash

ls -1tpd ~/Pictures/Screenshots/* | grep -v ".*/$" | head -1 | tesseract stdin stdout | xclip -i -selection clipboard
