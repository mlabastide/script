#!/bin/bash

# This script is for post installation of debain based systems

# Variables
line="==========================================================================="
#clear
# Check Root
if [[ "${UID}" -ne 0 ]]
then
 echo 'Please run this script as "root"' >&2
 exit 1
fi

# Main Menu
echo $line
echo "                                Main Menu"
echo $line
echo "1) Installation"
echo "2) Users"
echo "3) Shutdown"
echo $line
read -p "Please choose an option: " option
if (($option == "1"))
    then ./installation_options.sh
    elif (($option == "2"))
    then ./user_menu.sh
    elif (($option == "3"))
    then ./shutdown_options.sh
else echo "That is not an option, please try again"
    sleep 2
./install.sh
fi
./install.sh