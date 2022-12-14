#!/bin/bash

## Check Root
#if [[ "${UID}" -ne 0 ]];then
#  echo 'Please run this script as "root"' >&2
#  exit 1
#fi
## Install Required Packages
dnf install curl -y

## Fetch Packages

#Tailscale
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | sudo tee /etc/dnf/sources.list.d/tailscale.list
#Bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb

## Update
dnf update -y

echo '#####################
System is up to date
#####################'
echo "
#######################################
Would you like to install OpenSSH?[y/n]
#######################################"
read -r n
if [[ ( $n == "y" || $n == "Y" ) ]];then
  dnf install openssh-server -y
fi

## Install and Enable firewall
echo "
##########################################
Would you like to install a Firewall?[y/n]
##########################################"
read -r Y
if [[ ( $Y == "Y" || $Y == "y" ) ]];then
  dnf install ufw -y
  echo "What ports would you like opened[1-10000"
  read -r ports
  ufw allow "$ports"
  ufw --force enable
  ufw status
fi

## Install Fail2Ban
echo "
########################################
Would you like to install Fail2Ban?[y/n]
########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install fail2ban -y
  systemctl enable fail2ban
  systemctl start fail2ban
  echo "
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 4
" >> /etc/fail2ban/jail.local
fi

## Install Tailscale
echo "
#########################################
Would you like to install tailscale?[y/n]
#########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install tailscale -y
fi

## Install Bottom
echo "
#####################################################
Would you like to install bottom system monitor?[y/n]
#####################################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dpkg -i bottom_0.6.3_amd64.deb
fi

## Install neofetch
echo "
#########################################
Would you like to install neofetch ?[y/n]
#########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install neofetch -y
fi

## Install mlocate
echo "
########################################
Would you like to install mlocate ?[y/n]
########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install mlocate -y
  update db
fi

## Install speedtest-cli
echo "
#########################################
Would you like to install speedtest?[y/n]
#########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install speedtest-cli -y
  speedtest
fi

## Install rclone
echo "
######################################
Would you like to install rclone?[y/n]
######################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install rclone -y
fi

## Install ncdu 
echo "
##################################################
Would you like to install NCurses DisK Usage?[y/n]
##################################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install ncdu -y
fi

## Install ranger
echo "
#######################################################
Would you like to install ranger CLI file manager?[y/n]
#######################################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install ranger -y
fi

## Install fuck
echo "
####################################
Would you like to install fuck?[y/n]
####################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install thefuck -y
fi

## Install nano
echo "
####################################
Would you like to install nano?[y/n]
####################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install nano -y
fi

## Install xsensors
echo "
########################################
Would you like to install xsensors?[y/n]
########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install xsensors -y
fi

## Install net-tools
echo "
#########################################
Would you like to install net tools?[y/n]
#########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install net-tools -y
fi

## Install thunderbird
echo "
###########################################
Would you like to install thunderbird?[y/n]
###########################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install thunderbird -y
fi

## Install freecad
echo "
#######################################
Would you like to install freecad?[y/n]
#######################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install freecad -y
fi

## Install tilix
echo "
#####################################
Would you like to install tilix?[y/n]
#####################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  dnf install tilix -y
fi


## Cleanup
  echo "
  #################################################################################
  One last thing, We need to update the system and clean up some installation files
  #################################################################################"
sleep 2
  dnf upgrade -y
  dnf autoremove -y
  dnf-get autoremove -y
  rm bottom_0.6.3_amd64.deb
  
## Reboot
  echo "
  ##################################################
  We must reboot, would you like to do this now.[y/n
  ##################################################"
read -r y
if [[ ( $y == "y" || $y == "Y" ) ]];then
  reboot now
  else
  [[ ( $y == "n" || $y == "N" ) ]]
  echo "
  #################################
  You really should reboot now.....
  #################################"
fi
