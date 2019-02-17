#!/usr/bin/env bash

# clear
setxkbmap -option

echo "
clear lock
keycode 66 = Mode_switch
keycode 43 = h H Left Left
keycode 44 = j J Down Down
keycode 45 = k K Up Up
keycode 46 = l L Right Right
keycode 53 = x X BackSpace BackSpace
" > /tmp/.xmodmap

xmodmap /tmp/.xmodmap

if [ $(type xcape > /dev/null) ]; then
    xcape -e 'Mode_switch=Escape'
fi