#!/bin/bash

setxkbmap -option
xmodmap $(HOME)/.Xmodmap
if [ $(type xcape > /dev/null) ]; then
    xcape -e 'Mode_switch=Escape'
fi

echo "done" > /tmp/xmodmap.log

exit 0
