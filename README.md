# dotfiles

> [!NOTE]
>
> - The origin of "dotfiles"
>   - [dotfiles · GitHub Topics](https://github.com/topics/dotfiles)
>   - [GitHub does dotfiles - dotfiles.github.io](https://dotfiles.github.io/)
>   - [dotfiles - ArchWiki](https://wiki.archlinux.org/title/Dotfiles)

## Outline

- Purpose: Configuration

## To-do list

- [ ] research zoxide
  - [cdコマンドを強化する zoxide でターミナル操作を快適にする](https://zenn.dev/h_ymt/articles/e4a07ca71fd1cb)
- [ ] @chatgpt[prompt: bash であるディレクトリにすぐに移動するような設定はある？（zsh の hash -d のような）]
- [ ] `evince` なら `.pdf` のみ補完．のようにコマンドごとに補完する拡張子を指定したい
- [ ] `config_desktop.sh`
  - terminal の色を White on black にする設定を追加したい
  - 日時などの format を英語にする設定を追加したい
  - terminal の font 設定を有効にする設定を追加したい
  - 電源の設定を追加したい
  - Display の Refresh Rate, Scale を設定できるようにしたい

## Usage

### Linux

```bash
$ bash setup.sh
```

### Windows

1.  Run PowerShell as an administrator
1.  `> .\xxx.ps1`

## Directory structure

> [!NOTE]
>
> - `~/.gitconfig` ではなく `~/.config/git/config` を採用する理由
>   - XDG Base Directory 規約（Linux デスクトップや近代的な設定管理の標準）に従うため
>   - `$HOME` がすっきりするため
> - [Dotfiles の整頓とバージョン管理：XDG Base Directory Specification と YADM の活用ガイド](https://qiita.com/LuckyWindsck/items/ef8ae12a3450344d8902)

```
dotfiles
├── README.md
├── autostart
│   └── .config/autostart
├── bash
│   ├── config_desktop.sh
│   ├── set_wallpaper.sh
├── git
│   └── .config/git
│       ├── config
│       ├── ignore
│       ├── message
├── gnome-files
│   └── .config/gtk-3.0
│       └── bookmarks
├── pandoc
│   ├── defaults
│   │   ├── common.yaml
│   │   ├── report-from-markdown-to-html.yaml
│   │   ├── report-from-markdown-to-latex.yaml
│   ├── refs
│   │   ├── misc.yaml
├── tex
├── typst
│   ├── bib
│   ├── common
│   ├── math
├── vim
├── visual-studio-code
│   ├── extensions.sh
│   ├── snippets
│   ├── keybindings.json
│   └── settings.json
└── zsh
```

### Autostart

- The origin of "autostart"
  - `~/.config/autostart`
- In your home directory, there's a folder called `.config/autostart`.
  Anything placed in this folder will be run when you login
  - [How to add a program as a startup application from a terminal?](https://askubuntu.com/questions/178567/how-to-add-a-program-as-a-startup-application-from-a-terminal)
- Filename
  - Use hyphens, not underscores, to separate words
    - `/usr/share/applications/google-chrome.desktop`
    - `/usr/share/applications/setup-mozc.desktop`
- [How to add a script to Startup Applications from the command line? [duplicate]](https://askubuntu.com/questions/598195/how-to-add-a-script-to-startup-applications-from-the-command-line)
- Syntax
  - [Application entry](https://wiki.archlinux.org/title/desktop_entries#Application_entry)

### Bash

> [!TIP]
>
> `set_wallpaper.sh` エラー発生時の対処法
>
> 1.  `$ vi /etc/ImageMagick-6/policy.xml`
> 1.  `pdf` の行にある `rights="none"` を `rights="read | write"` に変更
>
> - [参照先](https://askubuntu.com/questions/1081695/error-during-converting-jpg-to-pdf)

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

### TeX

- `texmf/tex`
  - directory名が `tex` でなければならない理由は
    恐らく \href{run:/usr/share/texlive/texmf-dist/web2c/texmf.cnf}{texmf.cnf} の149行目
- `texmf/bibtex/bib`
  - directory名が\verb|bibtex/bib|でなければならない理由は
    恐らく\href{run:/usr/share/texlive/texmf-dist/web2c/texmf.cnf}{texmf.cnf}の234,314行目


### Vim

- The origin of `~/.config/nvim/after/ftplugin/***.vim`
  - \vimhelp[section=3.]{ftplugin-overrule}

### Visual Studio Code

- File location:
  - `keybindings.json`
    - Linux: `$HOME/.config/Code/User/keybindings.json`
    - Windows: `%UserProfile%\AppData\Roaming\Code\User\keybindings.json`
  - `settings.json`
    - Linux: `$HOME/.config/Code/User/settings.json`
    - Windows: `%APPDATA%\Code\User\settings.json`

#### References

- [How to Reset your Keyboard Shortcuts in Visual Studio Code](https://bobbyhadz.com/blog/reset-keyboard-shortcuts-in-vscode)
- [User and workspace settings](https://code.visualstudio.com/docs/configure/settings#_user-settingsjson-location)

## 個人用/仕事用 dotfiles について

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
- [@chatgpt, prompt: 「会社用」と「プライベート用」の `.gitconfig` を使い分けるとき，拡張子は `.work`, `.private` が一般的？ それとも，もっと一般的な拡張子がある？]
  - 会社用：`.gitconfig.work`
  - プライベート用：`.gitconfig.personal`

> [!NOTE]
> Conclusion: work/personal

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
