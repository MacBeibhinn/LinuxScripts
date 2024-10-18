#!/bin/bash

# Clear Chrome history, sessions, visited links, top sites, and cache
rm -rf ~/.config/google-chrome/Default/History
rm -rf ~/.config/google-chrome/Default/Sessions
rm -rf ~/.config/google-chrome/Default/Visited\ Links
rm -rf ~/.config/google-chrome/Default/Top\ Sites
rm -rf ~/.config/google-chrome/Default/Cache/*
# Clear download history, only works if sqlite3 is installed, remove/comment the line if you do not want this:
sqlite3 ~/.config/google-chrome/Default/History "DELETE FROM downloads;"
# Launch Google Chrome (location/file may be different, right click your Chrome application and edit/view the file to see how your system launches the app)
/usr/bin/google-chrome-stable
