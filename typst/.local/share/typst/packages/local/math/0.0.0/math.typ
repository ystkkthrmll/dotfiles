/// Import packages
#import "@preview/equate:0.3.2": equate
#import "@preview/thmbox:0.3.0": *

/// Configure
///
/// - Updated: 2026-01-01T20:04:17
///
#let config(
  equation-numbering: "(1.1.1)",
  supplement: "Eq.",
  /// supplement: "式",
  number-mode: "label",
  doc,
) = {
  set math.equation(
    numbering: numbering.with(equation-numbering),
    supplement: supplement,
  )

  show: equate.with(
    breakable: true,
    sub-numbering: true,
    number-mode: number-mode,
  )

  show: thmbox-init()

  let emptyset = $text(font: "Fira Sans", nothing)$

  doc
}

/// Definition
///
/// ```example
/// #definition[サンプル]
/// ```
///
/// -> content
//
#let axiom = axiom.with(
  sans-fonts: "IPAexMincho",
)

#let definition = definition.with(
  color: black,
  sans-fonts: "IPAexMincho",
)

#let example = example.with(
  color: gray,
  sans-fonts: "IPAexMincho",
)

#let proposition = proposition.with(
  sans-fonts: "IPAexMincho",
)

#let remark = remark.with(
  color: red,
  sans-fonts: "IPAexMincho",
)

#let theorem = theorem.with(
  sans-fonts: "IPAexMincho",
)

/// Proof
///
/// ```example
/// #proof[サンプル]
/// ```
///
/// -> content
//
#let proof(
  name: "Proof",
  prefix: none,
  fontsize: 8pt,
  /// The number of columns.
  num-cols: 1,
  body,
) = {
  rect[
    #set text(fontsize)
    #set math.equation(numbering: "[1.1]")
    #columns(
      num-cols,
    )[
      #strong[#prefix #name]:
      #body
    ]
  ]
}

#let because-of(
  /// Random variable. -> content
  x,
  space: 10pt,
) = {
  h(space)
  $( because #x )$
}

/// = Set theory
///
/// Domain of a function
///
/// ```example
/// $domain(f)$
/// ```
///
/// -> content
#let domain(
  /// Function. -> content
  f,
) = (
  $ op("dom") (#f) $
)

/// == Empty set
///
/// Ref: https://www.reddit.com/r/typst/comments/17mxm4h/how_do_i_change_what_emptyset_looks_like/
///
/// ```example
/// $emptyset$
/// ```
///
/// -> content
#let emptyset = $text(font: "Fira Sans", nothing)$

/// == Open ball
///
/// ```example
/// $openball(p, r)$
/// ```
///
/// -> content
#let openball(
  /// Point. -> content
  point,
  /// Radius. -> content
  radius,
) = (
  $ op("B")_(#radius) (#point) $
)

/// == Power set
///
/// ```example
/// $powerset(x)$
/// ```
///
/// -> content
// #let power-set(
#let powerset(
  /// Set. -> content
  /// set,  // Error occurred
  set_,
) = (
  $ cal(P) (#set_) $
)

/// == Range of a function
///
/// ```example
/// $range(f)$
/// ```
///
/// -> content
#let range(
  /// Function. -> content
  f,
) = (
  $ op("ran") (#f) $
)

/// == Successor function
///
/// ```example
/// $successor(x)$
/// ```
///
/// -> content
#let successor(
  /// Set. -> content
  x,
) = (
  $ op("S") (#x) $
)

/// == Standard number sets
///
/// The set of complex numbers
///
/// ```example
/// $complexnumbers$
/// ```
///
/// -> content
#let complexnumbers = (
  $ bold(upright(C)) $
)

/// == The set of integers
///
/// ```example
/// $integers$
/// ```
///
/// -> content
#let integers = (
  $ bold(upright(Z)) $
)

/// == The set of natural numbers
///
/// ```example
/// $naturalnumbers$
/// ```
///
/// -> content
#let naturalnumbers = (
  $ bold(upright(N)) $
)

/// == The set of rational numbers
///
/// ```example
/// $rationalnumbers$
/// ```
///
/// -> content
#let rationalnumbers = (
  $ bold(upright(Q)) $
)

/// == The set of real numbers
///
/// ```example
/// $realnumbers$
/// ```
///
/// -> content
#let realnumbers = (
  $ bold(upright(R)) $
)

/// = Statistics
///
/// == Covariance
///
/// ```example
/// $covariance(X, Y)$
/// ```
///
/// -> content
#let covariance(
  /// Random variable. -> content
  x,
  /// Random variable. -> content
  y,
) = (
  // $ "Cov"(#x, thin #y) $
  $ op("Cov") (#x, thin #y) $
)

/// == Expectation
///
/// ```example
/// $expectation(X)$
/// ```
///
/// -> content
#let expectation(
  /// Random variable. -> content
  x,
) = (
  $ op("Ex") (#x) $
)

/// == Normal distribution
///
/// ```example
/// $normaldistribution(mu, sigma^2)$
/// ```
///
/// -> content
// #let normal-distribution(
#let normaldistribution(
  /// Mean. -> content
  mean,
  /// Standard deviation. -> content
  std,
) = (
  $ cal(N) (#mean, thin #std) $
)

/// == Variance
///
/// ```example
/// $variance(X)$
/// ```
///
/// -> content
#let variance(
  /// Random variable. -> content
  x,
) = (
  $ "Var"(#x) $
)

/// = Topological space
///
/// == Closure
///
/// ```example
/// $closure(A)$
/// ```
///
/// -> content
#let closure = (
  $ op("cl") $
)

/// == Interior
///
/// ```example
/// $interior(A)$
/// ```
///
/// -> content
#let interior = (
  $ op("int") $
)

/// == Topology
///
/// ```example
/// $topology$
/// ```
///
/// -> content
#let topology = (
  $ cal(O) $
)

