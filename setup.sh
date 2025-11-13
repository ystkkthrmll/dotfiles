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
    fcitx
    fish
    git
    gnome-files
    # pandoc
    tex
    typst
    vim
    visual-studio-code
    # zsh
  )
else
  # For work PC
  targets=(
    fish
    git
    typst
    vim
  )
fi

# Run stow
for target in ${targets[@]}; do
  echo "Target: ${target}"
  stow -v --target=$HOME ${target}
done
