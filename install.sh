#!/usr/bin/env bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$DOTFILES_DIR")"
PKG_NAME="$(basename "$DOTFILES_DIR")"

ADOPT=""
if [ "$1" = "--adopt" ]; then
  ADOPT="--adopt"
fi

chmod +x "$DOTFILES_DIR/install.sh"

stow -v --no-folding --dir="$PARENT_DIR" --target="$HOME" $ADOPT "$PKG_NAME"

# Ensure stowme alias points to this script in .zshrc
ALIAS_LINE="alias stowme='$DOTFILES_DIR/install.sh'"
ZSHRC="$DOTFILES_DIR/.zshrc"
if grep -q "^alias stowme=" "$ZSHRC" 2>/dev/null; then
  sed -i '' "s|^alias stowme=.*|$ALIAS_LINE|" "$ZSHRC"
else
  sed -i '' "/^# Source platform-specific config/i\\
$ALIAS_LINE\\
" "$ZSHRC"
fi
