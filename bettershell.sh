#!/bin/bash

# Check if the user has root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please execute it with sudo."
  exit 1
fi

# Function to check and add the zsh-autosuggestions repository for Ubuntu 18.04
add_zsh_autosuggestions_repository() {
  if [[ "$(lsb_release -rs)" == "18.04" ]]; then
    echo "Adding the zsh-autosuggestions repository for Ubuntu 18.04..."
    echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
    curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null
    apt-get update
  fi
}

# Function to install packages
install_packages() {
  echo "Installing required packages..."
  apt-get update
  apt-get install -y zsh
}

# Function to create aliases
create_aliases() {
  echo "Creating aliases..."
  echo "alias ll='ls -alF'" >> /etc/skel/.zshrc
  echo "alias ll='ls -alF'" >> /root/.zshrc
}

# Function to set Zsh shell as default for all users
set_zsh_for_users() {
  echo "Setting Zsh shell as default for all users..."
  for user in /home/*; do
    chsh -s /usr/bin/zsh "$user"
    cp /etc/skel/.zshrc "$user/"
  done
}

# Function to enable Zsh autosuggestions and syntax highlighting
enable_zsh_plugins() {
  echo "Enabling Zsh autosuggestions and syntax highlighting..."
  echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> /etc/skel/.zshrc
  echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> /root/.zshrc
  echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /etc/skel/.zshrc
  echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /root/.zshrc
}

# Main function to execute the steps
main() {
  add_zsh_autosuggestions_repository
  install_packages
  create_aliases
  set_zsh_for_users
  enable_zsh_plugins
}

# Execute the main script
main
