#!/bin/bash

# List of essential packages
PACKAGES=(
    build-essential
    git
    curl
    wget
    zsh
)

echo "Installing essential packages..."
for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo apt install -y "$package"
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo "Essential packages installed successfully."
