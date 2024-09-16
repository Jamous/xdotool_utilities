#!/bin/bash
## This script presses up and enter once per second. Usefull for refreshing cli pages

# Define a lock file to track the script state
LOCK_FILE="/tmp/key_press_running.lock"

# Function to start the loop
start_script() {
    echo "Starting the key press loop..."
    while true; do
        xdotool key Up
        xdotool key Return
        sleep 1
    done
}

# Check if the script is already running by checking for the lock file
if [ -f "$LOCK_FILE" ]; then
    echo "Stopping the key press script."
    # Remove the lock file
    rm "$LOCK_FILE"
    # Kill the running instance of this script
    pkill -f "upandenter.sh"
else
    # Create the lock file to mark that the script is running
    touch "$LOCK_FILE"
    # Run the script in the background
    start_script &
fi
