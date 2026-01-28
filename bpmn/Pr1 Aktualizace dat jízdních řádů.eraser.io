textSize large
title Online Order Fulfillment

Proces aktualizace dat jízdních řádů [color: yellow, colorMode: outline, styleMode: plain] {
  Dopravce {
    Změna jízdního řádu [type: event]
    Informování správce systému o změně jízdních řádů [type: activity, icon: mail]
    Odpověď na dotaz [type: activity]
  }
  Správce systému {
    Převzetí informace o změně jízdního řádu [type: activity, icon: mail]
    Ruční kontrola výstupních dat [type: activity]
    Nahrání dat do systému [type: activity]
    Nasazení nové verze aplikace [type: activity]
    Byli předány všechny informace? [type: gateway, icon: x]
    Řešení chyby v datech [type: activity]
    Doptání se na informace [type: activity]
  }
  Informační systém {
    Transformace zdrojových dat jízdního řádu [type: activity]
    Validace transformovaných dat [type: activity]
    Jsou data validní? [type: gateway, icon: x]
    Aktualizovaná data jízdních řádů dostupná v IS [type: event]
  }
}

Změna jízdního řádu > Informování správce systému o změně jízdních řádů
Informování správce systému o změně jízdních řádů > Převzetí informace o změně jízdního řádu
Převzetí informace o změně jízdního řádu > Transformace zdrojových dat jízdního řádu
Transformace zdrojových dat jízdního řádu > Validace transformovaných dat
Validace transformovaných dat > Jsou data validní?
Jsou data validní? > Ruční kontrola výstupních dat: Ano
Ruční kontrola výstupních dat > Nahrání dat do systému
Nahrání dat do systému > Nasazení nové verze aplikace
Nasazení nové verze aplikace > Aktualizovaná data jízdních řádů dostupná v IS
Jsou data validní? > Byli předány všechny informace?: Ne
Řešení chyby v datech > Transformace zdrojových dat jízdního řádu
Byli předány všechny informace? > Řešení chyby v datech: Ano
Byli předány všechny informace? > Doptání se na informace: Ne
Doptání se na informace > Odpověď na dotaz
Odpověď na dotaz > Řešení chyby v datech