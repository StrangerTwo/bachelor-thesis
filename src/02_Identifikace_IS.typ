#import "config.typ" as config

= Identifikace klíčových částí aktuálního IS

Cílem této kapitoly je provést identifikaci klíčových částí aktuálního IS.
Bude proveden krok 1 procesní analýzy IS, *identifikace a vymezení podniku*.
Následně krok 1 funkční analýzy IS, *sběr požadavků*.
Druhé kroky funkční analýzy IS, *modelování stávajícího stavu (As-­Is)*, a procesní analýzy IS, *mapování stávajícího stavu (As-­Is)*, budou sjednoceny do jedné podkapitoly.
@Sommerville2015

Cílem této kapitoly je vymezit hranice IS, identifikovat jeho hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace.
Vhodnou analýzou budou odhaleny slabá místa, redundance a chybějící funkcionality systému.
Kombinací metodických přístupů k analýze IS bude vytvořen podklad pro návrh cílového řešení.
@Dumas2018

== Identifikace a vymezení podniku

Nyní bude proveden první krok procesní analýzy IS.
Dojde k obeznámení s podnikem, jeho hlavními činnostmi, strategickými cíli a podnikovým záměrem.
Bude vymezen rozsah podniku, na jeho části podnikové procesy relevantní pro IS.
@Weske2012

===== Podnik

IS je určený pro dopravce hromadné veřejné dopravy.
Podnik v kontextu IS využívá aplikace, za účelem informování a zpříjemnění jízdy cestujícím.

Systém je vybavený pro práci s daty jízdních řádů, v zákonem požadovaných formátech.

===== Mise

Klientská aplikace má za úkol zobrazit data o spojení vozidel MHD rychle a jednoduchým způsobem.
Aplikace by měla sloužit jako dodatečný komunikační kanál dopravce, aby sdělil důležitá upozornění cestujícím.

===== Vize

Jednoduchá klientská aplikace by se měla rozšířit mezi větší část cestujících
a stát se aktivně využívaným místem pro zobrazování aktuálních situací, které ovlivňují cestující.

===== Podnikové procesy

IS má za účel podporovat podnik v jeho procesech a komunikaci s cestujícími.
Může zastávat roli informativní a propagační.
Systém je provozován přímo u koncových zákazníků podniku a proto je možné jej využít jako komunikační kanál dopravců se svými zákazníky.

== Sběr požadavků

Nyní bude proveden první krok funkční analýzy IS.
Hlavním cílem bude pochopení problému, který IS řeší.
V tomto kroku dojde k poznání funkcionalit IS, jejich vlastností a způsoby využívání IS jednotlivými skupinami uživatelů.
@Sommerville2015

=== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má za úkol zpřístupnit veřejnosti data o aktuálních polohách spojů, jejich zpožděních, nebo jiných provozních událostech, které se týkají cestujících.

Aplikace je z velké části využívána ve chvíli, kdy je cestující rozhodnutý cestovat veřejnou hromadnou dopravou a potřebuje zjistit informace o dostupných dopravních spojeních.
Užitek aplikace pro cestujícího spočívá v rychlosti, snadné ovladatelnosti a dostupnosti během cestování.

===== Skupiny uživatelů

Uživatelské skupiny lze rozdělit na primární a sekundární.
@Sommerville2015
Dle tohoto dělení je primární skupina cestujících oddělena od sekundární skupiny interních rolí.
Na základě doporučení pro návrh provozně kritických systémů, je vhodné sekundární skupinu rozdělit dle role na provozní a administrátorskou. @DennisWixomTegarden2015
Jako součást návrhu manažerských a podpůrných IS je vhodné zahrnout i manažerskou skupinu uživatelů. @isManagement

*Cestující* jsou primárním uživatelem IS, požadují informace o aktuálním zpoždění a provozních upozorněních.
*Dispečeři* jsou privilegovaným uživatelem IS, zajišťují přesnost zobrazovaných dat, publikují provozní upozornění.
*Administrátoři* jsou správci aplikačního serveru, zajišťují bezchybový běh aplikace, sledují zátěž a provozní log serveru.
*Vedení* vyžadují znát metriky o návštěvnosti a návratnosti uživatelů, popř.
jiné statistiky využívání aplikace.

Diagram přístupů uživatelských skupin je zobrazen na @topologyOld[Obrázku]

#config.sourcedFigure(
  [
    #figure(
      image("../images/topology_old.png", width: 80%),
      caption: [Topologie optimalizované IS],
    ) <topologyOld>
  ],
  [Vlastní zpracování],
)

=== Klíčové funkce aplikace

Analýzou IS dle funkční analýzy budou identifikovány hlavní funkce, jejich vzájemné vazby a význam pro podporu provozních procesů organizace.
K jednotlivým funkcionalitám budou popsány jejich vlastností a způsoby, jak s nimi jednotlivé skupiny uživatelů zacházejí.

===== Zobrazování aktuálních poloh na mapě

Primárním funkčním prvkem aplikace je zobrazování poloh vozidel na interaktivní mapě.
Mapa je aktualizovaná každých 8-12s kdy dochází i k aktualizaci dat na aplikačním serveru.
@currentIndex vyobrazuje funkci současného IS.

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

@currentDetail zobrazuje funkci současného IS.
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
Součástí postranní lišty jsou dodatečné možnosti pro ovládání aplikace.
@currentSidebar zobrazuje příklad aktuálního IS.

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
@currentStopDetail zobrazuje tento detail. Je zde zobrazena obdoba odjezdové tabule s příštími odjezdy.

#config.sourcedFigure(
  [
    #figure(
      image("../images/current_station_detail.png", width: 80%),
      caption: [Detail zastávky],
    ) <currentStopDetail>
  ],
  [@onlineDpmp],
)

