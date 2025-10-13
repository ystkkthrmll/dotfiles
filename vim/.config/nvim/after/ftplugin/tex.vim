
" \section{Fold関係}^^A [[[
" 補足
" texだと自動でfoldする機能があるっぽい．
" \verb|let g:tex_fold_enabled=1|，\verb|set fdm=syntax|で機能する（\verb|:h tex-folding|）．
" ただ，自動でfoldするのが気に入らないので手動ですることにする．
"
set foldmarker=[[[,]]]
set foldmethod=marker
" ^^A ]]] End of subsection `Fold関係'.
"
" \section{texだけのkey mapping}^^A [[[
"
" \RenewDocumentCommand \temporarycommand { m m m } {#1&#2&#3\\}
" \begin{mytabular}{lll}
"   key mapping & insert  & \\ \hline
"   \verb|\b|   & \verb|\mymathbold{| ... \verb|}|    & \myemph{b}old \\
"   \verb|\d|   & \verb|\doublequotes{| ... \verb|}|  & \myemph{d}oublequotes \\
"   \verb|\e|   & \verb|\emph{| ... \verb|}|  & \myemph{e}mph \\
"   \verb|\m|   & \verb|$| ... \verb|$|       & \myemph{m}ath \\
"   \verb|\v|   & \verb/\verb|/ ... \verb/|/  & \myemph{v}erb \\ \hline
" \end{mytabular}
"
" In Normal mode "\verb|\e|"で"\verb|\emph{foo}|"を挿入する（Put the cursor on the first character and press "\verb|\e|".）
" "\verb|\e|" は"emph"の"e"
" cf. \verb|usr_05.txt|, \myline{228}
"
nnoremap <silent>\d i\doublequotes{<Esc>ea}<Esc>

" 以下だと上手くいかない
" nnoremap <silent>e i\verb|<C-[>eai|<C-[>
nnoremap <silent>\e i\myemph{<Esc>ea}<Esc>

" nnoremap <silent>\v i\verb\|<Esc>ea\|<Esc>
nnoremap <silent><Leader>v i\verb\|<Esc>ea\|<Esc>

" nnoremap <silent>\p i\pythoninline{<Esc>ea}<Esc>

nnoremap <silent><Leader>b i\mymathbold{<Esc>ea}<Esc>

nnoremap <silent><Leader>m i$<Esc>ea$<Esc>

nnoremap <silent><Leader>l i\latexinline{<Esc>ea}<Esc>

autocmd FileType tex nnoremap <silent>\a :%s/’/'/gc<Esc>

autocmd FileType tex nnoremap <silent>\x :%s/➪/\\myarrow/gc<Esc>

" 以下は次を参照した：http://www.mazn.net/blog/2009/01/06/170.html
" autocmd FileType tex nnoremap <silent>\d :%s/“\(.*\)”/"\1"/gc<Esc>


" 以下は次を参照した：http://za.toypark.in/html/2010/02-22.html
" autocmd FileType tex nnoremap <silent>\x :%s/➪/\\myarrow/g | :%s/'/'/g
"
" \subsection{Syntax hightlighting}^^A [[[
" \begin{myitemize}
" \0 The origin of keys
" \1 \verb|d|: .dtx file (TeX)
" \1 \verb|g|: Graphviz
" \1 \verb|p|: Python
" \1 \verb|t|: TeX
"   \2 \viminline{syn match texComment "%.*$"}
"     \3 \href{run:/usr/share/nvim/runtime/syntax/tex.vim}{\texttt{tex.vim}} \myline{598}を参考にした．
" \end{myitemize}
"
nnoremap <silent><Leader>d :set syntax=tex<Esc>
nnoremap <silent><Leader>g :set syntax=dot<Esc>
nnoremap <silent><Leader>p :set syntax=python<Esc>
" nnoremap <silent><Leader>t :set syntax=tex<Esc>:syn match texComment "^%\+" contains=@texCommentGroup<Esc>
nnoremap <silent><Leader>t :set syntax=tex<Esc>:syn match texComment "%.*$" contains=@texCommentGroup<Esc>
" ^^A ]]] End of subsection `Syntax hightlighting'.
"
" ^^A ]]] End of section `texだけのkey mapping'.
"
" \subsection{補完関係}^^A [[[
" \urlref{http://daisuzu.hatenablog.com/entry/2015/12/05/002129}{completion}
"
set dictionary+=~/Dropbox/configuration-files/latex/output-files/classes/mydocument.cls
set dictionary+=~/Dropbox/configuration-files/latex/output-files/classes/mydtxfile.cls
set dictionary+=~/Dropbox/configuration-files/latex/output-files/classes/myslides.cls
set dictionary+=~/Dropbox/configuration-files/latex/output-files/classes/mywallpaper.cls

