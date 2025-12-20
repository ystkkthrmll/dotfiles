
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
    #let data = (
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
    == #data.at(5).subsections.at(3).subsection

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,
      stroke: none,

      ..for datum in data.at(5).subsections.at(3).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Tagging
    == #data.at(5).subsections.at(4).subsection

    #table(
      columns: (auto, auto),
      // align: horizon,
      row-gutter: ROW-GUTTER,
      stroke: none,

      ..for datum in data.at(5).subsections.at(4).cmds {
        (eval(datum.cmd, mode: "markup"), datum.desc)
      }
    )

    // Misc
    = #data.at(6).section

    // Notes
    == #data.at(6).subsections.at(0).subsection

    #eval(data.at(6).subsections.at(0).content, mode: "markup")

    // Tips
    == #data.at(6).subsections.at(1).subsection

    #eval(data.at(6).subsections.at(1).content, mode: "markup")
  ],
)
