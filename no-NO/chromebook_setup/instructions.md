Du kan hoppe over[denne delen](http://tutorial.djangogirls.org/en/installation/#install-python) om du ikke bruker en Chromebook. Om du bruker en Chromebook, vill installasjons prosessen bli litt anderledes. Du kan ignorerer resten av installasjons instruksene.

### Cloud 9

Cloud 9 er et verktøy som gir deg en code editor og tilgang til en data som kjører på Internet, hvor du kan installere, skrive og kjøre programvaren. Gjennom hele opplæringen, vill Cloud 9 være din *lokale data*. Du vil fortsatt kjøre kommandoer i en terminal-grensesnitt som dine klassekamerater på OS X, Ubuntu og Windows, men terminalen vil være koblet til en datamaskin som kjører et annet sted som Cloud 9 setter opp for deg.

1. Installer Cloud 9 fra [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gå til [c9.io](https://c9.io)
3. Registrer en konto
4. Klikk *Opprett et nytt arbeidsområde*
5. Kall det *django-jenter*
6. Velg det *tomme* (andre fra høyre i den nederste raden med oransje logo)

Du burde nå se et grensesnitt med ett sidepanel, et stort hovedvindu med text, og et lite vindu nederst på siden som ser omtrent slik ut:

{% filename %}Cloud 9{% endfilename %}

    dittbrukernavn:~/workspace $
    

Det nederste området er din *terminal*, hvor du vil gi datamaskinen Cloud 9 har klargjort dine instruksjoner. Du kan endre størrelsen på vinduet for å gjøre det litt større.

### Virtual Environment

Et virtuelt miljø (også kalt virtualenv) er som en privat boks vi kan fylle med nyttige datakode vi trenger for prosjektene vi jobber med. Vi bruker dem til å holde de ulike bitene av koden vi ønsker for våre ulike prosjekter separat så ting ikke bli blandet opp mellom prosjekter.

I terminalen nederst på Cloud 9 grensesnittet, kjører du følgende:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Hvis dette fortsatt ikke fungerer, kan du spørre din trener om hjelp.

Neste steg er å kjøre:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(legg merke til at på siste linje bruker vi tilde etterfulgt av et likhets tegn: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Django Dirls opplæringen inkluderer en seksjon om noe som heter Deployment, som er en prosess som tar koden som kjører din nye web-applikasjon og flytter den til en offentlig tilgjengelig data (kalles en server) slik at andre kan se hva du har gjort.

Denne delen er litt rar om du gjør opplæringen på en Chromebook siden vi allerede bruker en data som er på internett (i motsetning til, si, en datamaskin). Uansett, det er fremdeles nyttig, siden vi kan tenke på vår Cloud 9 arbeidsplass som en plass for vår "in progress" arbeid og Python Anywhere som plassen vi viser frem hva vi har gjort når det er mer ferdig.

Så, registrer deg for en ny Python Anywhere bruker på [www.pythonanywhere.com](https://www.pythonanywhere.com).