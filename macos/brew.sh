#!/usr/bin/env bash
# Brew packages — regenerate with: brew leaves && brew list --cask

set -e

echo "Adding brew taps..."
# Taps
brew tap dart-lang/dart
brew tap asmvik/formulae

# Homebrew 7+ refuses non-official taps until trusted
brew trust --tap dart-lang/dart asmvik/formulae

echo "Installing formulae..."
# Formulae
brew install bat
brew install dart-lang/dart/dart
brew install direnv
brew install docker
brew install docker-compose
brew install eza
brew install fd
brew install fzf
brew install gh
brew install git-delta
brew install git
brew install git-lfs
brew install glab
brew install go
brew install jq
brew install asmvik/formulae/skhd
brew install asmvik/formulae/yabai
brew install lazydocker
brew install lazygit
brew install libpq
brew install luarocks
brew install mactop
brew install neovim
brew install nvm
brew install openjdk@21
brew install openfortivpn
brew install pipx
brew install podman
brew install redis
brew install rust
brew install ripgrep
brew install stow
brew install tmux
brew install tree-sitter
brew install tree-sitter-cli
brew install uv
brew install websocat
brew install wget
brew install wireguard-tools
brew install yq
brew install zoxide
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-vi-mode

echo "Installing casks..."
# Casks
brew install --cask betterdisplay
brew install --cask dbeaver-community
brew install --cask flutter
brew install --cask font-fira-code-nerd-font
brew install --cask font-lilex-nerd-font
brew install --cask ghostty
brew install --cask google-chrome
brew install --cask medis
brew install --cask podman-desktop
brew install --cask slack
brew install --cask spotify
brew install --cask telegram
