#!/usr/bin/env bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

ADOPT=""
if [ "$1" = "--adopt" ]; then
  ADOPT="--adopt"
fi

# Ensure scripts are executable
chmod +x "$DOTFILES_DIR/install.sh"
chmod +x "$DOTFILES_DIR/stowme.sh"
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

echo "Writing local overrides..."

# Platform-specific sources
PLATFORM_PROFILE=""
PLATFORM_RC=""
case "$(uname -s)" in
Darwin)
  PLATFORM_PROFILE='source "$HOME/.zmacprofile"'
  PLATFORM_RC='source "$HOME/.zmacrc"'
  ;;
Linux)
  PLATFORM_PROFILE='# TODO: source "$HOME/.zlinuxprofile"'
  PLATFORM_RC='# TODO: source "$HOME/.zlinuxrc"'
  ;;
esac

# Write .zlocalprofileoverride (not tracked by git)
LOCALPROFILE="$DOTFILES_DIR/.zlocalprofileoverride"
cat >"$LOCALPROFILE" <<EOF
# Dotfiles PATH
export PATH="\$PATH:$DOTFILES_DIR/vendor/tmux-sessionizer"

# Platform-specific profile
$PLATFORM_PROFILE
EOF

# Write .zlocaloverride (not tracked by git)
LOCALRC="$DOTFILES_DIR/.zlocaloverride"
cat >"$LOCALRC" <<EOF
# Dotfiles aliases
alias stowme='$DOTFILES_DIR/stowme.sh'
alias nvimc='cd $DOTFILES_DIR/.config/nvim && nvim'
alias dotc='cd $DOTFILES_DIR && nvim'
alias ts='tmux-sessionizer'

# Platform-specific rc
$PLATFORM_RC
EOF

"$DOTFILES_DIR/stowme.sh" $ADOPT

echo "Done!"
