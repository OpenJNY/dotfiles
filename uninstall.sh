#!/bin/bash

set -Ce

SCRIPT_DIR=$(cd $(dirname $0); pwd)

startswith() { case $2 in "$1"*) true;; *) false;; esac; }

for file in $(find $HOME -maxdepth 1 -type l); do
  resolved=$(readlink $file)
  if startswith $SCRIPT_DIR $resolved; then
    echo "[unlink] $file <- $resolved"
    unlink $file
  fi
done

echo "done!"