#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Prompt for username
read -p "Enter username: " username

# Prompt for password
read -s -p "Enter password: " password
echo

# Create the user
useradd -m $username
echo "$username:$password" | chpasswd

# Add the user to the sudo group (optional)
usermod -aG sudo $username

echo "User $username created successfully!"
