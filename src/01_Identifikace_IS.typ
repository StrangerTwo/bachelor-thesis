#import "config.typ" as config

= Identifikace klíčových částí aktuálního IS

Pro porozumění tématu se nyní zaměříme na definice a teoretická východiska pro tuto práci.

Bude třeba vymezit hranice informačního systému. Upřesnit jeho roli pro fungování podniku. Dekomponovat jej na jeho části a určit, jakými procesními kroky je možné celý systém zefektivnit.

== Informační systém

Informační systém (IS) je organizovaná množina prvků, které spolupracují za účelem sběru, zpracovávání, koordinace a procesování informací.
@Bruckner_2012
Informační systémy pomáhají při rozhodování, správě, analýze a vizualizaci procesů podniku.

Informační systémy se skládají z prvků několika druhů:

/ Hardware: fyzická zařizení, jako třeba servery, počítatě, mobilní telefony, které sbírají a zpracovávají data. V kontextu informačního systému můžeme rozdělit na zařízení klientské a serverové. Např. servery zpracovávají větší množství dat a připravují je pro stovky klientských zařízení. Klientská zařízení následně dotazují serverové komponenty pro data personalizované pro jejich situaci (např. dle GPS polohy)

/ Software: aplikace a programy, které využívají hardware pro sbírají data, zpracovávají informace a např. je zobrazují cestujícím. Hlavnímy druhy software jsou databázové systémy, informační systémy pro správu dat. Je to díky těmto software aplikacích, které umožňují efektivní zpracovávání a distribuci informací.

/ Data: informace, které jsou v informačním systému shromažďovány a zpracovávány. Mohou zahrnovat data o jízdních řádech, geografické informace o polohách vozidel, nebo actuální feed informací o zpoždění. Data jsou základem pro rozhodování a plánování. Díky historickým datům je možné zpracovávat statistiku a vytvořit optimalizovaný jízdní řád na příští období.

/ Lidé: uživatelé a správci systému. Buďto k systému přistupují za účelem získání informací, nebo chtějí využít nashromážděná data pro provedení analýz, nebo ověření hypotéz pro jejich další rozhodování. Lidé musí být pro práci s informačním systémem proškoleni, aby mohli svoji práci provádět efektivně a nedocházelo při jejich práci k chybám. @Danel2013

== Metodický přístup k identifikaci klíčových částí IS

Identifikaci klíčových částí informačního systému lze provádět pomocí mnoha metod.


=== Analýza podle funkčních oblastí IS

Informační systém je možné rozdělit na funkční celky, které reprezentují hlavní skupiny aktivit, které IS zajištuje. @Pressman2014

Tento příštup umožňuje strukturovaně popsat:

- klíčové moduly systému,
- vazby mezi nimi,
- datové toky,
- technické a procesní závislosti.

Tento způsob identifikace se uplatňuje především u systémů, které poskytují více navzájem samostatných, ale propojených funkcí.

=== Procesně orientovaná analýza

Systém je analyzován podle toho, jaké podnikové procesy podporuje.
V této analýze je kladen důraz na přesnou identifikaci částí IS, které mají přímý dopad na chod organizace. @Dumas2018

Při správném zpracování této analýzy, dokáže odhalit úzká místa podnikových procesů, nebo manuální operace, které by bylo možné z části, nebo plně automatizovat.

=== Analýza architektury a komponent

Rozbor architektury systému lze provést z hlediska systémového inženýrství.
@Blanchard2010
Analýza spočívá v identifikaci:

- softwarových komponent,
- API a integračních rozhraní,
- datové uložiště a formáty dat,
- infrastrukturní prvky (server, cloud, služby třetích stran)

Tento přístup je důležitý pro vyzobrazení technologických limitů, existenci kritických integrací, nebo využití nových technologií.

== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má
za úkol zpřístupnit veřejnosti informace o aktuálních polohách spojů,
jejich zpožděních, nebo jiných provozních událostech, které se týkají cestujících.

=== Mise

