#!/usr/bin/bash

pandoc "$1" -t pdf --pdf-engine=xelatex --pdf-engine-opt=-shell-escape -o "${1%.*}.pdf"
gio trash _minted-input
