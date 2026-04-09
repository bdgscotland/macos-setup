#!/usr/bin/env bash
# =============================================================================
# macos/defaults.sh — General macOS preferences
# =============================================================================
# Idempotent. Safe to run multiple times.
# Some changes require logout to take effect.
# =============================================================================

echo "[defaults] Applying general macOS preferences..."

# ---------------------------------------------------------------------------
# Keyboard
# ---------------------------------------------------------------------------
# Fast key repeat rate (lower = faster, default is 6)
defaults write NSGlobalDomain KeyRepeat -int 2
# Short delay before key repeat starts (default is 25)
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
# Disable press-and-hold for keys (enables key repeat in VS Code, Electron apps)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Disable auto-period substitution (double-space to period)
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ---------------------------------------------------------------------------
# Trackpad
# ---------------------------------------------------------------------------
# Enable tap to click (all trackpad domains for built-in + external)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ---------------------------------------------------------------------------
# Screenshots
# ---------------------------------------------------------------------------
# Save screenshots to ~/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
# Save as JPG (smaller than PNG)
defaults write com.apple.screencapture type -string "jpg"
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# ---------------------------------------------------------------------------
# Miscellaneous
# ---------------------------------------------------------------------------
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Disable .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Disable .DS_Store on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Restart SystemUIServer for screenshot changes
killall SystemUIServer 2>/dev/null || true

echo "[defaults] General preferences applied. Some changes require logout."
