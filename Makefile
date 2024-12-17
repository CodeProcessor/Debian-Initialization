.PHONY: all update install_apt install_brew config clean help add_permissions

# Default action
all: add_permissions update install_apt install_brew

add_permissions:
	@echo "Adding permissions..."
	chmod +x scripts/*.sh

# Update system
update:
	@echo "Updating system..."
	./scripts/update.sh

# Install essential packages
install_apt:
	@echo "Installing APT packages..."
	./scripts/apt-install-packages.sh

install_brew:
	@echo "Installing APT packages..."
	./scripts/brew-install-packages.sh

# Configure dotfiles and custom setup
config:
	@echo "Configuring dotfiles..."
	./scripts/configure-dotfiles.sh

# Clean up system
clean:
	@echo "Cleaning up..."
	./scripts/clean.sh

# Display help
help:
	@echo "Makefile commands:"
	@echo "  make update     Update and upgrade the system"
	@echo "  make install    Install essential packages"
	@echo "  make config     Configure dotfiles and custom settings"
	@echo "  make clean      Remove unused packages and cache"
	@echo "  make all        Run update, install, and config"
