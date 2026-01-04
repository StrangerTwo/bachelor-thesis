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

Kroky funkční analýzy:

- *Analýza a sběr požadavků*:
  - Pochopení problému:
- *Modelování stávajícího stavu (As-Is)*:
  - Popis aktuálních funkcí systému
  - Data Flow Diagram (DFD): grafické znázornění toku dat, procesů a uložišť
  - Kontextový diagram: Zobrazení hranic systému a interakcí s externím prostředím
- *Definování funkčních a nefunkčních požadavků*:
  - Funkční: obsahují požadavky, které IS má naplňovat (př. zobrazit aktuální polohy vozidel)
  - Nefunkční: obsahují požadavky, které IS nemá překročit (př. výkon, bezpečnost)
- *Návrh budoucího stavu (To-Be)*:
  - Definice cílů, jak by měl systém fungovat
  - Návrh funkcí, které by nový systém měl
- *Dokumentace*:
  - Sepsání výsledků analýzy
  - Přiložení diagramů

===== Procesní analýza (Business Process Analysis)

Systém je analyzován podle toho, jaké podnikové procesy podporuje.
V této analýze je kladen důraz na přesnou identifikaci částí IS, které mají přímý dopad na chod organizace. Cílem je pochopit tok činností, vstupy, výstupy a odpovědnosti. @Dumas2018

Při správném zpracování této analýzy, propojí reálné procesy organizace s IS.
Dokáže odhalit neefektivní procesy a problémová místa podnikových procesů.
Slouží jako podklad pro manuální operace, které by bylo možné z části, nebo plně automatizovat.

Kroky procesní analýzy:

- *Identifikace a vymezení podniku*:
  - Obeznámení se s podnikem a jeho podnikovým záměrem
  - Určení, které části budou analyzovány
- *Mapování stávajícího stavu (As-Is)*:
  - Pozorování, dotazovaní a měření operací aktérů za účelem identifikace procesů podniku
  - Vytvoření procesních map, obsahující vstupy, výstupy, kroky a role
- *Analýza a identifikace nedostatků*:
  - Vyhodnocení současného stavu
  - Hledání defektů, úzkých míst a příležitostí pro zlepšení
- *Návrh optimalizace (To-Be)*:
  - Vytvoření modelů budoucího stavu procesů
- *Implementace a monitorování*:
  - Zavedení změn (např. implementace nového IS)
  - Následné sledování, zda dochází k efektivnímu dosahování cílů

===== Modelování procesů pomocí BPMN

Business Process Model and Notation (BPMN) je standardizovaný jazyk pro grafické modelování procesů. @omg2013bpmn202 @freund2012reallifebpmn @weske2024bpm
Byl vytvořen s cílem sjednotit způsob jejich dokumentace a zlepšit komunikaci mezi technickými a netechnickými účastníky projektu.

Modely BPMN jsou jedním z průmyslových standardů. Umožňuje identifikovat, které části procesu jsou v IS podporovány. K jakým interakcím uživatele se systémem dochází.
