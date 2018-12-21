#!/bin/bash

sep="$1"

if [ "$sep" ]; then
    python3 -c "\"import sys; list(map(lambda l: print('|'.join(l.split('${sep}'))), sys.stdin.readlines()))\""
else
    python3 -c "\"import sys; list(map(lambda l: print('|'.join(l.split())), sys.stdin.readlines()))\""
fi