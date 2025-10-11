= Identifikace klíčových částí aktuálního IS

== Charakteristika systému

Existující řešení je dostupné na webové stránce https://online.dpmp.cz/.

#figure(
  image("../images/current_index.png", width: 80%),
  caption: [Ukázka aplikace],
) <currentIndex>

#set table(
  stroke: none,
  gutter: 0.1em,
  fill: (x, y) => if x == 0 or y == 0 { luma(33.33%) },
)
#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else {
    it
  }
}

#figure(
  table(
    columns: (1fr, auto, auto, auto, auto, auto, auto, auto),
    align: horizon,
    table.header([], [Pondělí], [Úterý], [Středa], [Čtvrtek], [Pátek], [Sobota], [Neděle]),
    "Denní návštěvnost", $1668$, $6413.5$, $6260.25$, $6185$, $6789.25$, $6359$, $1817$,
  ),
  caption: [Data návštěvnosti za období 13.9.2025 - 10.10.2025],
)


== Zdroj dat

=== Manuální nahrání

=== Datový formát JDF

=== Otevřená data ČR

Pro účel zvěřejňování dat o jízdních řádech v České republice existuje *Celostátní informační systém o jízdních řádech* (CIS JŘ).
