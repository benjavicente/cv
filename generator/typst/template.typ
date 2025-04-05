
// Inspired by: https://github.com/tzx/NNJR/blob/main/template.typ

#import "@preview/cmarker:0.1.3" as cmaker

#let template(body) = {
  show heading.where(level: 1): it => {
    set text(weight: "bold", size: 1.5em)
    align(center, it)
  }

  show heading.where(level: 2): it => {
    set text(size: 1em, weight: "regular")
    pad(
      block(smallcaps(it), stroke: (bottom: 1pt + black), width: 100%, inset: (bottom: 4pt)),
      x: -8pt
    )
  }

  show link: it => {
    underline(it)
  }

  set par(leading: 0.4em, spacing: 0.8em)

  body
}


#let simple_link(href) = {
  link(href, href.replace(regex("^\w+://(www\.)?"), ""))
}

#let contact(..elements) = {
  // TODO: use a line instead of the line character
  align(center, elements.pos().join(" | "))
}

#let md = cmaker.render