===== Přehled klíčových funkcí

@currentFunctions obsahuje seznam funkcí aktuálního IS, včetně vzájemných vazeb na ostatní funkce aplikace.

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto, auto),
        align: left,
        table.header([ID], [Funkční oblast], [Vazba na funkci]),
        "F1", "Zobrazování aktuálních poloh vozidel na mapě", "-",
        "F2", "Detail spoje jedoucího vozidla", "F1",
        "F3", "Filtrování linky uživatelem", "F1",
        "F4", "Vyhledání zastávky", "F1",
        "F5", "Přehled odjezdů ze zastávky", "F4",
      ),
      caption: [Identifikace hlavních funkcí systému],
    ) <currentFunctions>
  ],
  [@onlineDpmp],
)

== Mapování stávajícího stavu

Tato kapitola se zabývá spojením druhých kroků funkční a procesní analýzy IS.
Dojde k identifikaci hlavních procesů v systému.
Dle východisek procesní analýzy IS je třeba analyzovat skutečný průběh činností souvisejících s IS, tak jak doopravdy probíhají.
Zmapování aktuálního stavu umožní identifikovat oblasti ke zlepšení v návrhu nového řešení.
@Dumas2018

===== Aktualizace dat jízdních řádů

Aktualizace jízdních řádů (proces Pr1) představuje pravidelný provozní proces IS, který úzce navazuje na podnikové procesy dopravce.
Proces je zahájen událostí změny jízdního řádu na straně dopravce.
K výměně jízdního řádu dochází vždy minimálně jednou ročně.
@onlineDpmp

*Vstupem* tohoto procesu je soubor zdrojových dat jízdního řádu, který je poskytován dopravcem ve stanoveném formátu.
*Výstupem* procesu jsou transformovaná data, strukturována pro strojové čtení informačním systémem.
*Hlavní kroky* procesu jsou v pořadí nejprve notifikování správce systému o změně jízdních řádů.
Následně probíhá transformace zdrojových dat pomocí specializovaného skriptu na datový balík využívaný IS.
Po úspěšné transformaci jsou data nahrána do systému a je nasazena nová verze aplikace.
*IS vstupuje* do procesu v moment transformace dat.
IS zajišťuje automatické zpracování vstupních souborů, včetně validace pro ověření konzistence dat.
*Ruční zásahy* procesu se vyskytují ve chvíli notifikování správce o změně.
Transformace dat a kontrola výstupních souborů vyžaduje ruční dohled, pro případ chyb.
Nahrání transformovaných dat do produkčního prostředí a vydání nové verze rovněž vyžaduje ruční zásah správce systému.

===== Zavedení nové zastávky

Zavedení nové zastávky (proces Pr2) do systému probíhá v aktuálním IS současně s aktualizací jízdního řádu.
Zastávka je vázaná na data jízdního řádu.
Správná identifikace a vazba na jízdní řád je zaručena validací.
Interní datový formát IS ukládá data jízdních řádů a zastávek společně, do jednoho datového balíku.
Z tohoto důvodu dochází v tomto procesu o překryv některých kroků mezi oběma procesy.

*Vstupem* procesu jsou data o nové zastávce.
*Výstupem* jsou zpracovaná data o zastávce s její GPS souřadnicí.
*Hlavními kroky* je notifikování správce systému o nové zastávce včetně její GPS souřadnice.
Následně probíhá transformace zdrojových dat pomocí skriptu a přepsání datového balíků novými daty.
Dalším krokem je vydání nové verze aplikace s aktualizovaným jízdním řádem a daty zastávek.
*IS do procesu vstupuje* zajištěním validace dat.
*Ruční zásahy* procesu se vyskytují ve chvíli notifikování správce systému, transformaci vstupu a i při vydání nové verze aplikace.

===== Výměna ikonky vozidel

Výměna ikonky vozidel (proces Pr3) v aplikaci je nyní možná pouze pomocí vydání nové verze aplikace.

*Vstupem* procesu je požadavek dopravce na výměnu ikonky, obsahující přílohu obrázku, který si dopravce přeje využít.
*Výstupem* je nově vydaná verze aplikace, zobrazující nové ikonky vozidel.
*Hlavními kroky* je notifikování správce systému o požadavku na změnu.
Následně správce systému provede manuální úpravu přílohy.
Dojde k upravení ikonka do formátu, podporového systémem.
Po tomto kroku dojde k vydání nové verze IS.
*Ruční zásahy* jsou v procesu v moment notifikování správce systému, při úpravě vstupu a i při vydání nové verze aplikace.

===== Tabulka hlavních procesů

@currentProcesses obsahuje seznam procesů, týkajících se aktuálního IS.
Zvlášť jsou poznamenány kroky, které v aktuálním IS mohou znamenat možné nedostatky.
Může jít o ruční zásah a ve kterých IS nenabízí dostatečnou podporu.

#config.sourcedFigure(
  [
    #figure(
      table(
        columns: (auto, auto, auto),
        align: left,
        table.header([ID], [Proces], [Možné nedostatky]),
        "Pr1",
        "Aktualizace dat jízdních řádů",
        [
          - notifikování správce o změně
          - vydání nové verze
        ],

        "Pr2",
        "Zavedení nové zastávky",
        [
          - lokalizace GPS souřadnic zastávky
          - vydání nové verze
        ],

        "Pr3",
        "Výměna ikonky vozidel",
        [
          - notifikování správce o změně
          - obstarání kompatibilní ikonky
          - vydání nové verze
        ],
      ),
      caption: [Přehled procesů aktuálního IS],
    ) <currentProcesses>
  ],
  [@onlineDpmp],
)
