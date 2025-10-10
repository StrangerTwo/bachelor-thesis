#import "src/config.typ" as config

#set text(
  font: "Times New Roman",
  size: 12pt,
  lang: "cs",
  region: "CZ",
)
#set par(
  leading: 1.1em,
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
#set par(spacing: 2em)

#include "src/declarations.typ"

#include "src/outlines.typ"


#show heading.where(depth: 1): it => {
  pagebreak()
  set text(size: 16pt)
  it
}
#show heading.where(depth: 2): set text(size: 14pt)
#show heading.where(depth: 3): set text(size: 13pt)

#set heading(numbering: "1.")

#include "src/01_Identifikace_IS.typ"

#include "src/02_Specifikace_pozadavku_IS.typ"

#include "src/03_Navrh_implementace_IS.typ"

