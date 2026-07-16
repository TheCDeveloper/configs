#!/usr/bin/env bash

./arch.sh

echo "Installng dev environment..."

sudo pacman -Syu clang cmake lldb rust cargo pyright

echo "Installing libraries..."

sudo pacman -S sdl3 glm vulkan-headers vulkan-validation-layer mesa-dev
