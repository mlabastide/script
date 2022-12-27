#!/bin/bash

#Variables
line="==========================================================================="
#apt update
#apt install curl
#apt install dpkg
#clear
# Installation Menu
echo $line
echo "                           Installation Menu"
echo $line
echo "1) Tailscale"
echo "2) UFW Firewall"
echo "3) Fail2Ban"
echo "4) Bottom"
echo "5) Neofetch"
echo "6) mlocate"
echo "7) rclone"
echo "8) NCDU"
echo "9) Ranger"
echo "10) Fuck"
echo "11) xsensors"
echo "12) net-tools"
echo "13) thunderbird"
echo $line
echo "0) Return to main menu"
echo "Press Enter to view installed packages"
echo $line
# Installation Commands
touch installed_packages.txt
echo "Here is a list of all packages that you installed" >> installed_packages.txt
read -p "Please select packages that you would like to install: " package
if (($package == "1"))
# Tailscale
    then curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
         curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
         apt install tailscale -y
         echo "- tailscale" >> installed_packages.txt
         ./installation_options.sh
# UFW
elif (($package == "2"))
    then ./ufw_firewall.sh
         echo "- UFW" >> installed_packages.txt
         ./installation_options.sh
# Fail2Ban
elif (($package == "3"))
    then apt install fail2ban -y
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
         echo "- Fail2Ban" >> installed_packages.txt
        ./installation_options.sh
# Bottom
elif (($package == "4"))
    then curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb
         dpkg -i bottom_0.6.3_amd64.deb
         echo "- Bottom" >> installed_packages.txt
         ./installation_options.sh
# Neofetch
elif (($package == "5"))
    then apt install neofetch -y
         echo "- Neofetch" >> installed_packages.txt
         ./installation_options.sh
# Mlocate
elif (($package == "6"))
    then apt install mlocate -y
         updatedb
         echo "- Mlocate" >> installed_packages.txt
    ./installation_options.sh
# Speedtest
elif (($package == "7"))
    then apt install speedtest-cli -y
         echo "- Speedtest CLI" >> installed_packages.txt
         ./installation_options.sh
elif (($package == "8"))
    then apt install ncdu -y
         echo "- NCDU" >> installed_packages.txt
         ./installation_options.sh
elif (($package == "9"))
    then apt install ranger -y
         echo "- Ranger" >> installed_packages.txt
         ./installation_options.sh
elif (($package == "10"))
    then apt install thefuck -y
         echo "- The Fuck" >> installed_packages.txt
         ./installation_options.sh 
elif (($package == "11"))
    then apt install xsensors -y
         echo "- xsensors" >> installed_packages.txt
         ./installation_options.sh 
elif (($package == "12"))
    then apt install net-tools -y
        echo "- Net-Tools" >> installed_packages.txt
        ./installation_options.sh
elif (($package == "13"))
    then apt install thunderbird -y
         echo "- Thunderbird" >> installed_packages.txt
elif (($package == "0"))
    then ./install.sh
else cat installed_packages.txt
fi
read -p "Press Enter to return to main menu" nothing