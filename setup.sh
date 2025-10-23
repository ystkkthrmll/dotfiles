#!/usr/bin/bash
#
# - Purpose: for Linux
# - Usage: `$ bash setup.sh`
#
readonly COMPUTER_NAME=home

# Define target softwares
if [[ $(uname -n) == ${COMPUTER_NAME} ]]; then
  # For personal PC
  targets=(
    # autostart
    # bash
    git
    gnome-files
    # pandoc
    tex
    typst
    vim
    visual-studio-code
    zsh
  )
else
  # For work PC
  targets=(
    git
    typst
    vim
    zsh
  )
fi

# Run stow
for target in "${targets[@]}"; do
  echo "Target: ${target}"
  stow -v --target=$HOME ${target}
done
