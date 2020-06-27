Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel gebruikt, dan is het installatieproces anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud 9 is een hulpmiddel die je een code editor aanbiedt op een computer op het Internet. Hierop kan je de programmatuur installeren en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld. Hier is de instructie voor cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Je kan kiezen uit de een van de volgende IDEs. Volg een van onderstaande instructies.

#### Ga naar de PaizaCloud wolk IDE

1. Ga naar de [PaizaCloud wolk IDE](https://paiza.cloud/)
2. Meld je aan voor een account
3. Klik op *New Server* en kies Django app
4. Klik op Terminal knop (aan de linkerkant van het venster)

Nu zou je een scherm met een zijbalk en knoppen aan de linkerkant moeten zien. Klik op de "Terminal" knop om een scherm met een terminal te openen, met de volgende prompt:

{% filename %}Terminal{% endfilename %}

    $
    

De terminal op de PaizaCloud IDE is klaar voor je instructies. Je kunt het scherm vergroten of maximaliseren.

#### AWS Cloud9

Op dit moment vereist Cloud 9 dat je je aanmeldt met AWS en creditcardinformatie invoert.

1. Installeer Cloud 9 uit de [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Ga naar [c9.io](https://c9.io) en klik op * Get started with AWS Cloud9*
3. Registreer voor een AWS-account (vereist creditcardgegevens, maar deze kun je gratis gebruiken)
4. In het AWS Dashboard, typ *Cloud9* in de zoekbalk en klik erop
5. In het Cloud 9 overzicht, klik op * Create environment*
6. Noem deze *django-girls*
7. Tijdens het aanpassen van de instellingen, selecteer je * Create a new instance for environment (EC2)* voor “Environment Type” en de *t2.micro* “Instance type” (Er zou “Free-tier eligible.”) moeten staan. De standaard kosten-besparing instelling is in orde en je kan de andere standaard instellingen behouden
8. Klik op *Next step*
9. Klik op * Create environment*

Je zou nu een scherm moeten zien met een zijbalk, een hoofdvenster met enkele tekstblokken erin, en een klein venster beneden dat er ongeveer zo uitziet:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Het onderste scherm is je terminal. Je kunt de terminal gebruiken om instructies op afstand naar de Cloud 9 computer te versturen. Je kunt de grootte van dat scherm aanpassen om het iets groter te maken.

### Virtuele omgeving

Een virtuele omgeving (ook wel een virtualenv genoemd) is als een persoonlijke bak waarin we de computercode kunnen opslaan voor een project waaraan we werken. We gebruiken ze om de stukjes code van verschillende projecten apart te houden, zodat dingen uit verschillende projecten niet doorelkaar worden gehaald.

Uitvoeren:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(let op: op de laatste regel gebruiken we een tilde gevolgd door een 'is' teken: `~=`).

### GitHub

Maak een [GitHub](https://github.com)account aan.

### PythonAnywhere

De Django Girls Gids bevat een sectie over iets wat we Deployment noemen; dit is het proces om de code van je nieuwe webapplicatie over te zetten naar een publiek toegankelijke computer (een zogenaamde server) waar andere mensen je werk kunnen zien.

Dat gedeelte is een tikkeltje vreemd als je de Gids door neemt op een Chromebook omdat we al gebruik maken van een computer op het Internet (in tegenstelling tot bijvoorbeeld op een laptop). Het is echter nog steeds nuttig, doordat we onze Cloud 9 werkruimte kunnen zien als een plek voor onze aanpassingen en Python Anywhere als een plek om onze resultaten te laten zien wanneer het meer afgewerkt wordt.

Meld je daarom aan voor een nieuw Python Anywhere account op [www.pythonanywhere.com](https://www.pythonanywhere.com).