#!/usr/bin/env perl
#
# - Notes
#   - `.latexmkrc`lの由来は \href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}}の
#     "CONFIGURATION/INITIALIZATION (RC) FILES" より
#   - 基本的には \href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}} を参考にした．
#   - latexmkの説明は，\href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}}を参照せよ
#     - ``.latexmkrc` で `$cleanup_mode = 2` としても，消してくれなかった．
#     - \verb|$success_cmd = "latexmk -c %S";|としもダメだった．
#
# #region $clean_ext
# Extra extensions of files for latexmk to remove
# when any of the clean-up options (\verb|-c| or \verb|-C|) is selected.
# The value of this variable is a string containing the extensions separated by spaces
# See \mycite[keyword=\texttt{\$clean\_ext}]{latexmk}.
#
#   - `bbl`: 
#   - `listing`: tcolorboxのtcblisting環境などで使われるファイル
#   - `nav`: beamerを使用すると生成されるファイル
#   - `run.xml`:
#   - `snm`: beamerを使用すると生成されるファイル
#   - `synctex.gz`:`
#   - `upa, upb`: `pdfcomment` packageを使用すると出力されるファイル
#
$clean_ext = "bbl listing nav run.xml snm synctex.gz upa upb";
# #endregion $clean_ext
#
# #region makeindex
# The index processing program.
#
# なぜかこれを設定するとエラーが起きる．
#
# $makeindex = "mendex %O %S";
# #endregion makeindex
#
# #region $pdflatex
# The LaTeX processing program in a version that makes a pdf file instead of a dvi file.
#
# \verb|luajittex --fmt=luajitlatex.fmt| については \url{https://texwiki.texjp.org/?LuaJITTeX} を参照．
# \verb/-shell-escape/ は minted package を使う上で必要（\verb|texdoc minted|）．
#
# \verb|$ sudo apt update| したら，なぜかluajittexでエラーになった（2017/07/16）．
# なので（一時的に？）\verb|$pdflatex = "lualatex"|にする．
#
# \bashinline{lualatex}の由来\urlref{https://texwiki.texjp.org/?LaTeX%E5%85%A5%E9%96%80%2F%E7%99%BA%E5%B1%95%E7%B7%A8#t7eebe4c}{発展編：最近の LaTeX の動向}
#
#$pdflatex = "luajittex --fmt=luajitlatex.fmt -shell-escape %O %S";
#$pdflatex = "lualatex -shell-escape %O %S";
$lualatex = "lualatex -shell-escape %O %S";
# #endregion $pdflatex
#
# #region $bibtex
$bibtex = "bibtex %O %S";
# #endregion $bibtex
#
# #region $dvi_mode
# If nonzero, generate a dvi version of the document \mycite[keyword=\texttt{\$dvi\_mode}]{latexmk}.
#
$dvi_mode = 0;
# #endregion $dvi_mode
#
# #region $pdf_mode
# If zero, do NOT generate a pdf version of the document.
#
# If equal to 1, generate a pdf version of the document using pdflatex,
# using the command specified by the \verb|$pdflatex| variable
#
# If equal to 4, generate a pdf version of the document using lualatex,
# using the command specified by the \verb|$lualatex| variable.
# \mycite[keyword=\texttt{\$pdf\_mode}]{latexmk}.
#
$pdf_mode = 4;
# #endregion $pdf_mode
#
# #region $postscript_mode
# If nonzero, generate a postscript version of the document
# \mycite[keyword=\texttt{\$postscript\_mode}]{latexmk}.
#
$postscript_mode = 0;
# #endregion $postscript_mode
#
# #region $preview_mode
# If nonzero, run a previewer to preview the document \mycite[keyword=\texttt{\$preview\_mode}]{latexmk}.
#
$preview_mode = 1;
# #endregion $preview_mode
#
# #region $pdf_previewer
# The command to invoke a pdf-previewer \mycite[keyword=\texttt{\$pdf\_previewer}]{latexmk}.
#
# `latexmk -c` は不要なファイルを消すため．
#
# \verb|evince|を最後に持ってこないとcleanしてくれない．

# $pdf_previewer = "start evince %S";
# $pdf_previewer = "evince %S &; latexmk -c %S; rm temp.bib";
$pdf_previewer = "latexmk -c %S; rm temp.bib; evince %S &";
# ^^A ]]] End of subsection `$pdf_previewer'.