///
/// Set the title, authors, and abstract.
///
/// config
/// - Ref: #link("https://typst.app/docs/tutorial/making-a-template/#named-arguments")[Templates with named arguments]
/// - Ref: #link("https://kumaroot.readthedocs.io/ja/latest/typst/typst-text.html")[本文したい（#text）]
///
#let config(
  title: none,
  authors: (),
  abstract: [],
  lang: "ja",
  font: (
    normal: "IPAexMincho",
    // normal: "IPAMincho",
    // normal: "Noto Serif CJK JP",
    // normal: "Noto Sans CJK JP",
    // normal: "New Computer Modern",
    // normal: "New Computer Modern Math",
    strong: "IPAexGothic",
    // strong: "IPAGothic",
    size: 10pt,
  ),
  doc,
) = {
  // Set and show rules from before.
  // ...

  set text(
    lang: lang,
    font: font.normal,
    size: font.size,
  )
  show strong: set text(font: font.strong)

  // Set heading
  set heading(numbering: "1.1")

  // Set title
  set document(title: title)
  align(center, text(size: 17pt, title))

  // Set authors
  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #author.affiliation \
      #link("mailto:" + author.email)
    ]),
  )

  // Set abstract
  align(
    center,
    par(justify: false)[
      *Abstract* \
      #abstract
    ]
  )

  // Configure link
  show link: set text(blue)
  show link: strong
  show link: underline

  // Main document
  set align(left)
  doc
}

/// = hideable note
/// - Notes:
///   - The origin of "hideable note"
///     - @chatgpt[prompt: "次を英訳して：非表示可能なメモ"]
///     - @chatgpt[prompt: "hideableとconcealableの違いは？"]

// #let hide-note = state("flag", false)
#let hide-note = state("flag", true)

#let hideable-note(
  body,
  fontsize: 8.5pt,
) = {
  context {
    if hide-note.get() {
      rect(fill: gray, radius: 5pt)[
        #set text(fontsize)
        #body
      ]
    }
  }
}


/// term
///
/// ```example
/// #term(english: [sample])[サンプル]
/// ```
///
/// -> content
#let term(
  /// Term. -> content
  term,
  /// English. -> content
  english: none,
  /// Index. -> content
  position: none,
) = {
  if english == none {
    [* #term * ]
  } else {
    [* #term (#english) * ]
  }
}





