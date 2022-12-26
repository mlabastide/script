#!/bin/bash
## This script is to choose a random winner out of 25 spots. 
# command to choose random number / echo $(( $RANDOM %  5 + 1 ))
# Introduction
echo "Welcome to the giveaway!"
sleep 1
echo "
_______/]_________[\___
|    ____     ___|---------------|=====
|_ /      /  /_|   |
         /_/     \_ \
"
# Giveaway item
#echo "Please enter what is being given away.(No Spaces)"
read -p "Please enter the guns manufacture:" manufacture
read -p "Please enter the guns model:" model
# Make a new winner file
touch /home/vscode/git/script/gun_raffle/winners/$manufacture$model
# Add date to new file
date >> /home/vscode/git/script/gun_raffle/winners/$manufacture$model
# Add prize to new file
echo "Prize" >> /home/vscode/git/script/gun_raffle/winners/$manufacture$model
echo "Make: $manufacture" >> /home/vscode/git/script/gun_raffle/winners/$manufacture$model
echo "Model: $model" >> /home/vscode/git/script/gun_raffle/winners/$manufacture$model
# Number of participants
#echo "Please enter the number of participants."
read -p "Please enter the number of participants:" PARTICIPANTS
# Choose a random number from 1 - however many participants
WINNER=$(($(( $RANDOM % $PARTICIPANTS )) +1 ))
sleep 1
# Display the winning number
read -p "Please press enter to continue." nothing
echo "The winner of the $manufacture $model is Number $WINNER"
# Add winning number to new file
read -p "Please press enter to file information."
echo "Winning Number: $WINNER" >> /home/vscode/git/script/gun_raffle/winners/$manufacture$model
sleep 1
echo "
╔═══╗─────────────╔╗───╔╗───╔╗
║╔═╗║────────────╔╝╚╗──║║──╔╝╚╗
║║─╚╬══╦═╗╔══╦═╦═╩╗╔╬╗╔╣║╔═╩╗╔╬╦══╦═╗╔══╗
║║─╔╣╔╗║╔╗╣╔╗║╔╣╔╗║║║║║║║║╔╗║║╠╣╔╗║╔╗╣══╣
║╚═╝║╚╝║║║║╚╝║║║╔╗║╚╣╚╝║╚╣╔╗║╚╣║╚╝║║║╠══║
╚═══╩══╩╝╚╩═╗╠╝╚╝╚╩═╩══╩═╩╝╚╩═╩╩══╩╝╚╩══╝
──────────╔═╝║
──────────╚══╝
"
# Record the winners/ name
echo "Please enter the winners/ name (First/Last)."
read -r NAME
# Add winners/ name to new file
echo "Winners Name: $NAME." >> /home/vscode/git/script/gun_raffle/winners/$manufacture$model
clear
# Display the final file for 60 seconds
cat /home/vscode/git/script/gun_raffle/winners/$manufacture$model
read -p "Please press enter to return to the menu" nothing
clear
./menu.sh