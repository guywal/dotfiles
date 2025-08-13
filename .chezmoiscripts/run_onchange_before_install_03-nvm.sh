#!/bin/bash

set -e

# Install NVM if not already installed
if [ ! -d "$HOME/.nvm" ]; then
    echo "📦 Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
    
    # Source nvm to use it immediately
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # Install latest LTS Node.js
    nvm install --lts
    nvm use --lts
else
    echo "✅ NVM already installed"
fi