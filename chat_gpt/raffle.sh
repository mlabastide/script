#!/bin/bash

# Prompt for number of tickets
read -p "Enter number of tickets: " num_tickets

# Prompt for number of winners
read -p "Enter number of winners: " num_winners

# Generate a list of ticket numbers
tickets=($(seq 1 $num_tickets))

# Shuffle the ticket numbers
tickets=($(shuf -e "${tickets[@]}"))

# Select the winning ticket numbers
winners=("${tickets[@]:0:$num_winners}")

# Print the winning ticket numbers
echo "The winning ticket numbers are: ${winners[@]}"
