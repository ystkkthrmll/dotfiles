
# README

> [!TIP]
>
> - `$ texdoc biblatex-cheatsheet`

## `foo.yaml`

### Template
[@pandoc, [Specifying bibliographic data](https://pandoc.org/MANUAL.html#specifying-bibliographic-data)]
```yaml
---
references:
- type: article-journal
  id: WatsonCrick1953
  author:
  - family: Watson
    given: J. D.
  - family: Crick
    given: F. H. C.
  issued:
    date-parts:
    - - 1953
      - 4
      - 25
  title: 'Molecular structure of nucleic acids: a structure for
    deoxyribose nucleic acid'
  title-short: Molecular structure of nucleic acids
  container-title: Nature
  volume: 171
  issue: 4356
  page: 737-738
  DOI: 10.1038/171737a0
  URL: https://www.nature.com/articles/171737a0
  language: en-GB
...
```

### id の決め方
*   基本的にはタイトルをそのまま\verb|key|にする
    *   著者名は含めない．もし `id` を著者名から始めると著者名を覚えている必要があるし，
        複数人の書籍やWebサイトの場合，困るから．
        *   同じタイトルのものがある場合，著者名を入れる感じか？
    *   日本語タイトルの場合もそのまま日本語で\verb|key|にする
        *   英訳にすることが難しいから
        *   ローマ字表記にはしない．日本語をローマ字表記したものを\verb|key|にすると，
            「おう」\myarrow`\verb|o|', `\verb|ou|', `\verb|oh|'などがあり混乱を招くから
*   大文字と小文字の違いしかない参照は用いてはならない\mycite[page=352]{teach-yourself-latex2e}．
    *   特別な理由がない限り小文字を使用する．理由はいちいちSHIFTキーを押すのが面倒だから
*   なお，\verb|key|はVimでは\verb|Ctrl+x, Ctrl+k|で補完できる
    *   日本語でも問題なく補完できる
*   区切り文字は\doublequotes{\texttt{-}}\texdoc[section=2.1 New BIB\TeX features]{bibtex}

### title
*   bookの場合：裏表紙のところを使用する
*   websiteの場合： **Ctrl+D** したときの Name を使用する

### year
*   数字は\verb|"|で囲まない
    \mycite[page=189]{LaTeX2e美文書作成入門},
    \mycite[page=357]{独習LaTeX2e}







% \section{Computers \& Technology}^^A [[[
%
% \begin{concealableitemize}^^A [[[
% \1 \doublequotes{Computers \& Technology}の由来
%   \2 \urlref{https://www.amazon.com/books-used-books-textbooks/b?ie=UTF8&node=283155}{Amazon.com: Books}
% \end{concealableitemize}^^A ]]]
%
% \subsection{C/C++}^^A [[[
%
% \begin{macro}{pep-7-style-guide-for-c-code'}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='misc',
    key='pep-7-style-guide-for-c-code',
    title='PEP 7 -- Style Guide for C Code',
    url='https://www.python.org/dev/peps/pep-0007/',
    )
%</myreferences.py>
% \end{pythoncode}
% \end{macro}^^A ]]]
%
%
% \subsection{Python}^^A [[[
%
% \begin{macro}{pep-8-style-guide-for-python-code'}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='misc',
    key='pep-8-style-guide-for-python-code',
    title='PEP 8 -- Style Guide for Python Code',
    url='https://www.python.org/dev/peps/pep-0008/',
    )
%</myreferences.py>
% \end{pythoncode}
% \end{macro}^^A ]]]
%
% ^^A ]]] End of subsection `Python'.
%
% \subsection{Machine learning}^^A [[[
%
% \subsubsection{Understanding Machine Learning}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='understanding-machine-learning-from-theory-to-algorithms',
    author='Shai Shalev-Shwartz, Shai Ben-David',
    title='Understanding Machine Learning From Theory To Algorithms',
    publisher='Cambridge University Press',
    year='2014', )
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `Understanding Machine Learning'.
%
% ^^A ]]] End of subsection `Machine learning'.
%
% \subsection{\TeX}^^A [[[
%
% \begin{macro}{latexmk}^^A [[[
%    \begin{macrocode}
%<*reference>
@misc{latexmk,
    title = "LATEXMK",
    howpublished = "\href{run:/usr/share/doc/latexmk/latexmk.pdf}{\texttt{latexmk.pdf}}", }
%</reference>
%    \end{macrocode}
% \end{macro}^^A ]]]
%
% ^^A ]]] End of subsection `\TeX'.
%
% \subsection{Windows}^^A [[[
%
%
%
% \subsubsection{Excel}^^A [[[
%
% \begin{macro}{excel-function-zenjiten}^^A [[[
%
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='excel-function-zenjiten',
    author='羽山博 吉川明広',
    title='できるポケットExcel関数全辞典',
    publisher='株式会社インプレス',
    year='2015', )
%</myreferences.py>
% \end{pythoncode}
% \end{macro}^^A ]]]
%
% \begin{macro}{excel-vba-programming-for-dummies}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
  type='book',
  key='excel-vba-programming-for-dummies',
  author='John Walkenbach',
  title='Excel VBA Programming For Dummies',
  publisher='John Wiley \& Sons, Inc.',
  year='2013',
  edition='3', )
%</myreferences.py>
% \end{pythoncode}
% \end{macro}^^A ]]]
%
% ^^A ]]] End of subsubsection `Excel'.
%
% ^^A ]]] End of subsection `Windows'.
%
% \subsection{etc.}^^A [[[
%
% \subsubsection{pc-jisaku-tune-up-toranomaki-2020}^^A [[[
% 以下の情報は\mycite[page=512]{pc-jisaku-tune-up-toranomaki-2020}
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='pc-jisaku-tune-up-toranomaki-2020',
    author='小川 亨',
    title='PC自作・チューンナップ虎の巻二〇二〇',
    publisher='株式会社インプレス',
    year='2019',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `pc-jisaku-tune-up-toranomaki-2020'.
%
% ^^A ]]] End of subsection `etc.'.
%
% ^^A ]]] End of section `Computers & Technology'.
%
% \section{English}^^A [[[
%
% \begin{concealablenote}^^A [[[
% \doublequotes{English}の由来は自分で決めた（特に変更する必要はないと思う）
% \end{concealablenote}^^A ]]]
%
% \subsection{Dictionary}^^A [[[
% \href{https://en.wikipedia.org/wiki/Comparison_of_English_dictionaries}{ここ}に各辞書が比較さてれいる．
%
% \subsubsection{lexico}^^A [[[
% \href{https://www.lexico.com/about}{About}
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='misc',
    key='lexico',
    title='LEXICO',
    note='powered by OXFORD',
    url='https://www.lexico.com/',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `lexico'.
%
% \subsubsection{oxford-learners-dictionaries}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='misc',
    key='oxford-learners-dictionaries',
    title="Oxford Learner's Dictionaries",# double quotesにしないとエラー
    url='https://www.oxfordlearnersdictionaries.com/',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `oxford-learners-dictionaries'.
%
% \subsubsection{longman}^^A [[[
% \href{https://www.ldoceonline.com/about.html}{About}
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='misc',
    key='longman',
    title='Longman Dictionary of Contemporary English',
    url='http://www.ldoceonline.com/',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `longman'.
%
% \subsubsection{cambridge-dictionary}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='misc',
    key='cambridge-dictionary',
    title='Cambridge Dictionary',
    url='https://dictionary.cambridge.org/',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `cambridge-dictionary'.
%
% \subsubsection{genius}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='genius',
    author='小西 友七',
    title='ジーニアス英和辞典',
    publisher='大修館書店',
    year='2001', )
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `genius'.
%
% \begin{macro}{newbury-house-dictionary}^^A [[[
%    \begin{macrocode}
%<*reference>
@book{newbury-house-dictionary,
	author = "Philip M. Rideout",
	title = "Heinle's Newbury House Dictionary of American English",
	edition = "4",
}
%</reference>
%    \end{macrocode}
% \end{macro}^^A ]]]
%
% ^^A ]]] End of subsection `Dictionary'.
%
% \subsection{Grammar}^^A [[[
%
% \subsubsection{ロイヤル英文法}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='royal-english-grammar',
    author='綿貫 陽，宮川 幸久',
    title='徹底例解ロイヤル英文法',
    publisher='旺文社', )
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `ロイヤル英文法'.
%
% \begin{macro}{maintop}^^A [[[
%    \begin{macrocode}
%<*reference>
@book{maintop,
	author = "生田 友七",
	title = "MAINTOP総合英語",
	publisher = "山口書店",
	year = 2007,
	note = "南山大学外国語学部英米学科卒業", }
%</reference>
%    \end{macrocode}
% \end{macro}^^A ]]]
%
%
%
%
% ^^A ]]] End of subsection `Grammar'.
%
% \subsection{Wordbook}^^A [[[
%
% \begin{concealablenote}^^A [[[
% \doublequotes{wordbook} \urlref{https://eikaiwa.dmm.com/uknow/questions/63183/}{単語帳って英語でなんて言うの？}
% \end{concealablenote}^^A ]]]
%
% \subsubsection{単語王}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='tangoou-2202',
    author='中澤 一',
    title='単語王2202',
    publisher='株式会社 オー・メソッド出版', )
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsubsection `単語王'.
%
%
%
%
%
% ^^A ]]] End of subsection `Wordbook'.
%
% ^^A ]]] End of section `English'.
%
% \section{Business}^^A [[[
% \doublequotes{Business}の由来はAmazon.com: Booksより．
%
% \subsection{businessdou-life}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='businessdou-life',
    author='内山 早苗',
    title='{\\small 新社会人基本}Newビジネス道PLUS「体」',
    publisher='株式会社 日本能率協会マネジメントセンター',
    year='2016',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsection `businessdou-life'.
%
% \subsection{businessdou-mind}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='businessdou-mind',
    author='内山 早苗',
    title='{\\small 新社会人基本}Newビジネス道PLUS「心」',
    publisher='株式会社 日本能率協会マネジメントセンター',
    year='2016',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsection `businessdou-mind'.
%
% \subsection{businessdou-skill}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='businessdou-skill',
    author='内山 早苗',
    title='{\\small 新社会人基本}Newビジネス道PLUS「技」',
    publisher='株式会社 日本能率協会マネジメントセンター',
    year='2016',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsection `businessdou-skill'.
%
% \subsection{中堅社員研修}^^A [[[
% \begin{pythoncode}
%<*myreferences.py>
add_ref(
    type='book',
    key='中堅社員研修',
    title='中堅社員研修',
    publisher='日本能率協会マネジメントセンター',)
%</myreferences.py>
% \end{pythoncode}
% ^^A ]]] End of subsection `中堅社員研修'.
%
% ^^A ]]] End of section `Business'.
%
%    \begin{macrocode}
%<*reference>
@book{mechanics-of-materials,
    author = "日本機械学会",
    title = "材料力学",
    publisher = "日本機械学会",
    year = 2016 }
%</reference>
%    \end{macrocode}
%
%
%
%
% ^^A ]]] End of part `myreferences.py'.
%
