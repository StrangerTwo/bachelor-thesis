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
        "P1", "Aktualizace dat jízdních řádů", [
          - informování správce o změně
          - vydání nové verze
        ],
        "P2", "Zavedení nové zastávky", [
          - lokalizace GPS souřadnic zastávky
          - vydání nové verze
        ],
        "P3", "Výměnna ikonky vozidel", [
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


#config.sourcedFigure(
  [
    #figure(
      image("../images/jdf_change_bpmn_90deg.png", height: 70%),
      caption: [BPMN diagram změny jízdních řádu],
    )
  ],
  [vlastní zpracování],
)

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

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto, auto),
        align: left,
        table.header([ID],[Proces], [Typ]),
        "P01", "Zobrazování poloh vozidel v aplikaci", "F",
        "P02", "Detail spoje vozidla", "F",
        "P03", "Formulář pro výměnu jízdního řádů", "F",
        "P03", "Formulář pro úpravu ikonky vozidla", "F",
      ),
      caption: [Tabulka požadavků],
    )
  ],
  [Vlastní zpracování],
)



