
#set page(
  width: 750pt,
  height: 520pt,
  fill: rgb("000000"),
  // fill: color("black"),
  margin: (x: 5pt, y: 60pt),
)

#set text(
  8pt,
  // 9pt,
  // 10pt,
  fill: rgb("ffffff"),
  // font: "IPAexGothic",
  // font: "IPAexMincho",
  font: "Noto Sans Osmanya",
)

// - Refs
//   - https://help.ubuntu.com/stable/ubuntu-help/shell-keyboard-shortcuts.html.en

#grid(
  columns: (265pt, 250pt, 250pt),
  rows: auto,
  gutter: -3pt,

  // First column
  rect[
    = Ubuntu

    #let data = (
      (cmd: [`Shift`+`Super`+$arrow.l$], desc: [move the current window one monitor to the left]), // \href{https://help.ubuntu.com/stable/ubuntu-help/shell-keyboard-shortcuts.html.en}{Useful keyboard shortcuts}
      (cmd: [`Shift`+`Super`+$arrow.r$], desc: [move the current window one monitor to the right]),
      (cmd: [`Alt`+`Prnt Scrn`], desc: [Take a screenshot of a window]), // \href{https://help.ubuntu.com/stable/ubuntu-help/shell-keyboard-shortcuts.html.en}{Useful keyboard shortcuts}
      (cmd: [`Shift`+`Prnt Scrn`], desc: [Take a screenshot of an area of the screen]),
      (cmd: [`Ctrl`+`Alt`+`Delete`], desc: [Show the Power Off / Restart dialog]),
      (cmd: [`Ctrl`+`Super`+`D`], desc: [Minimise all windows]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    = Terminal

    #let data = (
      // \verb|Ctrl+L|, \verb|Ctrl+Z|, \verb|Ctrl+C|
      // #link("http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html")[参照先]
      (cmd: [`grep -nr <patterns>`], desc: [print lines that match patterns]),
      (cmd: [`cd -`], desc: [Go back to previous directory]), // https://superuser.com/questions/113219/go-back-to-previous-directory-in-shell
      (cmd: [`~hash`], desc: [cd (hash)]),
      (cmd: [`Ctrl`+`T`], desc: [New Terminal in New Tab]),
      (cmd: [`Ctrl`+`→`], desc: [Switch to Next Terminal]),
      (cmd: [`Ctrl`+`←`], desc: [Switch to Previous Terminal]),
      (cmd: [`Ctrl`+`W`], desc: [Close Terminal]),
      (cmd: [`Ctrl`+`Q`], desc: [Close All Terminals]),
      (cmd: [`Ctrl`+`C`], desc: [Copy]),
      (cmd: [`Ctrl`+`V`], desc: [Paste]),
      (cmd: [`Ctrl`+`L`], desc: [Clear screen]),
      (cmd: [`Ctrl`+`Z`], desc: [Suspend/stop current foreground process]),
      (cmd: [`Ctrl`+`C`], desc: [Terminate/kill current foreground process]),
      (cmd: [`F11`], desc: [Full Screen]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    = Google Chrome

    #let data = (
      // \href{https://support.google.com/chrome/answer/157179?hl=en-GB}{Chrome keyboard shortcuts}
      (cmd: [`Ctrl`+`t`], desc: [Open a new tab, and jump to it]),
      (cmd: [`Ctrl`+`Tab`], desc: [Jump to the next open tab]),
      (cmd: [`Ctrl`+`Shift`+`Tab`], desc: [Jump to the previous open tab]),
      (cmd: [`Alt`+`Home`], desc: [Open your home page in the current tab]),
      (cmd: [`Alt`+`←`], desc: [Open the previous page from your browsing history in the current tab]),
      (cmd: [`Ctrl`+`w`], desc: [Close the current tab]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )
  ],

  // Second column
  rect[
    = Visual Studio Code

    #let data = (
      (cmd: [`Ctrl`+`B`], desc: [hide explorer]), // https://superuser.com/questions/1569067/how-to-close-explorer-via-shortcut-in-vs-code     % https://stackoverflow.com/questions/37815472/vscode-keybinding-to-hide-explorer
      (cmd: [`Ctrl`+`Enter`], desc: [Open to the side]), // https://code.visualstudio.com/docs/getstarted/userinterface#_side-by-side-editing
      (cmd: [`Ctrl+Tab`], desc: [Change tabs]), // https://stackoverflow.com/questions/38957302/is-there-a-quick-change-tabs-function-in-visual-studio-code
      (cmd: [`F12`], desc: [Go to definition]), // https://code.visualstudio.com/docs/editing/editingevolved#_go-to-definition
      (cmd: [`Ctrl`+`F12`], desc: [Go to implementation]), // https://code.visualstudio.com/docs/editing/editingevolved#_go-to-implementation
      (cmd: [`Ctrl`+`M`], desc: [Move (custom)]),
      (cmd: [`Ctrl`+`E`], desc: [Explorer (custom)]),
      (cmd: [`Ctrl`+`C`], desc: [Collapse (custom)]),
      (cmd: [`Ctrl`+`O`], desc: [Outline (custom)]),
      (cmd: [`Ctrl`+`T`], desc: [Terminal (custom)]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    = Vim

    #let data = (
      (cmd: [`Ctrl`+`B`], desc: [hide explorer]),
      (cmd: [`vim -d file1 file2`], desc: [view the differeces]), // http://vimdoc.sourceforge.net/htmldoc/diff.html
      (cmd: [`zA`], desc: [open fold recursivly]),
      // (cmd: [`zf`], desc: [create fold]),
      (cmd: [`$`], desc: [cursor to the end of `N` lines next line]),
      (cmd: [`gg`], desc: [cursor to the first line]),
      (cmd: [`G`], desc: [cursor to the last line]),
      (cmd: [`A`], desc: [append text after the end of the line]),
      (cmd: [`x`], desc: [delete character]),
      (cmd: [`Ctrl+F`], desc: [scroll `N` screens Forward]),
      (cmd: [`Ctrl+B`], desc: [scroll `N` screens Backwards]),
      (cmd: [`%`], desc: [find the next bracket and go to its match]),
      (cmd: [`Ctrl+Shift+V`], desc: [start blockwide Visual mode]),
      (cmd: [`cc`], desc: [delete line and start insert]),
      // (cmd: [`R`], desc: [enter replace mode]),
      (cmd: [`u`], desc: [undo changes]),
      (cmd: [`Ctrl+R`], desc: [redo changes which were undone with '`u`']),
      (cmd: [`:sp[lit]`], desc: [split current window]),
      (cmd: [`Shift+Insert`], desc: [paste clipboard]),
      (cmd: [`/xxx<CR>`], desc: [search forward for `xxx`]),
      (cmd: [`:\%s/X/Y/gc`], desc: [all X $\to$ Y]), // cf. http://qiita.com/shirochan/items/a16487d0739f455b5e8a
      (cmd: [`:4,9s/X/Y/gc`], desc: [4-9 line X $\to$ Y]), // cf. http://qiita.com/shirochan/items/a16487d0739f455b5e8a
      // (cmd: [`Ctrl+X Ctrl+K`], desc: []),
      (cmd: [`Ctrl`+`]`], desc: [jump to the subject]),
      (cmd: [`Ctrl`+`O`], desc: [jump back]),
      (cmd: [`gx`], desc: [open URL in browser]), //  https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
      (cmd: [`visual mode + <>`], desc: [indentの深さ変更]), // https://linuxhint.com/tab-multiple-lines-vim/
      (cmd: [`:!texdoc`], desc: []),
      (cmd: [`:map`], desc: [list all key mappings]), // cf. map.txt 1.1 MAP COMMANDS
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )
  ],

  // Third column
  rect[
    = Git

    == First time

    // - The origin of "first time", "after that"
    //   - #link("https://eikaiwa.dmm.com/uknow/questions/72040/")[初回って英語でなんて言うの？]

    #let data = (
      (cmd: [`git init`/`git clone <repository>`], desc: [xxxxx]),
      (cmd: [`git add <pathspec>`], desc: [xxxxx]),
      (cmd: [`git commit -m "msg"`], desc: [xxxxx]),
      (cmd: [`git remote add origin <url>`], desc: [xxxxx]),
      (cmd: [`git push -u origin master`], desc: []),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    == After that

    #let data = (
      (cmd: [(`git pull origin master`)], desc: [xxxxx]),
      (cmd: [`git commit <pathspec>`], desc: [xxxxx]),
      (cmd: [`git push`], desc: [xxxxx]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    == Switch branch

    #let data = (
      (cmd: [(`git branch -a`)], desc: [xxxxx]),
      (cmd: [`git checkout <branch>`], desc: [xxxxx]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    == Merge

    #let data = (
      (cmd: [`git checkout <(main) branch>`], desc: [xxxxx]),
      (cmd: [`git merge <(sub) branch>`], desc: [xxxxx]),
      (cmd: [`git push origin <(main) branch>`], desc: [xxxxx]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    == Tagging

    #let data = (
      (cmd: [`git tag -a <tagname>`], desc: [xxxxx]), // ref: `$ git help tag`
      (cmd: [`git push origin <tagname>`], desc: [xxxxx]), // https://qiita.com/growsic/items/ed67e03fda5ab7ef9d08#tag%E3%81%AE%E5%85%B1%E6%9C%89
    )

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: -4pt,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )

    = Notes

    - Notes
      - 注意事項/意識すべき点
        - 予定確認（時間意識）
        - 目的意識（Flow 5W1H）
        - 後工程はお客様
        - 付加価値
      - 改善点・不満点など，気づいた点ないか？
      - 改善点など自己分析
    - Tips
      - Document Viewer Keyboard Shortcuts
        - Open PDF file > File options > Keyboard Shortcuts
      - Screenshot
        - Show Applications → Screenshot
      - `https://******/#:~:text=***`
        - Space: `%20`
      - Space > `%20`
        - Visual modeで置換範囲を選択
        - `:` を押下
        - `:'<,'>s/ /%20/gc`

  ],
)
