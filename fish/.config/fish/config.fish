if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_powerline_fonts no  # 文字化け解消のため

# Ref: https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
zoxide init fish | source

zoxide add ~/Dropbox/dotfiles

zoxide add ~/my-docs/computer
zoxide add ~/my-docs/computer/data-science
zoxide add ~/my-docs/computer/programming-languages
zoxide add ~/my-docs/computer/programming-languages/python
zoxide add ~/my-docs/computer/programming-languages/shell
zoxide add ~/my-docs/computer/software
zoxide add ~/my-docs/computer/software/typesetting-sofrware/typst

zoxide add ~/my-docs/math
zoxide add ~/my-docs/math/algebra
zoxide add ~/my-docs/math/algebra/linear-algebra
zoxide add ~/my-docs/math/analysis
zoxide add ~/my-docs/math/analysis/real-analysis
zoxide add ~/my-docs/math/foundations
zoxide add ~/my-docs/math/foundations/set-theory
zoxide add ~/my-docs/math/foundations/topological-space
zoxide add ~/my-docs/math/misc/notation

function z
    if test (count $argv) -eq 0
        # 引数なしでzを呼んだときは通常の挙動（候補一覧など）
        __zoxide_z
    else
        __zoxide_z $argv
        # and ls
    end
    ls
end
