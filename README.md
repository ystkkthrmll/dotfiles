# dotfiles

> [!NOTE]
> - The origin of "dotfiles"
>   - [dotfiles · GitHub Topics](https://github.com/topics/dotfiles)
>   - [GitHub does dotfiles - dotfiles.github.io](https://dotfiles.github.io/)

## Outline

- Purpose: Configuration

## Usage

```bash
$ bash setup.sh
```

## Directory structure
```
dotfiles
├── README.md
├── pandoc
│   ├── defaults
│   │   ├── common.yaml
│   │   ├── report-from-markdown-to-html.yaml
│   │   ├── report-from-markdown-to-latex.yaml
│   ├── refs
│   │   ├── misc.yaml
├── typst
│   ├── bib
│   ├── common
│   ├── math
└── visual-stadio-code
    ├── snippets
    ├── keybindings.json
    └── settings.json
```

## 自宅用/会社用config-filesについて

### Naming
候補
* メイン・サブ
  * mainの対義語がサブか怪しい
* プライベート・仕事
  * 仕事でも個人的にしか使用しないため適切ではない
* 1, 2, 3, ...
  * 対応関係を覚えておく必要がある
* 自宅・会社
  * これを採用する

### English
* 自宅
  * home/house
    * \href{https://eikaiwa.dmm.com/uknow/questions/87456/}{自宅って英語でなんて言うの？}
    * \mycite[keyword=自宅]{weblio}
    * \href{https://nativecamp.net/blog/20210712english}{HomeとHouseの違いは？ 各々に使う前置詞の違いや英語表現とは}
    * \href{https://bookclub.japantimes.co.jp/news/n22474.html}{Ｑ５１： houseとhomeはどちらも｢家」ですが、どう違いますか？}
* 会社
  * company/corporation/office/firm
    * \href{https://eikaiwa.dmm.com/uknow/questions/36366/}{会社って英語でなんて言うの？}
  * office
    * \href{https://shinuwakaeng.com/kihontango-company-office}{【1分でわかる】company/officeの違い【会社を意味する単語】}
    * \href{https://english.sanachan.com/how-native-uses/company-office-enterprise-firm}{会社「company / office / enterprise / firm」の違い}
    * \href{https://nakabayashikumiko.com/job-office-work-company/}{job, office, work, companyの違い【間違い多発】}

> [!NOTE]
> Conclusion: home/office

## Implementation

\begin{myitemize}
\1 \verb|latex|
	\2 \verb|wallpaper.tex|
		\3 \verb|wallpaper-home.tex|, \verb|wallpaper-office.tex|をそれぞれ作成する
			\4 それぞれで内容が全く異なるため
\1 \verb|miscellaneous|
	\2 \verb|bookmark|
		\3 \verb|bookmark.home|/\verb|bookmark.office|を作成し，symlink時に適切な方を選択する
			\4 \verb|bookmark|ファイル内で自宅用・会社用の切り替えができないため
	\2 \verb|.gitconfig|
		\3 \verb|.gitconfig.home|/\verb|.gitconfig.office|を作成し，symlink時に適切な方を選択する
			\4 \verb|.gitconfig|ファイル内で自宅用・会社用の切り替えができないため
\1 \verb|shell|
	\2 \verb|.zshrc|
		\3 \verb|.zshrc|内で自宅用・会社用の切り替えをする
\end{myitemize}

