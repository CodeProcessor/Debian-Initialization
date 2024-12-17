#!/bin/bash

echo "Updating package list and upgrading system..."
sudo apt update && sudo apt upgrade -y

# echo "Removing unnecessary packages..."
# sudo apt autoremove -y

echo "System update complete."
