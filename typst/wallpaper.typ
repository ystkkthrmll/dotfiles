
#set page(
  width: 750pt,
  height: 520pt,
  fill: rgb("000000"),
  // fill: color("black"),
  margin: (x: 5pt, y: 60pt),
)

#set text(
  7.5pt,
  // 8pt,
  // 9pt,
  // 10pt,
  fill: rgb("ffffff"),
  // font: "IPAexGothic",
  // font: "IPAexMincho",
  font: "Noto Sans Osmanya",
)

#show heading: set block(
  above: 5pt,
  below: 1pt,
)

#let ROW-GUTTER = -5pt

#let data = yaml("wallpaper.yaml")

#grid(
  columns: (265pt, 250pt, 250pt),
  rows: auto,
  gutter: -3pt,

  // First column
  rect[
    // Ubuntu
    = #data.at(0).section

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,

      ..for datum in data.at(0).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Terminal
    = #data.at(1).section

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,

      ..for datum in data.at(1).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Google Chrome
    = #data.at(2).section





    /*
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
        row-gutter: ROW-GUTTER,
        stroke: none,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )
    ],

    // Second column
    rect[
      = Visual Studio Code

      #let data = (
        (cmd: [`Ctrl`+`B`], desc: [Toggle sidebar visibility]), // [keyboard-shortcuts-linux.pdf](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
        (cmd: [`Ctrl`+`Enter`], desc: [Open to the side]), // https://code.visualstudio.com/docs/getstarted/userinterface#_side-by-side-editing
        (cmd: [`Ctrl`+`Tab`], desc: [Change tabs]), // https://stackoverflow.com/questions/38957302/is-there-a-quick-change-tabs-function-in-visual-studio-code
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
        row-gutter: ROW-GUTTER,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )

      = Vim

      #let data = (
        (cmd: [`vim -d file1 file2`], desc: [view the differeces]), // http://vimdoc.sourceforge.net/htmldoc/diff.html
        (cmd: [`zA`], desc: [open fold recursivly]),
        // (cmd: [`zf`], desc: [create fold]),
        (cmd: [`$`], desc: [cursor to the end of `N` lines next line]),
        (cmd: [`gg`], desc: [cursor to the first line]),
        (cmd: [`G`], desc: [cursor to the last line]),
        (cmd: [`A`], desc: [append text after the end of the line]),
        (cmd: [`x`], desc: [delete character]),
        (cmd: [`Ctrl`+`F`], desc: [scroll `N` screens Forward]),
        (cmd: [`Ctrl`+`B`], desc: [scroll `N` screens Backwards]),
        (cmd: [`%`], desc: [find the next bracket and go to its match]),
        (cmd: [`Ctrl+Shift+V`], desc: [start blockwide Visual mode]),
        (cmd: [`cc`], desc: [delete line and start insert]),
        // (cmd: [`R`], desc: [enter replace mode]),
        (cmd: [`u`], desc: [undo changes]),
        (cmd: [`Ctrl`+`R`], desc: [redo changes which were undone with '`u`']),
        (cmd: [`:sp[lit]`], desc: [split current window]),
        (cmd: [`Shift`+`Insert`], desc: [paste clipboard]),
        (cmd: [`/xxx<CR>`], desc: [search forward for `xxx`]),
        (cmd: [`:%s/X/Y/gc`], desc: [all X $->$ Y]), // cf. http://qiita.com/shirochan/items/a16487d0739f455b5e8a
        (cmd: [`:4,9s/X/Y/gc`], desc: [4-9 line X $->$ Y]), // cf. http://qiita.com/shirochan/items/a16487d0739f455b5e8a
        // (cmd: [`Ctrl+X Ctrl+K`], desc: []),
        (cmd: [`Ctrl`+`]`], desc: [jump to the subject]),
        (cmd: [`Ctrl`+`O`], desc: [jump back]),
        (cmd: [`gx`], desc: [open URL in browser]), //  https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
        (cmd: [`visual mode + <>`], desc: [indentの深さ変更]), // https://linuxhint.com/tab-multiple-lines-vim/
        (cmd: [`:map`], desc: [list all key mappings]), // cf. map.txt 1.1 MAP COMMANDS
      )

      #table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,

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
        (cmd: [`git init`/`git clone <repository>`], desc: [xxx]),
        (cmd: [`git add <pathspec>`], desc: [xxx]),
        (cmd: [`git commit -m "msg"`], desc: [xxx]),
        (cmd: [`git remote add origin <url>`], desc: [xxx]),
        (cmd: [`git push -u origin master`], desc: []),
      )

      #table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )

      == After that

      #let data = (
        (cmd: [(`git pull origin master`)], desc: [xxx]),
        (cmd: [`git commit <pathspec>`], desc: [xxx]),
        (cmd: [`git push`], desc: [xxx]),
      )

      #table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )

      == Switch branch

      #let data = (
        (cmd: [(`git branch -a`)], desc: [xxx]),
        (cmd: [`git checkout <branch>`], desc: [xxx]),
      )

      #table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )

      == Merge

      #let data = (
        (cmd: [`git checkout <(main) branch>`], desc: [xxx]),
        (cmd: [`git merge <(sub) branch>`], desc: [xxx]),
        (cmd: [`git push origin <(main) branch>`], desc: [xxx]),
      )

      #table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,
        stroke: none,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )

      == Tagging

      #let data = (
        (cmd: [`git tag -a <tagname>`], desc: [xxx]), // ref: `$ git help tag`
        (cmd: [`git push origin <tagname>`], desc: [xxx]), // https://qiita.com/growsic/items/ed67e03fda5ab7ef9d08#tag%E3%81%AE%E5%85%B1%E6%9C%89
      )

      #table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,
        stroke: none,

        ..for datum in data {
          (datum.at("cmd"), datum.at("desc"))
        }
      )

      = Misc

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


      */

  ],
)