Klientská aplikace má za úkol zobrazit informace o spojení vozidel MHD rychle a jednoduchým způsobem.
Aplikace by měla sloužit jako dodatečný komunikační kanál dopravce, aby sdělil důležitá upozornění cestujícím.

=== Vize

Jednoduchá klientská aplikace by se měla rozšířit mezi větší část cestujících
a stát se aktivně využívaným místem pro zobrazování aktuálních situací, které ovlivňují cestující.

=== Cíle

#set enum(numbering: "1)")

+ Rozšířit aplikaci na 90% zastávek v podobě QR kódu obsahující přehled odjezdů spojů ze zaztávky do září 2026
+ Vytvořit administrativní backoffice aplikace pro možnost publikování provozních upozornění pro cestující do ledna 2026
+ Optimalizace klientské aplikace aby došlo ke snížení zátěže aplikačního serveru o 10% v příštích 12 měsicích

=== Metriky

+ Kontrola vystavených QR kódů
+ Zavedením administrativního backoffice do provozu
+ Dle analytických dat nashromážděných v nadcházejících 12 měsicích

== Klíčové procesy aplikace

=== Zobrazování aktuálních poloh na mapě

Primárním funkčním prvkem aplikace je zobrazování poloh vozidel na interktivní mapě. Mapa je aktualizovaná každých 8-12s kdy dochází i k aktualizaci dat na aplikačním serveru.

#figure(
  image("../images/current_index.png", width: 80%),
  caption: [Ukázka aplikace],
) <currentIndex>

=== Detail spoje jedoucího vozidla

Každé zobrazované vozidlo obsluhuje aktuálně provozovaný spoj a po jeho rozkliknutí je k dispozici zobrazení detail tohoto spoje.

#figure(
  image("../images/current_detail.png", width: 80%),
  caption: [Detail spoje],
) <currentDetail>

=== Filtrování linky uživatelem

Aplikaci může uživatel obsluhovat pomocí postranní lišty, ve které má k dispozici dodatečné ovládací prvky. Jedním z nich je možnost filtrovat spoje zobrazené v aplikaci.

=== Vyhledání zastávky

Vyhledávání zastávky je dalším prvkem postranní lišty.

#figure(
  image("../images/current_sidebar.png", width: 80%),
  caption: [Postranní lišta aplikace],
) <currentSidebar>

=== Přehled odjezdů ze zastávky

Po vyhledání, nebo zvolení zastávky je možné stejně jako u vozidla zobrazit její detail. Na tomto detailu je zobrazena obdoba odjezdové tabule s příštími odjezdy.

#figure(
  image("../images/current_station_detail.png", width: 80%),
  caption: [Detail zastávky],
) <currentSidebar>

== Prerekvizity klíčových procesů

=== Otevřená data ČR

Pro účel zvěřejňování dat o jízdních řádech v České republice existuje *Celostátní informační systém o jízdních řádech* (CIS JŘ). Tento informační systém vznikl na základě vyhlášky Ministerstva dopravy ČR z roku 2014 @vyhlaskaCISJR a zprostředkovává veřejně dostupná data ve strojově čitelném formátu.

Data na FTP uložišti obsahují vícero druhů informací.

+ Jízdní řády #underline[vlakových spojení] ve formátu *XML*
+ Jízdní řády #underline[autobusové dopravy] ve formátu *JDF*

Pro potřeby požadovaného informačního systému budou využívány jízdní řády autobusové dopravy ve formátu JDF

==== Datový formát JDF

Datový formát JDF je popsán dokumentací vydanou součástí metodického pokynu ministerstva dopravy. @jdfSpec

Tento datový formát disponuje informacemi o názvech, časováním a kilometráží autobusových spojů s dodatečnou možností označit spoj, či zastávku kódovou značkou.

Značnou nevýhodou tohoto datového formátu je absence geografických dat. GPS souřadnice zastávek je tedy nutno získat jiným způsobem.

=== Zdroj dat o polohách vozidel

