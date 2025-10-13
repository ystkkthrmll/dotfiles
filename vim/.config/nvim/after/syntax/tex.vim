
" \part{\myverb{tex.vim}}^^A [[[
" \iffalse
"<*tex.vim>
" \fi
"
" \href{http://www.drchip.org/astronaut/vim/index.html#LATEXPKGS}{ここ}にamsmath用のsyntax fileがある
" （\verb|:h tex-morecomands|）．使用するか要検討．
"
" \section{Syntax highlighting}^^A [[[
" タイトルはテキトーにつけた．
"
" \subsubsection{molokaiの色メモ}^^A [[[
" molokaiに用いられている色
"
" \href{https://jonasjacek.github.io/colors/}{256 COLORS - CHEAT SHEET}
"
" \begin{center}
" \begin{tabular}{ll}
"	color	& number	\\ \hline
"	black	& 0		\\^^A 確認済み(Search)
"	green	& 118	\\^^A 確認済み(Function)
"	orange	& 208	\\^^A 確認済み(CursorLineNr)
"	purple	& 135	\\^^A 確認済み(Number)
"	red		& 161	\\^^A 確認済み(keyword)
"	white	& 	\\
" \end{tabular}
" \end{center}
" ^^A ]]] End of subsubsection `***'.
"
" \subsection{Defining Conceal}^^A [[[
" \href{https://github.com/pangloss/vim-javascript/issues/151}{参照先}
" \begin{vimcode}
hi Conceal ctermfg=0 ctermbg=135 cterm=bold,underline
" \end{vimcode}
" ^^A ]]] End of subsection `***'.
"
" \subsection{Defining ***}^^A [[[
" \verb|\begin|などのフォントを変更．
" \begin{vimcode}
hi Statement ctermfg=161 cterm=bold
" \end{vimcode}
" ^^A ]]] End of subsection `***'.
"
" \subsection{Defining ***}^^A [[[
" \verb|\begin{foo}|の\verb|foo|の部分や\verb|\verb|のフォントを変更．
" \begin{vimcode}
hi PreCondit ctermfg=118 cterm=bold
" \end{vimcode}
" ^^A ]]] End of subsection `***'.
"
" ^^A ]]] End of section `***'.
"
" \section{文章関係}^^A [[[
"
" \subsubsection{\texcommand{1}, \texcommand{2}, ...}^^A [[[
"
" \paragraph{Creating a List}^^A [[[
" タイトルは\vimhelp{list}より．
" \begin{vimcode}
let s:texStatementList=[
    \ ['\\$', '$'],
    \ ['\\&', '&'],
    \ ['\\#', '#'],
    \ ['\\_', '_'],
    \ ['\\%', '%'],
    \ ['\\1', '・'],
    \ ['\\2', 'ー'],
    \ ['\\3', '＊'],
    \ ['\\4', '@']]
" \end{vimcode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[
" タイトルの由来は\verb|:h syn-define|より．
"
" \href{run:/usr/share/nvim/runtime/syntax/tex.vim}{\texttt{tex.vim}} \myline{477--517}を参考にした．
"
" \doublequotes{cmd}の由来は\href{https://writingexplained.org/english-abbreviations/command}{ここ}や
" \href{https://en.wikipedia.org/wiki/Cmd.exe}{\texttt{cmd.exe}}より．
" \begin{vimcode}
for texcmd in s:texStatementList
    exe "syn match texStatement '".texcmd[0]."' conceal cchar=".texcmd[1]
endfor
" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `\1, \2, ...'.
"
" \subsubsection{\texcommand{doublequotes}系}^^A [[[
" タイトルはテキトーにつけた．
"
" \paragraph{Creating a List}^^A [[[
" \begin{vimcode}
let s:texStatementList=[
    \ ['doublequotes'	, '❝'	, '❞'],
    \ ['texcommand'		, '＼'	, ' '],
    \ ['title'			, '❝'	, '❞']]
