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

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/snippets']

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




" \section{Comparison of plugins for Neovim}^^A [[[
"
" \subsection{Plugin manager}^^A [[[
"
" \begin{concealableitemize}^^A [[[
" \1 The origin of `plugin manager'
"   \2 A minimalist Vim plugin manager
"   \urlref{https://github.com/junegunn/vim-plug}{junegunn/vim-plug}
"   \2 Dark powered Vim/Neovim plugin manager \vimhelp{dein.txt}
" \end{concealableitemize}^^A ]]]
"
" \begin{myitemize}
" \1 \href{https://qiita.com/nil2/items/ddcf23f1163d0abd805b}{Vimのプラグインマネージャの種類と選び方}
" \1 \href{https://www.slant.co/topics/1224/~best-plugin-managers-for-vim}{What are the best plugin managers for vim?}
" \1 
" \end{myitemize}
"
" \subsubsection{junegunn/vim-plug}^^A [[[
" \begin{myitemize}
" \1 \href{https://github.com/junegunn/vim-plug}{junegunn/vim-plug}
" \1 Installation \urlref{https://github.com/junegunn/vim-plug#unix-linux}{Unix, Linux}
"   \2 \verb|sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \|
"   \verb|https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'|
"   \2 Reload \verb|.vimrc| and \verb|:PlugInstall| to install plugins.
" \end{myitemize}
" ^^A ]]] End of subsubsection `junegunn/vim-plug'.
"
" \subsubsection{Shougo/dein.vim}^^A [[[
" \begin{myitemize}
" \1 Dark powered Vim/Neovim plugin manager \vimhelp{dein.txt}
" \1 一人で開発しているのか，deoplete，deoppetなどの開発が非常に遅い
" \1 OSをインストールし直す毎にエラーやpluginが上手く機能しない事態に陥る
" \1 
" \end{myitemize}
" ^^A ]]] End of subsubsection `Shougo/dein.vim'.
"
" \subsubsection{Conclusion}^^A [[[
" \begin{myitemize}
" \1 junegunn/vim-plug
"   \2 記述が簡単
"   \2 初期設定の速度が速い
"   \2 Shougo/dein.vimは記述が複雑
" \end{myitemize}
" ^^A ]]] End of subsubsection `Conclusion'.
"
" ^^A ]]] End of subsection `Plugin manager'.
"
" \subsection{File explorer}^^A [[[
"
" \begin{concealableitemize}^^A [[[
" \1 The origin of `file explorer'
"   \2 A powerful file explorer implemented in Vim script
"   \urlref{https://github.com/Shougo/vimfiler.vim#vimfiler}{vimfiler.vim}
"   \2 The NERDTree is a file system explorer for the Vim editor
"   \urlref{https://github.com/preservim/nerdtree#introduction}{nerdtree}.
" \end{concealableitemize}^^A ]]]
"
" \subsubsection{関連pluginについて比較・言及されている記事}^^A [[[
" \begin{myitemize}
" \1 \href{https://vim.blue/compare-filer-plugins/}{どれが良い？Vimのファイラ系プラグインを比較してみた}
" \1 
" \end{myitemize}
" ^^A ]]] End of subsubsection `***'.
"
" \subsubsection{preservim/nerdtree}^^A [[[
" \begin{myitemize}
" \1 Homepage: \href{https://github.com/preservim/nerdtree}{preservim/nerdtree}
"   \2 
" \1 \verb|mo|でpdfなどを開ける
"   \2 \href{https://vi.stackexchange.com/questions/19657/execute-a-file-from-nerdtree}{mo}
" \1 nerdtreeのbookmarkは\verb|~/.NERDTreeBookmarks|に保存されている
" \1 
" \end{myitemize}
" ^^A ]]] End of subsubsection `preservim/nerdtree'.
"
" \subsubsection{Shougo/vimfiler.vim}^^A [[[
" \begin{myitemize}
" \1 Homepage: \href{https://github.com/Shougo/vimfiler.vim}{Shougo/vimfiler.vim}
"   \2 実際に使ってみたが，bookmarkがunite.vimを経由して使うので面倒
"   \2 vimfilerで\verb|x|でシステムの関連付けを実行
"     \3 例えば，\verb|.pdf|で\verb|x|を実行すると\verb|evince|が起動してpdfが見れる
"     \urlref{http://i05nagai.github.io/memorandum/vim/vimfiler.html}{vimfiler}
"   \2 vimfilerでファイルのbookmark
"     \3 \url{http://i05nagai.github.io/memorandum/vim/vimfiler.html}
"     \3 \url{http://baqamore.hatenablog.com/entry/2015/06/24/213320}
"       \4 \verb|~/.cache/unite/bookmark/default|にbookmarkが保存されている
" \end{myitemize}
"
" vimfilerはunite.vimを必要とする\urlref{https://github.com/Shougo/vimfiler.vim}{vimfiler.vim}．
" 現時点ではvimfilerはdenite.nvimには対応していないので，unite.vimを使うことにする
" （cf. \url{https://github.com/Shougo/vimfiler.vim/issues/379}）．
" 対応し次第，denite.nvimに移行するつもり．
"
" \verb|vimfiler_enable_auto_cd|について調べよ．同じくunitでlcdについて調べよ．
"
" \begin{myitemize}
" \1 \viminline{let g:vimfiler_as_default_explorer = 1}
"   \2 If this variable is true, Vim use vimfiler as file manager instead of netrw (cf. vimfiler.txt, VARIABLES).
" \1 \viminline{:VimFiler -force-quit -winwidth=30 ...}
"   \2 \href{http://lsifrontend.blog100.fc2.com/blog-entry-343.html}{vimfilerのoption}
"   \2 \verb|-force-quit|
"     \3 Exit the vimfiler buffer after firing an action. \verb|:h vimfiler-options-force-quit|
"   \2 \verb|-winwidth|
"     \3 Specifies the width of a vimfiler buffer.
"   \2 \verb|-simple|
"     \3 Enable vimfiler simple mode.
"   \2 \verb|-split|
"     \3 Split vimfiler buffer.
" \1 \viminline{let g:vimfiler_edit_action = ...}
"   \2 \href{http://lsifrontend.blog100.fc2.com/blog-entry-343.html}{vimfiler edit action}
" \1 \viminline{let g:vimfiler_ignore_pattern = ...}
"   \2 Specify the regexp pattern string or list to ignore candidates of the source.
"   \2 \href{http://qiita.com/termoshtt/items/3cf7596a1c81c0a4c160}{vimfiler ignore pattern}
"   \2 \href{https://github.com/Shougo/vimfiler.vim/issues/120}{vimfiler ignore pattern}
"   \2 \vimhelp{vimfiler}にあるように\verb|['^\.pdf']|としてもダメだった
" \1 \viminline{vimfiler#do_switch_action}
"   \2 \href{http://baqamore.hatenablog.com/entry/2016/02/13/062555}{ref}
" \1 \viminline{vimfiler#set_execute_file()}
"   \2 \href{http://i05nagai.github.io/memorandum/vim/vimfiler.html}{ref}
" \end{myitemize}
"
"    \begin{macrocode}
" [[plugins]]
" repo = 'Shougo/vimfiler'
" hook_add = '''
" let g:vimfiler_as_default_explorer = 1
" nnoremap <silent>f :VimFiler -force-quit -winwidth=30 -simple -split<CR>
" " nnoremap <silent>f :VimFiler -force-quit -winwidth=30 -simple -split -direction='topright'<CR>
" let g:vimfiler_edit_action = 'vsplit'
" " let g:vimfiler_edit_action = 'split'
" " let g:vimfiler_edit_action = 'tabopen'
" let g:vimfiler_ignore_pattern = '\%(.png\|.pyc\)$'
" % ^^A  " let g:vimfiler_ignore_pattern = '\(^\.\|\~$\|\.pdf$\|\.[oad]$\)'
" % ^^A  " let g:vimfiler_ignore_pattern = '\%(.pdf\|.png\|.pyc\)$'
" nnoremap s vimfiler#do_switch_action('split')
" nnoremap v vimfiler#do_switch_action('vsplit')
" % ^^A call vimfiler#set_execute_file('pdf', 'evince')
" '''
"    \end{macrocode}
" ^^A ]]] End of subsubsection `Shougo/vimfiler.vim'.
"
" \subsubsection{Conclusion}^^A [[[
" \begin{myitemize}
" \1 preservim/nerdtree
"   \2 bookmarksが簡単
"   \2 Shougo/vimfiler.vimはbookmarksの設定方法がよくわからない
" \end{myitemize}
" ^^A ]]] End of subsubsection `Conclusion'.
"
" ^^A ]]] End of subsection `File explorer'.
"
" \subsection{Commenting}^^A [[[
" \begin{myitemize}
" \1 SpaceVimがnerdcommenterを使っている\urlref{https://spacevim.org/documentation/#commenting}{Commenting}
" \1 
" \1 
" \end{myitemize}
"
"
" ^^A ]]] End of subsection `Commenting'.
"
" \subsection{display git diff}^^A [[[
" \begin{myitemize}
" \1 airblade/vim-gitgutter
" \1 'mhinz/vim-signify'
" \end{myitemize}
"
"
"
"
" ^^A ]]] End of subsection `***'.
"
" \subsection{auto close bracket}^^A [[[
" \begin{myitemize}
" \1 'Townk/vim-autoclose'
" \1 
" \end{myitemize}
"
"
" ^^A ]]] End of subsection `auto close bracket'.
"
" \subsection{auto completion}^^A [[[
" \begin{myitemize}
" \1 \href{https://www.slant.co/topics/3999/~best-semantic-autocompletion-plugins-for-vim}{What are the best semantic autocompletion plugins for Vim?}
" \1 \href{https://github.com/ycm-core/YouCompleteMe/issues/1751}{Can I install YCM with vim-plug?}
" \1 \href{https://github.com/ycm-core/YouCompleteMe}{ycm-core/YouCompleteMe}
" \1 YouCompleteMeはインストールの仕方が悪いのか，エラー発生して上手くいかない
" \1 vim built in function???
"   \2 In insert mode, press \verb|Ctrl+n| or \verb|Ctrl+n| to complete word
" \end{myitemize}
"
" \subsubsection{Shougo/ddc.vim}^^A [[[
" \begin{myitemize}
" \1 \href{https://github.com/Shougo/ddc.vim}{Shougo/ddc.vim - GitHub}
"   \2 Dark deno-powered completion framework for neovim/Vim8
" \1
" \end{myitemize}
"
"
"
"
" ^^A ]]] End of subsubsection `Shougo/ddc.vim'.
"
" ^^A ]]] End of subsection `auto completion'.
"
" \subsection{Snippets}^^A [[[
" \begin{myitemize}
" \1 \href{https://www.vim.org/scripts/script.php?script_id=3633}{vim-snippets : snippets for a variety of vim plugins}
" \1 \href{https://zenn.dev/shougo/articles/snippet-plugins-2020}{スニペットプラグインについて 2020 年版}
" \1 \href{https://github.com/SirVer/ultisnips}{SirVer/ultisnips}
" \end{myitemize}
"
" \subsubsection{Shougo/deoppet}^^A [[[
" \begin{myitemize}
" \1 The neo-snippet plugin contains snippet source
" \1 \vimhelp{deoppet-examples}
" \end{myitemize}
"
" \begin{vimcode}
" Plug 'Shougo/deoppet.nvim'
" imap <C-k>  <Plug>(deoppet_expand)
" imap <C-f>  <Plug>(deoppet_jump_forward)
" imap <C-b>  <Plug>(deoppet_jump_backward)
" smap <C-f>  <Plug>(deoppet_jump_forward)
" smap <C-b>  <Plug>(deoppet_jump_backward)
"
" call deoppet#initialize()
" call deoppet#custom#option('snippets',
"\ map(globpath(&runtimepath, 'neosnippets', 1, 1),
"\     { _, val -> { 'path': val } }))
"
" " Use deoppet source.
"call ddc#custom#patch_global('sources', ['deoppet'])
"
" " Change source options
"call ddc#custom#patch_global('sourceOptions', {
"      \ 'deoppet': {'dup': v:true, 'mark': 'dp'},
"      \ })
" \end{vimcode}
" ^^A ]]] End of subsubsection `Shougo/deoppet'.
"
" \subsubsection{Shougo/neosnippet}^^A [[[
" \begin{myitemize}
" \1 使用してみての所感
"   \2 snippet挿入時indentが崩れる
"     \3 Python, YAMLだと致命的
"   \1 snippet挿入時，挙動が変になることがある
" \1 
" \end{myitemize}
"
" \begin{myitemize}
" \1 The neo-snippet plugin contains snippet source
" \1 \viminline{let g:neosnippet#snippets_directory = ...}
"   \2 This variable appoints a path to user-defined snippet files
"   \vimhelp{g:neosnippet#snippets_directory}.
" \1 \viminline{<Plug>(neosnippet_expand_or_jump)}
"   \2 Expand a snippet in current cursor position
"   \vimhelp{<Plug>(neosnippet_expand)}.
" \1 基本構造
"   \2 \vimhelp{neosnippet-examples}
" \end{myitemize}
"
" \begin{vimcode}
" Plug 'Shougo/neosnippet'
" let g:neosnippet#snippets_directory = '~/Dropbox/configuration-files/vim/output-files/snippets'
" imap <C-k> <Plug>(neosnippet_expand_or_jump)<Esc>:only<CR>li
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
"
"
"
" " SuperTab like snippets' behavior.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" "smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " Enable snipMate compatibility feature.
" " let g:neosnippet#enable_snipmate_compatibility = 1
" \end{vimcode}
" ^^A ]]] End of subsubsection `Shougo/neosnippet'.
"
" \subsubsection{Shougo/neosnippet-snippets}^^A [[[
" \begin{vimcode}
" Plug 'Shougo/neosnippet-snippets'
" \end{vimcode}
" ^^A ]]] End of subsubsection `Shougo/neosnippet-snippets'.
"
" \subsubsection{SirVer/ultisnips}^^A [[[
" \begin{myitemize}
" \1 \href{https://github.com/SirVer/ultisnips}{SirVer/ultisnips}
" \1 
" \1 
" \end{myitemize}
" ^^A ]]] End of subsubsection `SirVer/ultisnips'.
"
" ^^A ]]] End of subsection `Snippets'.
"
" ^^A ]]] End of section `Comparison of plugins for Neovim'.





