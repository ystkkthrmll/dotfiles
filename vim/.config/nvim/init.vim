" - Purpose: Config nvim
" - Notes
"   - The origin of \verb|~/.config/nvim/init.vim|
"     - The Nvim config file is named "init.vim", located at:
"       Unix \verb|~/.config/nvim/init.vim| \vimhelp{config}
"     - This file is always used and is recommended:
"       \verb|~/.config/nvim/init.vim| (Unix and OSX) \vimhelp{vimrc-intro}

" #region set nocompatible
" - コードは\vimhelp{dein-examples}より
" - \verb|set nocompatible|とは\verb|'compatible'|オプションを無効にするため設定です。
"   では\verb|'compatible'|オプションとは何なのかというと『VimをなるべくVi互換にする』ためのオプションになります。
"   つまり\verb|'compatible'|オプションが有効な場合は、『VimがVi互換となっている』為、
"   『Vimの便利な機能』が使えません。
"   なのでVimをVimらしく使うためには\verb|'compatible'|オプションを無効にするために
"   \verb|set nocompatible|をする必要があります
"   \urlref{http://secret-garden.hatenablog.com/entry/2017/12/02/000156}{【一人 vimrc Advent Calendar 2017】set nocompatibleとは【2日目】}。

" if &compatible
"   set nocompatible
" endif
" #endregion set nocompatible

" \section{plugin}^^A [[[
"
" \begin{concealableitemize}^^A [[[
" \1 The origin of `plugin'
"   \2 \vimhelp{plugin}
" \end{concealableitemize}^^A ]]]
"
call plug#begin('~/.vim/plugged')
"
" \subsection{File explorer}^^A [[[
" \begin{myitemize}
" \1 \viminline{let g:NERDTreeQuitOnOpen = 1}
"   \2 This setting governs whether the NERDTree window or the bookmarks table
"   closes after opening a file with the \verb|NERDTree-o|, \verb|NERDTree-i|,
"   \verb|NERDTree-t| and \verb|NERDTree-T| mappings \vimhelp{NERDTreeQuitOnOpen}.
" \1 \viminline{nnoremap <silent>f :NERDTreeToggle<CR>}
"   \2  \vimhelp{NERDTreeToggle}
"   \2 本来のfは？
" \end{myitemize}
"
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
let g:NERDTreeQuitOnOpen = 1
nnoremap <silent>f :NERDTreeToggle<CR>

