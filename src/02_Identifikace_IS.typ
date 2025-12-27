#import "config.typ" as config

= Identifikace klíčových částí aktuálního IS

Bude třeba vymezit hranice informačního systému (IS). Upřesnit jeho roli pro fungování podniku.
Dekomponovat jej na jeho části a určit, jakými procesními kroky je možné celý systém zefektivnit.

== Základní charakteristika aplikace

Informační systém pro zobrazování poloh vozidel MHD má
za úkol zpřístupnit veřejnosti informace o aktuálních polohách spojů,
jejich zpožděních, nebo jiných provozních událostech, které se týkají cestujících.

===== Mise

Klientská aplikace má za úkol zobrazit informace o spojení vozidel MHD rychle a jednoduchým způsobem.
Aplikace by měla sloužit jako dodatečný komunikační kanál dopravce, aby sdělil důležitá upozornění cestujícím.

===== Vize

Jednoduchá klientská aplikace by se měla rozšířit mezi větší část cestujících
a stát se aktivně využívaným místem pro zobrazování aktuálních situací, které ovlivňují cestující.

== Klíčové procesy aplikace

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