" \end{vimcode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[ OK (2020-01-02T05:22:00)
" \begin{vimcode}
for texcmd in s:texStatementList
    exe "syn match ".texcmd[0]."CommandRight contained '\\\\".texcmd[0]."{.\\{-}' conceal cchar=".texcmd[1]
    exe "syn match ".texcmd[0]."CommandLeft contained '}' conceal cchar=".texcmd[2]
    exe "syn match texStatement '\\\\".texcmd[0]."{.\\{-}}'"
        \ "contains=".texcmd[0]."CommandRight,".texcmd[0]."CommandLeft"
"       \ ."contains=".texcmd[0]."CommandRight,".texcmd[0]."CommandLeft"
endfor
" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `***'.
"
" \subsubsection{\texcommand{***ref}}^^A [[[
" \doublequotes{式(...)}のように日本語表示にした理由は，その方が文字数が絞れるから．
" 英語だと\doublequotes{Eq.(...)}，\doublequotes{Def.(...)}，\doublequotes{Prop.(...)}など
" 文字数が様々なので，コードが複雑になってしまう．
"
" \paragraph{Creating a List}^^A [[[ OK (2020-01-02T09:46:16)
" \begin{vimcode}
let s:texStatementList=[
    \ ['axiom'	, '公理'],
    \ ['def'	, '定義'],
    \ ['eq'		, '式'],
    \ ['lemma'	, '補題'],
    \ ['prf'	, '式'],
    \ ['prop'	, '命題'],
    \ ['thm'	, '定理']]
" \end{vimcode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[ OK (2020-01-02T11:28:27)
" \verb|leftParenthesis, rightParenthethesis|は$C(X), L(X), U(X)$の箇所で定義したものを使い回す．
"
" 文字数を得るには\verb|strlen|関数ではなく\verb|strchars|関数を用いること（
" \href{https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/strlen}{vim script: strlen}
" または
" \href{https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/strchars}{vim script: strchars}
" より）．
" \begin{vimcode}
" syn match defrefCommandDef contained "\\def" conceal cchar=定
" syn match defrefCommandRef contained "ref" conceal cchar=義
" syn match texStatement "\\defref{.\{-}}" contains=defrefCommandDef,defrefCommandRef,leftParenthesis,rightParenthethesis
"
for texcmd in s:texStatementList
    if strchars(texcmd[1]) == 1
        exe "syn match ".texcmd[0]."refCommand contained '\\\\".texcmd[0]."ref' conceal cchar=".texcmd[1]
        exe "syn match texStatement '\\\\".texcmd[0]."ref{.\\{-}}'"
            \ "contains=".texcmd[0]."refCommand,leftParenthesis,rightParenthethesis"
"           \ ."contains=".texcmd[0]."refCommand,leftParenthesis,rightParenthethesis"
    else
        let chars = split(texcmd[1], '\zs')
        exe "syn match ".texcmd[0]."refCommand".texcmd[0]." contained '\\\\".texcmd[0]."'"
        	\ "conceal cchar=".chars[0]
        exe "syn match ".texcmd[0]."refCommandRef contained 'ref' conceal cchar=".chars[1]
        exe "syn match texStatement '\\\\".texcmd[0]."ref{.\\{-}}'"
        	\ "contains=".texcmd[0]."refCommand".texcmd[0].","
        	\ .texcmd[0]."refCommandRef,leftParenthesis,rightParenthethesis"
    endif
endfor
" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `\***ref'.
"
" \subsubsection{\texcommand{href}系}^^A [[[
" タイトルはテキトーにつけた．
"
" \paragraph{Creating a List}^^A [[[
" \begin{vimcode}
let s:texStatementList=[
    \ ['href'   , '👉'  , '👈'],
    \ ['urlref' , '👉'  , '👈'],]
" \end{vimcode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[
" \begin{vimcode}
" syn region texRefZone matchgroup=texStatement start="\\href{.\{-}}{"
"        \ end="}\|%stopzone\>" contains=@texRefGroup cchar=寝
"
" syn region texRefZone matchgroup=texStatement start="\\href{.\{-}}{" end="}\|%stopzone\>" contains=@texRefGroup cchar=寝
"
" syn region texRefZone matchgroup=texStatement start="\\href{.\{-}}{" end="}\|%stopzone\>" cchar=寝
" syn region texRefZone matchgroup=texStatement start="\\href{" end="}\|%stopzone\>" cchar=寝
"





