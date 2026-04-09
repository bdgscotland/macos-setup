#!/usr/bin/env bash
# =============================================================================
# macos/dock.sh — Dock preferences and layout
# =============================================================================
# Uses dockutil for managing Dock items (brew install dockutil).
# Falls back to defaults write if dockutil is not available.
# =============================================================================

echo "[dock] Configuring Dock..."

# ---------------------------------------------------------------------------
# Dock behavior
# ---------------------------------------------------------------------------
# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true
# Set Dock icon size (pixels)
defaults write com.apple.dock tilesize -int 48
# Minimize windows using scale effect (faster than genie)
defaults write com.apple.dock mineffect -string "scale"
# Don't show recent applications
defaults write com.apple.dock show-recents -bool false
# Speed up auto-hide animation
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4

# ---------------------------------------------------------------------------
# Dock items (requires dockutil)
# ---------------------------------------------------------------------------
if command -v dockutil &>/dev/null; then
    echo "[dock] Setting up Dock items with dockutil..."

    # Remove all current items
    dockutil --remove all --no-restart 2>/dev/null

    # Add apps we actually use (order matters)
    DOCK_APPS=(
        "/Applications/Ghostty.app"
        "/Applications/Zed.app"
        "/Applications/Google Chrome.app"
        "/Applications/Claude.app"
        "/Applications/Spotify.app"
        "/System/Applications/System Settings.app"
    )

    for app in "${DOCK_APPS[@]}"; do
        if [ -d "$app" ]; then
            dockutil --add "$app" --no-restart 2>/dev/null
        fi
    done
else
    echo "[dock] dockutil not found. Install with: brew install dockutil"
    echo "[dock] Skipping Dock item configuration."
fi

# Restart Dock
killall Dock 2>/dev/null || true

echo "[dock] Dock configured."
