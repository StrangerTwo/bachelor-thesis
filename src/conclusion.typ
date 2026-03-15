#show heading: h => upper(h)

#pagebreak()

= Závěr

Cílem mé bakalářské práce bylo provést zhodnocení současného stavu a vytvořit návrh vylepšení systému pro zobrazování poloh vozidel MHD.

První kapitola se věnovala porozumění tématu informačních systémů.
Byly sepsány potřebné teoretická východiska pro tuto práci.
Představené analýzy IS sloužili jako rámec pro zbylé části práce.

Druhá kapitola sloužila k představení aktuálního IS.
Bylo popsáno, jakou roli zaujímá IS v podniku, kteří aktéři k IS přistupují a účel IS pro zájmy podniku.
Byly identifikovány klíčové části IS a jednotlivé prvky převedeny do modelů funkční a procesní analýzy IS.
Klíčové funkcionality IS byli zaznamenány hromadně v tabulce hlavních funkcí systému.
Existující procesy IS byli zaznamenány v tabulce procesů aktuálního IS.

Třetí kapitola se zaměřila na hodnocení vlastností aktuálního IS.
Procesy IS byly dekomponovány na dílčí činnosti.
Činnosti procesů byli hodnoceny na základně nutnosti ručních zásahů, chybovosti a časové náročnosti.
Byly představeny datové formáty, které musí IS podporovat.
Nalezené nedostatky sloužili jako podklad pro definování funkčních a nefunkčních požadavků na nový IS.
Funkční a nefunkční požadavky byly souhrnně sepsány do tabulky požadavků.

Čtvrtá kapitola se věnovala návrhu implementace nového IS.
Na základně funkčních a nefunkčních požadavků byl připraven návrh nového IS.
Pro návrh nového IS byla zvolena vhodná architektura.
K naplnění požadavků byly navrhnuty tři komponenty.
Pro vzniklé komponenty byly vytvořeny designy uživatelského rozhraní.
Upravené procesy byly zakresleny v podobě BPMN diagramů.

Pátá kapitola pojednávala nad informační bezpečností a dohledem na provoz IS.
Práce se zaměřila na nutnost monitorování IS po jeho nasazení.
Byly představeny vybraná doporučení pro zajištění informační bezpečnosti, převážně v oblasti autentizace a autorizace uživatele.

Poslední kapitola se věnovala zhodnocení návrhu nového IS.
Rozdíly mezi aktuálním stavem a návrhem byli zhodnoceny z technické stránky.
Došlo k zamyšlení nad různými možnostmi pro další rozvoj IS.

Přínosem této práce je praktický návrh informačního systému, který může usnadnit cestování cestujícím a sloužit dopravcům při komunikaci s veřejností. 

#pagebreak()

#bibliography(
  "sources.bib",
  title: "Použitá literatura",
  style: "iso690-numeric-brackets-cs.csl",
)

// #pagebreak()

// #outline(
//   title: heading("Přílohy", outlined: true),
//   target: figure.where(kind: "attachment"),
// )
