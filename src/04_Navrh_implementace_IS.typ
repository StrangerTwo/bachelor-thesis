#import "config.typ" as config

= Návrh implementace IS

Cílem této kapitoly je vytvořit návrh implementace IS.
Bude proveden krok 4 funkční analýzy IS, *návrh budoucího stavu*.
Následně krok 4 procesní analýzy IS, *návrh optimalizace procesů*.

===== Návrh budoucího stavu

Krok 4 funkční analýzy IS.
Dle definovaných požadavků budou finalizovány cíle nového IS.
Návrh budoucího stavu obsahuje funkce, datové toky i úložiště nového IS.
@isManagement

Pro návrh nového IS je zvolena architektura *klient-server*, která umožňuje oddělení prezentační vrstvy od aplikační logiky a datové vrstvy.
@Sommerville2015
Klientská aplikace komunikuje se serverovou částí systému prostřednictvím vystaveného aplikačního rozhraní (API), které zajišťuje přístup k datům a službám systému.
Tento přístup zvyšuje modularitu systému, podporuje jeho škálovatelnost a umožňuje snadnější údržbu a další rozšiřování funkcionality.
@BassClementsKazman2021

===== Topologie IS

Využitím architektury klient-server dojde k rozdělení IS na 3 hlavní komponenty.
Topologie nového IS je zobrazena na @topology[Obrázku].

#config.sourcedFigure(
  [
    #figure(
      image("../images/topology.png", width: 80%),
      caption: [Topologie optimalizované IS],
    ) <topology>
  ],
  [Vlastní zpracování],
)

*Aplikační služba* plní serverovou roli architektury.
Má za úkol obsluhovat všechny příchozí požadavky, uchovává data a je zodpovědná za spolehlivost a bezpečnost IS.

*Uživatelská aplikace* je spouštěna na klientských zařízeních.
Obstarává uživatelské rozhraní, včetně umožňování využití různých zobrazovacích funkcí pro cestujícího.
Komunikuje s aplikační službou pro získávání aktuálních dat.

*Administrativní rozhraní* je spouštěna na klientských zařízeních.
Přístup do této klientské aplikace je zabezpečen autentizací přihlášeného uživatele.
Obsahuje administrativní prvky, ovlivňující uživatelskou aplikaci.
Požadavky administrativní aplikace je nutné autorizovat a validovat i na straně aplikační služby.

===== Uživatelská aplikace

Uživatelská aplikace bude veřejně dostupná pro cestující a nahradí zobrazovací vrstvu původního IS.
Požadavky *Po01*, *Po02* a *Po03* budou součástí uživatelské aplikace.
Návrh rozhraní uživatelské aplikace je zobrazen na @appShowcase[Obrázku].

#config.sourcedFigure(
  [
    #figure(
      image("../images/app_showcase.png", width: 80%),
      caption: [Ilustrační obrázek uživatelské aplikace],
    ) <appShowcase>
  ],
  [@MhdOnlinePardubice],
)

===== Administrativní rozhraní

Administrativní rozhraní bude nová klientská aplikace.
Přístup do této aplikace je omezen pouze pro administrátora, dispečery a vedení dopravce.
Administrativní rozhraní je prostor pro monitorování aplikace a správu dat zobrazovaných v uživatelské aplikaci.
Návrh této administrativního rozhraní je zobrazen na @adminIndex[Obrázku].

#config.sourcedFigure(
  [
    #figure(
      image("../images/admin_index.png", width: 80%),
      caption: [Ilustrační obrázek administrativního rozhraní],
    ) <adminIndex>
  ],
  [@MhdOnlineAdmin],
)

Součástí administrativního rozhraní budou formuláře pro požadavky *Po04*, *Po05* a *Po06*.
Na @adminJdfUpload[Obrázku] je zobrazena ilustrace, jak by mohl *Po04 Formulář pro výměnu jízdního řádu* vypadat.

#config.sourcedFigure(
  [
    #figure(
      image("../images/admin_jdf_upload.png", width: 80%),
      caption: [Ilustrační obrázek formuláře pro výměnu jízdního řádu],
    ) <adminJdfUpload>
  ],
  [@MhdOnlineAdmin],
)


===== Návrh optimalizace procesů

Krok 4 procesní analýzy IS.
Na základě vyhodnocených požadavků bude vytvořen návrh nových optimalizovaných procesů.
Nové procesy budou využívat nových funkcí IS, s cílem automatizace ručních kroků.
@FreundRucker2014

Rozdělením IS dle architektury *klient-server* vznikla potřeba upravit stávající podnikové procesy tak, aby lépe odpovídaly navrženému řešení.
Hlavní procesy *Pr1*, *Pr2* a *Pr3* byly proto optimalizovány s ohledem na nové požadavky kladené na IS.
Zapojením administrativního rozhraní a formulářových prvků dochází k automatizaci části dříve manuálně prováděných činností.
Současně je ve většině případů odstraněna závislost procesů na přímé dostupnosti administrátora systému, což přispívá k plynulejšímu průběhu podnikových procesů.

