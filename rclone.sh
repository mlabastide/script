#!/bin/bash

# This is a simple script to easily transfer files with rclone. 

# rclone needs to be configured before this will work
 # rclone config
# rclone copy source:sourcepath dest:destpath

read -p "Please enter the ip address of client: " client
read -p "Please enter the username of client: " user
read -p "Please enter the source path: " source
read -p "Please enter the destination path: " destination
rclone copy $USER:$source $user@$client:$destination
