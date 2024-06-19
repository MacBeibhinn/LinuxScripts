#!/bin/bash

# Mount external drives and Steam folder locations, helps if Steam starts without automatically checking external drives
MOUNT_POINT_1="/mnt/external_drive1/Steam"
MOUNT_POINT_2="/mnt/external_drive2/Steam"
# Ensure all of the drives are mounted (this may not be necessary if for example fstab mounts correctly)
sudo mount -a
# Command to add library folders to Steam configuration
steam --reset  # This command might help to refresh Steam's settings
sleep 5  # Wait for Steam to reset then add the Steam folders
steam steam://run/0 --add-library-folder="$MOUNT_POINT_1"
steam steam://run/0 --add-library-folder="$MOUNT_POINT_2"
# Start Steam normally
steam
