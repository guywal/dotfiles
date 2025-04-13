#!/bin/sh

set -e #exit on error

# exist checks if a command exist in shell
exist() {
    command -v "$1" >/dev/null 2>&1
}

# install homebrew
# https://brew.sh/
if exist brew; then
    echo "Homebrew already exists, continuing..."
else
    (echo '🍺  Installing Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# install chezmoi
# https://www.chezmoi.io/
if ! exist chezmoi; then
    echo '👊  Installing chezmoi'
    brew install chezmoi
else
    chezmoi=chezmoi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply "--source=$script_dir"