" 以下で上手く行った
" syn match hrefCommandLeft contained '\\href{.\{-}}{.\{-}' conceal cchar=👉
" syn match hrefCommandRight contained '}' conceal cchar=👈
" syn match texStatement '\\href{.\{-}}{.\{-}}' contains=hrefCommandLeft,hrefCommandRight




for texcmd in s:texStatementList
  exe "syn match ".texcmd[0]."CommandLeft contained '\\\\".texcmd[0]."{.\\{-}}{.\\{-}' conceal cchar=".texcmd[1]
  exe "syn match ".texcmd[0]."CommandRight contained '}' conceal cchar=".texcmd[2]
  exe "syn match texStatement '\\\\".texcmd[0]."{.\\{-}}{.\\{-}}' contains=".texcmd[0]."CommandLeft,".texcmd[0]."CommandRight"
endfor





" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `***'.
"
" \subsubsection{\texcommand{verb}系}^^A [[[
" \verb|minted|の\verb|\mint|で定義されたコマンドもこれに該当する．
"
" \paragraph{Creating a List}^^A [[[ OK (2020-01-04T02:33:05)
" \doublequotes{delimiter}の由来およびその略\doublequotes{delim}は\texdoc{minted}の\verb|\mint|より．
"
" デリミタ（delimiter）とは，複数の要素を列挙する際に，
" 要素の区切りとなる記号や特殊文字（の並び）のこと\mycite[keyword=delimiter]{e-words}．
" \begin{vimcode}
let s:texCommandList=[
    \ 'bash',
    \ 'latex',
    \ 'myverb',
    \ 'verb']

let s:texDelimiterList=[
    \ '|',
    \ '/',
    \ '?']
" \end{vimcode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[
"
" \begin{vimcode}
" for texcmd in s:texCommandList
"       % for texdelim in s:texDelimiterList
"       	% exe "syn match ".texcmd."CommandLeft contained '\\\\".texcmd.texdelim."' conceal"
"       	% exe "hi ".texcmd."CommandLeft ctermfg=118 ctermbg=0 cterm=bold,underline"
"       	% exe "syn match ".texcmd."CommandRight contained '".texdelim."' conceal"
"       	% exe "hi ".texcmd."CommandRight ctermfg=118 ctermbg=0 cterm=bold,underline"
"       	% exe "syn match ".texcmd."Command '\\\\".texcmd.texdelim.".\{-}".texdelim."'"
"       		% \ "contains=".texcmd."CommandLeft,".texcmd."CommandRight"
"       	% exe "hi ".texcmd."Command ctermfg=0 ctermbg=118 cterm=bold,underline"
"       % endfor
" endfor



syn match verbCommandLeft contained "\\verb|" conceal
hi verbCommandLeft ctermfg=118 cterm=bold
syn match verbCommandRight contained "|" conceal
hi verbCommandRight ctermfg=118 cterm=bold
syn match verbCommand "\\verb|.\{-}|" contains=verbCommandLeft,verbCommandRight
hi verbCommand ctermfg=118 cterm=bold,underline




" 下記でうまくいくが，\section以降ではうまくいかない
" syn match bashinlineCommandLeft contained "\\bashinline{" conceal cchar=$
" hi bashinlineCommandLeft ctermfg=118 cterm=bold
" syn match bashinlineCommandRight contained "}" conceal
" hi bashinlineCommandRight ctermfg=118 cterm=bold
" syn match bashinlineCommand "\\bashinline{.\{-}}" contains=bashinlineCommandLeft,bashinlineCommandRight
" hi bashinlineCommand ctermfg=118 cterm=bold,underline

" syn region texZone start="\\bashinline{" end="}\|%stopzone\>"
syn region texZone start="\\bashinline\*{" end="}\|%stopzone\>"

" syn region texZone start="\\pythoninline{" end="}\|%stopzone\>"

