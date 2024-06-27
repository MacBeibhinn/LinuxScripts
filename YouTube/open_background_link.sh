#!/bin/bash

# Open Firefox with the specified URL in a new tab without waiting for it to launch
firefox --new-tab "https://www.youtube.com" &
# Use wmctrl to get the ID of the most recently opened window
while [ -z "$WINDOW_ID" ]; do
    WINDOW_ID=$(xdotool search --onlyvisible --name "Mozilla Firefox" | tail -1)
    sleep 0.1
done
# Minimize the Firefox window
xdotool windowminimize $WINDOW_ID
