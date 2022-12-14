#!/bin/bash

## Make sure to "chmod +x" and add this file location to the end of "/etc/bash.bashrc"
## so it will automagicly run when user logs in.

## This script if for Airworx Raspberry Pi's
## It's purpose is to make it easy to update and upgrade in one command
## as well as easly search and clear logs

## Check Root
if [[ "${UID}" -ne 0 ]]
then
       echo 'Please run this script as "root"'
       exit 1
fi

## Update and Upgrade
echo "
##############################################
Would you like to update and upgrade now?(Y/n)
##############################################"
read -r answer
if [[ ( $answer == "Y" || $answer == "y" ) ]]
then
        sudo apt-get update
        sudo apt-get upgrade -y
        sudo apt-get autoremove -y
echo "
#####################################
Upgrade Complete!!!
─────────────────██▌─███████▌────────
─────────────────███─██████████▌─────
───────────────▐─███████████████▌────
──────────────▐██████████████████▌───
──────────────▐███████████████████▌──
──────────────▐████████████████████──
──────────────█████████░░░█████████──
─────────────██████░░░▓░░░░▓░░░░███──
────────────▐█████░░░▓░░░░░░░░░░░██──
─────────────▐███░░░█████░░░░███░█▌──
─────────────█████░█░░░░░░█▓░░░░█▌───
─────────────█████░░░░░░░░░░░░░░░▌───
─────────────█░███░░░░█░░░░░▐▀▌░░▌───
────────▄▄▄──█░░█░░░░░█░░░░░▐▄▌░▓▌───
──────▐█░░░█─█░█░░░░░░░░░█░░░░░░░▌───
─────▐█░░░░█─▐▄▌▓░░░░░░░░░░░░▓░░░▌───
─────▐█░░░░█───▐▓░░░▐▄▄▄▄▄▄▄▄░░░█────
──────▐█░░░█▌───▐▓░░░▐─────▌░░░█▌────
──▄▄▄▄███░░██────▐▓░░░▀▀▀▀▀░░░█▌─────
─▐██░░████░░█▄▄───██▓░░░░░░░░█▌──────
▐██▓▓▓▓▓▓░░░░▓█▌─█████░░░░░▓██───────
▐█▓░░░░░░▓░░░░▓▓▌─███████████────────
▐█▓▓▓▓▓▓▓▓▓░░░█▓█▄▄█████▓▓██─────────
▐█▓░░░░░▓▓░░░░░░░▓▓▓████▓░███────────
▐█▓▓▓▓▓▓▓▓▓░█░░▓█▓▄██████░░███▄──────
─▐█░░░░░▓▓░██▀▀▀▀▐██████░▄░███▓▌─────
──▀▀▀▀▀▀▀▀▀▀──────█████░░▄░░███▓▌────
─────────────────▐█████░░▄░░██▓░▓▌───
─────────────────▐█████░░▄░░███░▓▌───
────────────────▐██████░░▄░░███░░▓▌──
─░░────────────▐███████░░▄░░███▓░▓▌──
░░░░───────────▐███████░░░▄░░░███░▓▌─
░──░──────────────▐████████████▌░░▓▌─
░──░──────────────█████████████▌▓░░▓▌
░──░─────────────▐██████████████░▓░▓▌
░──░─────────────███████████████▓░▓▌─
░──░──────────────▓████████████▌░▓▌──
░──░────────────────█▓█▌──█▓█▌───────
░──░────────────────█▓█▌──█▓█▌───────
░──░────────────────█▓█▌──█▓█▌───────
░──░────────────█──██▓█▌─█▓▓█████▓▌──
░──░───────█████████▓█▌─██▓▓███████▌─
░──░──────█████████▓▓▓█▌─████████───█
░░░░─────██───██████▓██▌──███████████
─░░─────██████████████▌───██──█████──
─────────████████──██
#####################################"
else
echo "
####################
Upgrade not complete
╭∩╮ʕ•ᴥ•ʔ╭∩╮
####################"
fi
sleep .5
## Clear logs
echo "
##################################
Would you like to clear logs?(Y/n)
##################################"
read -r answer2
if [[ ( $answer2 == "Y" || $answer2 == "y" ) ]]
then
echo "
####################################################################
1. Opening NCDU, you must choose the logs you would like to remove.
####################################################################"
sleep 1
echo "
##########################################
2. Use arrow keys to navigate through NCDU
##########################################"
sleep 1
echo "
###########################################################
3. Find file you'd like to delete, press (d) to delete file
###########################################################"
sleep 1
echo '
#######################
4. Press Q to exit NCDU
#######################'
        sudo ncdu /var/log
echo "Log's deleted"
fi