syn region texZone start="\\.*inline{" end="}\|%stopzone\>"

" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `\verb'.
"
" \subsubsection{\texcommand{myarrow}}^^A [[[
" \begin{vimcode}
syn match texStatement "\\myarrow" conceal cchar=➞
" \end{vimcode}
" ^^A ]]] End of subsubsection `\myarrow'.
"
" \subsubsection{\texcommand{mybecause}}^^A [[[
" 
" \href{https://stackoverflow.com/questions/8309815/vim-conceal-with-more-than-one-character}{ここ}を参考にした．
"
" \verb|:syn-concealends|を使えばできそう．
"
" \verb|\mybecause{\eqref{***}}|とすると，意図したように表示されない．
"
" \begin{vimcode}
" syn match mybecauseCommand contained "\\mybecause" conceal cchar=(
" syn match mybecauseLeft contained "{" conceal cchar=∵
" syn match mybecauseRight contained "}" conceal cchar=)
" syn match texMathSymbol "\\mybecause\s*{.\{-}}" contains=mybecauseCommand,mybecauseLeft,mybecauseRight
" syn match texMathSymbol "\\mybecause\s*{.\{-}}" contains=mybecauseCommand,mybecauseLeft,.\{-},mybecauseRight
"
" syn region texMathSymbol start="\\mybecause{" end="}" contains=mybecauseCommand,mybecauseLeft,mybecauseRight
"
syn match texMathSymbol "\\mybecause" conceal cchar=∵
" \end{vimcode}
" ^^A ]]] End of subsubsection `****'.
"
" \subsubsection{\texcommand{subfile}}^^A [[[
" \href{run:/usr/share/nvim/runtime/syntax/tex.vim}{\texttt{tex.vim}} \myline{283}の
" \verb/\include(graphics|list)/を参考にした．
"
" \begin{vimcode}
syn match texInputFile "\\subfile\=\(\[.\{-}\]\)\=\s*{.\{-}}" contains=texStatement,texInputCurlies,texInputFileOpt
" \end{vimcode}
" ^^A ]]] End of subsubsection `subfile'.
"
" ^^A ]]] End of section `***'.
"
" \section{Math}^^A [[[
"
" \subsubsection{Including New Math Group}^^A [[[
" タイトルは\verb|:h tex-math|を参考にした．
"
" コードは\verb|:h tex-math|と
" \href{run:/usr/share/nvim/runtime/syntax/tex.vim}{\texttt{tex.vim}} \myline{439}を参考にした．
"
" "B"にした理由は特にない．上手くいったので暫定OK．あとで調べよ．
"
" 3つ目の引数は\verb|*|付きも定義するかどうかを指定するフラグ（\vimhelp{tex-math}）．
"
" \begin{vimcode}
call TexNewMathZone("B","align",1)
call TexNewMathZone("B","gather",1)
call TexNewMathZone("B","mycalculation",1)
" \end{vimcode}
" ^^A ]]] End of subsubsection `Including New Math Group'.
"
" \subsubsection{数}^^A [[[
" タイトルはテキトーにつけた．
"
" \paragraph{Creating a List}^^A [[[ OK (2020-01-02T09:49:41)
" タイトルは\verb|:h list|より．
" \begin{vimcode}
let s:texMathList=[
    \ ['N', 'Ｎ'],
    \ ['Z', 'Ｚ'],
    \ ['Q', 'Ｑ'],
    \ ['R', 'Ｒ'],
    \ ['C', 'Ｃ']]
" \end{vimcode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[
" \href{run:/usr/share/nvim/runtime/syntax/tex.vim}{\texttt{tex.vim}} \myline{677--856}より．
"
" \verb|syn match texMathSymbol "\\R" conceal cchar=Ｒ|とすると\verb|\Rightarrow|も変換されてしまう．
" \verb|"\\R\>"|とすることで防げる．
"
" \begin{vimcode}
for texmath in s:texMathList
    exe "syn match texMathSymbol '\\\\".texmath[0]."\\>' contained conceal cchar=".texmath[1]
