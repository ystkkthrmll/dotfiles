////// error: multiple bibliographies are not yet supported

/*
#let read-bib(
  filenames: array,
  ///// style: "ieee",
) = {
  for filename in filenames {
    // bibliography(filename, style: style)
    bibliography(filename, style: "ieee")
  }
}
*/

#let bibs = (
  computer: "computer.yaml",
  english: "english.yaml",
  math: "math.yaml",
)

///
/// - The origin of "srcs"
///   - #link("https://typst.app/docs/reference/model/bibliography/")[Bibliography Function – Typst Documentation]
#let read-bib(
  /// Sources.
  srcs,
  style: "ieee",
) = {
  let srcs_array = ()

  for src in srcs {
    srcs_array.push(bibs.at(src))
  }
  // bibliography(("computer.yaml", "math.yaml"), style: style)
  bibliography(srcs_array, style: style)
}
