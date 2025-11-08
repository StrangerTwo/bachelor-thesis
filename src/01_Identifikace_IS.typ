= Identifikace klíčových částí aktuálního IS

== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má v Pardubickém kraji
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

Pro potřeby požadovaného informačního systému budou využívány jízdní řády městské hromadné dopravy dopravce IČO 63217066 Dopravní podnik města Pardubic a.s.

==== Datový formát JDF

Datový formát JDF je popsán dokumentací vydanou součástí metodického pokynu ministerstva dopravy. @jdfSpec

Tento datový formát disponuje informacemi o názvech, časováním a kilometráží autobusových spojů s dodatečnou možností označit spoj, či zastávku kódovou značkou.

Značnou nevýhodou tohoto datového formátu je absence geografických dat. GPS souřadnice zastávek je tedy nutno získat jiným způsobem.

=== Zdroj dat o polohách vozidel

Dopravní podnik města Pardubic a.s. v roce 2019 vydala zakázku pro vytvoření digitální rádiové sítě v Pardubicích. @dpmpRadiovaSit

Na základě tohoto kroku v následujících letech vytvořili aplikační rozhraní poskytující informace o vozidlech dopravce, všechně aktuální polohy.
