#show heading: h => upper(h)

#pagebreak()

= Závěr

#pagebreak()

#bibliography(
  "sources.bib",
  title: "Použitá literatura",
  style: "iso690-numeric-brackets-cs.csl",
)

#pagebreak()

#outline(
  title: heading("Přílohy", outlined: true),
  target: figure.where(kind: "attachment"),
)
