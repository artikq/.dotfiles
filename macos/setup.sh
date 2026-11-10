#!/usr/bin/env bash
echo "Applying macOS defaults..."

# General
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.universalaccess reduceMotion -bool true

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
defaults write com.apple.HIToolbox AppleFnUsageType -int 0
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -bool false

# Trackpad
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 1.5

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock tilesize -int 21
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock "mru-spaces" -bool false
defaults write com.apple.dock wvous-br-corner -int 1

# Desktop / Stage Manager
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
defaults write com.apple.WindowManager HideDesktop -bool true
defaults write com.apple.WindowManager StandardHideWidgets -bool true

# Finder
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Screenshots go to clipboard
defaults write com.apple.screencapture target -string clipboard

# Keyboard shortcuts: hotkey <id> <enabled> <p1> <p2> <modifiers>
hotkey() {
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$1" \
    "<dict><key>enabled</key><$2/><key>value</key><dict><key>parameters</key><array><integer>$3</integer><integer>$4</integer><integer>$5</integer></array><key>type</key><string>standard</string></dict></dict>"
}
# input source switching (ctrl+space) off
hotkey 60 false 32 49 262144
hotkey 61 false 32 49 786432
# move to space left/right (ctrl+arrows) off, yabai/skhd handle it
hotkey 79 false 65535 123 8650752
hotkey 81 false 65535 124 8650752
# switch to desktop 1-9 with option+1..9
hotkey 118 true 49 18 524288
hotkey 119 true 50 19 524288
hotkey 120 true 51 20 524288
hotkey 121 true 52 21 524288
hotkey 122 true 53 23 524288
hotkey 123 true 54 22 524288
hotkey 124 true 55 26 524288
hotkey 125 true 56 28 524288
hotkey 126 true 57 25 524288
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

killall Dock Finder SystemUIServer 2>/dev/null
