#!/usr/bin/bash

ffmpeg -i $1 -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" ${@:2}
