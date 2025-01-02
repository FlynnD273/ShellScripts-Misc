#!/usr/bin/env bash

_md_autocomplete() {
    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -f -- "$cur" | grep '\.md$') )
    return 0
}

complete -F _md_autocomplete mdtopdf
