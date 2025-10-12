# - Purpose: Config prompt
# - Notes
#   - \href{https://original-game.com/terminal-zsh2/}{.zshrc で zsh をカスタマイズしてみよう。（プラグイン無し）}
#   - \href{https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0#%E4%BD%BF%E3%81%84%E3%81%9D%E3%81%86%E3%81%AA%E3%83%91%E3%83%A9%E3%83%A1%E3%82%BF}{とりあえずZshを使えば良いんだろう？}
#   - \href{http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html}{zshの出力}

# #region Delimiter???
# - Refs
#   - \urlref{https://stackoverflow.com/questions/32443522/triangular-background-for-bash-ps1-prompt}{三角形を出力する方法}
#   - \verb|$ sudo apt install fonts-powerline|
TEMP=$'\ue0b0'
# #endregion Delimiter

# #region Define colors
first_color=green
second_color=blue
third_color=yellow
fourth_color=cyan
# #endregion Define colors

# #region Define `get_git_branch_name()`
# - Refs
#   - \href{https://medium.com/pareture/simplest-zsh-prompt-configs-for-git-branch-name-3d01602a6f33}{Simplest ZSH Prompt Configs for Git Branch Name}
function get_git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ ${branch} == "" ]];
  then
    :
  else
    echo '('${branch}')'
  fi
}
# #endregion Define `get_git_branch_name()`

# #region Define PROMPT
# - Refs
#   - `%D`: The date in yy-mm-dd format
#     - \urlref{http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html}{13.2.4 Date and time}
#   - `%W`: The date in mm/dd/yy format
#     - \urlref{http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html}{13.2.4 Date and time}
#   - `%*`: Current time of day in 24-hour format, with seconds
#     - \urlref{http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html}{13.2.4 Date and time}
setopt prompt_subst
PROMPT=%K{$first_color}%F{black}' '%D' '\
%k%f%K{$second_color}%F{$first_color}$TEMP' '\
%k%f%K{$second_color}%F{black}%*' '\
%k%f%K{$third_color}%F{$second_color}$TEMP' '\
%k%f%K{$third_color}%F{black}%~' '\
%k%f%K{$fourth_color}%F{$third_color}$TEMP' '\
%k%f%K{$fourth_color}%F{black}'$(get_git_branch_name) '\
%k%f%K{black}%F{$fourth_color}$TEMP' '%k%f
# #endregion Define PROMPT

