# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), a tool for managing dotfiles across multiple machines. The repository contains configuration files and installation scripts for setting up a development environment with Oh My Zsh, Homebrew, and various shell configurations.

## Key Commands

### Installation
- **Full setup on new machine**: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/guywal/dotfiles/refs/heads/main/install.sh)"`
- **Test installation in Docker**: `./test.sh` (mounts dotfiles in Ubuntu container)

### Chezmoi Operations
- **Initialize chezmoi**: `chezmoi init --apply`
- **Apply changes**: `chezmoi apply`
- **Check diff**: `chezmoi diff`
- **Update from source**: `chezmoi update`
- **Check status**: `chezmoi status` (shows what would change)
- **Edit source files**: `chezmoi edit <file>` (e.g., `chezmoi edit ~/.zshrc`)
- **Navigate to source**: `chezmoi cd` (opens shell in source directory)
- **Merge conflicts**: `chezmoi merge <file>`
- **Troubleshooting**: `chezmoi doctor` (diagnose common problems)

### Git Operations (within chezmoi source)
- **Navigate to source**: `chezmoi cd`
- **Check git status**: `git status`
- **Commit changes**: `git add . && git commit -m "message"`
- **Push changes**: `git push`
- **Exit source directory**: `exit`

## Repository Structure

The repository follows chezmoi naming conventions:
- `dot_zshrc` → `~/.zshrc` (main zsh configuration)
- `dot_zprofile` → `~/.zprofile` (sets up Homebrew environment)
- `install.sh` → Bootstrap script that installs Homebrew, chezmoi, and applies dotfiles
- `test.sh` → Docker-based testing script
- `.chezmoiignore` → Files/patterns to exclude from management
- `.chezmoidata` → Data variables for templates
- `run_*` scripts → Automation scripts (run once, on change, etc.)
- `.chezmoitemplates/` → Shared template files

## Architecture

This is a simple dotfiles setup with two main components:

1. **Installation Pipeline**: `install.sh` handles the complete setup process:
   - Installs Homebrew if not present
   - Installs chezmoi via Homebrew
   - Initializes and applies the dotfiles from the current directory

2. **Shell Configuration**: 
   - `dot_zprofile`: Sets up Homebrew environment paths
   - `dot_zshrc`: Configures Oh My Zsh with the robbyrussell theme and git plugin

The setup is designed to be idempotent - running `install.sh` multiple times is safe and will skip already installed components.

## Common Workflows

### Adding a new dotfile
1. `chezmoi add ~/.newfile` (adds file to chezmoi management)
2. `chezmoi edit ~/.newfile` (edit the source version)
3. `chezmoi apply` (apply changes to home directory)

### Making changes to existing dotfiles
1. `chezmoi edit ~/.zshrc` (edit source version)
2. `chezmoi diff` (review changes before applying)
3. `chezmoi apply` (apply changes)

### Syncing changes across machines
1. `chezmoi cd` (navigate to source directory)
2. `git add . && git commit -m "Update config"`
3. `git push`
4. On other machine: `chezmoi update` (pulls and applies changes)