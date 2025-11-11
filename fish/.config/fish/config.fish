if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias la="eza -la"
alias vi="nvim"

set -g theme_powerline_fonts no  # 文字化け解消のため

# Ref: https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
zoxide init fish | source

# #region dotfiles
zoxide add ~/Dropbox/dotfiles
zoxide add ~/Dropbox/dotfiles/fish/.config/fish
zoxide add ~/Dropbox/dotfiles/typst/.local/share/typst/packages/local
zoxide add ~/Dropbox/dotfiles/visual-studio-code/.config/Code/User
# #endregion dotfiles

# #region projects
zoxide add ~/projects
zoxide add ~/projects/0000-00-00-data-science-tool
# #endregion projects

set -g COMPUTER_NAME home

if test (uname -n) = $COMPUTER_NAME

# #region computer
zoxide add ~/my-docs/computer
zoxide add ~/my-docs/computer/data-science
zoxide add ~/my-docs/computer/programming-languages
zoxide add ~/my-docs/computer/programming-languages/python
zoxide add ~/my-docs/computer/programming-languages/rust
zoxide add ~/my-docs/computer/programming-languages/shell
zoxide add ~/my-docs/computer/software
zoxide add ~/my-docs/computer/software/typesetting-sofrware/typst
# #endregion computer

# #region english
zoxide add ~/my-docs/english
zoxide add ~/my-docs/english/expressions
zoxide add ~/my-docs/english/grammar
zoxide add ~/my-docs/english/vocabulary
# #endregion english

# #region math
zoxide add ~/my-docs/math
zoxide add ~/my-docs/math/algebra
zoxide add ~/my-docs/math/algebra/linear-algebra
zoxide add ~/my-docs/math/analysis
zoxide add ~/my-docs/math/analysis/real-analysis
zoxide add ~/my-docs/math/foundations
zoxide add ~/my-docs/math/foundations/set-theory
zoxide add ~/my-docs/math/foundations/topological-space
zoxide add ~/my-docs/math/misc/notation
# #endregion math

# #region misc
zoxide add ~/my-docs/misc
zoxide add ~/my-docs/misc/data
zoxide add ~/my-docs/misc/rules
zoxide add ~/my-docs/misc/shopping
# #endregion misc

fcitx5 &

end

function z
    if test (count $argv) -eq 0
        # 引数なしでzを呼んだときは通常の挙動（候補一覧など）
        __zoxide_z
    else
        __zoxide_z $argv
        # and ls
    end
    pwd
    ls
end

function notes
    vi ~/Dropbox/notes.md
end

function to-do-list
    vi ~/Dropbox/notes/data/to-do-list-home.yaml
end

