#!/usr/bin/env bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$DOTFILES_DIR")"
PKG_NAME="$(basename "$DOTFILES_DIR")"

ADOPT=""
if [ "$1" = "--adopt" ]; then
  ADOPT="--adopt"
fi

# Ensure scripts are executable
chmod +x "$DOTFILES_DIR/install.sh"
chmod +x "$DOTFILES_DIR/macos/brew.sh"
chmod +x "$DOTFILES_DIR/macos/setup.sh"
chmod +x "$DOTFILES_DIR/macos/init.sh"

# OS-specific setup
case "$(uname -s)" in
  Darwin)
    echo "Detected macOS..."
    # Install Homebrew if not found
    if ! command -v brew &>/dev/null; then
      echo "Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    "$DOTFILES_DIR/macos/brew.sh"
    "$DOTFILES_DIR/macos/setup.sh"
    "$DOTFILES_DIR/macos/init.sh"
    ;;
  Linux)
    echo "Detected Linux..."
    # TODO: add linux setup
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    exit 1
    ;;
esac

# Common setup
echo "Updating submodules..."
git -C "$DOTFILES_DIR" submodule update --init --recursive

chmod +x "$DOTFILES_DIR/vendor/tmux-sessionizer/tmux-sessionizer"

echo "Writing local aliases..."
# Write aliases to .zlocaloverride (not tracked by git)
LOCALRC="$DOTFILES_DIR/.zlocaloverride"
cat > "$LOCALRC" <<EOF
alias stowme='$DOTFILES_DIR/install.sh'
alias nvimc='cd $DOTFILES_DIR/.config/nvim && nvim'
alias dotc='cd $DOTFILES_DIR && nvim'
export PATH="\$PATH:$DOTFILES_DIR/vendor/tmux-sessionizer"
alias ts='tmux-sessionizer'
EOF

echo "Stowing dotfiles..."
stow -v --no-folding --dir="$PARENT_DIR" --target="$HOME" $ADOPT "$PKG_NAME"

echo "Done!"
