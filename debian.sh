#!/bin/bash

## Are you running this script as root?
if [[ "${UID}" -ne 0 ]]
then
 echo 'Please run this script as "root"' >&2
 exit 1
fi

##  System Update
apt update && apt upgrade -y

echo 'System is up to date'

## Install and Enable OpenSSH
apt install openssh-server -y

## Install and Enable firewall
apt install ufw -y
ufw enable -y
ufw allow 22
echo 'Firewall Enabled'

## Install Fail2Ban
apt install fail2ban -y
systemctl start fail2ban
systemctl enable fail2ban

echo "
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 4
" >> /etc/fail2ban/jail.local

## Create new user with needed directories
adduser mlabastide
usermod -G sudo mlabastide
mkdir /home/mlabastide/Documents
mkdir /home/mlabastide/Downloads

echo 'sudo user created'

## Unattended Upgrades
sudo apt-get install -y unattended-upgrades
echo "Unattended-Upgrade::Allowed-Origins {
#   "${distro_id}:${distro_codename}-security";
#//  "${distro_id}:${distro_codename}-updates";
#//  "${distro_id}:${distro_codename}-proposed";
#//  "${distro_id}:${distro_codename}-backports";
#Unattended-Upgrade::Automatic-Reboot "true";
#}; " >> /etc/apt/apt.conf.d/50unattended-upgrades

## Most used Packages installation
PACKAGES="mlocate neofetch"

apt install $PACKAGES -y

## Clean up
apt autoremove -y
