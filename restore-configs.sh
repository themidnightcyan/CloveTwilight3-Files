#!/bin/bash
# Restoration script for Arch

# Install required packages first:
# sudo pacman -S fish neofetch git

# Restore Fish
cp -r ./fish/fish/ ~/.config/
cp -r ./fish/omf-themes/ ~/.local/share/omf/

# Restore Neofetch  
cp -r ./neofetch/ ~/.config/

# Restore Git configs
cp ./git-configs/.gitconfig ~/

# Restore shell configs
cp ./shell-configs/.bashrc ~/
cp ./shell-configs/.profile ~/

# Set Fish as default shell
chsh -s /usr/bin/fish

echo "Configs restored! Restart terminal to use Fish."
