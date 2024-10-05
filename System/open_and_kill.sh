#!/bin/bash

# Open Dolphin (or any other application) and get its PID
dolphin /home/username/Documents/Folder &
dolphin_pid=$!
# Wait for a specified amount of time (e.g., 10 seconds, adjust if needed)
sleep 5
# Close the opened app using its PID
kill $dolphin_pid
