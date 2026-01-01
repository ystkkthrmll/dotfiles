#import "@preview/tidy:0.4.3"

#import "common.typ"

#let docs = tidy.parse-module(
  read("common.typ"),
  name: "common",
  scope: (common: common),
  preamble: "#import common: *\n"
)

#tidy.show-module(
  docs,
  // style: styles.minimal,
  style: tidy.styles.default,
)
