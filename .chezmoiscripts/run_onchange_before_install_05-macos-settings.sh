#!/bin/bash

set -e

echo "🔧 Configuring macOS settings based on current preferences..."

# Close System Preferences to prevent overriding settings
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null || true
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true

# Dock settings (based on current configuration)
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "expose-group-apps" -bool "true"
defaults write com.apple.dock "wvous-br-corner" -int "14"  # Bottom-right hot corner

# Finder settings (based on current configuration)
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"
defaults write com.apple.finder "ShowSidebar" -bool "true"
defaults write com.apple.finder "SidebarWidth" -int "143"
defaults write com.apple.finder "FXICloudDriveEnabled" -bool "true"

# Keyboard settings (based on current configuration)
defaults write NSGlobalDomain "InitialKeyRepeat" -int "15"
defaults write NSGlobalDomain "KeyRepeat" -int "2"

# Menu bar clock settings (based on current configuration)
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false"
defaults write com.apple.menuextra.clock "IsAnalog" -bool "false"
defaults write com.apple.menuextra.clock "ShowAMPM" -bool "true"
defaults write com.apple.menuextra.clock "ShowDate" -bool "false"
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -bool "true"
defaults write com.apple.menuextra.clock "ShowSeconds" -bool "false"

# Trackpad settings (based on current configuration)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "false"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadTwoFingerDoubleTapGesture" -int "1"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerVertSwipeGesture" -int "2"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerVertSwipeGesture" -int "2"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerHorizSwipeGesture" -int "2"

# Screenshot settings (based on current configuration)
defaults write com.apple.screencapture "target" -string "clipboard"

# Energy/Power settings (based on current configuration)
sudo pmset -a displaysleep 10
sudo pmset -a sleep 10
sudo pmset -a disksleep 10

echo "✅ macOS settings configured. Restarting affected applications..."

# Restart affected applications
for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null || true
done

echo "✅ macOS settings setup complete!"