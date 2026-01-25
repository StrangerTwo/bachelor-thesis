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

===== Uživatelská aplikace

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

#config.sourcedFigure(
  [
    #figure(
      image("../images/admin_index.png", width: 80%),
      caption: [Ilustrační obrázek administrační rozhraní],
    ) <adminIndex>
  ],
  [@MhdOnlineAdmin],
)



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
