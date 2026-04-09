# Tool Choices

Every tool in this setup was chosen deliberately. Here's what we use and why.

## Terminal & Shell

| Tool | Replaces | Why |
|------|----------|-----|
| **Ghostty** | iTerm2, Terminal.app | GPU-accelerated, native macOS (AppKit/Metal), zero config by default. Built by Mitchell Hashimoto (HashiCorp founder). Fastest terminal on macOS. |
| **zsh** | bash | macOS default since Catalina. No oh-my-zsh, no plugins. Clean and debuggable. |
| **Starship** | p10k, oh-my-zsh themes | Cross-shell prompt. Shows git status + language versions. Written in Rust, fast. |
| **tmux** | screen | Terminal multiplexer. Split panes, detach sessions. |

## Editor

| Tool | Replaces | Why |
|------|----------|-----|
| **Zed** | VS Code, Vim | Native, fast, multiplayer editing. VSCode keybindings available. One Dark theme. |

## Developer CLI

| Tool | Replaces | Why |
|------|----------|-----|
| **gh** | hub, browser | GitHub CLI. PRs, issues, actions from the terminal. |
| **ripgrep** | grep, ag | Fast recursive search. Written in Rust. |
| **btop** | top, Activity Monitor | Beautiful resource monitor. |
| **shellcheck** | — | Shell script linter. Catches real bugs. |

## Languages & Runtimes

| Tool | Why |
|------|-----|
| **pyenv** | Python version manager. Don't use system Python. |
| **rbenv** | Ruby version manager. Clean, simple. |
| **nvm** | Node version manager. Project-specific Node versions. |
| **bun** | Fast JS runtime + package manager. |
| **rustup/cargo** | Rust toolchain manager. |
| **Go** | System install via Homebrew. |

## Version Control & Security

| Tool | Why |
|------|-----|
| **gnupg** | GPG commit signing. Proves commits are really from you. |
| **Git aliases** | Conservative set: `st`, `co`, `br`, `lg`, `unstage`. Widely used, non-controversial. |

## macOS Preferences

| Setting | Value | Why |
|---------|-------|-----|
| Dock autohide | on | More screen space |
| Dock size | 48px | Comfortable without being huge |
| Key repeat | 2 (fast) | Faster editing |
| Show hidden files | on | Developer necessity |
| Show file extensions | on | Never be surprised by file types |
| Screenshot format | JPG | Smaller files than PNG |
| Screenshot location | ~/Screenshots | Keep Desktop clean |
| Tap to click | on | Speed |

## What We Don't Use (and why)

| Tool | Why Not |
|------|---------|
| oh-my-zsh | Plugin hell. Slow shell startup. Hard to debug. AI assistants can't help. |
| zoxide | cd replacement. Claude/Codex don't have training data on it. Causes confusion. |
| fzf keybindings | Exotic shell integration. Breaks in unexpected ways. |
| Nix | Steep learning curve. Overkill for personal setup. |
| Ansible | Enterprise tool for personal problem. YAML tax not worth it. |