Ze všech procesů byla odebrána činnost *T09 Nasazení nové verze aplikace*.
Tato činnost bude nově vyhrazena pouze pro vývoj nových funkcionalit, nebo opravy chyb systému.
Namísto této činnosti bude v procesech využívána činnost *T13 Aplikování změn v aplikaci*.
Tato změna představuje změnu v přístupu ke správě stavových dat systému.
Namísto pevně definovaných hodnot v aplikační logice jsou konfigurační hodnoty ukládány do databáze.
Tím dochází k oddělení aplikační logiky od datové vrstvy a zároveň k omezení nutnosti nasazovat novou verzi aplikace při změně konfiguračních údajů.

Proces *Pr1* byl přepracován tak, aby v případě bezchybného průběhu umožňoval provedení změny jízdního řádu dispečerem bez nutnosti zásahu správce systému.
Formulář pro změnu jízdního řádu obsahuje validační mechanismy, které jsou schopny dispečera upozornit na konkrétní chyby v datech.
Dispečer může po vyhodnocení upozornění provést opravu dat.
Optimalizovaný proces *Pr1* je znázorněn pomocí BPMN diagramu na @bpmnPr1New[Obrázku].

Proces *Pr2* byl rovněž přepracován.
Původně sloučený datový balík obsahující data jízdních řádů a zastávek byl rozdělen na samostatné části.
Toto rozdělení umožňuje nezávislou úpravu dat jízdních řádů a dat zastávek.
Optimalizovaný proces *Pr2* je znázorněn pomocí BPMN diagramu na @bpmnPr2New[Obrázku].

Proces *Pr3* byl upraven automatizací transformace ikonky do požadovaného formátu.
Za pomocí interaktivního formuláře je vložená ikonka transformována a předána ke kontrole.
Úspěšnou automatizací byla odebrána nutnost zásahu správce systému.
Optimalizovaný proces *Pr3* je znázorněn pomocí BPMN diagramu na @bpmnPr3New[Obrázku].

#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  #config.sourcedFigure(
    [
      #figure(
        image("../images/Pr1_v2 Aktualizace dat jízdních řádů.svg", width: 100%),
        caption: [BPMN diagram optimalizovaného Pr1 Aktualizace dat jízdních řádů],
      ) <bpmnPr1New>
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  #config.sourcedFigure(
    [
      #figure(
        image("../images/Pr2_v2 Zavedení nové zastávky.svg", width: 100%),
        caption: [BPMN diagram optimalizovaného Pr2 Zavedení nové zastávky],
      ) <bpmnPr2New>
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()

#[
  #set page(
    paper: "a3",
    margin: auto,
    flipped: true
  )
  #v(1fr)

  #config.sourcedFigure(
    [
      #figure(
        image("../images/Pr3_v2 Výměna ikonky vozidel.svg", width: 100%),
        caption: [BPMN diagram optimalizovaného Pr3 Výměna ikonky vozidel],
      ) <bpmnPr3New>
    ],
    [Vlastní zpracování],
  )

  #v(1fr)
]

#pagebreak()

#[
  // #set page(
  //   paper: "a3",
  //   margin: auto,
  //   flipped: true
  // )
  
  Upravené činnosti jednotlivých procesů byly sepsány v @newProcessStepsTable[Tabulce].

  #config.sourcedFigure(
    [
      #figure(
        table(
          columns: (auto, auto, auto, auto, auto, auto),
          align: left,
          table.header([ID], [Činnost], [Role], [Chybovost], [Časová#linebreak()náročnost], [Procesy]),
          "T05", "Řešení chyby v datech", "Dispečer", "Bezchybná", "Náročná", "Pr1",
          "T11", "Vyplnění dat jízdního řádu do formuláře", [Dispečer,#linebreak()Správce systému], "Bezchybná", "Střední", "Pr1",
          "T12", "Přijmutí dat formulářem", "Informační systém", "Možnost chyby", "Rychlá", [Pr1, Pr2,#linebreak()Pr3],
          "T13", "Aplikace změn v aplikaci", "Informační systém", "Bezchybná", "Rychlá", [Pr1, Pr2,#linebreak()Pr3],
          "T14", "Zaznamenání chyby", "Informační systém", "Bezchybná", "Rychlá", "Pr1",
          "T15", "Zobrazení chybové hlášky", "Informační systém", "Bezchybná", "Rychlá", "Pr1",
          "T16", "Upozornění administrátora", "Dispečer", "Bezchybná", "Rychlá", "Pr1",
          "T17", "Investigace problému", "Správce systému", "Bezchybná", "Náročná", "Pr1",
          "T18", "Oprava chyby", "Správce systému", "Bezchybná", "Náročná", "Pr1",
          "T19", "Vyplnění formuláře pro úpravu zastávky", "Dispečer", "Bezchybná", "Střední", "Pr2",
          "T20", "Aktualizace dat zastávky", "Informační systém", "Bezchybná", "Rychlá", "Pr2",
          "T21", "Vyplnění formuláře pro úpravu ikonky vozidla", "Dispečer", "Bezchybná", "Střední", "Pr3",
          "T22", "Transformace ikonky do požadovaného formátu", "Informační systém", "Bezchybná", "Rychlá", "Pr3",
          "T23", "Zobrazení upravené ikonky", "Informační systém", "Bezchybná", "Rychlá", "Pr3",
          "T24", "Kontrola ikonky v interaktivním formuláři", "Dispečer", "Bezchybná", "Střední", "Pr3",
        ),
        caption: [Tabulka činností všech procesů],
      ) <newProcessStepsTable>
    ],
    [Vlastní zpracování],
  )

]