#!/bin/bash

xdotool mousemove $(($(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f1) / 2)) $(($(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f2) / 2))
