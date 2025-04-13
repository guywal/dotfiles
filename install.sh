#!/bin/sh

set -e #exit on error

# exist checks if a command exist in shell
exist() {
    command -v "$1" >/dev/null 2>&1
}

# install homebrew
# https://brew.sh/
if exist brew; then
    echo"Homebrew already exists, continuing..."
else
    (echo '🍺  Installing Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
fi

# install chezmoi
# https://www.chezmoi.io/
if ! exist chezmoi; then
    echo '👊  Installing chezmoi'
    brew install chezmoi
fi

chezmoi init https://github.com/guywal/dotfiles.git

echo "Run 'chezmoi diff' to see what changes would apply, then run 'chezmoi apply'"
