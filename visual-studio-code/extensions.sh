#!/usr/bin/bash

# - Purpose
#   - グローバルで使用する拡張機能をインストールするためのスクリプト．
# - Notes
#   - Gemini によると，グローバルな extensions.json ファイルは存在しないらしい．
#     そのため，コマンドで拡張機能をインストールする．

# D2
code --install-extension terrastruct.d2

# JavaScript, HTML, Markdown, etc.
code --install-extension esbenp.prettier-vscode

# LaTeX
# code --install-extension James-Yu.latex-workshop  # 一旦使用をやめる

# Markdown
code --install-extension shd101wyy.markdown-preview-enhanced

# PDF
code --install-extension tomoki1207.pdf

# Python
code --install-extension charliermarsh.ruff
code --install-extension ms-python.black-formatter
code --install-extension njqdev.vscode-python-typehint
code --install-extension samuelcolvin.jinjahtml

# Vim
code --install-extension vscodevim.vim

# Misc
code --install-extension ms-vscode-remote.remote-containers
code --install-extension eamodio.gitlens

