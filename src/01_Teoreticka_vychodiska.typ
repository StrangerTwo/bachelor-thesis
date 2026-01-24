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

Tato analýza umožňuje strukturovaně popsat klíčové moduly systému a vazby mezi nimi. Na základě identifikovaných datových toků určit technické a procesní závislosti. Díky funkční analýze lze jednoduše určit hranice systému a jeho hlavních komponent.

Funkční analýza se skládá z celkem pěti navazujících kroků.

Prvním krokem je *analýza a sběr požadavků*, jehož hlavním cílem je pochopení problému, který IS řeší. Tento krok slouží ke kompletnímu poznání aktuální IS, jeho funkcionalit, vlastností a způsobu využití jednotlivými skupinami uživatelů.
Jsou identifikovány potřeby uživatelských skupin a základní očekávání kladená na systém.
@WiegersBeatty2013

Druhým krokem funkční analýzy je *modelování stávajícího stavu (As-Is)*.
Cílem tohoto kroku je detailní popis aktuálních funkcí IS a způsobu jejich realizace.
Tento krok obsahuje identifikaci hlavních procesů, toků dat a vazeb mezi jednotlivými částmi systému.
Je možné využít grafického znázornění stávajícícho stavu pomocí diagramů. Diagram toku dat Data Flow Diagram - DFD, zobrazuje tok dat, procesy a uložiště. Kontextový diagram, vymezuje hranice systému a jeho interakce s okolním prostředím.
@Sommerville2015

Třetím krokem je *definování funkčních a nefunkčních požadavků*.
Na základě poznatků z analýz stávajícího stavu a kladených očekávání dojde k definování požadavků na nový IS.
Funkční požadavky popisují konkrétní činnosti a služby, které má IS poskytovat. Například zobrazení aktuálních poloh vozidel.
Nefunkční požadavky stanovují omezení a kvalitativní kritéria systému. Například požadavky na výkon, dostupnost, bezpečnost nebo použitelnost.
Rozdělení požadavků do dvou kategorií splňuje předpoklad přehledné specifikace pro návrh systému.
@SommervilleSawyer1997

Čtvrtým krokem je *návrh budoucího stavu (To-Be)*.
Dle definovaných požadavků jsou dány cíle budoucího řešení.
Finální návrh budoucího stavu zahrnuje poskytované funkce, způsoby, jakým tyto funkce budou podporovat podnikové procesy, včetně toků dat a uložišť nového IS.
@isManagement

Posledním krokem je *dokumentace výsledků analýzy*.
Tento krok zahrnuje systematické sepsání všech zjištěných poznatků, popis analyzovaných funkcí a procesů, a přiložení vytvořených diagramů.
Dokumentace složí jako podklad pro další fáze vývoje IS. Je vyžívána pro komunikaci mezi analytiky, vývojáři i jinými zainteresovanými stranami a tudíž je třeba klást důraz na přehlednost a srozumitelnost.
@StairReynolds2018

===== Procesní analýza (Business Process Analysis)

Systém je analyzován podle toho, jaké podnikové procesy podporuje.
Slouží k porozumění fungování organizace prostřednictvím jejích podnikových procesů. Na podnik je možné nahlížet jako soustavu vzájemně propojených procesů, které vytvářejí hodnotu pro zákazníka a podporují naplnění strategických cílů organizace.
V této analýze je kladen důraz na přesnou identifikaci částí IS, které mají přímý dopad na chod organizace. Cílem je pochopit tok činností, vstupy, výstupy a odpovědnosti. @Dumas2018

Procesy vyjedřují posloupnost činností, které transformují vstupy na výstupy a přispívají k naplnění podnikových cílů.
Při správném zpracování této analýzy, propojí reálné procesy organizace s IS.
Dokáže odhalit neefektivní procesy a problémová místa podnikových procesů.
Slouží jako podklad pro manuální operace, které by bylo možné z části, nebo plně automatizovat.

Procesní analýza se skládá z následujících kroků.

Prvním krokem je *identifikace a vymezení podniku*.
Dochází k obeznámení se s podnikem, jeho hlavními činnostmi, strategickými cíli a podnikovým záměrem.
V tomto kroce dojde k vymezení rozsahu analýzy, tedy kterých částí podniku a které procesy budou předmětem zkoumání. Vymezením rozsahu je zajištěna přehlednost a zaměření na klíčové procesy, na které mají vliv na požadavky kladené na IS.
@Weske2012

