#!/bin/bash

## Check Root
if [[ "${UID}" -ne 0 ]]
then
 echo 'Please run this script as "root"' >&2
 exit 1
fi
## Install Required Packages
apt install curl -y

## Fetch Packages

#Tailscale
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
#Bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb

## Update
apt update -y

echo 'System is up to date'
echo "Would you like to install OpenSSH? Y/n/"
read n
if [[ ( $n == "y" || $n == "Y" ) ]]
then
apt install openssh-server -y
fi

## Install and Enable firewall
echo "Would you like to install a Firewall?"
read Y
if [[ ( $Y == "Y" || $Y == "y" ) ]]
then
apt install ufw -y
echo "What ports would you like opened"
read ports
ufw allow $ports
ufw --force enable
ufw status
fi

## Install Fail2Ban
echo "Would you like to install Fail2Ban?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban
fi

echo "
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 4
" >> /etc/fail2ban/jail.local

## Install Tailscale
echo "Would you like to install tailscale?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install tailscale -y
fi

## Install Bottom
echo "Would you like to install bottom system monitor?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
dpkg -i bottom_0.6.3_amd64.deb
fi

## Install neofetch
echo "Would you like to install neofetch ?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install neofetch -y
fi

## Install mlocate
echo "Would you like to install mlocate ?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install mlocate -y
update db
fi

## Install speedtest-cli
echo "Would you like to install speedtest?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install speedtest-cli -y
speedtest
fi

## Install rclone
echo "Would you like to install rclone?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install rclone -y
fi

## Install ncdu 
echo "Would you like to install NCurses DisK Usage?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install ncdu -y
fi

## Install ranger
echo "Would you like to install ranger CLI file manager?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install ranger -y
fi

## Install fuck
echo "Would you like to install fuck?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install thefuck -y
fi

## Install nano
echo "Would you like to install nano?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install nano -y
fi

## Install xsensors
echo "Would you like to install xsensors?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install xsensors -y
fi

## Install net-tools
echo "Would you like to install net tools?"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
apt install net-tools -y
fi

## new-user
echo "Let's setup a user?"
sleep 1
echo "Pleae enter a username"
read user
adduser $user
wait
mkdir /home/$user/Documents
mkdir /home/$user/Downloads
echo "Should this user be sudo?"
read y
if [[ ( $y == "Y" || $y == "y" ) ]]
then
usermod -G sudo $user
echo "$user has been created and added to the sudo group"
else
echo "$user has been created with restricted access"
fi

## Cleanup
echo "One last thing, We need to update the system and clean up some installation files"
sleep 2
apt upgrade -y
apt autoremove -y
apt-get autoremove -y
rm bottom_0.6.3_amd64.deb
echo "We must reboot, would you like to do this now"
read y
if [[ ( $y == "y" || $y == "Y" ) ]]
then
reboot now
else
echo "You really should reboot now....."
fi
