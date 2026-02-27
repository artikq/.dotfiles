#!/usr/bin/env bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$DOTFILES_DIR")"
PKG_NAME="$(basename "$DOTFILES_DIR")"

ADOPT=""
if [ "$1" = "--adopt" ]; then
  ADOPT="--adopt"
fi

git -C "$DOTFILES_DIR" submodule update --init --recursive

chmod +x "$DOTFILES_DIR/install.sh"
chmod +x "$DOTFILES_DIR/vendor/tmux-sessionizer/tmux-sessionizer"

# Write aliases to .zlocaloverride (not tracked by git)
LOCALRC="$DOTFILES_DIR/.zlocaloverride"
cat > "$LOCALRC" <<EOF
alias stowme='$DOTFILES_DIR/install.sh'
alias nvimc='cd $DOTFILES_DIR/.config/nvim && nvim'
alias dotc='cd $DOTFILES_DIR && nvim'
export PATH="\$PATH:$DOTFILES_DIR/vendor/tmux-sessionizer"
alias ts='tmux-sessionizer'
EOF

stow -v --no-folding --dir="$PARENT_DIR" --target="$HOME" $ADOPT "$PKG_NAME"
