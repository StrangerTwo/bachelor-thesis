#import "config.typ" as config

= Identifikace klíčových částí aktuálního IS

Cílem této kapitoly je provést identifikaci klíčových částí aktuálního IS.
Bude proveden krok 1 procesní analýzy IS, *identifikace a vymezení podniku*.
Následně krok 1 funkční analýzy IS, *analýza a sběr požadavků*.
Druhé kroky funkční analýzy IS, *modelování stávajícího stavu (As-­Is)*, a procesní analýzy IS, *mapování stávajícího stavu (As-­Is)*, budou sjednoceny do jedné podkapitoly.
@Sommerville2015

Cílem této kapitoly je vymezit hranice IS, identifikovat jeho hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace.
Vhodnou analýzou budou odhaleny slabá místa, redundance a chybějící funkcionality systému.
Kombinací metodických přístupů k analýze IS bude vytvořen podklad pro návrh cílového řešení.
@Dumas2018

== Identifikace a vymezení podniku

První krok procesní analýzy IS.
Dojde k obeznámení s podnikem, jeho hlavními činnostmi, strategickými cíli a podnikovým záměrem.
Bude vymezen rozsah podniku, na jeho části podnikové procesy relevantní pro IS. 
@Weske2012

===== Podnik

#config.todo[TODO]

===== Mise

Klientská aplikace má za úkol zobrazit informace o spojení vozidel MHD rychle a jednoduchým způsobem.
Aplikace by měla sloužit jako dodatečný komunikační kanál dopravce, aby sdělil důležitá upozornění cestujícím.

===== Vize

Jednoduchá klientská aplikace by se měla rozšířit mezi větší část cestujících
a stát se aktivně využívaným místem pro zobrazování aktuálních situací, které ovlivňují cestující.

===== Podnikové procesy

#config.todo[TODO]

== Analýza a sběr požadavků

První krok funkční analýzy IS.
Hlavním cílem bude pochopení problému, který IS řeší.
V tomto kroce dojde k poznání funkcionalit IS, jejich vlastností a způsoby využívání IS jednotlivými skupinami uživatelů.
@Sommerville2015

=== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má
za úkol zpřístupnit veřejnosti informace o aktuálních polohách spojů,
jejich zpožděních, nebo jiných provozních událostech, které se týkají cestujících.

Z povahy aplikace je tedy využívána v moment, kdy je již cestující rozhodnutý cestovat veřejnou hromadnou dopravou a potřebuje zjistit aktuální stav dění.
Z tohoto předpokladu vychází požadavky na aplikaci aby byla rychlá, ovladatelná a dostupná v podmínkách se špatným přístupem k internetu.

===== Skupiny uživatelů

Uživatelské skupiny lze rozdělit na primární a sekundární.
@Sommerville2015
Dle tohoto dělení je skupina cestujících oddělena od ostatních interních rolí.
Na základě doporučení pro návrh provozně kritických systémů, je vhodné interní skupinu rozdělit dle role na provozní a administrátorskou. @DennisWixomTegarden2015
Jako součást návrhu manažerských a podpurůch IS je vhodné zahrnout i manažerskou skupinu uživatelů. @isManagement

*Cestující* jsou primárním uživatlem IS, požadují informace o aktuálním zpoždění a provozních upozorněních.
*Dispečeři* jsou privilegovaným uživatelem IS, zajišťují přesnost zobrazovaných dat, publikují provozní upozornění.
*Administrátoři* jsou správci aplikačního serveru, zajišťují bezchybový běh aplikace, sledují zátěž a provozní log serveru.
*Vedení* vyžadují znát metriky o návštěvnosti a návratnosti uživatelů, popř.
jiné statistiky využívání aplikace.

=== Klíčové funkce aplikace

Analýzou IS dle funkční analýzy budou identifikovány hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace.
K jednotlivým funkcionalitám budou popsány jejich vlastností a způsoby, jak s nimi jednotlivé skupiny uživatelů zacházejí.

===== Zobrazování aktuálních poloh na mapě

Primárním funkčním prvkem aplikace je zobrazování poloh vozidel na interktivní mapě.
Mapa je aktualizovaná každých 8-12s kdy dochází i k aktualizaci dat na aplikačním serveru.
@currentIndex vyzobrazuje funkci současného IS. 

#config.sourcedFigure(
  [
    #figure(
      image("../images/current_index.png", width: 80%),
      caption: [Ukázka aplikace],
    ) <currentIndex>
  ],
  [@onlineDpmp],
)

===== Detail spoje jedoucího vozidla

Každé zobrazované vozidlo obsluhuje aktuálně provozovaný spoj a po jeho rozkliknutí je k dispozici zobrazení detail tohoto spoje.

