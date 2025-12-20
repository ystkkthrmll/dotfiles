
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
  columns: (250pt, 250pt, 250pt),
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

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,
      stroke: none,

      ..for datum in data.at(2).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )
  ],

  // Second column
  rect[
    // Visual Studio Code
    = #data.at(3).section

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,
      // stroke: none,

      ..for datum in data.at(3).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Vim
    = #data.at(4).section

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,
      // stroke: none,

      ..for datum in data.at(4).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )



  ],

  /*
  rect[

    #let data = (
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

  ],

  */

  // Third column
  rect[
    // Git

    = #data.at(5).section

    // First time
    // - The origin of "first time", "after that"
    //   - #link("https://eikaiwa.dmm.com/uknow/questions/72040/")[初回って英語でなんて言うの？]
    == #data.at(5).subsections.at(0).subsection

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,

      ..for datum in data.at(5).subsections.at(0).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // After that
    == #data.at(5).subsections.at(1).subsection

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,

      ..for datum in data.at(5).subsections.at(1).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Switch branch
    == #data.at(5).subsections.at(2).subsection

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,

      ..for datum in data.at(5).subsections.at(2).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Merge

  ],


  /*

  rect[
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
)
