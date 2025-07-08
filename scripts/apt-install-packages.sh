#!/bin/bash

# List of essential packages (excluding nala as it will be installed first)
PACKAGES=(
    build-essential
    git
    curl
    wget
    zsh
    flameshot
    neovim
)

echo "Updating package list..."
DEBIAN_FRONTEND=noninteractive sudo apt update 

echo "Installing nala first..."
DEBIAN_FRONTEND=noninteractive sudo apt install -y nala

echo "Optimizing download locations with nala fetch..."
DEBIAN_FRONTEND=noninteractive sudo nala fetch --auto

echo "Installing essential packages using nala..."
DEBIAN_FRONTEND=noninteractive sudo nala install -y "${PACKAGES[@]}"


export RUNZSH=yes
export CHSH=yes
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change Oh My Zsh theme to candy
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="candy"/' ~/.zshrc


# Add greeting based on time of day to .zshrc
echo 'hours=$(date +%H)' >> ~/.zshrc
echo 'if [[ $hours -lt 12 ]]' >> ~/.zshrc
echo 'then' >> ~/.zshrc
echo '  st="Morning"' >> ~/.zshrc
echo 'elif [[ $hours -gt 11 ]] && [[ $hours -lt 17 ]]' >> ~/.zshrc
echo 'then' >> ~/.zshrc
echo '  st="Afternoon"' >> ~/.zshrc
echo 'else' >> ~/.zshrc
echo '  st="Evening"' >> ~/.zshrc
echo 'fi' >> ~/.zshrc

echo 'echo "Good $st, $USER!"' >> ~/.zshrc

echo "Essential packages installed successfully."
