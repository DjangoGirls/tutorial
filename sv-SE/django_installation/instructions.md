> Delar av det här avsnittet är baserat på en handledning av Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> En del av det här avsnittet är baserad på [django-marcador tutorial](http://django-marcador.keimlink.de/) licensierad under Creative Commons Attribution-ShareAlike 4.0 International License. Handledningen för django-marcador är upphovsrättsskyddad av Markus Zapke-Gründemann m. fl.

## Virtuell miljö

Innan vi installerar Django kommer vi installera ett mycket användbart verktyg för att hålla din kodningsmiljö välstädad på din dator. Det är möjligt att hoppa över detta steg, men det rekommenderas starkt. Att börja med den bästa möjliga installationen kommer att spara dig en hel del problem i framtiden!

Så, låt oss skapa en **virtuell miljö** (även kallad *virtualenv*). Virtualenv kommer att isolera din Python/Django-installation per projekt. Detta innebär att eventuella ändringar du gör på en webbsida inte kommer påverka andra webbsidor du också utvecklar. Trevligt, eller hur?

Allt du behöver göra är att hitta en katalog där du vill skapa din `virtualenv`; din hemkatalog, till exempel. På Windows kan den se ut som `C:\Users\Name` (där `Name` är namnet på din inloggning).

> **OBS:** I Windows, se till att denna katalog inte innehåller accenter eller specialtecken; om ditt användarnamn innehåller accentuerade tecken, använd en annan katalog, till exempel, `C:\djangogirls`.

För denna handledning kommer vi att använda en ny katalog `djangogirls` i din hemkatalog:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Vi kommer att göra en virtualenv som heter `myvenv`. Kommandot kommer att vara på formatet:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

För att skapa en ny `virtualenv` måste du öppna kommandotolken och köra `python -m venv myvenv`. Det kommer att se ut så här:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Där `myvenv` är namnet på din `virtualenv`. Du kan använda något annat namn, men håll dig till gemener och använda inga mellanslag, accenter eller specialtecken. Det är också en bra idé att hålla namnet kort – du kommer att referera till det mycket!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Vi kan skapa en `virtualenv` på både Linux och OS X genom att köra `python3 -m venv myvenv`. Det kommer att se ut så här:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` är namnet på din `virtualenv`. Du kan använda något annat namn, men håll dig till gemener och använda inga mellanslag. Det är också bra att hålla namnet kort – du kommer att referera till det mycket!

> **OBS:** På vissa versioner av Debian/Ubuntu kan du få följande fel:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> I så fall, följ instruktionerna ovan och installera `python3-venv`-paketet: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **OBS:** Vissa versioner av Debian/Ubuntu som initierar den virtuella miljön på det här sättet ger för närvarande följande fel:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> För att komma runt detta, använd kommandot `virtualenv` istället.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python{{ book.py_version }} myvenv
>     
> 
> **OBS:** Om du får ett fel som detta
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> kör istället:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## Arbeta med virtualenv

Kommandot ovan kommer att skapa en katalog som heter `myvenv` (eller vilket namn du än väljer) som innehåller vår virtuella miljö (i princip ett gäng kataloger och filer).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Starta din virtuella miljö genom att köra:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **OBS:** På Windows 10 kan du få ett fel i Windows PowerShell som säger `execution of scripts is disabled on this system`. I så fall, öppna en annan Windows PowerShell med alternativet "Kör som administratör". Skriv sedan följande kommando innan du startar din virtuella miljö:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **OBS:** För användare av den populära editorn VS Code, som kommer med en integrerad terminal baserad på Windows PowerShell, om du vill hålla fast vid den integrerade terminalen, kan du köra följande kommando för att aktivera din virtuella miljö:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Fördelen är att du inte behöver växla mellan redigerarfönster och kommandoradsfönster

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Starta din virtuella miljö genom att köra:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Kom ihåg att ersätta `myvenv` med ditt valda `virtualenv`-namn!

> **OBS:** Om kommandot `source` inte är tillgängligt, prova att göra detta istället:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Du vet att du har startat `virtualenv` när du ser att prompten i din konsol är prefixad med `(myvenv)`.

När du arbetar i en virtuell miljö kommer `python` automatiskt att hänvisa till rätt version så du kan använda `python` istället för `python3`.

OK, vi har alla viktiga beroenden på plats. Vi kan äntligen installera Django!

## Installera Django {#django}

Nu när du har startat din `virtualenv` kan du installera Django.

Innan vi gör det bör vi se till att vi har den senaste versionen av `pip`, den programvara vi använder för att installera Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installera paket med krav (requirements)

En kravfil håller en lista över beroenden som ska installeras med `pip install`:

Skapa först filen `requirements.txt` inuti mappen `djangogirls/` med kodeditorn du installerade tidigare. Du gör detta genom att öppna en ny fil i kodeditorn och sedan sparar den som `requirements.txt` i mappen `djangogirls/` Din katalog kommer att se ut så här:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Lägg till följande i filen `djangogirls/requirements.txt`:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Kör nu `pip install -r requirements.txt` för att installera Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Om du får ett fel när du kör pip på Windows, kontrollera om ditt projekts sökväg innehåller mellanslag, accenter eller specialtecken (till exempel `C:\Users\User Name\djangogirls`). Om det gör det, överväg att använda en annan plats utan mellanslag, accenter eller specialtecken (till exempel: `C:\djangogirls`). Skapa en ny virtualenv i den nya katalogen, ta sedan bort den gamla och prova kommandot ovan igen. (Att flytta virtualenv-mappen kommer inte fungera eftersom virtualenv använder absoluta sökvägar.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Din kommandorad kan frysa när du försöker installera Django. Om detta händer, kör detta istället för kommandot ovan:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Om du får ett fel när du kör pip på Ubuntu 12.04 kör `python -m pip install -U --force-reinstall pip` för att fixa pip-installationen i din virtualenv.

<!--endsec-->

Det var det! Du är nu (äntligen) redo att skapa en Django-applikation!