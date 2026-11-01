#!/usr/bin/env bash
# Omarchy for macOS - Turnkey Automated Homebrew Installer

set -e

echo -e "\031[1;36m================================================================"
echo -e "          ⚡ OMARCHY FOR MACOS INSTALLER v1.0.0 ⚡"
echo -e "   Authentic Glass Acrylic Tiling Desktop Suite for macOS"
echo -e "================================================================\033[0m"

# 1. Ensure Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is required. Please install Homebrew from https://brew.sh first."
    exit 1
fi

# 2. Install Window Manager & Bar Tooling
echo "📦 Installing AeroSpace, skhd, Sketchybar, and Jankyborders via Homebrew..."
brew tap nikitabobko/tap || true
brew tap FelixKratz/formulae || true
brew tap koekeishiya/formulae || true

brew install --cask aerospace || true
brew install skhd sketchybar borders || true

# 3. Deploy Configurations
mkdir -p ~/.config/aerospace ~/.config/skhd ~/.config/sketchybar ~/.config/borders ~/.config/omarchy/scripts

cp config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
cp config/skhd/skhdrc ~/.config/skhd/skhdrc
cp config/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
cp config/borders/bordersrc ~/.config/borders/bordersrc
cp scripts/theme-switcher.sh ~/.config/omarchy/scripts/theme-switcher.sh
chmod +x ~/.config/omarchy/scripts/theme-switcher.sh ~/.config/sketchybar/sketchybarrc ~/.config/borders/bordersrc

# 4. Start Background Daemons
brew services start skhd || true
brew services start sketchybar || true
brew services start borders || true

echo -e "\033[1;32m✔ Omarchy for macOS successfully installed!"
echo -e "Press Alt+Enter to launch Terminal, Alt+H/J/K/L to navigate tiled windows."
echo -e "Run ~/.config/omarchy/scripts/theme-switcher.sh catppuccin-mocha to switch themes.\033[0m"
