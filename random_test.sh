#!/bin/bash
read -r PARTICIPANTS
echo "The winning number is:" $(($(( $RANDOM % $PARTICIPANTS )) +1 ))
#echo $(( $RANDOM % $PARTICIPANTS ))
./random_test.sh