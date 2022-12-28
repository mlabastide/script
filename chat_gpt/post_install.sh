#!/bin/bash

# Update the package manager's package list and upgrade installed packages
apt update
apt upgrade -y

# Install some useful packages
apt install -y build-essential curl git htop unzip

# Set the timezone
timedatectl set-timezone America/New_York

# Create a new user
read -p "Enter username: " username
adduser $username
usermod -aG sudo $username

# Enable firewall and allow SSH connections
ufw allow 22/tcp
ufw enable

# Set up automatic updates
apt install -y unattended-upgrades
echo 'APT::Periodic::Update-Package-Lists "1";' > /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades

# Reboot the system
echo "Post-installation tasks complete. Rebooting system..."
reboot
