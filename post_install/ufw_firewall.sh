#!/bin/bash

# Install and setup UFW
  apt install ufw -y
  echo "What ports would you like opened[1-10000"
  read -r ports
  ufw allow "$ports"
  ufw --force enable
  ufw status
.installation_options.sh