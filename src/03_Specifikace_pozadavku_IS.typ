#import "config.typ" as config

= Specifikace požadavků na funkce IS

Cílem této kapitoly je provést specifikace požadavků na funkce IS.
Bude proveden krok 3 procesní analýzy IS, *analýza a identifikace nedostatků*.
Následně krok 3 funkční analýzy IS, *definování funkčních a nefunkčních požadavků*.

== Analýza a identifikace nedostatků

Krok 3 procesní analýzy IS.
V tomto kroce dojde k vyhodnocení procesů z hlediska efektivity, časové náročnosti, chybovosti a míry podpory informačním systémem.
@HammerChampy2006

===== Otevřená data ČR

Pro účel zvěřejňování dat o jízdních řádech v České republice existuje *Celostátní informační systém o jízdních řádech* (CIS JŘ).
Tento informační systém vznikl na základě vyhlášky Ministerstva dopravy ČR z roku 2014 @vyhlaskaCISJR a zprostředkovává veřejně dostupná data ve strojově čitelném formátu.
@cisjr

Data na FTP uložišti obsahují vícero druhů informací.

+ Jízdní řády *vlakových spojení* ve formátu *.XML*
+ Jízdní řády *autobusové dopravy* ve formátu *.JDF*

Pro potřeby požadovaného IS budou využívány jízdní řády autobusové dopravy ve formátu JDF.

===== Datový formát JDF

Datový formát JDF je popsán dokumentací vydanou součástí metodického pokynu ministerstva dopravy.
@jdfSpec

Tento datový formát disponuje informacemi o názvech, časováním a kilometráží autobusových spojů s dodatečnou možností označit spoj, či zastávku kódovou značkou.

Značnou nevýhodou tohoto datového formátu je absence geografických dat.
GPS souřadnice zastávek je tedy nutno získat jiným způsobem.

===== Tabulka hlavních procesů

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto, auto),
        align: left,
        table.header([ID],[Proces], [Ruční zásahy]),
        "Pr1", "Aktualizace dat jízdních řádů", [
          - informování správce o změně
          - vydání nové verze
        ],
        "Pr2", "Zavedení nové zastávky", [
          - lokalizace GPS souřadnic zastávky
          - vydání nové verze
        ],
        "Pr3", "Výměnna ikonky vozidel", [
          - informování správce o změně
          - obstarání kompatibilní ikonky
          - vydání nové verze
        ],
      ),
      caption: [Identifikace hlavních procesů],
    )
  ],
  [@onlineDpmp],
)

#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  #config.sourcedFigure(
    [
      #figure(
        image("../images/Pr1 Aktualizace dat jízdních řádů.png", width: 100%),
        caption: [BPMN diagram Pr1 Aktualizace dat jízdních řádů],
      )
    ],
    [vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  #config.sourcedFigure(
    [
      #figure(
        image("../images/diagram.svg", width: 100%),
        caption: [BPMN diagram Pr1 Aktualizace dat jízdních řádů],
      )
    ],
    [vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()

== Definování funkčních a nefunkčních požadavků

Krok 3 funkční analýzy IS.
Dojde k definování požadavků na nový IS.
Požadavky budou vycházet z očekávání uživatelů, nebo jako důsledek analýz předchozích kroků.
@SommervilleSawyer1997
Výsledkem bude tabulka požadavků.
@Sommerville2015

===== Formulář pro nahrání nových dat

Důležitým funkčním požadavkem pro nový IS bude možnost nové data o jízdních řádech poskytnout i pomocí administrativního rozhraní.
Tato nutnost vznikla z důvodu existence nestandartních událostí, které z provozních a jiných důvodů nevyžadují reportovat změnu v jízdních řádech na CIS JŘ.

===== Tabulka požadavků



#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  #config.sourcedFigure(
    [
      #figure(
        table(
          columns: (auto, auto, auto, auto, auto, auto),
          align: left,
          table.header([ID],[Proces], [Popis], [Způsob ověření], [Typ], [Zdroj]),
          "Po01", "Zobrazování poloh vozidel v aplikaci", "V klientské aplikaci jsou zobrazovány vozidla v interaktivní mapě na aktuálních GPS souřadnicích dle datového zdroje dopravce.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po02", "Detail spoje vozidla", "Pro zobrazovaná vozidla v klientské aplikaci je možné rozkliknutím zobrazit detail spojení jedoucího vozidla. V novém okně se zobrazí přehled spoje a nadcházející zastávky s aktuálním zpožděním.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po03", "Formulář pro výměnu jízdního řádů", "Formulář v administraci umožní dopravci nahrát data nového jizdního řádu v datovém formátu JDF. Následně bude v administraci proveden změnou dat a jakékoliv validační chyby jsou zobrazeny hned v administraci. Po odeslání formuláře dochází k okamžité změně jízdního řádu v IS.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
          "Po03", "Formulář pro úpravu ikonky vozidla", "Formulář v administraci umožní dopravci nahrát novou ikonku do aplikace. Dostupné ikonky ke změně jsou předem definovány a formulář vždy povolí pouze akceptované rozlišení. Po odeslání formuláře dochází k aktualizaci ikonek v aplikaci, bez nutnosti ručního zásahu.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
        ),
        caption: [Tabulka požadavků],
      )
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()



