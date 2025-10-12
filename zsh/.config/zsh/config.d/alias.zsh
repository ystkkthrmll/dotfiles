# - Purpose: Define aliases
#

# #region cd
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# #endregion cd

# #region ls/la
# - Notes
#   - `$ ls [-a]` の結果を色付け
alias ls='ls --color'
alias la='ls -a --color'
# #endregion ls/la

# #region nvim
# vim, vi で nvim を起動
alias vim='nvim'
alias vi='nvim'
# #endregion nvim

# #region python
alias py='python3'
alias python='python3'

# #endregion python

# #region tree
# - Notes
#   - \href{https://www.cyberciti.biz/faq/how-to-show-recursive-directory-listing-on-linux-or-unix/}{How to show recursive directory listing on Linux or Unix}
#     - `$ tree` で表示できる．ただし，標準でinstallされていない
#   - \href{https://stackoverflow.com/questions/3455625/linux-command-to-print-directory-structure-in-the-form-of-a-tree}{Linux command to print directory structure in the form of a tree}
alias tree="ls -aR | grep ':$' | perl -pe 's/:$//;s/[^-][^\/]*\//    /g;s/^    (\S)/└── \1/;s/(^    |    (?= ))/│   /g;s/    (\S)/└── \1/'"
alias treefile='find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"'

# #endregion tree

# \subsubsection{Suffix Alias}^^A [[[
# ^^ASyntax\mycite[url=https://blog.lftechnology.com/command-line-productivity-with-zsh-aliases-28b7cebfdff9]{Command Line Productivity with ZSH Aliases}
#
# \href{https://blog.lftechnology.com/command-line-productivity-with-zsh-aliases-28b7cebfdff9}{Syntax}
#
# \verb|alias -s [file-extension]=[name-of-app]|
#
# \href{https://news.mynavi.jp/article/zsh-16/}{参照先}
# \begin{bashcode}
# alias -s dtx=vim
# alias -s pdf=evince
# alias -s py=vim
# alias -s tex=vim
# \end{bashcode}
# ^^A ]]] End of subsubsection `Suffix Alias'.