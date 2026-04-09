# Philosophy

## Keep it boring

The best developer setup is one you don't have to debug. Every exotic shell plugin, every custom function, every "cool trick" is a future debugging session waiting to happen.

This repo prefers:
- Standard tools over novel ones
- Explicit config over magic
- Tools that AI assistants (Claude, Codex) can actually help you debug

## Conservative shell customization

Most dotfiles repos are 80% shell customization. Oh-my-zsh with 20 plugins, custom prompts that take 500ms to render, exotic cd replacements, fzf keybindings that shadow builtin shortcuts.

We don't do that. Our .zshrc is ~60 lines. It sets up PATH, language managers, a few aliases, and Starship. That's it.

Why? Because when something breaks at 2am, you need to be able to read your shell config and understand it. And because when you ask Claude Code for help, it actually knows what `cd` does.

## Opinionated, not configurable

This is not a framework. You don't configure it. You fork it and make it yours.

Every tool choice is documented with "why." If you disagree, replace it. The structure makes that easy.

## Two-step capture

When you run `bin/capture`, it dumps your current state into `.capture/`. You then review it and manually merge what you want into the repo. This prevents "fossilizing personal garbage" from a lived-in machine into your clean spec.

## The repo IS the documentation

The directory structure explains itself. The Brewfile is the package manifest. The `macos/*.sh` scripts are the preference docs. The chezmoi templates are the dotfile docs. `docs/tools.md` explains the "why" behind every choice.
