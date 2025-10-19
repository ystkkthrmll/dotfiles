#!/usr/bin/bash
#
# - Purpose: Set wallpaper
# - Usage: `$ bash set_wallpaper.sh`
# - Notes
#   - The origin of "set wallpaper"
#     - [Set wallpaper on Ubuntu 20.04 using command line](https://linuxconfig.org/set-wallpaper-on-ubuntu-20-04-using-command-line)
#   - wallpaper に設定するコマンドは以下を参照した：
#     - [参照先](https://danilodellaquila.com/en/blog/how-to-automatically-change-your-desktop-background-wallpaper)
#
readonly COMPUTER_NAME=home
readonly file_path=~/Dropbox/dotfiles/typst/wallpaper.typ

if [[ $(uname -n) == ${COMPUTER_NAME} ]]; then
  extension=home
else
  extension=office
fi

typst compile --ppi 500 ${file_path} "${file_path%.*}.png"

# pdftoppm -png -r 700 wallpaper-${extension}.pdf wallpaper-${extension}
