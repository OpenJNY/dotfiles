#!/usr/bin/env python3

# usage:
# wmctrl -l | cut_before.py 3

import sys

start = int(sys.argv[1])

for l in sys.stdin:
    print(" ".join(l.strip().split()[start:]))