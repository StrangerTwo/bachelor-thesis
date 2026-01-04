#import "config.typ" as config

#show heading: h => upper(h)

= Anotace

Cílem této bakalářské práce je provést zhodnocení současného stavu a vytvořit návrh vylepšení Informačního systému pro zobrazování poloh vozidel MHD. Práce se zaměří na specifikaci požadavků, návrh a bezpečnost nového informačního systému.
Byla provedena identifikace klíčových funkčních procesů stávajícího informačního systému.
Na základě potřeb podniku byli vyspecifikovány požadavky na nový informační systém.
Byl vytvořen návrh nového informačního systému s dodatečnou rozvahou nad nutnou bezpečností a možnostmi pro dohled nad provozem aplikace.

= Klíčová slova

informační systém, návrh,

= Title

Innovation of the application for dislaying the positions of public transport vehicles

= Annotation

The goal of this bachelor's thesis is to assess the current state and create an improvement plan for the application for dislaying the positions of public transport vehicles. This thesis will focus on the specification of requirements, design and security of the new information system.
The key functional processes the of the existing information system were identified.
Based onthe needs of the company, the requirements for the new information system were specified.
A design for the new information system was created with additional consideration of the necessary secutiry and options for supervising the operation of the application.

= Keywords

information system, design,

#pagebreak()

#outline(
  title: "Obsah",
  depth: 3,
)

#pagebreak()

#outline(
  title: heading("Seznam obrázků", outlined: true),
  target: figure.where(kind: image),
)

#outline(
  title: heading("Seznam tabulek", outlined: true),
  target: figure.where(kind: table),
)

#outline(
  title: heading("Seznam grafů", outlined: true),
  target: figure.where(kind: "chart"),
)

#pagebreak()
#heading("Seznam zkratek a značek", outlined: true)

#let terms = (
  "CIS JŘ": "Celostátní informační systém o jízdních řádech",
  "API": "Aplikační programové rozhraní",
  "IS": "Informační systém",
  "BPMN": "Business Process Model and Notation",
  "UI": "Uživatelské rozhraní",
  "UX": "Uživatelský žážitek (zkušenost)",
  "DFD": "Data Flow Diagram",
)

#for (term) in terms.keys().sorted() [/ #term: #terms.at(term)]
