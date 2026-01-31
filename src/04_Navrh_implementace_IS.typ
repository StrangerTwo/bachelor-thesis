#import "config.typ" as config

= Návrh implementace IS

Cílem této kapitoly je vytvořit návrh implementace IS.
Bude proveden krok 4 funkční analýzy IS, *návrh budoucího stavu*.
Následně krok 4 procesní analýzy IS, *návrh optimalizace procesů*.

== Návrh budoucího stavu

Krok 4 funkční analýzy IS.
Dle definovaných požadavků budou zfinalizovány cíle nového IS.
Návrh budoucího stavu obsahuje funkce, datové toky i uložiště nového IS.
@isManagement

Pro návrh nového IS je zvolena architektura *klient-server*, která umožňuje oddělení prezentační vrstvy od aplikační logiky a datové vrstvy.
@Sommerville2015
Klientská aplikace komunikuje se serverovou částí systému prostřednictvím vystaveného aplikačního rozhraní (API), které zajišťuje přístup k datům a službám systému.
Tento přístup zvyšuje modularitu systému, podporuje jeho škálovatelnost a umožňuje snadnější údržbu a další rozšiřování funkcionality.
@BassClementsKazman2021

===== Uživatelská aplikace

Uživatelská aplikace bude veřejně dostupná pro cestující a nahradí zobrazovací vrstvu původního IS.
Požadavky *Po01*, *Po02* budou součástí uživatelské aplikace.

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
Administrativní rozhraní je prostor pro minitorování aplikace a správu dat zobrazovaných v uživatelské aplikaci.

#config.sourcedFigure(
  [
    #figure(
      image("../images/admin_index.png", width: 80%),
      caption: [Ilustrační obrázek administrační rozhraní],
    ) <adminIndex>
  ],
  [@MhdOnlineAdmin],
)

Součástí administrativního rozhraní budou formuláře pro požadavky *Po03*, *Po04* a *Po05*.

#config.sourcedFigure(
  [
    #figure(
      image("../images/admin_jdf_upload.png", width: 80%),
      caption: [Ilustrační obrázek nahrání nových dat],
    ) <adminJdfUpload>
  ],
  [@MhdOnlineAdmin],
)


== Návrh optimalizace procesů

Krok 4 procesní analýzy IS.
Na základě vyhodnocených nedostatků bude vytvořen návrh nových zoptimalizovaných procesů.
Nové procesy budou využívat nových funkcí IS, s cílem automatizace ručních kroků.
@FreundRucker2014

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
      )
    ],
    [vlastní zpracování],
  )

  #v(1fr)
]
