# Hur Internet fungerar

> För läsare hemma: detta kapitel är täckt i filmen [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Detta kapitlet är inspirerat av Jessica McKellars föredrag "How the Internet Works" (http://web.mit.edu/jesstess/www/).

Vi satsar på att du använder Internet varje dag. Men vet du vad som faktiskt händer när du skriver in en adress som https://djangogirls.org i din webbläsare och trycker på `retur`?

Det första du behöver förstå är att en webbplats består av ett gäng filer som sparas på en hårddisk -- precis som dina filmer, musik, eller bilder. Men det finns en sak som är unik för hemsidor: de innehåller programkod som kallas HTML.

Om du inte är bekant med programmering kan det vara svårt att förstå HTML först, men din webbläsare (som Chrome, Safari, Firefox, etc.) älskar det. Webbläsare är designade för att förstå denna kod, följa dess instruktioner och presentera alla filer som din hemsida är gjord av precis på det sättet som du vill att de ska presenteras.

Precis som med alla filer måste vi lagra HTML-filer någonstans på en hårddisk. För Internet använder vi speciella kraftfulla datorer som kallas *servrar*. De har ingen skärm, mus eller tangentbord, för deras huvudsyfte är att lagra data och göra den åtkomlig. Det är därför de kallas *servrar* - eftersom de *serverar* din information.

Okej, men du vill säkert veta hur Internet ser ut, eller hur?

Vi har ritat en bild åt dig! Så här ser det ut:

![Figur 1.1](images/internet_1.png)

Visst ser det stökigt ut? Egentligen är det ett nätverk av anslutna datorer (ovan nämnda *servers*). Hundratusentals datorer! Många, många mil av kabel runt världen! Du kan besöka en karta över undervattenskablar (http://submarinecablemap.com) som visar hur komplicerat nätet är. Här är en skärmdump från hemsidan:

![Figur 1.2](images/internet_3.png)

Visst är det fascinerande? Men självklart går det inte att ha en kabel mellan varje dator som är ansluten till Internet. Så får att nå en dator (till exempel den där https://djangogirls.org finns sparad) måste vi skicka en begäran genom många olika datorer.

Så här ser det ut:

![Figur 1.3](images/internet_2.png)

Tänk dig att, när du skriver https://djangogirls.org, skickar du ett brev där det står: "Hej Django Girls, jag vill se hemsidan djangogirls.org. Snälla skicka den till mig!"

Ditt brev går till postkontoret närmast dig. Sen skickas det vidare till ett kontor som är lite närmare adressaten, och så vidare tills det når sin destination. Det unika är att även om du skickar många brev (*datapaket*) till samma plats kan de transporteras via helt olika postkontor (*routrar*). Det beror på hur de distribueras vid varje kontor.

![Figur 1.4](images/internet_4.png)

Ja, så simpelt är det. Du skickar meddelanden och förväntar dig ett svar. Istället för papper och penna använder du byte data, men idén är den samma!

Istället för adresser med gatunamn, ort, postnummer och land, använder vi IP-adresser. Din dator ber en DNS-server (Domain Name System) att översätta djangogirls.org till en IP-adress. Det fungerar lite som en gammaldags telefonkatalog där du kan leta efter namnet på en person du vill kontakta och hitta deras telefonnummer och adress.

När du skickar ett brev behövs några olika saker för att det ska komma fram ordentligt: en adress, frimärke osv. Du använder även ett språk som mottagaren förstår, eller hur? Detsamma gäller de *datapaket* som du skickar till en webbplats. Vi använder ett protokoll som kallas HTTP (Hypertext Transfer Protocol).

Så när du har en hemsida måste du helt enkelt ha en *server* där den bor. När *servern* tar emot en inkommande *begäran* (i ett brev), skickar den tillbaka din webbplats (i ett annat brev).

Eftersom detta är en tutorial för Django, kommer du säkert fråga vad Django gör. När du skickar ett svar, vill du inte alltid skicka samma sak till alla. Det är mycket bättre om dina brev är personliga till personen som precis har skrivit till dig, eller hur? Django hjälper dig att skapa dessa personliga, intressanta brev. :)

Nog med prat- dags att skapa något!