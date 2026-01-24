#import "config.typ" as config

= Specifikace požadavků na funkce IS

Cílem této kapitoly je provést specifikace požadavků na funkce IS.
Bude proveden krok 3 procesní analýzy IS, *analýza a identifikace nedostatků*.
Následně krok 3 funkční analýzy IS, *definování funkčních a nefunkčních požadavků*.

== Analýza a identifikace nedostatků

Krok 3 procesní analýzy IS.
V tomto kroce dojde k vyhodnocení procesů z hlediska efektivity, časové náročnosti, chybovosti a míry podpory informačním systémem.

== Definování funkčních a nefunkčních požadavků

Krok 3 funkční analýzy IS.
Dojde k definování požadavků na nový IS.
Požadavky budou vycházet z očekávání uživatelů, nebo jako důsledek analýz předchozích kroků.
Výsledkem bude tabulka požadavků.
@Sommerville2015

#config.todo[
  Správný formát tabulky požadavků
  - ID požadavku - jednoznačný identifikátor (např. FR-01, NFR-02)
  - Název - krátké shrnutí požadavku
  - Popis požadavku - jednoznačný, testovatelný popis
  - Typ - funkční / nefunkční
  - Priorita - např. vysoká / střední / nízká
  - Zdroj - stakeholder, proces, legislativa
  - Vazba na proces - konkrétní BPMN proces nebo krok
]







== Prerekvizity klíčových procesů

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

===== Zdroj dat o polohách vozidel


== Administrativní rozhraní

===== Formulář pro nahrání nových dat

Důležitým funkčním požadavkem pro nový IS bude možnost nové data o jízdních řádech poskytnout i pomocí administrativního rozhraní.
Tato nutnost vznikla z důvodu existence nestandartních událostí, které z provozních a jiných důvodů nevyžadují reportovat změnu v jízdních řádech na CIS JŘ.


