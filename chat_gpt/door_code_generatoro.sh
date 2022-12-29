#!/bin/bash

# Generate a random 4-digit number with no repeating digits
num=$(echo $(shuf -i 1-5 -n 4) | sed 's/./& /g')

echo "Random 4-digit number with no repeating digits: $num"
