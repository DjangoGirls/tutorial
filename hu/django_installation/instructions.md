> Ennek a fejezetnek egy része a Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tutorialjain alapul.
> 
> A fejezet részben a [django-marcador tutorial](http://django-marcador.keimlink.de/)-on alapszik, ami a Creative Commons Attribution-ShareAlike 4.0 International License jogvédelem alatt áll. A django-marcador tutorial jogvédelem alatt áll, Markus Zapke-Gründemann et al által.

## Virtuális környezet

Mielőtt feltelepítjük a Django-t, egy rettentő hasznos eszközt fogunk installálni, ami segít, hogy a kódolói környezetedet rendben tartsa a számítógépeden. Át lehet ugrani ezt a lépést, de nem ajánlott. Ha a lehető legjobb kiindulási helyzetből kezded a kódolást, sok bosszúságot megspórolhatsz magadnak a jövőben!

Tehát először is hozzunk létre egy **virtuális környezetet** (virtual environment), amit *virtualenv*-nek is hívunk. A virtualenv projektenként különíti el a Python/Django környezetet. Ez azt jelenti, hogy ha megváltoztatsz valamit egy weboldalon, az nem lesz hatással a többi weboldalra, amit párhuzamosan fejlesztesz. Jó, igaz?

Csak annyit kell tenned, hogy kiválasztasz egy könyvtárat, ahova a `virtualenv`et szeretnéd telepíteni, például a home könyvtárat. Windowson ez így nézhet ki: `C:\Users\Name` (ahol a `Name` a felhasználód neve).

Ehhez a tutorialhoz egy új, `djangogirls` nevű mappát fogunk használni a home könyvtáradon belül:

    mkdir djangogirls
    cd djangogirls
    

Most pedig létrehozunk egy `myvenv` nevű virtuális környezetet. A kód általánosan így néz ki:

    python3 -m venv myvenv
    

### Windows

Ahhoz, hogy létrehozz egy új `virtualenv`-et, meg kell nyitni a konzolt (pár fejezettel ezelőtt tanultál róla - emlékszel?) és a ezt a parancsot kell lefuttatnod: `C:\Python34\python -m venv myvenv`. Ez fog történni:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

itt a `C:\Python34\python` azt a könyvtárat jelenti, ahova korábban a Pythont telepítetted, és a `myvenv` a `virtualenv`-ed neve. Bármi más nevet is használhatsz, de maradj a kisbetűs szavaknál, és ne használj szóközt, ékezeteket, vagy más speciális karaktereket. Jó ötlet rövid nevet adni - sokszor be kell majd gépelned!

### Linus és OS X

A `virtualenv` létrehozása Linux és OS X környezetben is csak annyiból áll, hogy a `python3 -m venv myvenv` parancsot futtatod. Így fog kinézni:

    ~/djangogirls$ python3 -m venv myvenv
    

A `myvenv` a`virtualenv`-ed neve. Más nevet is használhatsz, de maradj a kisbetűs szavaknál, és ne használj szóközt, ékezeteket, vagy más speciális karaktereket. Jó ötlet rövid nevet adni - sokszor be kell majd gépelned!

> **MEGJEGYZÉS:** A virtuális környezetet létrehozó parancs Ubuntu 14.04 alatt ezt a hibát adja:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Hogy ezt elkerüld, használd a `virtualenv` parancsot.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Hogyan dolgozhatsz virtuális környezetben

A fenti parancs létrehozott egy `myvenv` nevű (vagy bármi más név, amit választottál) könyvtárat, ami a virtuális környezetünket tartalmazza (ez tulajdonképpen csak egy csomó könyvtár és fájl).

#### Windows

Így indíthatod el a virtuális környezetet:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

#### Linus és OS X

Így indíthatod el a virtuális környezetet:

    ~/djangogirls$ source myvenv/bin/activate
    

Fontos, hogy `myvenv` helyett azt a neved írd be, amit a `virtualenv`-ednek választottál!

> **MEGJEGYZÉS:** néha a `source` nem elérhető. Ebben az esetben próbáld meg ezt:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Onnan tudod, hogy a `virtualenv` elindult, hogy a konzolodban a prompt így néz ki:

    (myvenv) C:\Users\Name\djangogirls>
    

vagy:

    (myvenv) ~/djangogirls$
    

Figyeld meg, hogy megjelent a `(myvenv)` előtag!

Ha virtuális környezetben dolgozol, a `python` parancs mindig a megfelelő Python verzióra fog mutatni, tehát nyugodtan használhatod a `python`-t `python3` helyett.

Oké, most már minden feltétel teljesült. Végre installálhatjuk a Django-t!

## A Django telepítése

Most, hogy elindítottad a `virtualenv`-et, a `pip` segítségével tudod telepíteni a Django-t. Futtasd ezt a parancsot a konzolban: `pip install django==1.8` (figyelj oda, hogy dupla egyenlőségjelet használj: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

Windowson

> Ha hibát kapsz, amikor a pip-et hívod Windowson, nézd meg, hogy tartalmaz-e a projekted elérési útvonala szóközt, ékezetet, vagy speciális karaktereket (pl. `C:\Users\User Name\djangogirls`). Ha igen, helyezd át az egészet egy olyan helyre, ahol nincsenek szóközök, ékezetek vagy speciális karakterek (javaslat: `C:\djangogirls`). Miután áthelyezted, próbáld meg újra lefuttatni az előző parancsot.

Linuxon

> Ha Ubuntu 12.04 alatt hibát kapsz, amikor a pip-et próbálod hívni, futtasd a `python -m pip install -U --force-reinstall pip` parancsot, hogy megjavítsd a virtualenv-ben a pip feltelepített verzióját.

Ennyi! Most pedig (végre) létrehozhatod a Django alkalmazásodat!
