#!/bin/bash

## Check Root
if [[ "${UID}" -ne 0 ]]
then
 echo 'Please run this script as "root"' >&2
 exit 1
fi

## Update
apt update

echo 'System is up to date'

## Install and Enable OpenSSH
apt install openssh-server -y

## Install and Enable firewall
apt install ufw -y
ufw allow 22
ufw --force enable
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

## Unattended Upgrades
sudo apt-get install -y unattended-upgrades
echo "Unattended-Upgrade::Allowed-Origins {
#   "${distro_id}:${distro_codename}-security";
#//  "${distro_id}:${distro_codename}-updates";
#//  "${distro_id}:${distro_codename}-proposed";
#//  "${distro_id}:${distro_codename}-backports";
#Unattended-Upgrade::Automatic-Reboot "true";
#}; " >> /etc/apt/apt.conf.d/50unattended-upgrades

## Install Bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb
sudo dpkg -i bottom_0.6.3_amd64.deb


## Most used Packages installation
PACKAGES="mlocate neofetch speedtest-cli rclone fzf ranger thefuck"

apt install $PACKAGES -y

## Create new user with needed directories
adduser mlabastide
usermod -G sudo mlabastide
mkdir /home/mlabastide/Documents
mkdir /home/mlabastide/Downloads

echo 'sudo user created'

## Upgrade
apt upgrade -y
## Clean up
apt autoremove -y
