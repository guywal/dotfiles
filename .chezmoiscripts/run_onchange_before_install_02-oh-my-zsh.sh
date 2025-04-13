#!/bin/sh

# Oh My Zsh
if [ -d "${HOME}/.oh-my-zsh" ]; then
    echo "Oh My Zsh already installed at: ${HOME}/.oh-my-zsh"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended --keep-zshrc"
fi
