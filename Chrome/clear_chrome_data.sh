#!/bin/bash

# Clear Chrome history, recent tabs, and cache
rm -rf ~/.config/google-chrome/Default/History
rm -rf ~/.config/google-chrome/Default/Sessions
rm -rf ~/.config/google-chrome/Default/Cache/*
# Launch Google Chrome (location/file may be different, right click your Chrome application and edit/view the file to see how your system launches the app)
/usr/bin/google-chrome-stable
