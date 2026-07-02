#!/usr/bin/env bash

echo "Installing required packages..."

# Alacritty optional as I use system terminal.
sudo pacman -Syu --needed nvim neovide


echo "Applying configuration..."
exec "$PWD/apply.sh"
