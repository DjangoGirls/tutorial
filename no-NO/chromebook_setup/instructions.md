Du kan hoppe over [denne delen](http://tutorial.djangogirls.org/en/installation/#install-python) hvis du ikke bruker en Chromebook. Hvis du bruker en Chromebook, vil installasjonsprosessen bli litt annerledes. Du kan ignorere resten av installasjonsinstruksene.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE er et verktøy som gir en kodeeditor og tilgang til en datamaskin som kjører på internett der du kan installere, skrive, og kjøre programvaren. Gjennom hele opplæringen, vil Cloud IDE fungere som din *lokale datamaskin*. Du vil fortsatt kjøre kommandoer i en terminal akkurat som dine klassekamerater på OS X, Ubuntu eller Windows, men terminalen din vil være koblet til en datamaskin som kjører et annet sted som Cloud IDE setter opp for deg. Her er instruksjoner for Cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Du kan velge en Cloud IDE, og følge instruksjonene for Cloud IDE.

#### PaizaCloud Cloud IDE

1. Gå til [PaizaCloud IDE](https://paiza.cloud/)
2. Registrer en konto
3. Klikk *New Server*
4. Klikk knappen Terminal (på venstre side av vinduet)

Nå skal du se et grensesnitt med en sidebar, knapper til venstre. Klikk på knappen "Terminal" for å åpne et terminalvindu med en prompt som dette:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalen på PaizaCloud Cloud IDE er klar for dine instruksjoner. Du kan endre størrelsen eller maksimere vinduet for å gjøre det større.

#### AWS Cloud9

1. Gå til [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Registrer en konto
3. Klikk *Create Environment*

Nå skal du se et grensesnitt med en sidebar, et stort hovedvindu med noe tekst, og et lite vindu i bunnen som ser ut omtrent som dette:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Det nederste området er terminalen din. Du kan bruke terminalen for å sende instruksjoner til den eksterne Cloud9-maskinen. Du kan endre størrelse på vinduet for å gjøre det større.

### Virtual Environment (virtuelt miljø)

Et virtuelt miljø (også kalt virtualenv) er som en privat boks som vi kan fylle med nyttig datamaskinkode for prosjektene vi jobber med. Vi bruker dem til å holde de forskjellige kodebitene separat som vi trenger til de forskjellige prosjektene, slik at det ikke blir blandet sammen.

I terminalen på bunnen av grensesnittet til Cloud 9 kjører du følgende:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Hvis det fortsatt ikke fungerer, kan du spørre din instruktør om hjelp.

Neste steg er å kjøre:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(legg merke til at på den siste linjen bruker vi tilde etterfulgt av et likhetstegn: `~=`).

### GitHub

Opprett en [GitHub](https://github.com)-konto.

### PythonAnywhere

Django Girls tutorialen inkluderer en del om noe som heter Deployment, som er en prosess der du tar koden som kjører din nye webapplikasjon og flytter den til en offentlig tilgjengelig datamaskin (kalt en server) slik at andre kan se ditt arbeid.

Denne delen er litt rar når du gjør tutorialen på en Chromebook siden vi allerede bruker en datamaskin som er på internett (i motsetning til for eksempel en laptop). Uansett, det er fortsatt nyttig, fordi vi kan tenke på vår Cloud 9 Workspace som et sted for vårt arbeid "under utvikling", og Python Anywhere som et sted for å vise fram hva vi har gjort når det blir mer ferdig.

Så, registrer deg for en ny konto på Python Anywhere på [www.pythonanywhere.com](https://www.pythonanywhere.com).