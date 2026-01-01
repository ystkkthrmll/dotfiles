#import "@preview/tidy:0.4.3"

#import "math.typ"

#let docs = tidy.parse-module(
  read("math.typ"),
  name: "math",
  scope: (math: math),
  preamble: "#import math: *\n"
)

#tidy.show-module(
  docs,
  // style: tidy.styles.minimal,
  style: tidy.styles.default,
)
