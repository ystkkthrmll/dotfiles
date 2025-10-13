" - Purpose: YAML
" - Notes
"   - The origin of `yaml.vim`
"     - `~/.config/nvim/after/ftplugin/yml.vim` だと認識されなかっため

set expandtab
set shiftwidth=2
set tabstop=2

function! FoldMethod(lnum)
    let l:indent = max([indent(a:lnum+1), indent(a:lnum)])
    return l:indent / &shiftwidth
endfunction

set foldmethod=expr
set foldexpr=FoldMethod(v:lnum)

set iskeyword+=-

set dictionary+=~/Dropbox/dotfiles/typst/.local/share/typst/packages/local/bib/0.0.0/bib.yaml

