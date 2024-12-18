#!/bin/bash

# Script to install Homebrew and essential packages using Homebrew on Ubuntu

# Function to install Homebrew
install_brew() {
    echo "Installing Homebrew..."

    # Check if Homebrew is already installed
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew is already installed. Skipping installation."
    else
        # Install Homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH (for Linux systems)
        if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
            echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        fi
    fi

    echo "Homebrew installation complete."
}

# Function to install packages using Homebrew
install_packages() {
    echo "Installing packages using Homebrew..."

    # List of packages to install
    PACKAGES=(
        htop
        btop
        neovim
        tmux
        tree
        fzf
        atuin
        kubectl
        helm
    )

    # Install each package
    for package in "${PACKAGES[@]}"; do
        echo "Installing $package..."
        brew install "$package"
    done

    echo "All packages installed successfully."

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
    echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
}

# Main script execution
install_brew
install_packages
