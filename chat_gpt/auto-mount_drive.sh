#!/bin/bash

#To use this script, replace "/path/to/drive" with the path to the drive that you want to mount, and replace "/path/to/mount/point" with the desired mount point for the drive.

#Save the script to a file, make it executable with chmod +x, and then add it to your startup applications so that it runs whenever you log in.

#Alternatively, you can add the script to your .bashrc file to run it every time you open a new terminal window.

# Set the path to the drive that you want to mount
drive="/path/to/drive"

# Set the mount point for the drive
mount_point="/path/to/mount/point"

# Check if the drive is already mounted
if grep -qs "$mount_point" /proc/mounts; then
    # Drive is already mounted, do nothing
    :
else
    # Drive is not mounted, mount it
    sudo mount "$drive" "$mount_point"
fi
