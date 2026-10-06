#!/usr/bin/env bash
# Omarchy macOS Live Theme Switcher Script

THEME="${1:-tokyo-night}"

case "$THEME" in
  "tokyo-night")
    BORDER_COLOR="0xff7aa2f7"
    ACCENT_COLOR="0xffbb9af7"
    ;;
  "catppuccin-mocha")
    BORDER_COLOR="0xffcba6f7"
    ACCENT_COLOR="0xff89b4fa"
    ;;
  "nord")
    BORDER_COLOR="0xff88c0d0"
    ACCENT_COLOR="0xff81a1c1"
    ;;
  "cyberpunk")
    BORDER_COLOR="0xffff0055"
    ACCENT_COLOR="0xff00ffcc"
    ;;
  "gruvbox-dark")
    BORDER_COLOR="0xfffe8019"
    ACCENT_COLOR="0xfffabd2f"
    ;;
  *)
    echo "Usage: $0 {tokyo-night|catppuccin-mocha|nord|cyberpunk|gruvbox-dark}"
    exit 1
    ;;
esac

echo "⚡ Applying Omarchy macOS Theme: $THEME"

# Update Jankyborders
if command -v borders &> /dev/null; then
  borders active_color="$BORDER_COLOR"
fi

# Reload Sketchybar
if command -v sketchybar &> /dev/null; then
  sketchybar --set "/space.*/" icon.color="$BORDER_COLOR"
fi

echo "✔ Theme $THEME applied!"