endfor
" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `****'.
"
" \subsubsection{関数}^^A [[[
" タイトルの由来は\mycite[page=409]{teach-yourself-latex2e}より．
"
" \paragraph{Creating a List}^^A [[[
" 文字数は任意．
"    \begin{macrocode}
let s:texMathList=[
    \ 'cos',
    \ 'inf',
    \ 'lim',
    \ 'max',
    \ 'min',
    \ 'sin',
    \ 'sup',
    \ 'tan',
    \ 'tanh']
"    \end{macrocode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[ OK (2020-01-02T02:25:27)
" タイトルの由来は\verb|:h syn-define|より．
"
" \href{https://groups.google.com/forum/#!topic/vim_dev/0RurxXUlhbA}{Getting a character from a string.}
"
" \href{https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/range}{vim script: range}
"
" \verb|+=|は使えない．また，\verb|+|は数値にしか使えない．文字列の連結は\verb|.|を使うこと．
" \begin{vimcode}
" syn match maxCommandM contained "\\m" conceal cchar=m
" syn match maxCommandA contained "a" conceal cchar=a
" syn match maxCommandX contained "x" conceal cchar=x
" syn match texMathSymbol "\\max\>" contains=maxCommandM,maxCommandA,maxCommandX
"
for texmath in s:texMathList
    let chars = split(texmath, '\zs')
    for i in range(strchars(texmath))
        if i == 0
            exe "syn match ".texmath."Command".chars[i]." contained '\\\\".chars[i]."'"
                \ "conceal cchar=".chars[i]
            let temp = texmath."Command".chars[i]
        else
            exe "syn match ".texmath."Command".chars[i]." contained '".chars[i]."'"
                \ "conceal cchar=".chars[i]
            let temp = temp.",".texmath."Command".chars[i]
        endif
    endfor
    exe "syn match texMathSymbol '\\\\".texmath."\\>' contains=".temp
endfor
" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `関数'.
"
" \subsubsection{$C(X), L(X), U(X)$}^^A [[[
" タイトルはテキトーにつけた．
"
" \paragraph{Creating a List}^^A [[[ OK (2020-01-02T09:57:01)
"    \begin{macrocode}
let s:texMathList=[
    \ ['cut'        , 'C'],
    \ ['lowerbound' , 'L'],
    \ ['upperbound' , 'U']]
"    \end{macrocode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[ OK (2020-01-02T03:18:37)
" タイトルの由来は\verb|:h syn-define|より．
"
" \href{https://stackoverflow.com/questions/8309815/vim-conceal-with-more-than-one-character}{ここ}を参考にした．
"
" \verb|:syn-concealends|を使えばできそう．
"
" \doublequotes{left[right] parenthesis}の由来は
" \href{https://ja.wikipedia.org/wiki/%E6%8B%AC%E5%BC%A7#%E4%B8%B8%E6%8B%AC%E5%BC%A7%EF%BC%88%EF%BC%89}{ここ}より．
"
"    \begin{macrocode}
syn match leftParenthesis contained "{" conceal cchar=(
syn match rightParenthethesis contained "}" conceal cchar=)
"
" syn match cutCommand contained "\\cut" conceal cchar=C
" syn match texMathSymbol "\\cut{.\{-}}" contains=cutCommand,leftParenthesis,rightParenthethesis
"
for texmath in s:texMathList
    exe "syn match ".texmath[0]."Command contained '\\\\".texmath[0]."'"
        \ "conceal cchar=".texmath[1]
    exe "syn match texMathSymbol '\\\\".texmath[0]."{.\\{-}}' contains="
        \ .texmath[0]."Command,leftParenthesis,rightParenthethesis"
endfor
"    \end{macrocode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `****'.
"
" \subsubsection{表示の修正}^^A [[[
"
" \paragraph{Creating a List}^^A [[[
" タイトルは\verb|:h list|より．
"    \begin{macrocode}
let s:texMathList=[
    \ ['emptyset'		, '∅'],
    \ ['exists'			, '∃'],
    \ ['forall'			, '∀'],
    \ ['in'				, '∈'],
    \ ['land'			, '∧'],
    \ ['Leftrightarrow'	, '⇔'],
    \ ['lor'			, '∨'],
    \ ['neq'			, '≠'],
    \ ['notin'			, '∉'],
    \ ['Rightarrow'		, '⇒'],
    \ ['subset'			, '⊂'],
    \ ['subseteq'		, '⊆']]
