#import "config.typ" as config

= Specifikace požadavků na funkce IS

V této části popíšeme funkční a nefunkční požadavky na IS.

== Prerekvizity klíčových procesů

=== Otevřená data ČR

Pro účel zvěřejňování dat o jízdních řádech v České republice existuje *Celostátní informační systém o jízdních řádech* (CIS JŘ). Tento informační systém vznikl na základě vyhlášky Ministerstva dopravy ČR z roku 2014 @vyhlaskaCISJR a zprostředkovává veřejně dostupná data ve strojově čitelném formátu.

Data na FTP uložišti obsahují vícero druhů informací.

+ Jízdní řády #underline[vlakových spojení] ve formátu *XML*
+ Jízdní řády #underline[autobusové dopravy] ve formátu *JDF*

Pro potřeby požadovaného IS budou využívány jízdní řády autobusové dopravy ve formátu JDF

==== Datový formát JDF

Datový formát JDF je popsán dokumentací vydanou součástí metodického pokynu ministerstva dopravy. @jdfSpec

Tento datový formát disponuje informacemi o názvech, časováním a kilometráží autobusových spojů s dodatečnou možností označit spoj, či zastávku kódovou značkou.

Značnou nevýhodou tohoto datového formátu je absence geografických dat. GPS souřadnice zastávek je tedy nutno získat jiným způsobem.

=== Zdroj dat o polohách vozidel


== Administrativní rozhraní

=== Formulář pro nahrání nových dat

Důležitým funkčním požadavkem pro nový IS bude možnost nové data o jízdních řádech poskytnout i pomocí administrativního rozhraní. Tato nutnost vznikla z důvodu existence nestandartních událostí, které z provozních a jiných důvodů nevyžadují reportovat změnu v jízdních řádech na CIS JŘ.


