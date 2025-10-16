
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
  columns: (260pt, 220pt, 250pt),
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
      // \href{http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html}{参照先}
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
  ],

  // Third column
  rect[
    = Git

    #let data = (
      (cmd: [`git init`], desc: [xxxxx]),
    )

    #table(
      columns: (auto, auto),
      // align: horizon,

      ..for datum in data {
        (datum.at("cmd"), datum.at("desc"))
      }
    )
  ],
)
