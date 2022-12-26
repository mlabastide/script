#!/bin/bash
# Variables
line="================================================================"

#read -p "$line
#  Welcome to the raffle, please press enter to continue.
#$line"
# Main Menu
echo $line
echo "                       Main Menu"
echo $line
echo "1) New Raffle"
echo "2) View Previous Raffles"
echo $line
read -p "Please select an option:" selection
if (( $selection == "1" ))
    then ./winner.sh
    elif (( $selection == "2" ))
    then read -p "$line
Press enter to open folder, when complete plese press "q" to exit
$line" nothing
         ranger /home/vscode/git/script/gun_raffle/winners
else echo "That is not an available number, try again"
fi
clear
./menu.sh