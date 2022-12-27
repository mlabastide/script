#!/bin/bash

# Variables
line="==========================================================================="

#Check Root
#if [[ "${UID}" -ne 0 ]]
#then
# echo 'Please run this script as "root"' >&2
# exit 1
#fi
# User Menu

echo $line
echo "                              User Menu"
echo $line
echo "1) Add User"
echo "2) Change Password"
echo "3) Add User to Group"
echo "4) Delete User"
echo "5) Go Back to Main Menu"
echo $line
read -p "Please choose an option: " option
if (($option == "1"))
    then read -p "Please enter username: " username
    sudo adduser $username
elif (($option == "2"))
    then read -p "Please enter username: " username
    sudo passwd $username
    echo "3) Add User to Group"
elif (($option == "3"))
    then read -p "Please enter username: " username
         read -p "Please enter group: " group
    sudo usermod -G $group $username
elif (($option == "4"))
    then read -p "Please enter username: " username
    sudo deluser $username
elif (($option == "5"))
    then ./install.sh
else echo "That is not an option, please try again."
    ./user_menu.sh
fi
./user_menu.sh