#!/usr/bin/bash
#
# - Purpose: Set wallpaper
# - Notes
#   - The origin of "set wallpaper"
#     - [Set wallpaper on Ubuntu 20.04 using command line](https://linuxconfig.org/set-wallpaper-on-ubuntu-20-04-using-command-line)
#   - wallpaperに設定するコマンドは以下を参照した：
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
# latexmk ~/Dropbox/config-files/latex/output-files/misc/wallpaper-${extension}.tex

# - `$ pdftoppm -png -r 500 input.pdf output`
#   - \href{https://askubuntu.com/questions/50170/how-to-convert-pdf-to-image}{How to convert PDF to Image?}
#   - \href{https://www.atmarkit.co.jp/ait/articles/1903/08/news039.html}{【 pdftoppm 】コマンド――PDFファイルを画像に変換する}
#   - \href{https://unix.stackexchange.com/questions/11835/pdf-to-jpg-without-quality-loss-gscan2pdf}{pdf to jpg without quality loss; gscan2pdf}
# - `$ convert -density 300 file.pdf file.png`
#   - デフォルトで使えなくなった？？？
# - ファイル形式
#   - jpgよりpngの方がきれいだった．たぶん解像度が高い？？？
#
# pdftoppm -png -r 700 wallpaper-${extension}.pdf wallpaper-${extension}
# mv wallpaper-${extension}-1.png wallpaper-${extension}.png
# rm wallpaper-${extension}.tex wallpaper-${extension}.pdf

