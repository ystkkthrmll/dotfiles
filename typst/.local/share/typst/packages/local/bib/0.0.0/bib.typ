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

#let read-bib(
  style: "ieee",
) = {
  bibliography("bib.yaml", style: style)
}
