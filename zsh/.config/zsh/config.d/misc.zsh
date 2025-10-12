# - Purpose: Misc

# #region ls color
# - Refs
#   - \href{https://unix.stackexchange.com/questions/621720/zsh-how-to-set-ls-color-to-show-any-tar-file-as-different-color-than-white}{zsh: How to set LS_COLOR to show any tar file as different color than white?}
#   - \href{https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4}{Adding colors to Bash scripts}
#     - color codes
LS_COLORS="${LS_COLORS}*.html=01;31:*.pdf=01;31:*.svg=01;31:*.xlsx=01;31:*.yaml=01;93:"
# #endregion ls color

# 環境変数 PATH に新たなディレクトリを追加
# export PATH="${PATH}:~/.local/bin"
export PATH="${PATH}:${HOME}/.local/bin"

# Avoid Python shap module error
# https://github.com/NVlabs/instant-ngp/discussions/300
export QT_QPA_PLATFORM=offscreen

dropbox start
setxkbmap -option caps:swapescape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

fcitx5 &
