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
├── gnome-files
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
    ├── extensions.sh
    ├── snippets
    ├── keybindings.json
    └── settings.json
```

### Git

- About `.gitconfig`
  - Git's configuration files are all simple text files in the style of `.ini` files.
    They record various choices and settings used by many Git commands
    @version-control-with-git[page: 28].
  - `~/.gitconfig`
    User-specific configuration settings manipulated with the `--global` option
    \mycite[page=28]{version-control-with-git}.
  - `~/.gitconfig` or `~/.config/git/config` file:
    Values specific personally to you, the user.
    You can make Git read and write to this file specifically by passing the `--global` option,
    and this affects \emph{all} of the repositories you work with on your system
    \urlref{https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup}{1.6 Getting Started - First-Time Git Setup}.
- About `.gitignore`
  - You can also create a global \verb|.gitignore| file,
    which is a list of rules for ignoring files in _every_ Git repository on your computer.
    For example, you might create the file at \verb|~/.gitignore_global| and add some rules to it
    \urlref{https://help.github.com/en/github/using-git/ignoring-files#create-a-global-gitignore}{Create a global .gitignore}.
  - `.gitignore_global` とは，
    Git で管理する全てのフォルダに適用される `.gitignore` のようなファイルです．
    このファイルを作成して，常に無視したいファイルを追記することで Git の管理下から除外できます%
    \urlref{https://qiita.com/pira/items/dd67077c5b414c8eb59d#gitignore_global%E3%81%A8%E3%81%AF}{gitignoreglobalを作成する on OSX}．

### GNOME files

- The origin of "gnome files"
  - [Files – Apps for GNOME](https://apps.gnome.org/en/Nautilus/)
  - [GNOME Files - Wikipedia](https://en.wikipedia.org/wiki/GNOME_Files)
  - [GNOME/Files](https://wiki.archlinux.org/title/GNOME/Files)
- Notes
  - `Ctrl` + `D` add to sidebar
    - [Create a link to a folder on the left panel of Nautilus file manager?](https://askubuntu.com/questions/83118/create-a-link-to-a-folder-on-the-left-panel-of-nautilus-file-manager)
  - Remove folders from the places sidebar
    - [Remove folders from the places sidebar](https://wiki.archlinux.org/index.php/GNOME/Files#Remove_folders_from_the_places_sidebar)

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
