#!/usr/bin/env bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$DOTFILES_DIR")"
PKG_NAME="$(basename "$DOTFILES_DIR")"

ADOPT=""
if [ "$1" = "--adopt" ]; then
  ADOPT="--adopt"
fi

chmod +x "$DOTFILES_DIR/install.sh"

# Ensure stowme alias in .zlocaloverride (not tracked by git)
LOCALRC="$DOTFILES_DIR/.zlocaloverride"
ALIAS_LINE="alias stowme='$DOTFILES_DIR/install.sh'"
if grep -q "^alias stowme=" "$LOCALRC" 2>/dev/null; then
  sed -i '' "s|^alias stowme=.*|$ALIAS_LINE|" "$LOCALRC"
else
  echo "$ALIAS_LINE" >> "$LOCALRC"
fi

stow -v --no-folding --dir="$PARENT_DIR" --target="$HOME" $ADOPT "$PKG_NAME"
