#!/usr/bin/bash

flatpak run org.mozilla.firefox "https://duckduckgo.com/?t=ffab&q=$1" 2>/dev/null
