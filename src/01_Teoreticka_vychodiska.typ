#import "config.typ" as config

= Teoretická východiska

Za účelem porozumění tématu nyní výjmenujeme definice a teoretická východiska pro tuto práci.

== Informační systém

IS je organizovaná množina prvků, které spolupracují za účelem sběru, zpracovávání, koordinace a procesování informací.
IS pomáhají při rozhodování, správě, analýze a vizualizaci procesů podniku.
IS se skládají z následujících prvků @Bruckner_2012 @Danel2013:

===== Hardware
fyzická zařizení, jako třeba servery, počítatě, mobilní telefony, které sbírají a zpracovávají data. V kontextu IS lze rozdělit na zařízení klientské a serverové. Např. servery zpracovávají větší množství dat a připravují je pro stovky klientských zařízení. Klientská zařízení následně dotazují serverové komponenty pro data personalizované pro jejich situaci (např. dle GPS polohy).

===== Software
aplikace a programy, které využívají hardware pro sbírají data, zpracovávají informace a např. je zobrazují cestujícím. Hlavnímy druhy software jsou databázové systémy, informační systémy pro správu dat. Je to díky těmto software aplikacích, které umožňují efektivní zpracovávání a distribuci informací.

===== Data
jsou v informačním systému shromažďovány a zpracovávány. Mohou zahrnovat data o jízdních řádech, geografické informace o polohách vozidel, nebo actuální feed informací o zpoždění. Data jsou základem pro rozhodování a plánování. Díky historickým datům je možné zpracovávat statistiku a vytvořit optimalizovaný jízdní řád na příští období.

===== Lidé
uživatelé a správci systému. Buďto k systému přistupují za účelem získání informací, nebo chtějí využít nashromážděná data pro provedení analýz, nebo ověření hypotéz pro jejich další rozhodování. Lidé musí být pro práci s informačním systémem proškoleni, aby mohli svoji práci provádět efektivně a nedocházelo při jejich práci k chybám.

== Metodický přístup k identifikaci klíčových částí IS

Identifikaci klíčových částí IS lze provádět pomocí mnoha metod.

===== Funkční analýza IS

Funkční analýza se zaměřuje na identifikaci funkcí, které systém poskytuje, bez ohledu na jejich technickou implementaci. Jejím výsledkem je přehled jednotlivých funkcionalit systému, rozdělených podle logických celků. @Sommerville2015

Tato analýza umožňuje strukturovaně popsat:

- klíčové moduly systému,
- vazby mezi nimi,
- datové toky,
- technické a procesní závislosti.

Díky funkční analýze lze jednoduše určit hranice systému a jeho hlavních komponent.

#config.todo[
  + Identifikace a analýza business procesů: Pochopení stávajících procesů (AS-IS) a návrh nových (TO-BE) s využitím IS, např. proces objednávky, skladové hospodářství.
  + Definice funkcí systému: Co přesně má systém umět? (např. správa dat, zadávání transakcí, generování reportů, automatické notifikace).
  + Stanovení uživatelských rolí a oprávnění: Kdo bude systém používat (manažer, skladník, účetní) a jaké akce bude moci provádět.
  + Specifikace datových modelů: Jaká data se budou v systému spravovat, jejich struktura a vztahy (např. zákazník, produkt, objednávka).
  + Definice vstupů a výstupů: Jaká data systém přijímá (vstupy) a jaké informace generuje (výstupy).
  + Uživatelské rozhraní (UI) a zkušenost (UX): Jak bude systém vypadat a jak se bude ovládat.
]

===== Procesní analýza (Business Process Analysis)

Systém je analyzován podle toho, jaké podnikové procesy podporuje.
V této analýze je kladen důraz na přesnou identifikaci částí IS, které mají přímý dopad na chod organizace. Cílem je pochopit tok činností, vstupy, výstupy a odpovědnosti. @Dumas2018

Při správném zpracování této analýzy, propojí reálné procesy organizace s IS.
Dokáže odhalit neefektivní procesy a problémová místa podnikových procesů.
Slouží jako podklad pro manuální operace, které by bylo možné z části, nebo plně automatizovat.

#config.todo[
  + Definice cílů: Stanovení, čeho chceme analýzou dosáhnout (např. zkrácení doby zpracování, snížení chyb).
  + Mapování současného stavu (As-Is): Detailní zaznamenání všech kroků, aktérů, systémů a dat v procesu (pomocí diagramů, flowchartů).
  + Analýza dat: Identifikace bottlenecks, plýtvání (NVA), rizik a příležitostí.
  + Návrh budoucího stavu (To-Be): Vytvoření optimalizovaného procesu, který řeší zjištěné problémy.
  + Implementace a monitoring: Zavedení změn a průběžné sledování jejich účinnosti.
]

===== Modelování procesů pomocí BPMN

Business Process Model and Notation (BPMN) je standardizovaný jazyk pro grafické modelování procesů. @omg2013bpmn202 @freund2012reallifebpmn @weske2024bpm
Byl vytvořen s cílem sjednotit způsob jejich dokumentace a zlepšit komunikaci mezi technickými a netechnickými účastníky projektu.

Modely BPMN jsou jedním z průmyslových standardů. Umožňuje identifikovat, které části procesu jsou v IS podporovány. K jakým interakcím uživatele se systémem dochází.
