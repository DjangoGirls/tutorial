# Uitrollen!

> **Opmerking** Het volgende hoofdstuk kan soms een beetje moeilijk zijn om doorheen te komen. Zet door en maak het af. Software uitrollen is een belangrijk onderdeel van het ontwikkelproces. Dit hoofdstuk staat in het midden van de tutorial zodat je je mentor om hulp kunt vragen met het online krijgen van je website, wat iets ingewikkelder is. Dit betekent dat je de tutorial later altijd nog zelf kunt afmaken als je tijd tekort komt.

Tot nu toe was je website alleen maar beschikbaar op je eigen computer. Nu leer je hoe je je website kunt uitrollen! Uitrollen is het publiceren van jouw applicatie op het internet zodat mensen eindelijk jouw app kunnen zien. :)

Zoals je geleerd hebt moet een website op een server geplaatst zijn. Er zijn veel server providers beschikbaar op het internet. Wij zullen [PythonAnywhere](https://www.pythonanywhere.com/) gebruiken. PythonAnywhere is gratis voor kleine applicaties die niet zoveel bezoekers hebben, dus voor nu zal het voor jou voldoende zijn.

De andere externe dienst die we zullen gebruiken is [GitHub](https://www.github.com), een code hosting dienst. Er zijn ook anderen beschikbaar, maar bijna alle programmeurs hebben tegenwoordig een GitHub account, en nu jij ook!

Deze drie diensten zijn belangrijk. Je eigen (lokale) computer is de plek waar je verder bouwt en test aan je applicatie. Wanneer je tevreden bent met de wijzigingen, plaats je een kopie van je programma op GitHub. Je website staat op PythonAnywhere en je kunt 'm updaten door middel van een nieuwe kopie van je code van GitHub.

# Git

> **Opmerking** Als je de stappen voor installatie al gevolgd hebt, hoef je dit niet nog een keer te doen. Je kunt het volgende gedeelte overslaan en beginnen met het aanmaken van je Git repository.

{% include "/deploy/install_git.md" %}

## Het aanmaken van je Git repository

Git houdt wijzigingen in een bepaalde set bestanden bij in wat een code 'repository' (oftewel "repo" in het kort) als een soort bewaarplaats. Laten we er één creëren voor ons project. Open je console en draai de volgende commando's, in de `djangogirls` map:

> **Note** Controleer of je in de goede map zit te werken met een `pwd` (Mac OS X/Linux) of `cd` (Windows) commando voordat je de repository creëert. Je zou in de `djangogirls` map moeten zitten.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Je hoeft slechts één keer per project een git repository te creëren (en je hoeft nooit meer je gebruikersnaam en e-mail in te vullen).

Git houdt alle wijzigingen in alle bestanden en mappen in deze map bij, maar er zijn ook een paar bestanden die daarbij genegeerd mogen worden. We kunnen dit aangeven door een bestand genaamd `.gitignore` in de hoofdmap aan te maken. Open je editor en maak een nieuw bestand aan met de volgende inhoud:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder
    static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

En sla het op als `.gitignore` in de "djangogirls" map.

> **Opmerking** De punt aan het begin van de bestandsnaam is belangrijk! Als je tegen problemen aanloopt bij het creëren van het bestand (Macs vinden het niet leuk als je via de Finder een bestand dat begint met een punt aanmaakt, bijvoorbeeld), gebruik dan de "Opslaan als" functie in je editor; daar kan niks misgaan. En zorg ervoor dat je geen `.txt`, `.py`, of een andere extensie aan de bestandsnaam toevoegt -- het wordt alleen herkend door Git als de naam alléén `.gitignore` is. Linux en MacOS behandelen bestanden met een naam die begint met `.` (zoals `.gitignore`) als verborgen en het standaard `ls`-commando laat deze bestanden niet zien. Gebruik in plaats daarvan `ls -a` om he `.gitignore` bestand te zien.
> 
> **Opmerking** Een van de besanden die je genoemd hebt in je `.gitignore` bestand is `db.sqlite3`. Dit bestand is je lokale database waar al je gebruikers en posts worden opgeslagen. We zullen de standaard web programmeer praktijk volgen, wat betekent dat we aparte databases voor je lokale site en je live website op PythonAnywhere zullen gebruiken. De database voor PythonAnywhere zou SQLite kunnen zijn, zoals je lokale omgeving, maar meestal gebruik je een die MySQL heet. Die kan met veel meer bezoekers overweg dan SQLite. Omdat we de SQLite database negeren voor de GitHub kopie, betekent het dat de superuser en alle posts die je aangemaakt hebt alleen maar lokaal (op je eigen laptop) beschikbaar zullen zijn, en dat je voor de live website nieuwe moet creëren. Zie je lokale database als een speeltuin waar je veel verschillende dingen kunt uitproberen, zonder dat je bang hoeft te zijn dat je al je echte posts perongeluk verwijdert van je blog.

Het is een goed idee om een `git status` commando te gebruiken voor `git add` of wanneer je niet meer helemaal zeker weet welke bestanden je ookalweer hebt gewijzigd. Dit voorkomt nare verrassingen, zoals het toevoegen en committen van verkeerde bestanden. Het `git status` commando weergeeft informatie over alle gewijzigde en klaargezette bestanden, de status van de 'tak' (branch) en nog veel meer. Het resultaat zou hierop moeten lijken:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Als laatste stap slaan we onze wijzigingen op. Ga naar je console en draai de volgende commando's:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Je code op GitHub zetten

Ga naar [GitHub.com](https://www.github.com) en registreer een nieuwe, gratis, account. (als je dat tijdens de workshop voorbereidingen al gedaan hebt, tof!) Zorg er dan voor dat je je wachtwoord onthoudt (voeg het toe aan je wachtwoordbeheerder, als je die gebruikt).

Maak dan een nieuwe repository aan, en geef hem de naam "my-first-blog". Het vakje met "initialize with a README" kun je uitgevinkt laten, de .gitignore optie kun je ook leeg laten (we hebben dat al handmatig gedaan) en laat de licentie op 'None' staan.

![](images/new_github_repo.png)

> **Note** De naam `my-first-blog` is belangrijk - je kunt je repo natuurlijk ook anders noemen, maar je gaat de naam heel veel tegenkomen in onderstaande instructies, dus let dan op dat je de naam elke keer goed vervangt. Het is waarschijnlijk makkelijker om gewoon de naam `'my-first-blog'` aan te houden.

Op het volgende scherm zul je de clone URL van je repo zien, wat we in de volgende commando's zullen gebruiken:

![](images/github_get_repo_url_screenshot.png)

Nu moeten we de GitHub repository op je computer koppelen aan de repo op GitHub.

Typ het volgende in je console (vervang `<your-github-username>` met de gebruikersnaam die je hebt gekozen toen je je GitHub account creëerde, maar zonder de haken -- de URL moet overeenkomen met de URL die je zojuist gezien hebt):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Wanneer je naar GitHub pusht, wordt gevraagd naar je GitHub gebruikersnaam en wachtwoord (of rechtstreeks in je terminal, of in een pop-up), nadat je je wachtwoord en gebruikersnaam hebt ingevuld zie je ongeveer zoiets:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Je code staat nu op GitHub. Kijk maar! Je zult zien dat het in goed gezelschap verkeert - [Django](https://github.com/django/django), de [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), en vele andere gave open source projecten hebben ook hun code op GitHub staan. :)

# Je blog op PythonAnywhere zetten

## Meld je aan voor een PythonAnywhere account

> **Opmerking** Het zou kunnen dat je al eerder een PythonAnywhere account hebt aangemaakt tijdens de installatiestappen. Als dat zo is, hoef je dat niet nog een keer te doen.

{% include "/deploy/signup_pythonanywhere.md" %}

## Het configureren van de site op PythonAnywhere

Ga terug naar het hoofd [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) door op het logo te klikken, en kies de optie om een "Bash" console op te starten - dat is de PythonAnywhere versie van de terminal, net zoals die op je eigen computer.

![De 'Nieuwe console' sectie op de PythonAnywhere web interface, met een knop voor 'bash'](images/pythonanywhere_bash_console.png)

> **Opmerking** PythonAnywhere is gebaseerd op Linux, dus als je op Windows werkt zal de terminal er een beetje anders uitzien dan die op je eigen computer.

Voor het deployen van de applicatie op PythonAnywhere moeten we de code van GitHub overhevelen, en dan PythonAnywhere configureren om het te herkennen en als webapplicatie te behandelen. Er zijn manieren om dit handmatig te doen, maar PythonAnywhere heeft ook een hulpmiddel dat dit allemaal voor je doet. Laten we dat eerst installeren:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Dat zou enkele dingen als `Collecting pythonanywhere` moeten printen, en uiteindelijk eindigen met een regel die zegt `Successfully installed (...) pythonanywhere- (...)`.

Nu draaien we het hulpmiddel om onze app automatisch vanaf GitHub te configureren. Typ het volgende in de console op PythonAnywhere (vergeet niet om je GitHub gebruikersnaam in te vullen in plaats van `<your-github-username>`, zodat de URL overeenkomt met de URL van GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.6 https://github.com/<your-github-username>/my-first-blog.git
    

Als je kijkt wat er gebeurt, zie je wat het doet:

- Je code wordt van GitHub gedownload
- Er wordt een virtualenv aangemaakt op PythonAnywhere, net als op je eigen computer
- Het bestand met settings wordt geupdatet met wat settings voor de deploy
- Er wordt een database opgesteld op PythonAnywhere met behulp van het `manage.py migrate` commando
- Je statische bestanden worden klaargezet (je leert hier straks meer over)
- PythonAnywhere wordt geconfigureerd om via de API jouw webapplicatie te tonen

Op PythonAnywhere zijn al deze stappen geautomatiseerd, maar het zijn dezelfde stappen die je met een andere provider zou moeten doorlopen.

Het voornaamste wat je nu moet onhouden is dat je database op PythonAnywhere volledig gescheiden is van de database op je eigen computer, dus je kunt verschillende posts en admin accounts hebben. Daarom moeten we, net zoals we net op je eigen computer gedaan hebben, de admin account weer initialiseren met `createsuperuser`. PythonAnywhere heeft al automatisch je virtualenv voor je gestart, dus alles wat je hoeft te doen is:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Typ de details in voor je admin gebruiker. Het is het handigst als je dezelfde gebruikt als op je eigen computer om verwarring te voorkomen, tenzij je het wachtwoord op PythonAnywhere veiliger wil maken.

Als je wil kun je nu ook kijken naar je code op PythonAnywhere door `ls` te gebruiken:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

Je kunt ook naar de "Files" pagina gaan en door je bestanden navigeren met behulp van de ingebouwde PythonAnywhere bestandsbrowser. (vanaf de Console pagina kun je naar andere pagina's in PythonAnywhere via de menuknop in de rechterbovenhoek. Zodra je op één van de pagina's bent zijn er links naar de andere pagina's aan de bovenkant.)

## Je bent live!

Je site zou nu live moeten zijn op het openbare internet! Klik door naar de PythonAnywhere "Web" pagina om de link te verkrijgen. Je kunt die met iedereen delen die je wilt :)

> **Opmerking** Dit is een tutorial voor beginners, en tijdens het deployen hebben we een aantal stappen genomen die vanuit een veiligheidsoogpunt niet ideaal zijn. Als en wanneer je besluit om dit project voort te zetten, of met een nieuw project begint, is het handig om de [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) te bekijken voor wat tips om je site beter te beveiligen.

## Debugging tips

Als je een error ziet terwijl je het `pa_autoconfigure_django.py` script draait, zijn dit de meest voorkomende oorzaken:

- Vergeten om je PythonAnywhere API token aan te maken.
- Een foutje in je GitHub URL
- Als je een error ziet die meldt *"Could not find your settings.py"*, komt dat waarschijnlijk omdat het niet gelukt is om al je bestanden aan Git toe te voegen, en/of het is niet gelukt om ze naar GitHub te sturen. Kijk nog eens naar het Git hoofdstuk hierboven
- Als je je eerder aangemeld hebt voor een PythonAnywhere account en een fout had met collectstatic, heb je waarschijnlijk een oudere versie van SQLite (bijv. 3.8.2) voor uw account. Meld je in dat geval aan voor een nieuw account en probeer de commando's in de PythonAnywhere sectie hierboven.

Als je een errormelding krijgt als je je site probeert te bezoeken is de eerste plek om te kijken voor wat debugging informatie is in de **error log**. Je vindt een link naar de logs op de PythongAnywhere ["Web" pagina](https://www.pythonanywhere.com/web_app_setup/). Kijk of er daar errormeldingen zijn; de meest recente staan onderaan.

Er zijn ook wat meer [algemene debugging tips op de PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

En vergeet niet, je coach is hier om je te helpen!

# Bekijk je site!

De standaardpagina voor uw site zou "It worked" moeten zeggen, net zoals het op uw lokale computer doet. Probeer `/admin/` toe te voegen aan het einde van de URL, en je zal worden meegenomen naar de admin site. Log in met de gebruikersnaam en wachtwoord, en u ziet dat u nieuwe posts kunt toevoegen op de server -- Vergeet niet dat de berichten van uw lokale testdatabase niet naar uw live blog zijn verzonden.

Zodra u een paar posts hebt aangemaakt, kunt u terugkeren naar uw lokale setup (niet PythonAnywhere). Vanaf hier moet u werken aan uw lokale setup om veranderingen te maken. Dit is een veel gebruikte workflow in de webontwikkeling – maak lokaal veranderingen, push deze wijzigingen naar GitHub en trek de wijzigingen naar uw live Web server. Dit stelt je in staat om te werken en te experimenteren zonder je live Web site te breken. Gaaf, toch?

Geef jezelf een *FLINK* schouderklopje! Serverimplementaties zijn een van de moeilijkste onderdelen van de webontwikkeling en het kost vaak enkele dagen voordat ze werken. Maar je site is live, op het echte internet!