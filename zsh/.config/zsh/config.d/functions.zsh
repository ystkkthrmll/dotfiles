# - Purpose: Define functions
# - Notes
#   - \href{http://zsh.sourceforge.net/Guide/zshguide03.html#l49}{関数の書き方}
#   - \href{https://qiita.com/walrein/items/b6dd650381f978b4dbc8}{参照先}
#   - \href{https://shellscript.sunone.me/function.html#%E9%96%A2%E6%95%B0%E3%81%AE%E5%BC%95%E6%95%B0}{関数の引数}

# #region man
# - \bashinline{man}で表示されるtextのカラー化
#   - [manの読み方（初心者向け）](https://qiita.com/aosho235/items/0f2b73d08eb645c05208#man%E3%81%AE%E3%82%AB%E3%83%A9%E3%83%BC%E5%8C%96)
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
# #endregion man

# #region mkdir
# - Refs
#   - \bashinline*{mkdir}フォルダ作成後，そのディレクトリに\verb|cd|する
#   - \href{https://superuser.com/questions/152794/is-there-a-shortcut-to-mkdir-foo-and-immediately-cd-into-it}{ここ}
# mkdir() {
#   mkdir $1 ; cd $_
#   mkdir $1 && cd $_
#   # mkdir $1 &&
#   # cd $_
# }
# #endregion mkdir

# #region pandoc + cp
# - Refs
#   - \bashinline{pandoc}した後に\bashinline{cp ***.pdf ~/Dropbox/my-documents/***.pdf}するコマンド
pc() {
  # Set params
  filename_pandoc_config="pandoc.yaml"

  # Get necessary info
  pwd=$(pwd)
  basename=$(basename ${pwd})
  # echo ${basename}
  dir_path_parent=$(dirname ${pwd})
  # echo ${dir_path_parent}
  tmp=${dir_path_parent/yasutaka/Dropbox}
  dest=${tmp/home/${HOME:1}}
  # echo ${dest}

  # Convert markdown to html, pdf, ...
  echo "Converting ..."
  pandoc --defaults ${filename_pandoc_config}

  # Get output file extension
  if [ -f ${basename}.html ]; then
    ext="html"
  elif [ -f ${basename}.pdf ]; then
    ext="pdf"
  else
    echo "Neither ${basename}.html nor ${basename}.pdf is found."
    return
  fi

  # Copy to Dropbox
  echo "Copying to Dropbox ..."
  cp ${basename}.${ext} ${dest}

  # View
  open ${basename}.${ext}

  echo "Done"
}
# #endregion pandoc + cp

# #region lc
# - Notes
#   - \bashinline{latexmk}した後に\bashinline{cp ***.pdf ~/Dropbox/my-documents-pdf/***.pdf}するコマンド
#   - \verb|lc|の由来は\bashinline{latexmk}と\bashinline{cp}の頭文字を合わせた
#   - As of mid-2019, Dropbox no longer follows items outside of your Dropbox account
#     that are linked to by a symlink
#     \urlref{https://help.dropbox.com/installs-integrations/sync-uploads/symlinks}{How to use symlinks with Dropbox}.
lc() {
  latexmk $1
  cp *.pdf ~my-documents-pdf/$2
}
# #endregion lc

# #region notes
notes() {
  # cd ~/Dropbox/
  # evince notes.pdf &
  vi ~/Dropbox/notes.md
}
# #endregion notes

# #region docstrip
docstrip() {
    # -h, --helpしたら呼ぶ
    help() {
        echo 'Usage: docstrip [option] filename output_filename1 output_filename2 ...'
        echo "filename doesn't include extension"
        return
    }

    for arg in $*
    do
        case $arg in
            -h|--help)
                help
                return
                ;;
            *)
        esac
    done
    python3 ~/Dropbox/config-files/latex/output-files/etc/docstrip.py $1 $2
    return 1;
}
# #endregion docstrip

# #region config-latex
# \url{https://qiita.com/petitviolet/items/b1e8b5139169dd530919}
config-latex() {
    # -h, --helpしたら呼ぶ
    help() {
        echo 'Usage: config-latex [option] filename'
        return
    }

    for arg in $*
    do
        case $arg in
            -h|--help)
                help
                return
                ;;
            -pv|--preview)
                evince ~config-latex/$*[$#].pdf &
                ;;
            *)
        esac
    done
    cd ~config-latex
    vi ~config-latex/$*[$#].dtx
    return 1;
}

# https://blog.freedom-man.com/zsh-completions
_config-latex() {
    _values '' 'classes' 'misc' 'notes' 'packages'
}

compdef _config-latex config-latex
# #endregion config-latex






config-misc() {
    # -h, --helpしたら呼ぶ
    help() {
        echo 'Usage: config-misc [option] filename'
        return
    }

    for arg in $*
    do
        case $arg in
            -h|--help)
                help
                return
                ;;
            -pv|--preview)
                evince ~configuration-etc/$*[$#].pdf &
                ;;
            *)
        esac
    done
    cd ~config-misc
    vi ~config-misc/$*[$#].dtx
    return 1;
}

# https://blog.freedom-man.com/zsh-completions
_config-misc() {
    _values '' 'miscellaneous' 'python' 'shell' 'visual-studio-code'
}

compdef _config-misc config-misc

config-vim() {
    # -h, --helpしたら呼ぶ
    help() {
        echo 'Usage: config-vim [option] filename'
        return
    }

    for arg in $*
    do
        case $arg in
            -h|--help)
                help
                return
                ;;
            -pv|--preview)
                evince ~config-vim/$*[$#].pdf &
                ;;
            *)
        esac
    done
    cd ~config-vim
    vi ~config-vim/$*[$#].dtx
    return 1;
}

# https://blog.freedom-man.com/zsh-completions
_config-vim() {
    _values '' 'configuration-files' 'ftplugin' 'snippets' 'syntax'
}

compdef _config-vim config-vim

bgm() {
  # -h, --helpしたら呼ぶ
  help() {
    echo 'Usage: bgm [-h/--help] [-a/--all] [-e/--edit]'
    return
  }

  local bgm_py=~/Dropbox/configuration-files/miscellaneous/output-files/python/bgm.py

  readonly COMPUTER_NAME=home
  if [[ $(uname -n) == ${COMPUTER_NAME} ]]; then
    bgm_data=~/my-documents/misc/misc/bgm.yaml
  else
    # bgm_data=
  fi

  for arg in $*; do
    case $arg in
      -h|--help)
        help
        return
        ;;
      -a|--all)
        python3 ${bgm_py} -a
        return
        ;;
      -e|--edit)
        vi ${bgm_data}
        return
        ;;
      *)
        python3 ${bgm_py}
        return
        ;;
    esac
  done

  python3 ${bgm_py}
  return 1;
}

_show() {
    _values '' 'bgm'
}

compdef _show show










# 補完する拡張子を制限する
_my_text_files() {
  _files -g '*.(txt|md|c|cpp|h|py|sh|rb|js|ts|java|html|css|xml|json|yaml|yml|zsh|pl|go|rs|tex)(-.)'
}

# compdef _my_text_files vim
compdef _my_text_files vi

