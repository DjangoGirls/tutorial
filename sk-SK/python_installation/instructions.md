> Pre čitateľov doma: Táto kapitola je spracovaná v [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) videu.
> 
> Táto časť je založená na príručke Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django je napísané v Pythone. Python potrebujeme aby sme urobili hocičo vv Djangu. Začnime tým, že si ho nainštalujeme. Chceme aby si si nainštalovala Python 3.6, takže ak máš staršiu verziu budeš si ju musieť aktualizovať.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Najprv si over, či tvoj počítač beží na 32-bitovej alebo 64-bitovej verzii Windows-u, stlačením Windows tlačidlo + Pause/Break tlačidlo, čo otvorí informácie o tvojom systéme. Pozri sa na riadok "Typ systému". Python pre Windows si môžeš stiahnuť z webstránky https://www.python.org/downloads/windows/. Klikni na "Latest Python 3 Release - Python x.x.x" link. Ak tvoj počítač beží na **64-bitovej** verzii Windows-u, stiahni si **Windows x86-64 executable installer**. Inak si stiahni **Windows x86 executable installer**. Po stiahnutí inštalačného súboru, spusti ho (dvojklikom) a postupuj podľa inštrukcií v ňom.

Pozor na jednu vec: počas inštalácie si všimni okno označené "Setup". Uisti sa, že si označila "Add Python 3.6 to PATH" a klikni na "Install Now", ako je znázornené tu:

![Nezabudni pridať Python do Cesty](../python_installation/images/python-installation-options.png)

V ďalších krokoch, budeš používať Windows príkazový riadok (o ktorom ti tiež povieme viac). Zatiaľ, keď potrebuješ zadať nejake príkazy, choď do Štart → Systém Windows → Príkazový riadok. Alebo môžes stlačiť a držať tlačidlo so znakom Windows a k tomu stlačiť tlačidlo "R" kým sa neobjaví "Run" okno. Aby si spustila Príkazový riadok, zadaj "cmd" a stlač enter v "Run" okne. (No novších verziách Windows, možno budeš musieť vyhľadať "Command Prompt" ("Príkazový riadok"), lebo je niekedý skrytý.)

![Zadaj "cmd" v "Run" okne](../python_installation/images/windows-plus-r.png)

Poznámka: Ak používaš staršiu verziu systému Windows (7, Vista alebo ktorúkoľvek staršú verziu) a Python 3.6.x Inštalátor skončí s chybovou hláškou, môžeš skúsiť:

1. nainštalovať všetky Windows aktualizácie a skúsiť nainštalovať Python 3.6 znovu; alebo
2. nainštalovať [staršiu Python verziu](https://www.python.org/downloads/windows/), napr., [3.4.6](https://www.python.org/downloads/release/python-346/).

Ak si nainštaluješ staršiu Python verziu, inštalačně okno môže vypadať inak ako je to zobrazené hore. Uisti sa, že označíš "Add python.exe to Path", následne klikni na tlačidlo vľavo a zvoľ "Will be installed on local hard drive" ("Bude nainštalované na lokálny pevný disk"):

![Pridaj Python do Path, staršie verzie](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Poznámka:** Pred inštaláciou Python na OS X, mala by si povoliť v nastaveniach svojho Mac-u inštaláciu balíkov, ktoré nie sú z App Store. Choď do System Preferences (je to v priečinku Applications), klikni na "Security & Privacy," a potom na tab "General". Ak nastavenie: "Allow apps downloaded from:" je nastavené na "Mac App Store," zmeň ho na "Mac App Store and identified developers."

Inštalačný program Pythonu si môžeš stiahnuť zo stránky https://www.python.org/downloads/release/python-361/:

* Stiahni si súbor s *Mac OS X 64/32-bitovým inštalátorom*,
* Dvojklikom na *python-3.6.1-macosx10.6.pkg* spusti inštalačný program.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Je veľmi pravdepodobné, že Python už máš predinštalovaný. Pre kontrolu, či je naozaj nainštalovaný (a ktorá verzia), spusti konzolu a napíš tento príkaz:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Ak máš inú mikro verziu Pythonu nainštalovanú, e.g. 3.6.0, nemusíš ju aktualizovať. Ak nemáš Python nainštalovaný, alebo ak chceš inú verziu, môžeš ho nainštalovať takto:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Zadaj do konzoly tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Použi v konzole tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Ak používaš staršiu verziu Fedora, možno sa ti objaví chyba, že príkaz `dnf` neexistuje. V tomto prípade musíš použiť príkaz yum.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Použi v konzole tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Ak si chceš overiť, že inštalácia bola úspešná, otvor príkazový riadok a spusti príkaz `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**POZNÁMKA:** Ak používaš Windows a objavý sa ti chybová hláška, že `python3` nebol najdený, skús použiť `python` (bez čísla `3`) a over či to náhodou nie je Python 3.6 verzia.

* * *

V prípade nejakých pochybností, alebo ak sa niečo pokazilo a nemáš tušenie, čo robiť ďalej - opýtaj sa svojho trénera! Niekedy veci nejdú úplne hladko a je lepšie požiadať o pomoc niekoho, kto má viac skúseností.