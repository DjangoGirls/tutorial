> Za čitatelje kod kuće: ovo poglavlje je pokriveno u videu [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Ovaj odjeljak je napisan prema tutorijalu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django je pisan u Pythonu. Trebat ćemo Python ako želimo išta napraviti u Djangu. Počnimo sa instaliranjem! Želimo da instaliraš Python 3.6, pa ako imaš bilo kakvu raniju inačicu, nadogradi ju.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Prva provjeri imaš li na računalu 32-bitnu inačicu ili 64-bitnu inačicu Windowsa, pritiskanjem Windows + Pause/Break kombinacije, koja će otvoriti Sustav info, pa pogledaj na liniju u kojoj piše "Tip sustava". Možeš preuzeti Python za Windows sa stranice https://www.python.org/downloads/windows/. Klikni na link "Latest Python 3 Release - Python x.x.x". Ako na računalu imaš **64-bitnu** inačicu Windowsa, preuzmi **Windows x86-64 executable installer**. Ako imaš 32-bitnu, preuzmi **Windows x86 executable installer**. Nakon što se datoteka preuzme, pokreni ju (dvostrukim klikom) i prati te upute.

Pripazi na jednu stvar: tijekom instalacije, u prozoru na kojem piše "Setup" mora biti kvačica pored opcije "Add Python 3.6 to PATH". Ako je nema, stavi ju, a zatim klikni na "Install Now", kao što možeš vidjeti:

![Ne zaboravi dodati Python u Path](../python_installation/images/python-installation-options.png)

U nadolazećim koracima, koristit ćeš Windows naredbeni redak (o kojem ćemo ti također pričati). Za sada, ako trebaš upisati neke naredbe, idi na Start → Windows System → Command Prompt. Također možeš pritisnuti Windows tipku zajedno sa tipkom "R" sve dok se ne pojavi prozorčić "Run". Da bi se otvorio naredbeni redak, upiši "cmd" i pritisni enter u "Run" prozorčiću. (Na novijim Windowsima, možda ćeš morati potražiti "Command Prompt" pošto je ponekad skriveno.)

![Upiši "cmd" u "Run" prozor](../python_installation/images/windows-plus-r.png)

Napomena: ako koristiš starije inačice Windowsa (7, Vista ili starije), i instalacija Pythona 3.6.x ti dojavi grešku, možeš pokušati ili:

1. instalirati sva ažuriranja pa pokušati ponovno; ili
2. instalirati [stariju inačicu Pythona](https://www.python.org/downloads/windows/), npr. [3.4.6](https://www.python.org/downloads/release/python-346/).

Ako ćeš instalirati stariju inačicu Pythona, ekran instalacije može može izgledati drukčije nego na slici gore. Provjeri je li označeno "Add python.exe to Path", zatim klikni na gumb lijevo i odaberi "Will be installed on a local hard drive":

![Dodaj Python u Path, starije inačice](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Prije instalacije Pythona na OS X, trebalo bi provjeriti dozvoljavaju li ti postavke Maca instaliranje paketa koji nisu sa App Storea. Idi na System Preferences (u mapi Aplikacija), stisni na "Securty & Privacy", a zatim na tab "General". Ako ti pod "Allow apps downloaded from:" piše "Mac App Store", promjeni to u "Mac App Store and identified developers."

Moraš otići na web stranicu https://www.python.org/downloads/release/python-361/ i preuzeti Python instalaciju:

* Preuzmi *Mac OS X 64-bit732-bit installer*,
* Dvaput stisni *python-3.6.1-macosx10.6.pkg* da pokreneš instalaciju.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Vrlo je vjerojatno da već imaš predinstaliran Python još iz trgovine. Ako želiš provjeriti imaš li ga instaliranog (i koju inačicu), otvori konzolu i upiši sljedeću naredbu:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Ako imaš imaš instaliranu neku drugu 'mikro inačicu' Pythona, npr. 3.6.0, onda ne moraš ažurirati. Ako nemaš instaliran Python, ili želiš drugu inačicu, možeš ju instalirati na slijedeći način:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Upiši ovu naredbu u svoju konzolu:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Koristi ovu naredbu u svojoj konzoli:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Ako imaš stariju inačicu Fedora operacijskog sustava, možda dobiješ grešku da nema naredbe `dnf`. U tom slučaju moraš koristiti yum.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Koristi ovu naredbu u svojoj konzoli:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Provjeri da je instalacija prošla uspješno tako da otvoriš komandnu liniju i pokreneš `python3` naredbu:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NAPOMENA:**Ako si na Windowsima i dobiješ grešku da `python3` nije pronađen, pokušaj upisati samo `python` (bez `3`) i provjeri je li još uvijek inačica 3.6.

* * *

Ako imaš bilo kakvih sumnji, ili nešto pođe po zlu, a nemaš ideja što dalje napraviti, pitaj svoj trenera! Ponekad stvari ne prošu glatko i bolje je pitati za pomoć nekoga s više iskustva.