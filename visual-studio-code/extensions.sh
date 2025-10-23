#!/usr/bin/bash

# - Purpose: グローバルで使用する拡張機能をインストールするためのスクリプト
# - Notes
#   - Gemini によると，グローバルな `extensions.json` ファイルは存在しないらしい．
#     そのため，コマンドで拡張機能をインストールする．

extensions=(
  # D2
  terrastruct.d2

  # JavaScript, HTML, Markdown, etc.
  esbenp.prettier-vscode

  # LaTeX
  # James-Yu.latex-workshop  # 一旦使用をやめる

  # Markdown
  shd101wyy.markdown-preview-enhanced

  # PDF
  tomoki1207.pdf

  # Python
  charliermarsh.ruff
  ms-python.black-formatter
  njqdev.vscode-python-typehint
  samuelcolvin.jinjahtml

  # TOML
  tamasfe.even-better-toml

  # Vim
  vscodevim.vim

  # Misc
  ms-vscode-remote.remote-containers
  eamodio.gitlens
)

for extension in "${extensions[@]}"; do
  code --install-extension ${extension}
done
