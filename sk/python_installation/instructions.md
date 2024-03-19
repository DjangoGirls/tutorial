> Pre čitateľov a čitateľky doma: Táto kapitola je spracovaná vo videu [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Táto časť je založená na príručke Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django je napísané v jazyku Python. Python potrebujeme na všetko, čo chceme v Djangu robiť. Poďme ho teda najprv nainštalovať! Chceme, aby si si nainštalovala Python 3, takže ak máš staršiu verziu, budeš ju musieť upgradovať. Ak už máš verziu {{ book.py_min_version }} alebo vyššiu, malo by to byť v poriadku.

Nainštaluj si, prosím, Python nasledovne, a to aj v prípade, že už máš na svojom počítači nainštalovanú Anacondu.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Najprv si zisti, či na tvojom počítači beží 32-bitová alebo 64-bitová verzia Windowsu. Môžeš sa to dozvedieť v Systémových informáciách v časti Typ systému. Vieš sa tam dostať jedným z nasledujúcich spôsobov:

* Stlač klávesu Windows a klávesu Pause/Break naraz
* Otvor Ovládací panel z windowsového menu, potom prejdi na Systém a zabezpečenia, potom Systém
* Stlač tlačidlo Windows a potom prejdi na položku Nastavenia > Systém > Informácie
* Vyhľadaj "System information" cez Štart menu. Stlač tlačidlo Štart alebo klávesu Windows a začni písať `System Information`. Ako začneš písať, začne ti to dávať tipy. Keď sa položka objaví, vyber ju.

Python pre Windows si môžeš stiahnuť z webstránky https://www.python.org/downloads/windows/. Klikni na link "Latest Python 3 Release - Python x.x.x". Ak tvoj počítač beží na **64-bitovej** verzii Windowsu, stiahni si **Windows x86-64 executable installer**. V opačnom prípade si stiahni **Windows x86 executable installer**. Po stiahnutí inštalačného súboru ho spusti (dvojklikom) a postupuj podľa inštrukcií v ňom.

Jedna vec, na ktorú treba dávať pozor: Počas inštalácie si všimni okno označené "Setup". Uisti sa, že začiarkneš políčko "Pridať Python {{ book.py_version }} do PATH" alebo "Pridať Python do premenných prostredia" (alebo "Add Python {{ book.py_version }} to PATH") a klikneš na "Inštalovať" ("Install Now"), ako je zobrazené tu (môže to vyzerať trochu inak, ak inštaluješ inú verziu):

![Nezabudni pridať Python do PATH](../python_installation/images/python-installation-options.png)

Po dokončení inštalácie sa môže zobraziť dialógové okno s odkazom, pomocou ktorého sa môžeš dozvedieť viac o Pythone alebo o verzii, ktorú si nainštalovala. Toto dialógové okno zatvor alebo zruš - na to, aby si sa dozvedela viac, je tu tento tutoriál!

Poznámka: Ak si na staršej verzii Windowsu (7, Vista alebo niečo staršie) a inštalácia Pythonu {{ book.py_version }} padne s chybou, skús nainštalovať najnovšie updaty Windowsu a pokús sa nainštalovať Python znova. Ak problém pretrváva, skús nainštalovať Python {{ book.py_min_release }} z [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} vyžaduje Python {{ book.py_min_version }} alebo novší, ktorý nebeží na Windowse XP a nižších verziách.

<!--endsec-->

<!--sec data-title="Install Python: macOS" data-id="python_OSX"
data-collapse=true ces-->

> **Poznámka:** Pred inštaláciou Pythonu na macOS sa uisti, že nastavenia tvojho Macu ti povoľujú inštaláciu balíkov, ktoré nie sú z App Storu. Choď do System Preferences (je to v priečinku Applications), klikni na "Security & Privacy," a potom na záložku "General". Ak možnosť "Allow apps downloaded from:" je nastavená na "Mac App Store," zmeň ho na "Mac App Store and identified developers."

Potom musíš ísť na stránku https://www.python.org/downloads/ a stiahnuť si najnovší Python:

* Stiahni si súbor s *macOS inštalátorom*,
* Dvojklikom na *python-{{ book.py_release }}-macos11.pkg* spusti inštalačný program.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Je veľmi pravdepodobné, že Python už máš predinštalovaný. Pre kontrolu, či je naozaj nainštalovaný (a ktorá verzia), spusti konzolu a napíš tento príkaz:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

Ak máš inú verziu Pythonu, a to aspoň {{ book.py_min_version }} (napr. {{ book.py_min_release }}), nemusíš upgradovať. Ak Python nainštalovaný nemáš alebo chceš inú verziu, najprv zisti, akú máš linuxovú distribúciu, nasledovne:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Potom podľa toho, čo si zistila, nasleduj konkrétne inštalačné pokyny pod touto sekciou.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Zadaj do konzoly tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Použi v konzole tento príkaz:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Ak používaš staršiu verziu Fedory, možno sa ti objaví chyba, že príkaz `dnf` neexistuje. V tom prípade musíš použiť príkaz `yum`.

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
    Python {{ book.py_release }}
    

Zobrazená verzia sa môže líšiť od verzie {{ book.py_release }} - mala by zodpovedať verzii, ktorú si nainštalovala.

**POZNÁMKA:** Ak používaš Windows a objaví sa ti chybová hláška, že `python3` nebol najdený, skús použiť `python` (bez čísla `3`) a over, či to náhodou nie je Python {{ book.py_min_version }} alebo vyšší. Ak ani to nefunguje, otvor si nový príkazový riadok a skús znova - stáva sa to, keď robíš s príkazovým riadkom, ktorý bol otvorený ešte predtým, než sme nainštalovali Python.

* * *

V prípade pochybností alebo ak sa niečo pokazilo a nemáš tušenie, čo robiť ďalej - opýtaj sa svojej mentorky alebo mentora! Niekedy veci nejdú úplne hladko a je lepšie požiadať o pomoc niekoho, kto má viac skúseností.