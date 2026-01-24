#import "config.typ" as config

= Identifikace klíčových částí aktuálního IS

Cílem této kapitoly je provést identifikaci klíčových částí aktuálního IS.
Budou provedeny kroky procesní analýzy IS 1, *identifikace a vymezení podniku*.
Následně krok 1 funkční analýzy IS, *analýza a sběr požadavků*.
Kroky 2 funkční analýzy IS, *modelování stávajícího stavu (As-­Is)*, a procesní analýzy IS, *mapování stávajícího stavu (As-­Is)*, budou sjednoceny do jedné podkapitoly.

Cílem této kapitoly je vymezit hranice IS, identifikovat jeho hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace.
Vhodnou analýzou budou odhaleny slabá místa, redundance a chybějící funkcionality systému.
Kombinací metodických přístupů k analýze IS bude vytvořen podklad pro návrh cílového řešení.

== Identifikace a vymezení podniku

První krok procesní analýzy IS.
Dojde k obeznámení s podnikem, jeho hlavními činnostmi, strategickými cíli a podnikovým záměrem.
Bude vymezen rozsah podniku, na jeho části podnikové procesy relevantní pro IS.

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

===== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má
za úkol zpřístupnit veřejnosti informace o aktuálních polohách spojů,
jejich zpožděních, nebo jiných provozních událostech, které se týkají cestujících.

Z povahy aplikace je tedy využívána v moment, kdy je již cestující rozhodnutý cestovat veřejnou hromadnou dopravou a potřebuje zjistit aktuální stav dění.
Z tohoto předpokladu vychází požadavky na aplikaci aby byla rychlá, ovladatelná a dostupná v podmínkách se špatným přístupem k internetu.

===== Skupiny uživatelů

Aplikaci využívají následující skupiny uživatelů:

*Cestující* jsou primárním uživatlem IS, požadují informace o aktuálním zpoždění a provozních upozorněních.
*Dispečeři* jsou privilegovaným uživatelem IS, zajišťují přesnost zobrazovaných dat, publikují provozní upozornění.
*Administrátoři* jsou správci aplikačního serveru, zajišťují bezchybový běh aplikace, sledují zátěž a provozní log serveru.
*Vedení* vyžadují znát metriky o návštěvnosti a návratnosti uživatelů, popř.
jiné statistiky využívání aplikace.

===== Klíčové funkce aplikace

Provedením funkční analýzy IS budou identifikovány hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace.
Funkční analýza bude sloužit jako podklad pro návrh cílového řešení.
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
    ) <currentDetail>
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
    ) <currentSidebar>
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
    ) <currentSidebar>
  ],
  [@onlineDpmp],
)

===== Přehled klíčových funkcí

#config.sourcedFigure(
  [
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
    ) <currentSidebar>
  ],
  [@onlineDpmp],
)

== Mapování stávajícího stavu

Spojené druhé kroky funkční a procesní analýzy IS.

===== Klíčové procesy aplikace

Nyní bude provedena procesní analýza IS pro porozumění skutečnému průběhu činností souvisejících s IS, které v organizaci probíhají.
Procesní analýza umožní identifikovat oblasti ke zlepšení v návrhu nového řešení.

===== Aktualizace dat jízdních řádů

Pravidelný proces, který navazuje na podnikové procesy dopravců.
Interval mezi výměnnou dat je nepravidelný, vždy v závislosti na změnu jízdních řádů dopravce.
Vždy však ke změně jízdního řádu dochází alespoň jednou ročně.

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

===== Modelování procesů

#config.sourcedFigure(
  [
    #figure(
      image("../images/schedule_change_bpmn.png", width: 80%),
      caption: [Vývojový diagram změny jízdních řádu],
    ) <scheduleChangeFlowChart>
  ],
  [vlastní zpracování],
)

#config.sourcedFigure(
  [
    #figure(
      image("../images/client_data_request_bpmn.png", height: 50%),
      caption: [Sekvenční diagram toku dat polohy vozidel],
    ) <clientDataRequestSequence>
  ],
  [vlastní zpracování],
)

