#!/bin/bash

set -e

# Install Claude CLI if not already installed
if ! command -v claude >/dev/null 2>&1; then
    echo "🤖 Installing Claude CLI..."
    
    # Check if npm is available (from NVM installation)
    if command -v npm >/dev/null 2>&1; then
        npm install -g @anthropic-ai/claude-cli
    else
        echo "⚠️  npm not found, trying alternative installation method..."
        # Alternative: install via curl or other method
        curl -fsSL https://claude.ai/install | sh
    fi
else
    echo "✅ Claude CLI already installed"
fi