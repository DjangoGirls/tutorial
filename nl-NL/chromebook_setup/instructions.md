Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel eentje gebruikt, dan is je installatieproces anders dan anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud 9

Cloud 9 is een hulpmiddel dat je een code editor aanbiedt en toegang tot een computer op het Internet waarop je de programmatuur kunt installeren, schrijven, en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld.

1. Installeer Cloud 9 uit de [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Ga naar [c9.io](https://c9.io)
3. Meld je aan voor een account
4. Klik op *Create environment*
5. Noem deze *django-girls*
6. Klik op de oranje knop 'Next step'. En klik dan op de oranje knop *Create environment*

Je zou nu een scherm moeten zien met een zijbalk, een hoofdvenster met enkele tekstblokken erin, en een klein venster beneden dat er ongeveer zo uitziet:

{% filename %}Cloud 9{% endfilename %}

    jouw-naam:~/environment $
    

Dit bodempaneel is je *terminal*, waarin je instructies geeft aan de computer die Cloud 9 voor je heeft gemaakt. Je kunt de bovenrand van het venster verslepen om het venster wat groter te maken.

### Virtuele omgeving

Een virtuele omgeving (ook wel genoemd een virtualenv) is als een privé doosje waarin we de computer code kunnen opslaan voor het project waaraan we werken. We gebruiken ze om de stukken code van diverse projecten apart te houden, zodat dingen uit verschillende projecten niet met elkaar in de war raken.

In je terminal aan de onderkant van het Cloud 9 scherm, geef je de volgende opdracht:

{% filename %}Cloud 9{% endfilename %}

    sudo yum update
    

Als dit niet werkt, vraag je coach dan om wat hulp.

Dan voer je uit:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(merk op dat we op de laatste regel een tilde gevolgd door een is-teken gebruiken: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

De Django Girls Gids bevat een sectie over iets wat we Deployment noemen; dit is het proces om de code van je nieuwe webapplicatie over te zetten naar een publiek toegankelijke computer (een zogenaamde server) waar andere mensen je werk kunnen zien.

Dat gedeelte is een tikkeltje vreemd als je de Gids door neemt op een Chromebook omdat we al gebruik maken van een computer op het Internet (in tegenstelling tot bijvoorbeeld op een laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Meld je daarom aan voor een nieuw PythonAnywhere account op [www.pythonanywhere.com](https://www.pythonanywhere.com).