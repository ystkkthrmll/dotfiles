#!/usr/bin/env perl
#
#
#






# \verb|.latexmkrc|の由来は\href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}}の
# \doublequotes{CONFIGURATION/INITIALIZATION (RC) FILES}より．
#
# 基本的には\href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}}を参考にした．
#
# \section{Notes}^^A [[[
# \begin{myitemize}
# \1 latexmkの説明は，\href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}}を参照せよ．
#   \2 \verb|.latexmkrc|で\verb|$cleanup_mode = 2|としても，消してくれなかった．
#   \2 \verb|$success_cmd = "latexmk -c %S";|としもダメだった．
# \1
# \end{myitemize}
# ^^A ]]] End of section `Notes'.
#
% \section{Implementation}^^A [[[
%
% \subsection{\texttt{\$clean\_ext}}^^A [[[
% Extra extensions of files for latexmk to remove
% when any of the clean-up options (\verb|-c| or \verb|-C|) is selected.
% The value of this variable is a string containing the extensions separated by spaces
% See \mycite[keyword=\texttt{\$clean\_ext}]{latexmk}.
%
% \begin{description}
% \item[bbl] 
% \item[listing] tcolorboxのtcblisting環境などで使われるファイル
% \item[nav] beamerを使用すると生成されるファイル
% \item[run.xml] 
% \item[snm] beamerを使用すると生成されるファイル
% \item[synctex.gz] 
% \item[upa, upb] \verb|pdfcomment| packageを使用すると出力されるファイル
% \end{description}
%
%    \begin{macrocode}
%<.latexmkrc>$clean_ext = "bbl listing nav run.xml snm synctex.gz upa upb";
%    \end{macrocode}
% ^^A ]]] End of subsection `clean_ext'.
%
% \subsection{makeindex}^^A [[[
% The index processing program.
%
% なぜかこれを設定するとエラーが起きる．
%    \begin{macrocode}
%^^A<.latexmkrc>$makeindex = "mendex %O %S";
%    \end{macrocode}
% ^^A ]]] End of subsection `makeindex'.
%
% \subsection{\texttt{\$pdflatex}}^^A [[[
% The LaTeX processing program in a version that makes a pdf file instead of a dvi file.
%
% \verb|luajittex --fmt=luajitlatex.fmt|については\url{https://texwiki.texjp.org/?LuaJITTeX}を参照．
% \verb/-shell-escape/はminted packageを使う上で必要（\verb|texdoc minted|）．
%
% \verb|$ sudo apt update|したら，なぜかluajittexでエラーになった（2017/07/16）．
% なので（一時的に？）\verb|$pdflatex = "lualatex"|にする．
%
% \bashinline{lualatex}の由来\urlref{https://texwiki.texjp.org/?LaTeX%E5%85%A5%E9%96%80%2F%E7%99%BA%E5%B1%95%E7%B7%A8#t7eebe4c}{発展編：最近の LaTeX の動向}
% 
%    \begin{macrocode}
%<.latexmkrc>#$pdflatex = "luajittex --fmt=luajitlatex.fmt -shell-escape %O %S";
%<.latexmkrc>#$pdflatex = "lualatex -shell-escape %O %S";
%<.latexmkrc>$lualatex = "lualatex -shell-escape %O %S";
%    \end{macrocode}
% ^^A ]]] End of subsection `$pdflatex'.
%
% \subsection{\texttt{\$bibtex}}^^A [[[
%    \begin{macrocode}
%<.latexmkrc>$bibtex = "bibtex %O %S";
%    \end{macrocode}
% ^^A ]]] End of subsection `$bibtex'.
%
% \subsection{dvi\_mode, pdf\_mode, postscript\_mode}^^A [[[
%
% \subsubsection{\texttt{\$dvi\_mode}}^^A [[[ OK (2020-02-01T14:52:38)
% If nonzero, generate a dvi version of the document \mycite[keyword=\texttt{\$dvi\_mode}]{latexmk}.
%    \begin{macrocode}
%<.latexmkrc>$dvi_mode = 0;
%    \end{macrocode}
% ^^A ]]] End of subsubsection `$dvi_mode'.
%
% \subsubsection{\texttt{\$pdf\_mode}}^^A [[[ OK (2020-02-01T14:57:55)
% If zero, do NOT generate a pdf version of the document.
%
% If equal to 1, generate a pdf version of the document using pdflatex,
% using the command specified by the \verb|$pdflatex| variable
%
% If equal to 4, generate a pdf version of the document using lualatex,
% using the command specified by the \verb|$lualatex| variable.
% \mycite[keyword=\texttt{\$pdf\_mode}]{latexmk}.
%    \begin{macrocode}
%<.latexmkrc>$pdf_mode = 4;
%    \end{macrocode}
% ^^A ]]] End of subsubsection `$pdf_mode'.
%
% \subsubsection{\texttt{\$postscript\_mode}}^^A [[[ OK (2020-02-01T15:01:50)
% If nonzero, generate a postscript version of the document
% \mycite[keyword=\texttt{\$postscript\_mode}]{latexmk}.
%    \begin{macrocode}
%<.latexmkrc>$postscript_mode = 0;
%    \end{macrocode}
% ^^A ]]] End of subsubsection `$postscript_mode'.
%
% ^^A ]]] End of subsection `postscript_mode, dvi_mode'.
%
% \subsection{\texttt{\$preview\_mode}}^^A [[[
% If nonzero, run a previewer to preview the document \mycite[keyword=\texttt{\$preview\_mode}]{latexmk}.
%    \begin{macrocode}
%<.latexmkrc>$preview_mode = 1;
%    \end{macrocode}
% ^^A ]]] End of subsection `$preview_mode'.
%
% \subsection{\texttt{\$pdf\_previewer}*}^^A [[[
% The command to invoke a pdf-previewer \mycite[keyword=\texttt{\$pdf\_previewer}]{latexmk}.
%
% \verb|latexmk -c|は不要なファイルを消すため．
%
% \verb|evince|を最後に持ってこないとcleanしてくれない．
%    \begin{macrocode}
%<*.latexmkrc>
% $pdf_previewer = "start evince %S";
% $pdf_previewer = "evince %S &; latexmk -c %S; rm temp.bib";
$pdf_previewer = "latexmk -c %S; rm temp.bib; evince %S &";
%</.latexmkrc>
%    \end{macrocode}
% ^^A ]]] End of subsection `$pdf_previewer'.
%
% ^^A ]]] End of section `Implementation'.
%
% ^^A ]]] End of part `.latexmkrc'.
