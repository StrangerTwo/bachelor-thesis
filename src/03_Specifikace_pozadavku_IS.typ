#import "config.typ" as config

= Specifikace požadavků na funkce IS

Cílem této kapitoly je provést specifikace požadavků na funkce IS.
Bude proveden krok 3 procesní analýzy IS, *analýza a identifikace nedostatků*.
Následně krok 3 funkční analýzy IS, *definování funkčních a nefunkčních požadavků*.

== Analýza a identifikace nedostatků

Krok 3 procesní analýzy IS.
V tomto kroce dojde k vyhodnocení procesů z hlediska efektivity, časové náročnosti, chybovosti a míry podpory informačním systémem.
@HammerChampy2006

=== Datové formáty

Funkční požadavky na IS jsou kladeny i v podobě existujících datových formátů, který musí nový IS podporovat.
Jedná se o přesně specifikovaný datový formát otevřených dat ČR pro jízdní řády.

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
V současném systému jsou GPS souřadnice předávány vlastní komunikací dispečera s administrátorem, bez přesně určeného datového formátu.

=== Hodnocení procesů

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
      caption: [Procesy aktuálního IS],
    )
  ],
  [@onlineDpmp],
)

===== Nedostatky procesů

Hodnocení nedostatků procesů proběhne kontrolou existujících procesů se zaměřením na kroky s ručnímy zásahy, vyšší chybovostí, nebo největší délkou.
@HammerChampy2006

Procesy *Pr1*, *Pr2* i *Pr3* sdílí společný krok nutnosti vydání nové verze aplikace.
Tento ruční krok administrátorem zamezuje možnosti rychlé reakce IS na nové změny a je závislý na dostupnosti administrátora.

Proces *Pr2* vyžaduje vstupů ze 2 různých datových zdrojů, těmi jsou informace o zastávce a její GPS souřadnice.
Informace o zastávce jsou obsažena v datovém souboru JDF, GPS souřadnice nikoliv.
V praxi může nastat situace, kdy je předán pouze 1 datový soubor.

Ikonky, vyžadované procesem *Pr3*, nejsou dostatečně dokumentované.
Informace o požadovaném rozlišení ikonky existují pouze u administrátora.
Dispečer tedy není schopen dodat vlastní ikonky personalizaci klientské aplikace.

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
        image("../images/Pr1 Aktualizace dat jízdních řádů.svg", width: 100%),
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

===== Formuláře pro nahrání nových dat do IS

Důležitým funkčním požadavkem pro nový IS bude možnost nahrát nová data pomocí administrativního rozhraní.
Aktuální nedostatek procesů *Pr1*, *Pr2* a *Pr3* - nutnost vydání nové verze IS administrátorem, bude za pomocí formulářů odebrán.
Po nahrání dat skrze administrativní rozhraní dojde k automatickému nasazení nové verze klientské aplikace, bez nutnosti ručního zásahu administrátorem.
Takto vznikají požadavky pro *Po03 Formulář pro výměnu jízdního řádu*, *Po04 Formulář pro úpravu ikonky vozidla*, *Po05 Formulář pro úpravu zastávky*.

Nedostatek rozdílných datových zdrojů pro vstup procesu *Pr2* bude vyřešen součástí požadavku *Po05*.
Formulář pro úpravu zastávky sjednotí datové soubory a zvaliduje je.
IS data zastávky převezme vždy v uceleném stavu.

Nedostatek dokumentace a přehlednosti požadavků na ikonky klientské aplikace pro vstup procesu *Pr3* bude vyřešen součástí požadavku *Po04*.
Formulář bude obsahovat interaktivní validace pro ikonku s informačním dialogem.
Zadávání nové ikonky bude probíhat přes interaktivní formulář, tak aby IS dokázal příjmout libovolnou ikonku a případné nesrovnalosti s rozlišením ikonky byl schopen vyřešit dispečer z formuláře (např. oříznutím).

#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  ===== Tabulka požadavků
  #config.sourcedFigure(
    [
      #figure(
        table(
          columns: (auto, auto, auto, auto, auto, auto),
          align: left,
          table.header([ID],[Proces], [Popis], [Způsob ověření], [Typ], [Zdroj]),
          "Po01", "Zobrazování poloh vozidel v aplikaci", "V klientské aplikaci jsou zobrazovány vozidla v interaktivní mapě na aktuálních GPS souřadnicích dle datového zdroje dopravce.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po02", "Detail spoje vozidla", "Pro zobrazovaná vozidla v klientské aplikaci je možné rozkliknutím zobrazit detail spojení jedoucího vozidla. V novém okně se zobrazí přehled spoje a nadcházející zastávky s aktuálním zpožděním.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po03", "Formulář pro výměnu jízdního řádů", "Formulář v administraci umožní dispečerovi nahrát data nového jizdního řádu v datovém formátu JDF. Následně bude v administraci proveden změnou dat a jakékoliv validační chyby jsou zobrazeny hned v administraci. Po odeslání formuláře dochází k okamžité změně jízdního řádu v IS.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
          "Po04", "Formulář pro úpravu ikonky vozidla", "Formulář v administraci umožní dispečerovi nahrát novou ikonku do aplikace. Dostupné ikonky ke změně jsou předem definovány a formulář vždy povolí pouze akceptované rozlišení. Po odeslání formuláře dochází k aktualizaci ikonek v aplikaci, bez nutnosti ručního zásahu.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
          "Po05", "Formulář pro úpravu zastávky", "Formulář v administraci umožní dispečerovi upravit informace a GPS souřadnice zastávky. Data o zastávce a GPS souřadnice jsou odesílány společně.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
        ),
        caption: [Tabulka požadavků],
      )
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]
