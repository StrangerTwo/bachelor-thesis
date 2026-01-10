#let contents = yaml("config.yaml")

#let university() = contents.university;
#let faculty() = contents.faculty;
#let specialization() = contents.specialization;

#let author() = contents.author;
#let thesis() = contents.thesis;


#let year() = datetime.today().year();
#let today() = (
  datetime
    .today()
    .display(
      "[day padding:none].[month padding:none].[year]",
    )
)

#let defaults(doc) = {
  set document(
    title: thesis(),
    author: author(),
  )
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "cs",
    region: "CZ",
  )
  set par(
    leading: 1.1em,
    justify: true,
    spacing: 2em,
  )
  show figure.where(kind: table): set figure.caption(position: top)
  doc
}

#let main(doc) = {
  set page(
    margin: (
      left: 3.5cm,
      right: 1.5cm,
      y: 2.5cm,
    ),
  )
  doc
}

#let introduction(doc) = {
  show heading: set text(size: 12pt)
  show heading: set block(
    above: 2em,
    below: 2em,
  )
  set heading(outlined: false)
  doc
}

#let body(doc) = {
  show heading: set block(
    below: 1.5em,
  )
  show heading.where(depth: 1): it => {
    pagebreak()
    set text(size: 16pt)
    it
  }
  show heading.where(depth: 2): it => {
    set text(size: 14pt)
    let mVal = "trailing headings to new page"
    metadata(mVal)
    context {
      let m = query(metadata.where(value: mVal).before(here())).last()
      if m.location().position().y > page.height * 50% {
        pagebreak()
      }
    }
    it
  }
  show heading.where(depth: 3): set text(size: 13pt)
  doc
}

#let conclusion(doc) = {
  show heading: set text(size: 12pt)
  show heading: set block(
    above: 2em,
    below: 2em,
  )
  doc
}

#let todoBlock(body) = {
  block(
    fill: gradient.repeat(..color.map.rainbow),
    inset: 8pt,
    radius: 4pt,
    body,
  )
}

#let headings(doc) = {
  set heading(numbering: "1.")
  show heading.where(level: 5): it => [
    #block(it.body)
  ]
  doc
}

#let imageFigure(body, source) = {
  show figure.caption: set align(right)
  figure(
    [
      #show figure.caption: set align(left)
      #body
    ],
    caption: [Zdroj: #source],
    numbering: none,
    outlined: false,
  )
}

#let todo(body) = {
  block(
    fill: luma(230),
    inset: 8pt,
    radius: 4pt,
  )[#body]
}