#config.sourcedFigure(
  [
    #figure(
      image("../images/current_detail.png", width: 80%),
      caption: [Detail spoje],
    )
  ],
  [@onlineDpmp],
)

===== Filtrování linky uživatelem

Aplikaci může uživatel obsluhovat pomocí postranní lišty, ve které má k dispozici dodatečné ovládací prvky.
Jedním z nich je možnost filtrovat spoje zobrazené v aplikaci.

===== Vyhledání zastávky

Vyhledávání zastávky je dalším prvkem postranní lišty.

#config.sourcedFigure(
  [
    #figure(
      image("../images/current_sidebar.png", width: 80%),
      caption: [Postranní lišta aplikace],
    )
  ],
  [@onlineDpmp],
)

===== Přehled odjezdů ze zastávky

Po vyhledání, nebo zvolení zastávky je možné stejně jako u vozidla zobrazit její detail.
Na tomto detailu je zobrazena obdoba odjezdové tabule s příštími odjezdy.

#config.sourcedFigure(
  [
    #figure(
      image("../images/current_station_detail.png", width: 80%),
      caption: [Detail zastávky],
    )
  ],
  [@onlineDpmp],
)

===== Přehled klíčových funkcí

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto, auto),
        align: left,
        table.header([ID],[Funkční oblast], [Vazba na funkci]),
        "F1", "Zobrazování aktuálních poloh na mapě", "-",
        "F2", "Detail spoje jedoucího vozidla", "F1",
        "F3", "Filtrování linky uživatelem", "F1",
        "F4", "Vyhledání zastávky", "F1",
        "F5", "Přehled odjezdů ze zastávky", "F4",
      ),
      caption: [Identifikace hlavních funkcí systému],
    )
  ],
  [@onlineDpmp],
)

== Mapování stávajícího stavu

Spojené druhé kroky funkční a procesní analýzy IS.
Dojde k identifikaci hlavních procesů, toků dat a vazeb mezi jednotlivými částmi systému.
Výsledek bude přehledně vyzobrazen pomocí Data Flow diagramu.
@Sommerville2015
Dle východisek procesní analýzy IS je třeba analyzovat skutečný průběh činností souvisejících s IS, tak jak doopravdy probíhají.
Zmapování aktuálního stavu umožní identifikovat oblasti ke zlepšení v návrhu nového řešení.
@Dumas2018

===== Aktualizace dat jízdních řádů

Aktualizace jízdních řádů představuje pravidelný provozní proces IS, který úzde navazuje na podnikové procesy dopravce.
Proces je iniciován změnami jízdních řádů na straně dopravce v nepravidelné frekvenci.
K výměně jízdního řádu dochází vždy minimálně jednou ročně.
@onlineDpmp

*Vstupem* tohoto procesu je soubor zdrojových dat jízdního řádu, který je poskytován dopravcem ve stanoveném formátu.
*Výstupem* procesu jsou transformovaná data, strukturována pro strojové čtení informačním systémem.
*Hlavní kroky* procesu jsou v pořadí nejprve informování správce systému o změně jízdních řádů.
Následně probíhá transformace zdrojových dat pomocí specializovaného skriptu.
Po úspěšné transformaci jsou data nahrána do systému a je nasazena nová verze aplikace.
*Vstupy IS* jsou v moment transformace dat.
IS zajišťuje automatické zpracování vstupních souborů, včetně validace pro ověření konzistence dat.
*Ruční zásahy* procesu jsou v moment informování správce o změně.
Transformace dat a kontrola výstupních souborů vyžaduje ruční dohled, pro případ chyb.
Nahrání transformovaných dat do produkčního prostředí a vydání nové verze rovněž vyžaduje ruční zásah správce systému.

===== Zavedení nové zastávky

Pro zavedení nové zastávky do systému je za potřebí provést kroky navíc.
Samotné zastávky mají vazbu do dat jízdních řádů a proto je za potřebí zaručit validaci na správnou identifikaci zastávky.

- *Vstup*: Informace o nové zastávce
- *Výstup*: Identifikována zastávka s GPS souřadnicí
- *Hlavní kroky*:
  - Informování správce systému o nové zastávce
  - Doplnění informací o zastávce a její GPS souřadnicích
  - Vydání nové verze s jízdním řádem, který zastávku využívá
- *Kde vstupuje IS*:
  - IS zajišťuje validaci dat
- *Kde jsou ruční zásahy*:
  - Informování správce je nutné provést ručně
  - Transformace vstupu a výstupu vyžaduje ruční kontrolu
  - Nahrání dat a vydání nové verze je nutné provést ručně
