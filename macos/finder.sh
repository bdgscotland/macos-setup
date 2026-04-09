#!/usr/bin/env bash
# =============================================================================
# macos/finder.sh — Finder preferences
# =============================================================================

echo "[finder] Applying Finder preferences..."

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show path bar at bottom of Finder
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar at bottom of Finder
defaults write com.apple.finder ShowStatusBar -bool true
# Default to list view in Finder (icnv=icon, clmv=column, glyv=gallery, Nlsv=list)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Search the current folder by default (not entire Mac)
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Show the ~/Library folder
chflags nohidden ~/Library 2>/dev/null || true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# New Finder windows open to Home folder (PfHm=Home, PfDe=Desktop, PfDo=Documents)
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Restart Finder
killall Finder 2>/dev/null || true

echo "[finder] Finder preferences applied."
