#import "src/config.typ" as config

#set text(
  font: "Times New Roman",
  size: 12pt,
  lang: "cs",
  region: "CZ",
)
#set par(
  leading: 1.5em,
)

#set document(
  title: config.thesis(),
  author: config.author(),
)

#include "src/cover.typ"

#include "src/title.typ"

#include "src/assignment.typ"

#set page(
  margin: (
    left: 3.5cm,
    right: 1.5cm,
    y: 2.5cm,
  ),
)

#include "src/declarations.typ"

#show heading: h => {
  set text(
    size: 12pt,
  )
  upper(h)
}

#include "src/outlines.typ"
