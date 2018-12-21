#!/bin/bash

usage() {
    echo "Usage: $(basename $0) <source> <dest>

    source: The path to a file or directory to move.
    dest: A path to direcotry or file
"
}

src="$1"
dst="$2"

[[ -d $src || -f $src ]] || {
    usage()
    exit 1
}

# If dst is neither directory nor file, create
if [[ ! -d $dst && ! -f $dst ]]; then
    dst_dir=$(dirname "$dst")
    mkdir -p $dst_dir
fi