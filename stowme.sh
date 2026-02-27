#!/usr/bin/env bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$DOTFILES_DIR")"
PKG_NAME="$(basename "$DOTFILES_DIR")"

ADOPT=""
if [ "$1" = "--adopt" ]; then
  ADOPT="--adopt"
fi

echo "Stowing dotfiles..."
stow -v --no-folding --dir="$PARENT_DIR" --target="$HOME" $ADOPT "$PKG_NAME"
