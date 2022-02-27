#!/bin/sh

# Initialize X's resource database
[[ -f "$XDG_CONFIG_HOME/xorg/.Xresources" ]] && xrdb -merge -I$HOME "$XDG_CONFIG_HOME/xorg/.Xresources"

# start wm
exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
