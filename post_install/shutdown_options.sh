#!/bin/bash
# Variables
line="==========================================================================="

# Shutdown Menu
echo $line
echo "                          Shutdown Menu"
echo $line
echo "1) Shutdown"
echo "2) Reboot"
read -p "Please select an option: " option
if (($option == "1"))
    then sudo shutdown now
elif (($option == "2"))
    then sudo reboot now
fi
