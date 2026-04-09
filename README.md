# Best Mac Setup

One command to bootstrap a fully configured Mac for development. Opinionated, documented, reproducible.

## Quickstart

```bash
git clone https://github.com/bdgscotland/macos-setup.git
cd macos-setup
./bootstrap.sh
```

This installs Xcode CLI Tools, Homebrew, all packages, applies dotfiles, configures macOS preferences, and sets up language runtimes. Takes ~20-30 minutes on a fresh Mac.

## What's included

**Terminal:** Ghostty with Catppuccin Mocha theme and JetBrains Mono font

**Editor:** Zed with VSCode keybindings and One Dark theme

**Shell:** zsh + Starship prompt. No oh-my-zsh, no exotic plugins.

**Languages:** Python (pyenv), Ruby (rbenv), Node (nvm), Rust (rustup), Go, Bun

**CLI tools:** gh, ripgrep, btop, tmux, shellcheck, and more

**macOS:** Dock autohide, fast key repeat, Finder shows hidden files, screenshots to ~/Screenshots as JPG

**Git:** GPG commit signing, curated aliases (`git lg`, `git st`, `git co`)

See [docs/tools.md](docs/tools.md) for every tool choice with "why."

## Commands

| Command | What it does |
|---------|-------------|
| `./bootstrap.sh` | Full setup from scratch (Xcode CLT, Homebrew, everything) |
| `bin/bootstrap` | Re-apply setup (skips Xcode/Homebrew install) |
| `bin/capture` | Export current Mac state for review |
| `bin/audit` | Check for drift between your Mac and the repo spec |
| `bin/lint` | Run shellcheck on all scripts |

## How it works

```
bootstrap.sh          Entry point (installs Xcode CLT + Homebrew)
  └── bin/bootstrap   Core setup (brew bundle, chezmoi, defaults, languages)

Brewfile              Homebrew packages and casks
home/                 Dotfiles managed by chezmoi
  ├── dot_zshrc.tmpl       Shell config (templated for machine-specific values)
  ├── dot_gitconfig.tmpl   Git config (templated for name/email/signing key)
  └── dot_config/
      ├── ghostty/config   Ghostty terminal config
      ├── zed/settings.json  Zed editor config
      └── starship.toml    Starship prompt config

macos/                macOS preference scripts
  ├── defaults.sh     Keyboard, trackpad, screenshots, misc
  ├── finder.sh       Finder preferences
  └── dock.sh         Dock layout and behavior

bin/capture           Export current state (two-step: dump then curate)
bin/audit             Drift detection (what changed since last bootstrap?)
machines/             Per-machine profiles (hostname, versions, package counts)
```

## Multi-machine

Dotfiles use chezmoi templates for machine-specific values (git email, GPG key). On first run, chezmoi prompts for these values. Different machines can have different identities while sharing the same tool configuration.

Run `bin/audit` on any machine to see how it differs from the repo spec.

## Philosophy

- **Conservative shell config.** No oh-my-zsh, no zoxide, no exotic plugins. AI assistants can debug this.
- **Opinionated, not configurable.** Fork it and make it yours.
- **Two-step capture.** `bin/capture` dumps raw state. You curate before committing.
- **The repo IS the documentation.** Every choice has a "why."

Read more: [docs/philosophy.md](docs/philosophy.md)

## Forking

1. Fork this repo
2. Edit `Brewfile` with your packages
3. Edit `home/` with your dotfiles
4. Edit `macos/*.sh` with your preferences
5. Edit `home/.chezmoi.toml.tmpl` with your default values
6. Run `./bootstrap.sh` on your Mac

## Requirements

- macOS 15 (Sequoia) or later
- Internet connection
- ~30 minutes for initial setup
