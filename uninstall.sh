#!/usr/bin/env bash
# Omarchy for macOS - Clean Uninstaller Script

echo "⚡ Stopping background services and removing Omarchy macOS configs..."

brew services stop skhd || true
brew services stop sketchybar || true
brew services stop borders || true

rm -rf ~/.config/aerospace/aerospace.toml
rm -rf ~/.config/skhd/skhdrc
rm -rf ~/.config/sketchybar/sketchybarrc
rm -rf ~/.config/borders/bordersrc
rm -rf ~/.config/omarchy

echo "✔ Omarchy for macOS configs cleanly uninstalled."
