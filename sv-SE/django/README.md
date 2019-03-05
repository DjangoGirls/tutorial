# Vad är Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) är ett fritt webbapplikations-ramverk med öppen källkod, skrivet i Python. Ett webb-ramverk är en uppsättning komponenter som hjälper dig att utveckla webbplatser snabbare och enklare.

När du bygger en webbplats, måste du alltid ha en liknande uppsättning av komponenter: ett sätt att hantera användarautentisering (registrera dig, logga in, logga ut), en förvaltningspanel för din webbplats, blanketter, ett sätt att ladda upp filer, osv.

Lyckligtvis för dig, andra personer märkte för länge sedan att webbutvecklare står inför liknande problem när man bygger en ny webbplats, så att de slagit sig ihop och skapat webb-ramverk (Django är en av dem) som ger dig färdiga komponenter att använda.

Ramverk finns för att rädda dig från att ha uppfinna hjulet på nytt och för att lindra några av allmänna omkostnader när du bygger en ny webbplats.

## Varför behöver du en ramverk?

För att förstå vad Django är faktiskt till för, måste vi ta en närmare titt på servrarna. Det första är att servern behöver veta att du vill tjäna dig en webbsida.

Föreställ dig en brevlåda (port) som övervakas för inkommande brev (begäran). Detta görs av en webbserver. Webbservern läser brevet och skickar en webbsida som svar. Men om du vill skicka något, du behöver ha vissa innehåll. Och Django är något som hjälper dig att skapa det innehållet.

## Vad händer när någon begär en webbplats från din server?

När en begäran kommer till en webbserver, skickas det till Django som försöker räkna ut vad begärs faktiskt. Den tar en webbadress först och försöker räkna ut vad ska göras. Denna del görs av Django's **urlresolver** (observera att en webbadress kallas en URL – Uniform Resource Locator – så namnen *urlresolver* är vettigt). Den är inte så smart – den tar en lista med mönster och försöker matcha URL-adressen. Django kontrollerar mönster från topp till botten och om något matchas, överförs Django begäran till den associerade funktionen (som kallas *vy*).

Föreställ dig en brevbärare med ett brev. Hon går längs gatan och kontrollerar varje husnummer mot den på brevet. Om det matchar, sätter hon brevet där. Så här fungerar urlresolvern!

Det är i funktionen *vy* som alla intressanta saker görs: vi kan titta på en databas för att leta efter information. Kanske begärde användaren att ändra något i datan? Som ett brev som säger "Ändra beskrivningen av mitt jobb." *Vyn* kan kontrollera om du får göra det, kan sedan uppdatera jobbbeskrivningen för dig och skicka tillbaka ett meddelande: "Klar!" Då genererar *vyn* ett svar och Django kan skicka det till användarens webbläsare.

Beskrivningen ovan är lite förenklad, men du behöver inte veta alla tekniska saker än. Att ha en allmän idé är nog.

Så istället för att dyka för mycket in i detaljer, börjar vi skapa något med Django och vi kommer att lära oss alla viktiga delar längs vägen!