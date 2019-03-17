Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel gebruikt, dan is het installatieproces anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud 9 is een hulpmiddel die je een code editor aanbiedt op een computer op het Internet. Hierop kan je de programmatuur installeren en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld. Hier is de instructie voor cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Je kan kiezen uit de een van de volgende IDEs. Volg een van onderstaande instructies.

#### Ga naar de PaizaCloud wolk IDE

1. Ga naar de [PaizaCloud wolk IDE](https://paiza.cloud/)
2. Meld je aan voor een account
3. Klik op *nieuwe Server*
4. Klik op Terminal knop (aan de linkerkant van het venster)

Nu zou je een scherm met een zijbalk en knoppen aan de linkerkant moeten zien. Klik op de "Terminal" knop om een scherm met een terminal te openen, met de volgende prompt:

{% filename %}Terminal{% endfilename %}

    $
    

De terminal op de PaizaCloud IDE is klaar voor je instructies. Je kunt het scherm vergroten of maximaliseren.

#### AWS Cloud9

1. Ga naar [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Meld je aan voor een account
3. Klik op *Create Environment*

Nu zou je een scherm met een zijbalk, een groot hoofdscherm met wat tekst, en een smal scherm onderin wat er ongeveer zo uitziet:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Het onderste scherm is je terminal. Je kunt de terminal gebruiken om instructies op afstand naar de Cloud 9 computer te versturen. Je kunt de grootte van het scherm aanpassen.

### Virtuele omgeving

Een virtuele omgeving (ook wel virtualenv genoemd) is als een privé map waar we bruikbare computercodes kunnen bewaren voor het project waar we aan werken. We gebruiken ze om delen van de code voor onze diverse projecten gesepareerd te bewaren zodat ze niet in de war raken met andere projecten.

Voer de volgende opdracht in, in de terminal onderin de Cloud 9 interface:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Als dit nog steeds niet werkt, vraag dan je coach om hulp.

Vervolgens voer je uit:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(let op: op de laatste regel gebruiken we een tilde gevolgd door een 'is' teken: `~=`).

### GitHub

Maak een [GitHub](https://github.com) account aan.

### PythonAnywhere

De Django Girls tutorial heeft ook een hoofdstuk over 'Deployment', waarbij we de code van je nieuwe webapplicatie verplatsen naar een publiekelijke computer (dit noemen we een server) zodat andere mensen je werk ook kunnen bewonderen.

Dit gedeelte is een beetje vreemd als je de tutorial op een Chromebook maakt, omdat we nu al een computer die verbonden is met het internet gebruiken (in tegenstelling tot bijvoorbeeld een laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).