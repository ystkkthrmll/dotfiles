#!/usr/bin/bash
#
# - Purpose: for Linux
#
readonly COMPUTER_NAME=home

if [[ $(uname -n) == ${COMPUTER_NAME} ]]; then
  targets=(
    git
    gnome-files
    typst
    vim
    visual-studio-code
    zsh
  )
else
  targets=(
    git
    typst
    vim
    zsh
  )
fi

for target in "${targets[@]}"; do
  echo "Target: ${target}"
  stow -v --target=$HOME ${target}
done
