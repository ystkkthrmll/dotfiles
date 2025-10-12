
# Load seperated config files
for config in "${HOME}/.config/zsh/config.d/"*.zsh; do
  source "${config}"
done

unset config
