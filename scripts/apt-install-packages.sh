#!/bin/bash

# List of essential packages
PACKAGES=(
    build-essential
    git
    curl
    wget
    zsh
    nala
    flameshot
    neovim
)

echo "Installing essential packages..."
for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo apt install -y "$package"
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /usr/bin/zsh

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
