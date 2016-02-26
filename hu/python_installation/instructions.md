> Ez a fejezet a Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tutorialján alapszik

A Django Python nyelven íródott. Ahhoz, hogy bármit létrehozhassunk a Django-ban, szükségünk van a Pythonra is. Kezdjük a telepítésével! Azt szeretnénk, hogy a Python 3.4-es verziója legyen telepítve -- ha ennél korábbi verzióval rendelkezel, akkor frissítened kell.

### Windows

A Python-t az alábbi weboldalról tudod letölteni: https://www.python.org/downloads/release/python-343/. Az ***.msi** fájlt a letöltés után futtasd (dupla kattintás), és kövesd az utasításokat. Fontos, hogy emlékezz a path-ra (könyvtárra), ahova letöltötted. Később szükséged lesz rá!

Egy fontos dolog, amire figyelj oda: a telepítővarázsló második képernyőjén ("Customize") görgess lejjebb, és válaszd ki az "Add python.exe to the Path" opciót, ahogy itt láthatod:

![Ne felejtsd el hozzáadni a Pythont a Path-hoz](../python_installation/images/add_python_to_windows_path.png)

### Linux

Nagyon valószínű, hogy a Python már telepítve van a gépedre. Ahhoz, hogy ezt leellenőrizd (illetve hogy megnézd, melyik verzió van a gépeden), nyisd meg a konzolt és írd be az alábbi parancsot:

    $ python3 --version
    Python 3.4.3
    

Ha még nincs Pythonod, vagy másik verziót szeretnél telepíteni, így teheted meg:

#### Debian vagy Ubuntu

Írd be az alábbi parancsot a konzolba:

    $ sudo apt-get install python3.4
    

#### Fedora (21-es verzióig)

Írd be az alábbi programot a konzolba:

    $ sudo yum install python3.4
    

#### Fedora (22+)

Írd be az alábbi programot a konzolba:

    $ sudo dnf install python3.4
    

### OS X

Menj a https://www.python.org/downloads/release/python-343/ oldalra, és töltsd le a Python installert:

  * Töltsd le a *Mac OS X 64-bit/32-bit installer* fájlt,
  * Kattints duplán a *python-3.4.3-macosx10.6.pkg*-re, hogy futtasd a telepítőt.

Bizonyosodj meg arról, hogy sikeres volt a telepítés! Nyisd meg a *Terminált* és futtasd le a `python3` parancsot:

    $ python3 --version
    Python 3.4.3
    

* * *

Ha kétségeid vannak, vagy valami elromlott, és nem tudod, mit csinálj - csak kérdezd meg a coachodat! Néha a dolgok nem mennek teljesen simán, és jobb megkérdezni valakit, akinek több tapasztalata van a témában.
