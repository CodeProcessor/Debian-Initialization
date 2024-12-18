#!/bin/bash

# Script to enable and configure SSH on Ubuntu

# Function to install OpenSSH Server
install_ssh_server() {
    echo "Installing OpenSSH Server..."
    sudo apt update
    sudo apt install -y openssh-server
}

# Function to enable and start SSH service
enable_ssh_service() {
    echo "Enabling and starting SSH service..."
    sudo systemctl enable ssh
    sudo systemctl start ssh
}

# Function to configure SSH 
configure_ssh() {
    echo "Configuring SSH..."

    # Backup existing SSH configuration
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

    # Allow root login and password authentication (optional, not recommended for production)
    sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

    # Restart SSH to apply changes
    echo "Restarting SSH service to apply configurations..."
    sudo systemctl restart ssh
}

# Function to configure the firewall
configure_firewall() {
    echo "Configuring the firewall..."

    # Enable UFW (Uncomplicated Firewall)
    sudo ufw --force enable
    sudo ufw allow OpenSSH
    sudo ufw reload

    echo "Firewall configured. SSH port (22) is now open."
}

# Function to display SSH status and IP
display_status() {
    echo "Checking SSH service status..."
    sudo systemctl status ssh

    echo "Your SSH service is running!"
    echo "Access your system using: ssh username@$(hostname -I | awk '{print $1}')"
}

# Main script execution
echo "Starting SSH setup..."
install_ssh_server
enable_ssh_service
configure_ssh
configure_firewall
display_status

echo "SSH setup complete!"
