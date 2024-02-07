#!/usr/bin/bash

flatpak run org.mozilla.firefox "https://duckduckgo.com/?t=ffab&q=$*" 2>/dev/null
