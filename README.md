# Installation
To setup a new machine run:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/guywal/dotfiles/refs/heads/main/install.sh)"
```

# Testing Changes
After making changes to dotfiles, test them using chezmoi's built-in commands:

1. **Check what would change**: `chezmoi status` - Shows summary of pending changes
2. **Review detailed differences**: `chezmoi diff` - Shows exact changes before applying
3. **Apply changes**: `chezmoi apply` - Applies changes to home directory  
4. **Verify everything applied correctly**: `chezmoi verify` - Confirms managed files match expected state
5. **Troubleshoot issues**: `chezmoi doctor` - Diagnoses common problems

For shell configuration changes, open a new terminal tab to test the full initialization process.
