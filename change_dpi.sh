#!/bin/bash

## This is a VERY simple script to quickly and easily change the DPI of a display. I got annoyed having to do it all the time. Script in your .bashrc file to make sure that it automatically changes DPI at start. 

echo '
############################
Please, enter the DPI value.
############################'
read -r dpi
xrandr --dpi $dpi
echo "
####################################################
Thank you, $USER, your DPI has been updated to $dpi
####################################################"