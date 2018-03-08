> Ez a fejezet a Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tutorialján alapszik

A Django Python nyelven íródott. Ahhoz, hogy bármit létrehozhassunk a Django-ban, szükségünk van a Pythonra is. Kezdjük a telepítésével! Azt szeretnénk, hogy a Python 3.6-es verziója legyen telepítve -- ha ennél korábbi verzióval rendelkezel, akkor frissítened kell.

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

A Python-t az alábbi weboldalról tudod letölteni: https://www.python.org/downloads/release/python-343/. Az ***.msi** fájlt a letöltés után futtasd (dupla kattintás), és kövesd az utasításokat. Fontos, hogy emlékezz a path-ra (könyvtárra), ahova letöltötted. Később szükséged lesz rá!

Egy fontos dolog, amire figyelj oda: a telepítővarázsló második képernyőjén ("Customize") görgess lejjebb, és válaszd ki az "Add python.exe to the Path" opciót, ahogy itt láthatod:

![Ne felejtsd el hozzáadni a Pythont a Path-hoz](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Megjegyzés** Mielőtt telepítenéd a Pythont OS X-en, bizonyosodj meg arról hogy a Mac beállításaid megengedik olyan csomagok telepítését, amelyek nem az App Store-ból származnak. Nyisd meg a System Preferences ablakot (az Applications mappában), kattints a "Security & Privacy" gombra majd a "General" fülre. Ha az "Allow apps downloaded from:" beállítás "Mac App Store"-ra van állítva, állítsd át "Mac App Store and identified developers"-ra.

Menj a https://www.python.org/downloads/release/python-343/ oldalra, és töltsd le a Python installert:

  * Töltsd le a *Mac OS X 64-bit/32-bit installer* fájlt,
  * Kattints duplán a *python-3.4.3-macosx10.6.pkg*-re, hogy futtasd a telepítőt.

<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

Nagyon valószínű, hogy a Python már telepítve van a gépedre. Ahhoz, hogy ezt leellenőrizd (illetve hogy megnézd, melyik verzió van a gépeden), nyisd meg a konzolt és írd be az alábbi parancsot:

    $ python3 --version
    Python 3.4.3
    

Ha még nincs Pythonod, vagy másik verziót szeretnél telepíteni, így teheted meg:

<!--endsec-->

<!--sec data-title="Debian vagy Ubuntu" data-id="python_debian"
data-collapse=true ces-->

Írd be az alábbi parancsot a konzolba:

    $ sudo apt install python3.4
    
<!--endsec-->

<!--sec data-title="Fedora (22+)" data-id="python_fedora22"
data-collapse=true ces-->

Írd be az alábbi programot a konzolba:

    $ sudo dnf install python3.4
    
<!--endsec-->

<!--sec data-title="openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Írd be az alábbi programot a konzolba:

    $ sudo zypper install python3

<!--endsec-->

Bizonyosodj meg arról, hogy sikeres volt a telepítés! Nyisd meg a *Terminált* és futtasd le a `python3` parancsot:

    $ python3 --version
    Python 3.4.3
    


**Megjegyzés** Ha windows-t használsz és egy hibaüzenetet kapsz, mely szerint `python3` nem található, próbáld meg `python` néven (a `3` nélkül) és ellenőrizd hogy Python 3.6-e.


* * *

Ha kétségeid vannak, vagy valami elromlott, és nem tudod, mit csinálj - csak kérdezd meg a coachodat! Néha a dolgok nem mennek teljesen simán, és jobb megkérdezni valakit, akinek több tapasztalata van a témában.
