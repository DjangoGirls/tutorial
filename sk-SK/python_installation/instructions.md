> Pre čitateľov doma: Táto kapitola je spracovaná v [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) videu.
> 
> Táto časť je založená na príručke Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django je napísaný v jazyku Python. Python potrebujeme na všetko, čo chceme robiť v Djangu. Začnime teda s inštaláciou! Chceme, aby si si nainštalovala Python 3,, takže ak máš staršiu verziu, budeš ju musieť upgradovať. Ak už máš verziu 3.4 alebo vyššiu, malo by to byť v poriadku.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Najprv si skontroluj, či je na počítači v riadku Systémové informácie na stránke Informácie o systéme spustená 32-bitová verzia alebo 64-bitová verzia systému Windows. Ak chceš prejsť na túto stránku, vyskúšaj jednu z týchto metód:

* Stlač klávesu Windows a klávesu Pause/Break v rovnakom čase
* Otvor v ovládacom paneli v ponuke Windows, potom prejdi do Systém a Zabezpečenia, potom Systém
* Stlačte tlačidlo Windows a potom prejdite na položku Nastavenia > Systém > Informácie

Python pre Windows si môžeš stiahnuť z webstránky https://www.python.org/downloads/windows/. Klikni na "Latest Python 3 Release - Python x.x.x" link. Ak tvoj počítač beží na **64-bitovej** verzii Windows-u, stiahni si **Windows x86-64 executable installer**. Inak si stiahni **Windows x86 executable installer**. Po stiahnutí inštalačného súboru, spusti ho (dvojklikom) a postupuj podľa inštrukcií v ňom.

Jedna vec, na ktorú treba dávať pozor: Počas inštalácie si všimnete okno označené "Setup". Uisti sa, že začiarktneš políčko "Pridať Python 3.6 do PATH" alebo "Pridať Python do premenných prostredia" a klikneš na "Inštalovať", ako je zobrazené tu (môže to byť trochu iné, ak inštalujete inú verziu):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Po dokončení inštalácie sa môže zobraziť dialógové okno s odkazom, pomocou ktorého sa môžeš dozvedieť viac o Pythone alebo o verzii, ktorú si nainštalovala. Zatvor alebo zruš dialógové okno - v tomto návode sa budeš učiť viac!

Poznámka: Ak používaš staršiu verziu systému Windows (7, Vista alebo ktorúkoľvek staršú verziu) a Python 3.6.x Inštalátor skončí s chybovou hláškou, môžeš skúsiť:

1. nainštalovať všetky Windows aktualizácie a skúsiť nainštalovať Python znovu; alebo
2. nainštalovať [staršiu Python verziu](https://www.python.org/downloads/windows/), napr., [3.4.6](https://www.python.org/downloads/release/python-346/).

Ak si nainštaluješ staršiu Python verziu, inštalačně okno môže vyzerať inak ako je to zobrazené hore. Uisti sa, že označíš "Add python.exe to Path", následne klikni na tlačidlo vľavo a zvoľ "Will be installed on local hard drive" ("Bude nainštalované na lokálny pevný disk"):

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

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
    

Ak máš nainštalovanú inú verziu Pythonu, ale aspoň 3.4.0 (napr. 3.6.0), nemusíš ju aktualizovať. Ak nemáš Python nainštalovaný, alebo ak chceš inú verziu, môžeš ho nainštalovať takto:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Zadaj do konzoly tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Zadaj do konzoly tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.