
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
  columns: (250pt, 230pt, 250pt),
  rows: auto,
  gutter: -3pt,

  // First column
  rect(
    for i in range(3) {
      [= #data.at(i).section]

      table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,
        stroke: none,

        ..for datum in data.at(i).cmds {
          (eval(datum.cmd, mode: "markup"), datum.desc)
        }
      )
    },
  ),

  // Second column
  rect(
    for i in range(3, 5) {
      [= #data.at(i).section]

      table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,

        ..for datum in data.at(i).cmds {
          (eval(datum.cmd, mode: "markup"), eval(datum.desc, mode: "markup"))
        }
      )
    },
  ),

  // Third column
  rect[
    // Git
    = #data.at(5).section

    #for i in range(5) {
      [== #data.at(5).subsections.at(i).subsection]

      table(
        columns: (auto, auto),
        // align: horizon,
        row-gutter: ROW-GUTTER,
        stroke: none,

        ..for datum in data.at(5).subsections.at(i).cmds {
          ([`$ `] + eval(datum.cmd, mode: "markup"), datum.desc)
        }
      )
    }

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
