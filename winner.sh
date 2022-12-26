#!/bin/bash
## This script is to choose a random winner out of 25 spots. 
# command to choose random number / echo $(( $RANDOM %  5 + 1 ))
# Giveaway item
echo "Please enter what is being given away.(No Spaces)"
read -r PRIZE
# Make a new winner file
touch /home/vscode/winners/$PRIZE
# Add date to new file
date >> /home/vscode/winners/$PRIZE
# Add prize to new file
echo "Prize: $PRIZE" >> /home/vscode/winners/$PRIZE
# Number of participants
echo "Please enter the number of participants."
read -r PARTICIPANTS
# Choose a random number from 1 - however many participants
WINNER=$(( $RANDOM % $PARTICIPANTS ))
sleep 1
# Display the winning number
echo "The winner of the $PRIZE is Number $WINNER"
# Add winning number to new file
echo "Winning Number: $WINNER" >> /home/vscode/winners/$PRIZE
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
# Record the winners name
echo "Please enter the winners name (First/Last)."
read -r NAME
# Add winners name to new file
echo "Winners Name: $NAME." >> /home/vscode/winners/$PRIZE
clear
# Display the final file for 60 seconds
cat /home/vscode/winners/$PRIZE
sleep 60
exit