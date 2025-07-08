
[private]
default:
	just --list

# Default action
all: add_permissions install_apt install_brew

add_permissions:
	@echo "Adding permissions..."
	sudo chmod +x scripts/*.sh

# Update system
update:
	#!/bin/bash
	@echo "Updating system..."
	./scripts/updates.sh

# Install essential packages
install_apt:add_permissions
	#!/bin/bash
	@echo "Installing APT packages..."
	./scripts/apt-install-packages.sh

install_brew:add_permissions
	@echo "Installing APT packages..."
	./scripts/brew-install-packages.sh
	source ~/.zshrc

enable_ssh_server:add_permissions
	@echo "Enabling SSH server..."
	./scripts/enable-ssh-server.sh
	
# Configure dotfiles and custom setup
config:add_permissions
	@echo "Configuring dotfiles..."
	./scripts/configure-dotfiles.sh

# Clean up system
clean:add_permissions
	@echo "Cleaning up..."
	./scripts/clean_docker_images.sh

# test this using docker file
test:
	@echo "Testing..."
	docker build -t debian-init --network=host .
	docker run -it --rm debian-init

# Display help
help:
	@echo "Makefile commands:"
	@echo "  make update     Update and upgrade the system"
	@echo "  make install    Install essential packages"
	@echo "  make config     Configure dotfiles and custom settings"
	@echo "  make clean      Remove unused packages and cache"
	@echo "  make all        Run update, install, and config"