Druhým krokem je *mapování stávajícího stavu (As-Is)*.
Na základě pozorování, dotazování a měření činností jednotlivých aktérů dojde k identifikaci procesů.
Cílem je zachytit skutečný průběh procesů tak, jak probíhají v praxi, nikoliv tak, jak by měly ideálně probíhat.
Výsledkem je vytvoření procesních map, obsahující vstupy a výstupy, procesní kroky a role, podílející se na realizaci.
@Dumas2018

Třetím krokem je *analýza a identifikace nedostatků*.
Procesy jsou vyhodnoceny z hlediska efektivity, časové náročnosti, chybovosti a míry podpory informačním systémem.
Je kladen důraz na hledání defektů, úzkých míst a činností, které nepřinášejí přidanou hodnotu.
Identifikací nedostatků lze pojmenovat konkrétní problémy v procesech a formulovat důvody, proč dané procesy změnit, nebo podpořit novým IS.
@HammerChampy2006

Čtvrtým kromem je *návrh optimalizace (To-Be)*.
Na zákledně zjištěných nedostatků dojde k návrhu nových procesů po jejich optimalizaci. Zohledňují se možnosti automatizace, digitalizace a podpory IS.
Je definován cílový stav, u kterého lze porovnat přínosy navrhovaného řešení se současným stavem.
@FreundRucker2014

Posledním krokem je *implementace a monitorování*.
Implementace může zahrnovat zavedení nového informačního systému nebo úpravy stávajícího řešení tak, aby opdporovalo optimalizované procesy.
Po provedení změn je klíčové ověření, zda navrhované změny skutečně přinášení očekávané přínosy.
Následuje období sledování a vyhodnocování, zda dochází k efektivnímu dosahování stanovených cílů.
@Davenport1993

===== Modelování procesů pomocí BPMN

Business Process Model and Notation (BPMN) je standardizovaný jazyk pro grafické modelování procesů.
@omg2013bpmn202
Byl vytvořen s cílem sjednotit způsob jejich dokumentace a zlepšit komunikaci mezi technickými a netechnickými účastníky projektu.

Modely BPMN jsou jedním z průmyslových standardů. Umožňuje identifikovat, které části procesu jsou v IS podporovány. K jakým interakcím uživatele se systémem dochází.
@freund2012reallifebpmn

BPMN poskytuje soubor grafických elementů, pro přehledné modelování procesů. Hromadně se jedná o *komponenty a notace BPMN*:
@omg2013bpmn202

Mezi základní komponenty patří *Události (Events)*, které označují začátek, konec nebo mezistavy procesu.
Dále *Aktivity (Activities)*, tedy činnosti vykonávané aktéry nebo systémem. 
*Brány (Gateways)* jsou rozhodovacími body, které určují průběh procesu na základě podmínek nebo událostí.
*Toky (Sequence Flow)* jsou šipky zobrazující pořadí aktivit a průběhu procesu.
*Pule (Pools) a dráhy (Lanes)* vymezují účastníky procesu a jejich odpovědnosti.

Pro analýzu IS je vhodné využít několik typů diagramů. *Typy BPMN diagramů a jejich význam*:

*Diagramy procesů (Process Diagrams)* zobrazují detailní průběh jednotlivých procesů.
Slouží k zmapování aktivit a rozhodovacích bodů, které IS podporuje.
@weske2024bpm
*Kontextové diagramy (Collaboration / Choreography Diagrams)* znázorňují interakci mezi externími aktéry a systémem. Jsou vhodné pro vymezení hranic systému a zobrazení komunikačních toků.
@omg2013bpmn202
*Choreography / Conversation diagramy* umožňují sledovat výměnu zpráv účastníků procesu. Tyto diagramy jsou důležité při modelování interakcí napříč různými systémy, nebo moduly IS.
@freund2012reallifebpmn

Modelování BPMN má *využití při návrhu IS*: @freund2012reallifebpmn @Dumas2018

Ke *zmapování stávajících procesů (As-Is)*, pro identifikaci částí procesů s podporou IS.
Při *návrhu budoucího stavu (To-Be)*, díky možnosti vyzualizovat procesy po implementaci nového IS.
Slouží ke *zlepšení komunikace mezi účastníky projektu* jednotným jazykem pro analytiky, vývojáře i netechnické uživatele.
Každý krok procesu je možné propojit s konkrétní funkcí systému a tím *podporuje identifikaci funkčních požadavků IS*.