"    \end{macrocode}
" ^^A ]]] End of paragraph `Creating a List'.
"
" \paragraph{Defining Syntax}^^A [[[ OK (2020-01-02T23:41:05)
" \href{https://stackoverflow.com/questions/8309815/vim-conceal-with-more-than-one-character}{ここ}を参考にした．
"
" Listのindexについては\href{https://learnvimscriptthehardway.stevelosh.com/chapters/35.html#indexing}{ここ}を参考にした．
"
" join関数は\href{https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/join}{ここ}を参考にした．
"
" \verb|:syn-concealends|を使えばできそう．
" \begin{vimcode}
" syn match inCommand contained "\\i" conceal cchar=∈
" syn match inSpace contained "n" conceal cchar=.
" syn match texMathSymbol "\\in\>" contains=inCommand,inSpace
let tempSpace = ' '
for texmath in s:texMathList
    let chars = split(texmath[0], '\zs')
    let tempNum = strchars(texmath[0]) - 2
    let tempTexCommand = join(chars[0:tempNum], '')
    exe "syn match ".texmath[0]."Command contained '\\\\".tempTexCommand."'"
        \ "conceal cchar=".texmath[1]
    exe "syn match ".texmath[0]."CommandSpace contained '".chars[-1]."'"
        \ "conceal cchar=".tempSpace
    exe "syn match texMathSymbol '\\\\".texmath[0]."\\>'"
        \ "contains=".texmath[0]."Command,".texmath[0]."CommandSpace"
endfor
" \end{vimcode}
" ^^A ]]] End of paragraph `Defining Syntax'.
"
" ^^A ]]] End of subsubsection `****'.
"
" ^^A ]]] End of section `Math'.
"
" \section{***code environment}^^A [[[
" 以下は\verb|/usr/share/nvim/runtime/syntax/tex.vim|の\verb|verbatim|の箇所を参考にした．
"
" \begin{vimcode}
syn region texZone start="\\begin{.*code}" end="\\end{.*code}\|%stopzone\>"
" syn region texProgCode start="\\begin{.*code}" end="\\end{.*code}\|%stopzone\>"

" hi def link texProgCode PreCondit
" \end{vimcode}
" ^^A ]]] End of section `***code environment'.
"
" \begin{vimcode}

" hi link texMathSymbol Statement
hi texMathSymbol ctermfg=135 cterm=underline
hi texStatement ctermfg=135 cterm=underline
" hi doublequotesCommandRight ctermfg=9 ctermbg=20 cterm=bold
hi doublequotesCommandRight cterm=bold

hi dtxTest ctermfg=0 ctermbg=208 cterm=underline
syn match dtxTest '%<.*>'

let s:texMathList=[
    \ ['myprobability', 'P'],
    \ ['mydifferential', 'd']]

syn match leftParenthesis contained "{" conceal cchar=(
syn match rightParenthethesis contained "}" conceal cchar=)

for texmath in s:texMathList
    exe "syn match ".texmath[0]."Command contained '\\\\".texmath[0]."'"
        \ "conceal cchar=".texmath[1]
    exe "syn match texMathSymbol '\\\\".texmath[0]."{.\\{-}}' contains="
        \ .texmath[0]."Command,leftParenthesis,rightParenthethesis"
endfor

" \end{vimcode}
"
" 以下は\href{run:/usr/share/nvim/runtime/syntax/tex.vim}{\texttt{tex.vim}} \myline{384}を参考にした．
" \begin{vimcode}
syn region texMathDelim	matchgroup=texTypeStyle start="\\mybm\s*{" matchgroup=texTypeStyle  end="}" concealends contains=@texBoldGroup,@Spell
" \end{vimcode}
"
" \iffalse
"</tex.vim>
" \fi
" ^^A ]]] End of part `tex.vim'.
