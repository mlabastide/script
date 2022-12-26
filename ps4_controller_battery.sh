#!/bin/bash

## This is a simple script to easily and simply check the battery life of a PS4 controller on Ubunut. 
# cat /sys/class/power_supply/(device)/capacity

# This one works for mlab-Ubuntu
cat /sys/class/power_supply/sony_controller_battery_88\:03\:4c\:2b\:7f\:70/capacity