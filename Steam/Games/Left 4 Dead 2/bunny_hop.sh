#!/bin/bash

# Set script name and lock file
getScriptName="bunny_hop.sh"
lockfile="/tmp/${getScriptName}.lock" # Creates a file to detect script toggle
JUMP_DELAY=0.615 # How long it takes to land after jumping
# Function to check if the script is already running
is_running() {
    # Check if the lock file exists
    [ -e "$lockfile" ]
}
# Cleanup function to remove the lock file
cleanup() {
    rm -f "$lockfile"
    exit 0
}
# Trap signals to ensure cleanup
trap cleanup INT TERM EXIT
# If the script is already running, kill it
if is_running; then
    # notify-send "Script is already running. Stopping it."
    pkill -f "$getScriptName"
    exit 0  # Exit immediately after killing the existing instance
else
    # Create the lock file
    touch "$lockfile"
    # notify-send "Starting the script."
    echo "Starting the script."
fi
# Set the window title to monitor (change this to your game's window title)
WINDOW_TITLE="Left 4 Dead 2 - OpenGL"
# notify-send "Monitoring window: $WINDOW_TITLE"
# Main loop
sleep 0.5 # Delay to allow releasing command key
while true; do
    # Check if the focused window title matches the target window title
    getWindowTitle="$(xdotool getwindowfocus getwindowname)"
    if [ "$getWindowTitle" == "$WINDOW_TITLE" ]; then
        # Simulate pressing the space bar (jump key)
        xdotool key space
        # Wait before jumping again
        sleep $JUMP_DELAY
    else
        # If not in the target window, exit the loop and kill the script
        pkill -f "$getScriptName"
        break  # Exit the loop
    fi
done
# Cleanup: remove the lock file on exit
cleanup
