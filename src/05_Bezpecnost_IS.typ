#import "config.typ" as config

= Informační bezpečnost a dohled nad provozem aplikace

Cílem této kapitoly je zhodnotit doporučení pro informační bezpečnost IS a možnosti IS pro dohled nad provozem aplikace.
Kapitola odpovídá poslednímu kroku procesní analýzy IS, *implementace a monitorování*.
@Davenport1993

===== Monitorování IS

Klíčovou fází koloběhu IS je monitorování jeho stavu i po uvedením do provozu.
Požadavky *Po08* a *Po09* vyžadují neustálou kontrolu pro zajištění bezchybnosti IS.

Pro monitorování výkonu IS je vhodným řešením sledování využití zdrojů stroje.
Vytížení stroje v čase kolísá, je tedy proto vhodné zaznamenávat a porovnávat statistiku v různých časových oknech.
Porovnávat je dobré stav zatížení "v klidu" oproti zatížení za zvýšeného provozu.

"V klidu" je možné pozorovat vytížení systému v moment, kdy není IS aktivně využíván.
Jde např. o víkend, nebo noční hodiny.
V tento moment je možné zaznamenat minimální požadavky pro provoz IS.
Zhodnocení zatížení v tomto stavu může sloužit k výpočtu očekávaných nákladů na provoz IS.

Za zvýšeného provozu dochází k maximálnímu vytížení IS.
Zvýšený provoz lze pozorovat tradičně v poledních hodinách ve všední den.
Výkon IS v momentech zvýšeného provozu je pociťován největším množstvím zákazníků, plynulost provozu je tedy v těchto chvílích nejkritičtější.
Případné výkonnostní nedostatky jsou následně řešeny možnou optimalizací IS, nebo škálováním procesních instancí IS.

Na @cpuUsage[Obrázku] je zobrazena ilustrace monitorovacího systému pro měření zatížení stroje informačním systémem.

#config.sourcedFigure(
  [
    #figure(
      image("../images/cpu_usage.png", width: 80%),
      caption: [Ilustrační obrázek monitorovacího software],
    ) <cpuUsage>
  ],
  [@MhdOnlineAdmin],
)

===== Autentizace uživatelů

Autentizace představuje proces ověření identity uživatele před zpřístupněním funkcí IS.
Jejím cílem je zajistit, aby systém komunikoval skutečně s osobou, která tvrdí, že je oprávněným uživatelem.

Po úspěšném ověření identity je uživateli vydán identitní token.
Identitní token je datová struktura obsahující informace o ověřeném uživateli a o době platnosti jeho přihlášení.
Tento token slouží jako důkaz o tom, že uživatel byl řádně autentizován.
Token je následně přenášen při dalších požadavcích na aplikační rozhraní systému.
Identitní token umožňuje opakované ověřování identity bez nutnosti opětovného zadávání přihlašovacích údajů.

Tento mechanismus je označován jako tokenová autentizace.
Jeho výhodou je oddělení samotného procesu ověřování identity od aplikační logiky systému a omezení manipulace s citlivými přihlašovacími údaji.
@Fielding2000

===== Autorizace přístupu

Autorizace je pojem úzce spojený s Autentizací.
V procesu ověření oprávnění autentizace představuje identifikaci uživatele.
Po identifikaci uživatele je autorizací ověřeno, že uživatel je oprávněn požadovanou akci provést.

Správně nastavená autorizace přístupu obsahuje vhodně definovaný seznam oprávnění, které mohou být uživateli přiřazena.
Po přijetí identitního tokenu dochází k jeho ověření na straně aplikační služby.
Systém kontroluje pravost tokenu, jeho časovou platnost, integritu dat a zda je uživatel oprávněný tento druh požadavku provést.
Po úspěšném ověření je uživateli umožněn přístup k příslušným zdrojům, nebo funkcím.

Oddělení autentizace a autorizace je základním principem bezpečného návrhu informačních systémů.
Umožňuje jednoznačné řízení přístupových práv a minimalizuje riziko neoprávněného přístupu k datům.
@BassClementsKazman2021

===== Integrita a ochrana přenášených identitních údajů

Identitní tokeny jsou opatřeny kryptografickým podpisem.
kryptografický podpis je využit v mechanismu, pro ověření, že pochází od důvěryhodného zdroje a že data nebyla během přenosu podvržena.
Podpis je kontrolován při každém požadavku aplikační službou.

Tento postup významně snižuje riziko podvržení identity nebo neoprávněné manipulace s přístupovými údaji.
Ověřování integrity a původu dat je zároveň v souladu s doporučeními pro bezpečný návrh webových aplikací uvedenými v rámci OWASP Top 10.
@OWASPTop10

===== Využití externí služby pro správu identit

V současné praxi vývoje webových informačních systémů je běžné oddělovat samotnou aplikační logiku od mechanismu ověřování identity uživatelů.
Ověřování identity je bezpečnostně velmi citlivá oblast.
Zahrnuje práci s přihlašovacími údaji, jejich bezpečné uchovávání, ochranu proti kyber-útokům, řízení obnovy hesel i dodržování aktuálních kryptografických standardů.
Implementace těchto mechanismů vlastními prostředky představuje vysoké nároky na odborné znalosti i průběžnou údržbu.
@OWASPTop10

Z tohoto důvodu je v moderní architektuře často využíván specializovaný poskytovatel správy identit.
Taková služba přebírá odpovědnost za bezpečné zpracování přihlašovacích údajů a za samotné ověření identity uživatele.
Aplikační část systému pak nepracuje s hesly ani jinými citlivými údaji, ale pouze s výsledkem ověření identity.
Tento přístup odpovídá principu minimalizace odpovědnosti a principu oddělení zodpovědností, které jsou považovány za základní principy bezpečných systémů.
@BassClementsKazman2021

===== Role aplikační části systému při autentizaci a autorizaci

Využití externí služby pouze upravuje proces ověření uživatele aplikační službou.
Proces ověření probíhá tak, že externí služba provede ověření identity uživatele.
Po úspěšném ověření identity externí služba vystaví uživateli elektronický doklad o jeho identitě.
Tento doklad je kryptograficky podepsán.
Uživatel se při požadavcích na aplikační službu identifikuje pomocí vystaveného dokladu.

IS díky tomuto rozdělení nikdy nemanipuluje s hesly uživatelů a bezpečnostní riziko je významně sníženo.
@onlineSecurity