" let g:NERDTreeBookmarksFile=expand("$HOME/.vim-NERDTreeBookmarks")
let g:NERDTreeBookmarksFile=expand("$HOME/.config/nvim/NERDTreeBookmarks")
" ^^A ]]] End of subsection `File explorer'.
"
" \subsection{mhinz/vim-signify}^^A [[[
Plug 'mhinz/vim-signify'
" ^^A ]]] End of subsection `***'.
"
" \subsection{preservim/nerdcommenter}^^A [[[
" \begin{myitemize}
" \1 \href{https://github.com/preservim/nerdcommenter#nerd-commenter-}{Comment functions so powerful--no comment necessary.}
" \1 \viminline{let g:NERDSpaceDelims = 1}
"   \2 If you want spaces to be added then set \viminline{NERDSpaceDelims} to 1 in your vimrc
"   \vimhelp{NERDSpaceDelims}.
" \1 \viminline{map <silent>c <Plug>NERDCommenterToggle}
"   \2 Toggles commenting of the lines selected \vimhelp{NERDCommenterToggle}
"   \2 \verb|nnoremap|だと上手くいかない
"   \2 本来のcはdeleteだと思う．調べよ
" \end{myitemize}
"
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
" nnoremap <silent>c <Plug>NERDCommenterToggle
" nnoremap <silent>c <Leader>c<Space>
" map <silent><C-/> <Plug>NERDCommenterToggle
" nnoremap <silent><C-/> <Plug>NERDCommenterToggle
map <silent>c <Plug>NERDCommenterToggle
" ^^A ]]] End of subsection `preservim/nerdcommenter'.
"
" \subsection{Shougo/deoplete.nvim}^^A [[[
" \begin{myitemize}
" \1 Dark powered asynchronous completion framework for Neovim/Vim8 \vimhelp{deoplete.txt}.
" \1 \viminline{let g:deoplete#enable_at_startup = 1}
"   \2 Deoplete gets started automatically when Neovim/Vim starts if this value is 1
"   \vimhelp{g:deoplete#enable_at_startup}.
" \1 \viminline{call deoplete#custom#option('min_pattern_length', 1)}
"   \2 The default number of the input completion at the time of key input automatically
"   \vimhelp{min_pattern_length}.
" \end{myitemize}
"
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('min_pattern_length', 1)
inoremap <expr> <CR> (pumvisible() ? deoplete#close_popup() : "\<CR>")
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
" ^^A ]]] End of subsection `Shougo/deoplete.nvim'.
"
" \subsection{Shougo/vimproc.vim}^^A [[[
" \begin{myitemize}
" \1 非同期処理．quickrunには必須のプラグイン．
" \1 初めて使うときは，\verb|.../Shougo/vimproc.vim|上で\verb|make|をする必要あり
" \vimhelp{vimproc-install}
" \1 \verb|call dein#add('Shougo/vimproc.vim', {'build': 'make'})|は\verb|vimproc.txt|より．
" \1 \verb|build='make'|はテキトーにつけた（どっかネットの情報よりつけた気がする．必要かはわからない）
" \end{myitemize}
"
Plug 'Shougo/vimproc.vim'
" ^^A ]]] End of subsection `Shougo/vimproc.vim'.
"
" \subsection{thinca/vim-quickrun}^^A [[[
" \begin{myitemize}
" \1 Run a command and show its result quickly.
" \1 \href{http://qiita.com/ssh0/items/4aea2d3849667717b36d}{ここ}や
" \href{http://auewe.hatenablog.com/entry/2013/12/25/033416}{ここ}を参考にした
" \1 \verb|/hook/sweep/files|は削除する一時ファイルのリスト（cf. \verb/quickrun.jax/）．
" \1 \verb/.tmp/はshowexplのLTXexample環境で利用される．
" \1 \verb/\r/で実行
" \1 \verb|'runner': 'vimproc'|をつけることにより，非同期処理できる（cf. \url{http://qiita.com/uplus_e10/items/2a75fbe3d80063eb9c18}）．
" \1 \verb|'runner': 'vimproc'|をつけると，なぜか\verb|hook/sweep/files|が機能しない．
" \1 \verb|'cmdopt': '-pvc'|にすると，ファイルが保存されているたびに自動コンパイルしてくれる．
" しかし，編集できなくなることがあるのでやめる．
" \1 基本構造
"   \2 \vimhelp{quickrun-examples}
" \end{myitemize}
"
Plug 'thinca/vim-quickrun'
nnoremap \r :QuickRun<CR>
"
" \subsubsection{部分コンパイル}^^A [[[
" 一応，載せておく．
"    \begin{macrocode}
" 	let g:quickrun_config.tmptex = {
" 		\ 'exec': [
" 		\			'mv %s %a/tmptex.latex',
" 		\			'latexmk -pv -output-directory=%a %a/tmptex.latex',
" 		\			],
" 		\ 'args': expand("%:p:h:gs?\\\\?/?"),
" 		\ 'outputter': 'error',
" 		"\ 'outputter/error/error': 'buffer',
" 		\ 'outputter/error/error': 'quickfix',
" 		\ 'hook/eval/enable': 1,
" 		\ 'hook/eval/cd': "%s:r",
" 		\
" 		\ 'hook/eval/template':	 '\documentclass{ltjsarticle}'
" 		\						.'\usepackage[colorlinks=true,pdfencoding=auto]{hyperref}'
" 		\						.'\usepackage{mymath}'
" 		\						.'\begin{document}'
" 		\						.'%s'
" 		\						.'\end{document}',
" 		\
" 		\ 'hook/sweep/files': [
" 		\						'%a/tmptex.latex',
" 		\						'%a/tmptex.aux',
" 		\						'%a/tmptex.bbl',
" 		\						'%a/tmptex.blg',
" 		\						'%a/tmptex.fdb_latexmk',
" 		\						'%a/tmptex.fls',
" 		\						'%a/tmptex.idx',
" 		\						'%a/tmptex.ilg',
" 		\						'%a/tmptex.ind',
" 		\						'%a/tmptex.log',
" 		\						'%a/tmptex.out',
" 		\						'%a/tmptex.toc',
" 		\						'%a/tmptex.tmp',
" 		\						],
" 		\}
"    \end{macrocode}
" ^^A ]]] End of subsubsection `部分コンパイル'.
"
" ^^A ]]] End of subsection `vim-quickrun'.
"
" \subsection{Townk/vim-autoclose}^^A [[[
Plug 'Townk/vim-autoclose'
" ^^A ]]] End of subsection `Townk/vim-autoclose'.
"
" \subsection{Snippets}^^A [[[
" g:UltiSnipsSnippetDirectories
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = [$HOME.'/Dropbox/config-files/vim/output-files/snippets']

" ^^A ]]] End of subsection `Snippets'.
"
" \subsection{neoclide/coc.nvim}^^A [[[
" \begin{myitemize}
" \1 \href{https://github.com/neoclide/coc.nvim#example-vim-configuration}{Example Vim configuration}
" \end{myitemize}
"
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" ^^A ]]] End of subsection `neoclide/coc.nvim'.
"
" Plug 'ycm-core/YouCompleteMe'
Plug 'tomasr/molokai'
call plug#end()
"
" \subsection{molokai}^^A [[[
" \begin{myitemize}
" \1 注意：molokaiを最後にしないと表示がおかしくなる
" \1 色はmolokai.vimで用いられている色を使うこと
" \1 \viminline{hi Directory}
"   \2 NERDTreeで表示されるディレクトリ名のフォントを変更
"   \2 Ref: molokai.vim \myline{163, 154}
" \1 \viminline{hi MatchParen}
"   \2 Normal modeで対応する括弧の配色を逆にした
"   \2 Ref: molokai.vim \myline{180}
" \1 \viminline{hi NonText}
"   \2 テキスト外の色を変更
"   \2 Ref: molokai.vim \myline{231, 269}
" \1 \viminline{hi Visual}
"   \2 Visual modeで選択領域の色を変更
"   \2 Ref: molokai.vim \myline{223}
" \end{myitemize}
"
syntax on
colorscheme molokai
hi Directory  ctermfg=118             cterm=italic
hi MatchParen ctermfg=208 ctermbg=233 cterm=bold
hi NonText    ctermfg=255 ctermbg=16
hi Visual     ctermfg=16  ctermbg=102 cterm=italic,bold
" ^^A ]]] End of subsection `molokai'.
"
" ^^A ]]] End of section `plugin'.
"
" \section{Settings}^^A [[[
" \doublequotes{Settings}の由来は．
"
" \subsection{Fold関係}^^A [[[
"
" \subsubsection{fold自動open}^^A [[[
" ファイルを開けたとき，カーソルのある行のfoldを自動で開ける
" \href{https://zenbro.github.io/2015/07/19/simulate-a-keypress-in-vim-insert-mode.html}{参照先}
"
" if has("autocmd")
    " au BufReadPost * call feedkeys('zozozo')
    " au BufReadPost * foldopen
    " au BufReadPost * foldopen
" endif
" ^^A ]]] End of subsubsection `fold自動open'.
"
" ^^A ]]] End of subsection `Fold関係'.
"
" \subsubsection{scrolloff}^^A [[[
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=9999
" ^^A ]]] End of subsubsection `scrolloff'.
"
" \subsection{Conceal関係}^^A [[[
"
" \subsubsection{concealcursor}^^A [[[
set concealcursor=""
" ^^A ]]] End of subsubsection `concealcursor'.
"
" \subsubsection{conceallevel}^^A [[[
set conceallevel=2
" ^^A ]]] End of subsubsection `conceallevel'.
"
" \subsubsection{listchars}^^A [[[
" \verb|:h listchars|
"
" \href{https://qiita.com/pollenjp/items/459a08a2cc59485fa08b}{参考}
" set listchars=eol:↲,tab:>-,trail:-
set listchars=tab:>-,trail:*
set list
hi NonText ctermfg=red
" ^^A ]]] End of subsubsection `***'.
"
" ^^A ]]] End of subsection `Conceal関係'.
"
" \subsection{見た目関係}^^A [[[
" タイトル変更したい．
"
" \subsubsection{cursorline}^^A [[[ OK (2020-02-02T15:23:51)
" Highlight the screen line of the cursor with CursorLine \vimhelp{cursorline}.
set cursorline
" ^^A ]]] End of subsubsection `cursorline'.
"
" \subsubsection{number}^^A [[[ OK (2020-02-02T15:27:14)
" Print the line number in front of each line \vimhelp{'number'}.
set number
" ^^A ]]] End of subsubsection `number'.
"
" \subsubsection{ruler}^^A [[[ OK (2020-02-02T15:32:37)
" Show the line and column number of the cursor position, separated by a comma.
" When there is room, the relative position of the displayed text in the file is shown on the far right:
" \begin{center}
" \begin{tabular}{ll}
"   Top & first line is visible             \\
"   Bot & last line is visible              \\
"   All & first and last line are visible   \\
"   45\% & relative position in the file
" \end{tabular}
" \end{center}
set ruler
" ^^A ]]] End of subsubsection `ruler'.
"
" ^^A ]]] End of subsection `見た目関係'.
"
" \subsubsection{nohlsearch}^^A [[[
set nohlsearch
" ^^A ]]] End of subsubsection `foldmethod'.
"
" \subsubsection{lines, columns}^^A [[[
" set lines=150 columns=250
" ^^A ]]] End of subsubsection `lines, columns'.
"
" \subsubsection{splitbelow, splitright}^^A [[[
" When on, splitting a window will put the new window below the current one \vimhelp{splitbelow}.
"
" When on, splitting a window will put the new window right of the current one \vimhelp{splitright}.
set splitbelow
set splitright
" ^^A ]]] End of subsubsection `splitbelow, splitright'.
"
" \subsubsection{前回のカーソル位置からスタート*}^^A [[[
" 前回のカーソル位置からスタート
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" ^^A ]]] End of subsubsection `***'.
"
" \subsubsection{モードによってカーソルの形を変える}^^A [[[
" Insert mode Normal mode cursor change (cf. neovim/wiki/FAQ)
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" ^^A ]]] End of subsubsection `モードによってカーソルの形を変える'.
"
" \subsubsection{IMEオフ}^^A [[[
" Insert mode から Normal mode に切り替わるとIMEを自動でオフにする．
function! ImInActive()
    call system('fcitx-remote -c')
endfunction
inoremap <silent><Esc> <C-[>:call ImInActive()<CR>
" ^^A ]]] End of subsubsection `IMEオフ'.
"
" \subsubsection{Opening Vim help in a vertical split window}^^A [[[
" \href{https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window}{Opening Vim help in a vertical split window}
"
autocmd FileType help wincmd L
" ^^A ]]] End of subsubsection `Opening Vim help in a vertical split window'.
"
" \subsubsection{Others}^^A [[[
" \begin{myitemize}
" \1 \viminline{let g:tex_flavor = "latex"}
"   \2 常にlatexを想定（plain TeXとかではなく）
"   (cf. http://tex.stackexchange.com/questions/55397/vim-syntax-highlighting-of-partial-tex-file-used-with-include-is-incorrect)
"   \2 \verb|ftplugin/after/tex.vim|に書くと認識されない
" \end{myitemize}
"
let g:tex_flavor = "latex"
" ^^A ]]] End of subsubsection `Others'.
"
" ^^A ]]] End of section `Settings'.
"
" \section{Key mapping}^^A [[[
" vimで開くファイルの種類に限らず，全ファイル共通して用いるkey mapping．
" \doublequotes{Key mapping}の由来は．．．
" 変更する可能性大あり．
"
" \verb|:map|でkey mapping一覧が表示される．
"
" \subsubsection{y}^^A [[[
" 本来は？？？
" copy
nnoremap <silent>y yy
" ^^A ]]] End of subsubsection `***'.
"
" \subsubsection{q}^^A [[[
" 本来は？？？
nnoremap <silent>q :q<CR>
" ^^A ]]] End of subsubsection `***'.
"
" \subsubsection{Space}^^A [[[
" 本来は？？？
nnoremap <silent><Space> za
" ^^A ]]] End of subsubsection `Space'.
"
" \subsubsection{vsplit}^^A [[[
" \begin{myitemize}
" \1 The origin of \verb|Ctrl + \|
"   \2 \href{https://code.visualstudio.com/docs/getstarted/keybindings#_editorwindow-management}{workbench.action.splitEditor}
" \end{myitemize}
"
nnoremap <silent><C-\> :vsplit<CR>
" ^^A ]]] End of subsubsection `vsplit'.
"
" \subsubsection{一時的}^^A [[[
"
nnoremap <silent><CR> :w<CR>
" nnoremap <silent>+ 10<C-W>+ 20<C-W>>
" nnoremap <silent>- 10<C-W>- 20<C-W><
nnoremap <silent>+ 10<C-W>>
nnoremap <silent>- 10<C-W><
nnoremap <silent>= <C-W>=
nnoremap <silent>t gt
nnoremap <silent>m <C-W>w
" nnoremap <silent><C-M> <C-W>w
" map <silent><C-M> <C-W>w
nnoremap <silent>, :only<CR>
nnoremap <silent><C-@> :wqall<CR>

" test
inoremap <silent><C-J> <C-X><C-K>


nnoremap <silent><Leader>i :%s/outline/myitemize/gc<CR>


" a = add
" nnoremap <silent><buffer>\a :Gwrite<CR>


" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
nnoremap <F5> :set list!<CR>
" ^^A ]]] End of subsubsection `***'.
"
" ^^A ]]] End of section `Key mapping'.


" autocmd     BufNewFile,BufRead    *.*  :foldopen!
" autocmd VimEnter *.* :foldopen!
autocmd VimEnter *.* :normal 10za









