#!/usr/bin/bash

ls -1tpd ~/Pictures/Screenshots/* | grep -v ".*/$" | head -1 | tesseract stdin stdout | tail -1 | xclip -i -selection clipboard
