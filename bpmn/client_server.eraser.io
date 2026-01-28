title Vehicle Location Data Flow
autoNumber nested

// Define participants with icons and colors
Klient [icon: monitor, color: blue]
Server [icon: server, color: green]

// A request scenario
loop [label: každých 10 sekund, icon: clock] {
  Klient > Server: Požádání o data o polohách vozidel
  activate Klient
  
  activate Server
  Server > Server: Čtení dat z databáze
  Server > Server: Zpracování dat o polohách vozidel
  Server --> Klient: Odeslání dat o polohách vozidel
  deactivate Server
  alt [label: Úspěch, icon: check] {
    Server --> Klient: Validní odpověď
    Klient > Klient: Přijetí dat o polohách vozidel
    Klient > Klient: Zobrazení poloh vozidel
  }
  else [label: Chyba při zpracování, icon: x] {
    Server --> Klient: Chybová odpověď
    Klient > Klient: Zobrazení chybové hlášky uživateli
  }
  deactivate Klient
}

par [label: Více klientů, icon: users] {
  Klient -> Server: Další klient žádá o data
}