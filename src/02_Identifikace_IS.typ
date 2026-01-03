#import "config.typ" as config

= Identifikace klíčových částí aktuálního IS

Cílem této kapitoly je vymezit hranice IS, identifikovat jeho hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace. Díky vhodné analýze budou odhaleny slabá místa, redundance a chybějící funkcionality systému.Kombinací metodických přístupů k analýze IS bude vytvořen podklad pro návrh cílového řešení.

== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má
za úkol zpřístupnit veřejnosti informace o aktuálních polohách spojů,
jejich zpožděních, nebo jiných provozních událostech, které se týkají cestujících.

Z povahy aplikace je tedy využívána v moment, kdy je již cestující rozhodnutý cestovat veřejnou hromadnou dopravou a potřebuje zjistit aktuální stav dění. Z tohoto předpokladu vychází požadavky na aplikaci aby byla rychlá, ovladatelná a dostupná v podmínkách se špatným přístupem k internetu.

===== Mise

Klientská aplikace má za úkol zobrazit informace o spojení vozidel MHD rychle a jednoduchým způsobem.
Aplikace by měla sloužit jako dodatečný komunikační kanál dopravce, aby sdělil důležitá upozornění cestujícím.

===== Vize

Jednoduchá klientská aplikace by se měla rozšířit mezi větší část cestujících
a stát se aktivně využívaným místem pro zobrazování aktuálních situací, které ovlivňují cestující.

===== Skupiny uživatelů

Aplikaci využívají následující skupiny uživatelů:

- *Cestující* - primární uživatel, požaduje informace o aktuálním zpoždění a provozních upozorněních
- *Dispečeři* - privilegovaný uživatel, zajišťuje přesnost zobrazovaných dat, publikuje provozní upozornění
- *Administrátoři* - správce aplikačního serveru, zajišťuje bezchybový běh aplikace, sleduje zátěž a provozní log serveru
- *Vedení* - chce vidět metriky o návštěvnosti a návratnosti uživatelů, popř. jiné statistiky využívání aplikace

== Klíčové funkce aplikace

#config.todo[
  Cílem funkční analýzy je identifikovat hlavní funkce informačního systému, jejich vzájemné vazby a význam pro podporu provozních procesů organizace. Funkční analýza slouží jako podklad pro návrh cílového řešení a umožňuje odhalit slabá místa, redundance a chybějící funkcionality systému.
]

===== Zobrazování aktuálních poloh na mapě

Primárním funkčním prvkem aplikace je zobrazování poloh vozidel na interktivní mapě. Mapa je aktualizovaná každých 8-12s kdy dochází i k aktualizaci dat na aplikačním serveru. To je vidět na @currentIndex

#config.imageFigure(
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

#config.imageFigure(
  [
    #figure(
      image("../images/current_detail.png", width: 80%),
      caption: [Detail spoje],
    ) <currentDetail>
  ],
  [@onlineDpmp],
)

===== Filtrování linky uživatelem

Aplikaci může uživatel obsluhovat pomocí postranní lišty, ve které má k dispozici dodatečné ovládací prvky. Jedním z nich je možnost filtrovat spoje zobrazené v aplikaci.

===== Vyhledání zastávky

Vyhledávání zastávky je dalším prvkem postranní lišty.

#config.imageFigure(
  [
    #figure(
      image("../images/current_sidebar.png", width: 80%),
      caption: [Postranní lišta aplikace],
    ) <currentSidebar>
  ],
  [@onlineDpmp],
)

===== Přehled odjezdů ze zastávky

Po vyhledání, nebo zvolení zastávky je možné stejně jako u vozidla zobrazit její detail. Na tomto detailu je zobrazena obdoba odjezdové tabule s příštími odjezdy.

#config.imageFigure(
  [
    #figure(
      image("../images/current_station_detail.png", width: 80%),
      caption: [Detail zastávky],
    ) <currentSidebar>
  ],
  [@onlineDpmp],
)

===== Přehled klíčových funkcí


#figure(
  table(
    columns: (auto, auto),
    align: left,
    table.header([Funkční oblast], [Vazba na funkci]),
    "F1 - Zobrazování aktuálních poloh na mapě", "-",
    "F2 - Detail spoje jedoucího vozidla", "F1",
    "F3 - Filtrování linky uživatelem", "F1",
    "F4 - Vyhledání zastávky", "F1",
    "F5 - Přehled odjezdů ze zastávky", "F4",
  ),
  caption: [Identifikace hlavních funkcí systému],
)

== Klíčové procesy aplikace

#config.todo[
  Cílem procesní analýzy je porozumět skutečnému průběhu činností, které jsou informačním systémem podporovány, a identifikovat oblasti, ve kterých může návrh nového řešení přinést zlepšení.
]

===== Aktualizace dat jízdních řádů

Pravidelný proces, který navazuje na podnikové procesy dopravců.
Interval mezi výměnnou dat je nepravidelný, vždy v závislosti na změnu jízdních řádů dopravce. Vždy však ke změně jízdního řádu dochází alespoň jednou ročně.

- *Vstup*: Soubor zdrojových dat jízdního řádu
- *Výstup*: Transformovaná data, čitelná pro IS
- *Hlavní kroky*:
  - Informování správce systému o změně jízdních řádů
  - Transformace zdrojových dat za pomocí skriptu
  - Nahrání transformovaných dat a nasazeni nové verze
- *Kde vstupuje IS*:
  - IS zajišťuje transformaci dat, včetně validace vstupu
- *Kde jsou ruční zásahy*:
  - Informování správce je nutné provést ručně
  - Transformace vstupu a výstupu vyžaduje ruční kontrolu
  - Nahrání dat a vydání nové verze je nutné provést ručně

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
