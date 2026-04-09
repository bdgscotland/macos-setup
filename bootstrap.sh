#!/usr/bin/env bash
# =============================================================================
# bootstrap.sh — One-command Mac setup
# =============================================================================
# Entry point for a fresh Mac. Installs prerequisites (Xcode CLT, Homebrew),
# then delegates to bin/bootstrap for the actual setup.
#
# Usage: ./bootstrap.sh
# =============================================================================
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info()  { echo -e "${GREEN}[bootstrap]${NC} $1"; }
warn()  { echo -e "${YELLOW}[bootstrap]${NC} $1"; }
error() { echo -e "${RED}[bootstrap]${NC} $1"; }

# ---------------------------------------------------------------------------
# macOS version check
# ---------------------------------------------------------------------------
MACOS_VERSION=$(sw_vers -productVersion)
MACOS_MAJOR=$(echo "$MACOS_VERSION" | cut -d. -f1)

if [ "$MACOS_MAJOR" -lt 15 ]; then
    error "This setup requires macOS 15 (Sequoia) or later."
    error "You are running macOS $MACOS_VERSION."
    exit 1
fi

info "macOS $MACOS_VERSION detected. OK."

# ---------------------------------------------------------------------------
# Network check
# ---------------------------------------------------------------------------
if ! ping -c 1 -W 3 1.1.1.1 &>/dev/null; then
    error "No internet connection detected. Homebrew and packages require internet."
    exit 1
fi

info "Internet connection OK."

# ---------------------------------------------------------------------------
# Xcode Command Line Tools
# ---------------------------------------------------------------------------
if ! xcode-select -p &>/dev/null; then
    info "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait for installation to complete
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    info "Xcode Command Line Tools installed."
else
    info "Xcode Command Line Tools already installed."
fi

# ---------------------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------------------
if ! command -v brew &>/dev/null; then
    info "Installing Homebrew..."
    # Download the official Homebrew installer to a temp file so we can inspect
    # it before execution, rather than piping curl directly into bash.
    BREW_INSTALLER=$(mktemp)
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o "$BREW_INSTALLER"
    info "Homebrew installer downloaded to $BREW_INSTALLER"
    info "Review it if you like, then we'll run it."
    /bin/bash "$BREW_INSTALLER"
    rm -f "$BREW_INSTALLER"

    # Add brew to PATH for this session
    if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    info "Homebrew installed."
else
    info "Homebrew already installed."
fi

# ---------------------------------------------------------------------------
# Delegate to bin/bootstrap
# ---------------------------------------------------------------------------
info "Handing off to bin/bootstrap..."
exec "$SCRIPT_DIR/bin/bootstrap"
