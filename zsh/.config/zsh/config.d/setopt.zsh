# - Purpose: setopt

# #region auto_cd
# - Notes
#   - If a command is issued that can't be executed as a normal command,
#     and the command is the name of a directory, perform the \texttt{cd} command to that directory.
#     This option is only applicable if the option \texttt{SHIN\_STDIN} is set,
#     i.e. if commands are being read from standard input.
#     The option is designed for interactive use;
#     it is recommended that \texttt{cd} be used explicitly in scripts to avoid ambiguity
#     \urlref{http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories}{16.2.1 Changing Directories}.
setopt auto_cd
# #endregion auto_cd

# #region correct
# - Notes
#   - コマンドのスペルミスを修正
#     - (http://qiita.com/uasi/items/c4288dd835a65eb9d709)
setopt correct
# #endregion correct

# #region chpwd()
# - Notes
#   - cdの後にlsを自動で実行
#     - (http://qiita.com/uasi/items/c4288dd835a65eb9d709)
chpwd() {ls --color=auto}
# #endregion chpwd()

# #region completion
# - Notes
#   - \href{https://unix.stackexchange.com/questions/783435/zsh-completion-ignore-executable-files-with-no-dot-in-the-name}{zsh completion - ignore executable files with no dot in the name}
v() {
  nvim $1
}
# zstyle ':completion:*:*:vi:*' file-patterns '*.(py|tex)'
zstyle ':completion:*:*:vi:*' ignored-patterns '*.(html|pdf|svg)'
zstyle ':completion:*:*:vim:*' ignored-patterns '*.(html|pdf|svg)'
zstyle ':completion:*:*:v:*' ignored-patterns '*.(html|pdf|svg)'
zstyle ':completion:*:*:myfunc:*' ignored-patterns '*.(html|pdf|svg)'

# - 補完の候補から除外するファイルの拡張子を指定
#   - (https://teratail.com/questions/25280)
# zstyle ':completion:*:*files' ignored-patterns '*.pdf'
# zstyle ':completion:*:*files' ignored-patterns '*.bib' '*.cls' '*.ins' '*.pdf' '*.sty' '*.xlsx'

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1
# #endregion completion

# cdした先のディレクトリをディレクトリスタックに追加する．
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと．
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる．
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups
