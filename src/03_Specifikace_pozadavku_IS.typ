#import "config.typ" as config

= Specifikace požadavků na funkce IS

Cílem této kapitoly je provést specifikace požadavků na funkce IS.
Bude proveden krok 3 procesní analýzy IS, *identifikace nedostatků*.
Následně krok 3 funkční analýzy IS, *definování funkčních a nefunkčních požadavků*.

== Identifikace nedostatků

Nyní bude proveden krok 3 procesní analýzy IS.
V tomto kroku dojde k vyhodnocení procesů zejména z hlediska časové náročnosti, míry manuální práce a chybovosti.
@HammerChampy2006
Hodnocena bude míra podpory informačním systémem a možnosti automatizace procesů.
Tyto nedostatky následně slouží jako vstup pro návrh funkčních a nefunkčních požadavků pro nový IS.

=== Hodnocení procesů

===== Nedostatky procesů

Hodnocení nedostatků procesů proběhne kontrolou existujících procesů se zaměřením na činnosti s ručními zásahy, vyšší chybovostí, nebo největší časovou náročností.
@HammerChampy2006

Všechny vybrané procesy *Pr1*, *Pr2* i *Pr3* jsou níže zobrazeny ve formátu BPMN diagramu.
Některé činnosti jsou mezi procesy sdílené.
Pro analýzu bude využita @processStepsTable, s detailním přehledem činností všech procesů.

Proces *Pr1* je zpracován v podobě BPMN diagramu na @bpmnPr1[Obrázku].
Proces *Pr2* je zpracován v podobě BPMN diagramu na @bpmnPr2[Obrázku].
Proces *Pr3* je zpracován v podobě BPMN diagramu na @bpmnPr3[Obrázku].

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
      ) <bpmnPr1>
    ],
    [Vlastní zpracování],
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
        image("../images/Pr2 Zavedení nové zastávky.svg", width: 100%),
        caption: [BPMN diagram Pr2 Zavedení nové zastávky],
      ) <bpmnPr2>
    ],
    [Vlastní zpracování],
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
        image("../images/Pr3 Výměna ikonky vozidel.svg", width: 100%),
        caption: [BPMN diagram Pr3 Výměna ikonky vozidel],
      ) <bpmnPr3>
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()

===== Podrobnosti činností procesů

Činnosti jednotlivých procesů byly zapsány v @processStepsTable[Tabulce].

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: left,
        table.header([ID], [Činnost], [Role], [Chybovost], [Časová náročnost], [Procesy]),
        "T01", "Notifikování správce o změně", "Dispečer", "Bezchybná", "Rychlá", "Pr1, Pr2, Pr3",
        "T02", "Převzetí dat o změně", "Správce", "Bezchybná", "Rychlá", "Pr1, Pr2, Pr3",
        "T03", "Transformace zdrojových dat do datového balíku", "Systém", "Možnost chyby", "Rychlá", "Pr1, Pr2",
        "T04", "Validace datového balíku", "Systém", "Bezchybná", "Rychlá", "Pr1, Pr2",
        "T05", "Řešení chyby v datech", "Správce", "Bezchybná", "Náročná", "Pr1, Pr2",
        "T06", "Doptání se na potřebné podklady", "Správce", "Bezchybná", "Rychlá", "Pr1, Pr2",
        "T07", "Odpověď na dotaz", "Dispečer", "Bezchybná", "Rychlá", "Pr1, Pr2",
        "T08", "Nahrání dat do systému", "Správce", "Bezchybná", "Rychlá", "Pr1, Pr2, Pr3",
        "T09", "Nasazení nové verze aplikace", "Správce", "Bezchybná", "Náročná", "Pr1, Pr2, Pr3",
        "T10", "Úprava ikonky do požadovaného formátu", "Správce", "Bezchybná", "Náročná", "Pr3",
      ),
      caption: [Tabulka činností všech procesů],
    ) <processStepsTable>
  ],
  [Vlastní zpracování],
)

Na základě hodnot v @processStepsTable[Tabulce] lze jednoduše vyhledat činnosti, na kterých se projevují nedostatky aktuálního IS.
Tyto činnosti lze identifikovat na základě chybovosti, časové náročnosti.
Prioritu těmto nedostatkům byla určena, dle počtu procesů, ve kterých je činnost prováděna.

Činnosti, které jsou bezchybné s nízkou časovou náročností nejsou považovány za nedostatky.
Seřazené a vybrané činnosti jsou: *T05, T09, T10, T03*.

Činnost *T05 Řešení chyby v datech* je navazující činností na událost chyby.
Běžným zdrojem této chyby je činnost T04 Validace datového balíku.
V této činnosti je třeba provést investigaci, z jakého důvodu k chybě došlo.
Po prověření situace dojde k opravě správcem systému.
Chyba může mít různý charakter, zejména charakter chyby ve zdrojových datech, nebo chyby IS.

Činnost *T09 Nasazení nové verze aplikace* má vliv na všechny procesy IS.
Jedná se o časově náročnou činnost, který kvůli častému výskytu limituje informačnímu systému svižně reagovat na příchozí požadavky, bez delších prodlev.
V době nasazování nové verze je IS nedostupný a tím omezuje plynulé užívání IS.

*T10 Úprava ikonky do požadovaného formátu* je činnost prováděna správcem systému pro sjednocení formátu ikonky.
Kvůli vysoké časové náročnosti se jedná o činnost vhodnou pro automatizaci.

Činnost *T03 Transformace zdrojových dat do datového balíku* obsahuje riziko chyby.
Jedná se o místo slučování dat jízdních řádů s podkladem geografických dat IS.
V případě změn procesů dopravce mohou nové změny vyprodukovat chybu při transformaci dat.
Následující činností validace tedy dojde k chybě.
Chyba je pak následně prověřena a oprava ve zdrojových datech, nebo opravou IS.

=== Hodnocení datových formátů

Funkční požadavky na IS jsou kladeny i v podobě existujících datových formátů, který musí nový IS podporovat.
Jedná se o přesně specifikovaný datový formát otevřených dat ČR pro jízdní řády.

===== Otevřená data ČR

Za účelem zveřejňování dat o jízdních řádech v České republice existuje *Celostátní informační systém o jízdních řádech* (CIS JŘ).
Tento informační systém vznikl na základě vyhlášky Ministerstva dopravy ČR z roku 2014 @vyhlaskaCISJR a zprostředkovává veřejně dostupná data ve strojově čitelném formátu.
@cisjr

Data na FTP úložišti obsahují vícero druhů informací.

+ Jízdní řády *vlakových spojení* ve formátu *.XML*
+ Jízdní řády *autobusové dopravy* ve formátu *.JDF*

Pro potřeby požadovaného IS budou využívány jízdní řády autobusové dopravy ve formátu JDF.

===== Datový formát JDF

Datový formát JDF je popsán dokumentací vydanou součástí metodického pokynu ministerstva dopravy.
@jdfSpec

Tento datový formát disponuje názvy zastávek, časovou informací o příjezdech a odjezdech, kilometráží autobusových spojů.
Spoje, nebo zastávky mohou být dodatečně označeny kódovou značkou.
Význam kódových značek je součástí definice formátu JDF.

Značnou nevýhodou tohoto datového formátu je absence geografických dat.
GPS souřadnice zastávek je tedy nutno získat jiným způsobem.
V současném systému jsou GPS souřadnice předávány vlastní komunikací dispečera s administrátorem, bez přesně určeného datového formátu.

== Definování funkčních a nefunkčních požadavků

Krok 3 funkční analýzy IS.
Dojde k definování požadavků na nový IS.
Požadavky budou vycházet z očekávání uživatelů, nebo jako důsledek analýz předchozích kroků.
@SommervilleSawyer1997
Výsledkem bude tabulka požadavků.
@Sommerville2015

===== Funkcionality stávajícího IS

Inovace IS má za úkol dosáhnout zlepšení provozních procesů jejich optimalizací.
IS by po své inovaci měl zachovat všechny své existující funkcionality.

Funkční požadavky pro zachování původních funkcionalit jsou *Po01 Zobrazování poloh vozidel v aplikaci*, *Po02 Detail spoje vozidla*, *Po03 Odjezdová tabule zastávky*.
Jedná se o klíčové funkcionality IS, na které se cestující spoléhají.

===== Formuláře pro nahrání nových dat do IS

Důležitým funkčním požadavkem pro nový IS bude možnost nahrát nová data pomocí administrativního rozhraní.
Aktuální nedostatek procesů *Pr1*, *Pr2* a *Pr3* - nutnost vydání nové verze IS administrátorem, bude za pomocí formulářů odebrán.
Po nahrání dat skrze administrativní rozhraní dojde k automatickému nasazení nové verze klientské aplikace, bez nutnosti ručního zásahu administrátorem.
Proto vznikají funkční požadavky pro *Po04 Formulář pro výměnu jízdního řádu*, *Po05 Formulář pro úpravu ikonky vozidla*, *Po06 Formulář pro úpravu zastávky*.

Nedostatek rozdílných datových zdrojů pro vstup procesu *Pr2* bude vyřešen v rámci funkčního požadavku *Po06*.
Formulář pro úpravu zastávky sjednotí datové soubory a provede validaci je.
IS data zastávky převezme vždy v uceleném stavu.

Nedostatek dokumentace a přehlednosti požadavků na ikonky klientské aplikace pro vstup procesu *Pr3* bude vyřešen v rámci funkčního požadavku *Po05*.
Formulář bude obsahovat interaktivní validace pro ikonku s informačním dialogem.
Zadávání nové ikonky bude probíhat přes interaktivní formulář, tak aby IS dokázal přijmout libovolnou ikonku a případné nesrovnalosti s rozlišením ikonky byl schopen vyřešit dispečer z formuláře (např. oříznutím).

Dalším funkčním požadavkem je zachování podpory IS pro datový formát JDF.
Funkční požadavek *Po07 Podpora datových formátů* je klíčový pro načtení dat jízdních řádů, bez dodatečných nároků na dopravce využívající IS.

Klientská aplikace je vysoce exponovaná část IS.
Proto je nutné definovat pro ni požadavky na výkonnost a spolehlivost.
Nefunkční požadavky *Po08 Výkonnost a rychlost odezvy* a *Po09 Dostupnost a spolehlivost aplikace* popisují minimální akceptovatelné metriky pro nový IS.

Výkonnost a rychlost odezvy patří mezi klíčové nefunkční požadavky IS, protože přímo ovlivňují uživatelskou zkušenost a použitelnost aplikace.
Dle výzkumu použitelnosti systémů je reakční doba přibližně do dvou sekund považována za hranici, při které uživatel stále vnímá interakci se systémem jako plynulou a nepřerušovanou.
Delší odezva může vést ke ztrátě pozornosti uživatele a ke zhoršení celkové použitelnosti systému.
@Nielsen1994
Z tohoto důvodu je v navrženém systému stanoven nefunkční požadavek, aby doba odezvy běžných požadavků nepřekračovala jednu sekundu, s výjimkou plánovaných servisních intervalů nebo údržby systému.

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto),
        align: left,
        table.header([Limit pro čas odezvy], [Vnímání uživatelem]),
        "0,1 s", "okamžitá reakce",
        "1 s", "plynulá interakce",
        "~2-10 s", "uživatel ztrácí pozornost",
      ),
      caption: [Vnímání odezvy systému uživatelem],
    ) <nngResponseTimes>
  ],
  [@nng_response_times],
)

V @nngResponseTimes[Tabulce] byly sepsány modelové reakce uživatelů na různou dobu odezvy systému.
Ztráta pozornosti uživatele nastává v časovém okně 2-10 sekund.
Za účelem zlepšení uživatelského zážitku (UX) využívání aplikace bude limitní odezva systému pro běžné požadavky nastavena na jednu sekundu.

Požadavky byly souhrnně sepsány v @requirementsTable[Tabulce].

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
          columns: (auto, auto, 2fr, 1fr, auto, auto),
          align: left,
          table.header([ID], [Požadavek], [Popis], [Způsob ověření], [Typ], [Zdroj]),
          "Po01", "Zobrazování poloh vozidel v aplikaci", "V klientské aplikaci jsou zobrazovány vozidla v interaktivní mapě na aktuálních GPS souřadnicích dle datového zdroje dopravce. Filtrování zobrazovaných spojů bude k dispozici skrze postranní menu aplikace.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po02", "Detail spoje vozidla", "Pro zobrazovaná vozidla v klientské aplikaci je možné rozkliknutím zobrazit detail spojení jedoucího vozidla. V novém okně se zobrazí přehled spoje a nadcházející zastávky s aktuálním zpožděním.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po03", "Odjezdová tabule zastávky", "V klientské aplikaci musí být zachována možnost vyhledat zastávku a zobrazit seznam nadcházejících odjezdů ze zastávky. Zároveň je požadováno zachovat relevantní funkcionality postranního menu aplikace.", "Součástí klientské aplikace", "Funkční", "Stávající systém",
          "Po04", "Formulář pro výměnu jízdního řádů", "Formulář v administraci umožní dispečerovi nahrát data nového jízdního řádu v datovém formátu JDF. Následně bude v administraci proveden změnou dat a jakékoliv validační chyby jsou zobrazeny hned v administraci. Po odeslání formuláře dochází k okamžité změně jízdního řádu v IS.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
          "Po05", "Formulář pro úpravu ikonky vozidla", "Formulář v administraci umožní dispečerovi nahrát novou ikonku do aplikace. Dostupné ikonky ke změně jsou předem definovány a formulář vždy povolí pouze akceptované rozlišení. Po odeslání formuláře dochází k aktualizaci ikonek v aplikaci, bez nutnosti ručního zásahu.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
          "Po06", "Formulář pro úpravu zastávky", "Formulář v administraci umožní dispečerovi upravit vlastnosti zastávky. Data o zastávce a GPS souřadnice jsou odesílány společně.", "Ověření existence a kontrola funkčnosti formuláře v administraci", "Funkční", "Návrh optimalizace procesů",
          "Po07", "Podpora datových formátů", "IS musí podporovat datové formáty JDF pro načtení dat jízdního řádu. Formáty dodatečných datových zdrojů, které by IS případně vyžadoval, uvede dodavatel v prozní dokumentaci.", "Ověření aktualizací dat jízdního řádu původním datovým souborem", "Funkční", "Návrh optimalizace procesů",
          "Po08", "Výkonnost a rychlost odezvy", "Doba odezvy běžných požadavků nesmí překročit 1 sekundu. Delší odpovědi systému jsou mimo vyhrazené časové okna, pro např. nasazování nové verze IS, neakceptovatelné a vyžadují nápravu.", "Pravidelné monitorování času odezvy na požadavek", "Nefunkční", "Akceptační kritérium",
          "Po09", "Dostupnost a spolehlivost aplikace", "Systém musí být dostupný 99,9% času.", "Monitorování dostupnosti", "Nefunkční", "Akceptační kritérium",
        ),
        caption: [Tabulka požadavků],
      ) <requirementsTable>
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]