set dictionary+=~/Dropbox/configuration-files/latex/output-files/packages/myenglish.sty
set dictionary+=~/Dropbox/configuration-files/latex/output-files/packages/mygraphic.sty
set dictionary+=~/Dropbox/configuration-files/latex/output-files/packages/mymath.sty
set dictionary+=~/Dropbox/configuration-files/latex/output-files/packages/myprogramming.sty

set dictionary+=~/Dropbox/configuration-files/latex/output-files/etc/mydocstrip.tex

set dictionary+=~/Dropbox/configuration-files/latex/output-files/references/myreferences.bib
" ^^A ]]] End of subsection `補完関係'.
"
" \subsection{Auto indentation}^^A [[[
" \begin{myitemize}
" \1 \verb|g:tex_indent_items|などについて
" \urlref{https://www.reddit.com/r/neovim/comments/991kmv/annoying_auto_indentation_in_tex_files/}{Annoying auto indentation in tex files}
" \1 \viminline{filetype indent off}
"   \2 stop auto indent
"   \urlref{https://vim.fandom.com/wiki/How_to_stop_auto_indenting}{How to stop auto indenting}
" \1
" \end{myitemize}
"
filetype indent off
autocmd FileType tex set noautoindent

set noautoindent
set nocindent
set nosmartindent

let g:tex_indent_items=0
let g:tex_indent_and=0
let g:tex_indent_brace=0
" ^^A ]]] End of subsection `Auto indentation'.
"
" \subsection{区切り文字}^^A [[[
" \begin{myitemize}
" \0 次の文字は単語の区切り文字にしない
" \1 \verb|-| (hyphen)
"   \2 理由は\texinline{\ref}や\texinline{\label}の引数で単語の区切りに使い，
"   最後の文字まで補完させるため
" \1 \verb|'|
"   \2 \verb|Taylor's-theorem|や\verb|Cauchy's-mean-value-theorm|などを最後まで補完可能にするため
" \1 \verb|:|
"   \2 
" \1 codeの参照先
"   \2 \href{http://vimwiki.net/?%27iskeyword%27}{iskeyword}
" \end{myitemize}
"
set iskeyword+=-
set iskeyword+='
set iskeyword+=:
" ^^A ]]] End of subsection `****'.
"
" \subsection{etc}^^A [[[
"
" 定義元に移動するため
" cf. http://daisuzu.hatenablog.com/entry/2015/12/05/002129
set tags+=~/Dropbox/mylatex/classes/myclass
set tags+=~/Dropbox/mylatex/packages/mypackage

vnoremap <silent>\<Space> :'<,'>s/ /%20/gc


" "\p" はpart（「部分」コンパイル）の"p"
"vnoremap <silent><buffer>\p :QuickRun -mode v -type tmptex<CR>

"nnoremap <silent><buffer>\p :<C-u>
"\mx
"\?begin.*alignat<CR>V
"\/end.*alignat<CR>
"\:<C-u>quickrun -mode v -type tmptex<CR>
"\`x

" ^^A ]]] End of subsection `****'.
"
" \subsubsection{Indentation}^^A [[[
" \begin{myitemize}
" \1 \verb|if expand("%:t") =~ ".*\.tex"}|
" \urlref{http://blog.restartr.com/2014/04/20/vimrc-noexpandtab-in-golang/}{vimrc-noexpandtab-in-golang}
" \1
" \1 Number of spaces = 2の由来
"   \2 \doublequotes{As with code indenting (see later), nested environments and arguments
"   should be indented by (at least) two spaces to make the nature of the nesting clear.}
"   \texdoc[section=2 Documentation style]{l3styleguide}
"   \2 \verb|l3styleguide.tex|も2 spacesでindentしている
"   \urlref{http://mirror.ox.ac.uk/sites/ctan.org/macros/latex/contrib/l3kernel/l3styleguide.tex}{l3styleguide.tex}．
" \1
" \end{myitemize}
"
if expand("%:t") =~ ".*\.dtx"
    set expandtab
else
    set noexpandtab
endif

set shiftwidth=2
set tabstop=2
" ^^A ]]] End of section `Indentation'.
"
" \section{quickrun}^^A [[[
let g:quickrun_config = {}
let g:quickrun_config.tex = {
    \ 'runner': 'vimproc',
    \ 'command': 'latexmk',
    \ 'cmdopt': '-pv',
    \ 'outputter': 'error',
    \ 'outputter/error/error': 'quickfix',
    \ 'srcfile': expand("%"),
    \ 'exec': '%c %o %s'
\ }
" ^^A ]]] End of section `quickrun'.

set colorcolumn=80

