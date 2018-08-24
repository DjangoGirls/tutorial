# Wat is Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is een gratis en open source web-framework, geschreven in Python. Een web-framework is een set onderdelen die je helpen om sneller en makkelijker websites te maken.

Als je een website aan het bouwen bent, dan heb je altijd een vergelijkbare set aan onderdelen nodig: een manier om met gebruikersauthenticatie om te gaan (registreren, inloggen, uitloggen), een beheerderspaneel voor de website, formulieren, een manier om bestanden te uploaden, etc.

Gelukkig voor ons hebben andere mensen allang opgemerkt dat webontwikkelaars steeds dezelfde problemen tegenkomen bij het bouwen van een nieuwe site, dus zijn ze samen opgetrokken en hebben verschillende frameworks gecreëerd (Django is daar één van) die je kant-en-klare onderdelen geven om te gebruiken.

Frameworks zijn er dus om te voorkomen dat je steeds het wiel opnieuw hoeft uit te vinden en om dubbel werk te voorkomen bij het bouwen van een nieuwe site.

## Waarom heb je een framework nodig?

Om beter te begrijpen wat Django precies doet moeten we kijken naar de servers. Het allereerste wat een server moet weten is dat jij wil dat de server jou een website voorschotelt.

Stel je een postbus (port) voor die binnenkomende brieven (requests) controleert. Dit wordt gedaan door een webserver. De webserver leest de brief en verstuurt vervolgens een antwoord met een webpagina. Maar wanneer je wat wilt sturen, heb je ook wat inhoud nodig. Django is iets wat je helpt de inhoud te creëren.

## Wat gebeurt er als iemand een website opvraagt van jouw server?

Wanneer een request wordt ingediend bij de webserver, wordt het doorgespeeld naar Django, wat vervolgens probeert uit te zoeken wat er precies gevraagd wordt. Het kijkt eerst naar het adres van de webpagina om te bepalen wat er moet gebeuren. Dit gedeelte wordt gedaan door Djangos **urlresolver** (het adres van een website wordt ook wel URL genoemd - Uniform Resource Locator - dus de naam *urlresolver* betekent 'url oplosser'). De urlresolver is niet heel slim: het kijkt gewoon naar patronen en probeert een overeenkomst met de URL te vinden. Django controleert de patronen van boven naar beneden en als er een overeenkomst is gevonden wordt de request doorgestuurd naar de bijbehorende functie (die een *view* genoemd wordt).

Stel je een postbode met een brief voor. Ze loopt langs de straat en controleert elk huisnummer met die op de brief. Wanneer het overeenkomt, brengt ze de brief daar. Dit is hoe de urlresolver werkt!

In de *view* functie worden alle interessante dingen gedaan: we kunnen de database bekijken en er informatie uit opvragen. Misschien heeft de gebruiker gevraagd om iets in de data te wijzigen? Net zoals een brief met het verzoek "verander alsjeblieft de omschrijving van mijn baan", kan de *view* controleren of je daar wel toestemming voor hebt. Als je die toestemming hebt wordt de omschrijving geüpdatet en wordt een bericht teruggestuurd met: "Gedaan!" Vervolgens genereert de *view* een antwoord wat Django naar de webbrowser van de gebruiker kan sturen.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!