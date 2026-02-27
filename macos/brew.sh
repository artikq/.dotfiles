#!/usr/bin/env bash
# Brew packages — regenerate with: brew leaves && brew list --cask

set -e

echo "Adding brew taps..."
# Taps
brew tap felixkratz/formulae
brew tap koekeishiya/formulae
brew tap sst/tap

echo "Installing formulae..."
# Formulae
brew install bat
brew install direnv
brew install docker
brew install docker-compose
brew install fd
brew install fzf
brew install gh
brew install go
brew install jq
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
brew install lazydocker
brew install lazygit
brew install libpq
brew install luarocks
brew install mactop
brew install neovim
brew install nvm
brew install openjdk
brew install pipx
brew install podman
brew install redis
brew install rust
brew install sst/tap/opencode
brew install stow
brew install tmux
brew install tree-sitter
brew install tree-sitter-cli
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
brew install --cask font-fira-code-nerd-font
brew install --cask ghostty
brew install --cask medis
brew install --cask podman-desktop
