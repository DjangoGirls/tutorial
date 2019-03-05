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

Föreställ dig en brevbärare med ett brev. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!