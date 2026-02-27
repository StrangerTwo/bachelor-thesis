#import "config.typ" as config

= Informační bezpečnost a dohled nad provozem aplikace

Cílem této kapitoly je zhodnotit doporučení pro informační bezpečnost IS a možnosti IS pro dohled nad provozem aplikace.
Kapitola odpovídá poslednímu kroku procesní analýzy IS, *implementace a monitorování*.
@Davenport1993

===== Monitorování IS

Klíčovou fází koloběhu IS je monitorování jeho stavu i po uvedením do provozu.
Požadavky *Po08* a *Po09* vyžadují neustálou kontrolu pro zajištění bezchybnosti IS.

Pro monitorování výkonu IS je vhodným řešením sledování využítí zdrojů stroje.
Vytížení stroje v čase kolísá, je tedy proto vhodné zaznamenávat a porovnávat statistiku v různých časových oknech.
Porovnávat je dobré stav zatížení "vklidu" oproti zatížení za zvýšeného provozu.

"Vklidu" je možné pozorovat vytížení systému v moment, kdy není IS aktivně využíván.
Jde např. o víkend, nebo noční hodiny.
V tento moment je možné zaznamenat minimální požadavky pro provoz IS.
Zhodnocení zatížení v tomto stavu může sloužit k výpočtu očekávaných nákladů na provoz IS.

Za zvýšeného provozu dochází k maximálnímu vytížení IS.
Zvýšený provoz lze porozovat tradičně v poledních hodinách ve všední den.
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

#config.todo[
  TODO, @onlineSecurity
]

V oblasti webové bezpečnosti je vhodné zaměřit se na 10 nejkritičtějších bezpečnostních hrozeb webových aplikací.
@OWASPTop10

===== Authentikace

===== Autorizace

===== Debug stránka v ADMIN

