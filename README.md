# dotfiles

> [!NOTE]
>
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
├── git
│   ├── .gitconfig
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

### Visual Studio Code

- File location:
  - Linux: `$HOME/.config/Code/User/keybindings.json`
  - Windows: `%UserProfile%\AppData\Roaming\Code\User\keybindings.json`

#### References

- [How to Reset your Keyboard Shortcuts in Visual Studio Code](https://bobbyhadz.com/blog/reset-keyboard-shortcuts-in-vscode)

## 個人用/仕事用 config-files について

### Naming

候補

- メイン・サブ
  - どちらが main かがわかりづらいため不採用
  - main の対義語がサブか怪しい
- プライベート・仕事
  - 仕事でも個人的にしか使用しないため適切ではない
- 1, 2, 3, ...
  - 対応関係を覚えておく必要がある
- 自宅・会社
  - これを採用する
- [@chatcpt, prompt: 「会社用」と「プライベート用」の `.gitconfig` を使い分けるとき，拡張子は `.work`, `.private` が一般的？ それとも，もっと一般的な拡張子がある？]
  - 会社用：`.gitconfig.work`
  - プライベート用：`.gitconfig.personal`

> [!NOTE]
> Conclusion: work/personal

### English

- 自宅
  - home/house
    - \href{https://eikaiwa.dmm.com/uknow/questions/87456/}{自宅って英語でなんて言うの？}
    - \mycite[keyword=自宅]{weblio}
    - \href{https://nativecamp.net/blog/20210712english}{HomeとHouseの違いは？ 各々に使う前置詞の違いや英語表現とは}
    - \href{https://bookclub.japantimes.co.jp/news/n22474.html}{Ｑ５１： house と home はどちらも｢家」ですが、どう違いますか？}
- 会社
  - company/corporation/office/firm
    - \href{https://eikaiwa.dmm.com/uknow/questions/36366/}{会社って英語でなんて言うの？}
  - office
    - \href{https://shinuwakaeng.com/kihontango-company-office}{【1分でわかる】company/officeの違い【会社を意味する単語】}
    - \href{https://english.sanachan.com/how-native-uses/company-office-enterprise-firm}{会社「company / office / enterprise / firm」の違い}
    - \href{https://nakabayashikumiko.com/job-office-work-company/}{job, office, work, company の違い【間違い多発】}

## Implementation

- \verb|latex|
  - \verb|wallpaper.tex|
    - \verb|wallpaper-home.tex|, \verb|wallpaper-office.tex|をそれぞれ作成する
      - それぞれで内容が全く異なるため
- \verb|miscellaneous|
  - \verb|bookmark|
    - \verb|bookmark.home|/\verb|bookmark.office|を作成し，symlink 時に適切な方を選択する
      - \verb|bookmark|ファイル内で自宅用・会社用の切り替えができないため
  - \verb|.gitconfig|
    - \verb|.gitconfig.home|/\verb|.gitconfig.office|を作成し，symlink 時に適切な方を選択する
      - \verb|.gitconfig|ファイル内で自宅用・会社用の切り替えができないため
- \verb|shell|
  - \verb|.zshrc|
    - \verb|.zshrc|内で自宅用・会社用の切り替えをする
