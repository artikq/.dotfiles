#!/usr/bin/env bash
echo "Applying macOS init defaults..."
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles true
