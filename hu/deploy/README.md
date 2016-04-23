# Deploy!

> **Megjegyzés** A következő fejezet néhol kissé bonyolult lehet. Tarts ki és vedd át az egész fejezetet; ugyanis most a webfejlesztés egy nagyon fontos része következik - az ún. deployment. Ez a fejezet a tutorial közepén található, így majd a mentorod is tud segíteni a trükkösebb részeknél, miközben a honlapodat online is elérhetővé teszed. Magát a tutorialt később egyedül is befejezheted, ha esetleg kifutnál az időből.

Ezidáig a honlapod csak a saját számítógépeden volt elérhető - most tanuljuk meg, hogyan tegyük mások számára is elérhetővé! Ez az ún. deploying - az a tevékenység, amely során az alkalmazásodat közzé teszed az interneten, hogy mások is láthassák és használhassák azt :).

Ahogyan azt már tudod, a honlapot egy szerveren kell elhelyezni. Több szerver szolgáltató is elérhető az interneten. Mi egy olyat fogunk használni, amit viszonylag egyszerű kezelni: [PythonAnywhere][1]. A PythonAnywhere ingyenes olyan kisebb alkalmazások számára, amelyeknek nincs sok látogatójuk, tehát a mi esetünkben ez pont megfelelő lesz.

 [1]: http://pythonanywhere.com/

A másik külső szolgáltatás, amit igénybe fogunk venni a [GitHub][2], ami egy ún. code hosting service (forráskód tárolására és megosztására alkalmas online tárhely). Vannak más hozzá hasonló szolgáltatók is, de szinte minden programozó ezt használja manapság, és nemsokára te is közéjük tartozhatsz!

 [2]: http://www.github.com

A GitHubról fogjuk a forráskódunkat áthelyezni a PythonAnywhere-be, és fordítva.

# Git

A Git egy "version control system" (VCS, magyarul verziókezelő rendszer), amit sok programozó használ. Ez a szoftver nyomon követ minden változást a fájlokban, így a későbbiekben is visszatérhetünk egy bizonyos régebbi verzióhoz. Valamelyest hasonlít a "változások nyomon követése" funkcióhoz a Microsoft Wordben, de ez jóval hatékonyabb.

## Git telepítése

> **Megjegyzés** Ha már követted a korábbi telepítési utasításokat, ezt a pontot átugorhatod és kezdheted kialakítani a saját Git csomagtáradat!

{% include "/deploy/install_git.md" %}

## Készítsünk Git repository-t

A Git nyomon követi a változásokat az adott fájlokban egy ún. csomagtárban (repository vagy röviden "repo"). Nyissunk egy új repo-t a projektünknek. Nyisd fel a konzolt és futtasd le a következő parancsokat, a `djangogirls` mappában:

> **Megjegyzés** Az alábbi parancsokkal ellenőrizheted a munkamappát (working directory, az éppen megnyitott mappa): `pwd` (OSX/Linux) vagy `cd` (Windows) mielőtt létrehoznád a repositoryt. A `djangogirls` mappában kell lenned.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

A git csomagtár inicializálása olyasvalami, amit minden projekt esetében csak egyszer kell véghezvinni (így majd nem kell újra és újra megadni a felhasználónevet ill. jelszót).

A Git ezután nyomon követ minden változást a fájlokban és mappákban ezen a mappán belül. De vannak bizonyos fájlok, amiket nem szeretnénk figyelembe venni. Ezt úgy tehetjük meg, hogy létrehozunk egy fájlt `.gitignore` névvel a gyökérkönyvtárban. Nyisd meg a szövegszerkesztőt és hozz létre egy új fájlt, amibe az alábbi sorok kerülnek:

    *.pyc 
    __pycache__ 
    myvenv 
    db.sqlite3 
    .DS_Store
    

Majd mentsd le `.gitignore` néven a "djangogirls" legfelsőbb mappájában.

> **Megjegyzés** Nagyon fontos, hogy a fájl neve ponttal kezdődjön! Ha bármi gond adódna a fájl létrehozásánál (pl. Mac számítógépeken a Finder alapvetően nem engedi, hogy a fájlnév ponttal kezdődjön), akkor használd a "Save as" lehetőséget.

Jó ötlet a `git status` parancs használata még a `git add` előtt, valamint ezen kívül még bármikor, ha tudni szeretnéd, hogy mi változott. Ez majd segít elkerülni olyan szituációkat, mint például rossz fájlok hozzáadása ill. feltöltése a csomagtárba. A `git status` parancs információt szolgáltat minden nem követett (not tracked) / megváltozott (modified) /feltöltésre felkészített fájlról (staged files) stb. A kimenet ehhez hasonló lesz:

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Végül mentsük le a változtatásokat. A konzolban futtasd le a következő parancsokat:

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Forráskód feltöltése a GitHubra

A böngészőben keresd fel a [GitHub.com][2] honlapot és regisztrálj be egy új "free user" fiókba. (Ha már beregisztráltál, ezt a pontot kihagyhatod) 

Ezután hozz létre egy új csomagtárat ("repót"), amit nevezz "my-first-blog"-nak. Hagyd az "initialise with a README" mezőt jelöletlenül, a .gitignore lehetőséget hagyd üresen (ezt manuálisan tettük), a "License" résznél maradjon a "None" opció.

![][3]

 [3]: images/new_github_repo.png

> **Megjegyzés** A `my-first-blog` név fontos -- választhattál volna más nevet is, de gyakran előfordul majd a későbbiekben is a parancsokban. Valószínűleg egyszerűbb lesz számodra is, ha a `my-first-blog` nevet használod.

A következő oldalon látni fogod a repód url-jét (repo's clone url). Válaszd a "HTTPS" verziót, másold ki - mindjárt bemásoljuk a terminálba:

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Most összekötjük a Git csomagtárat a számítógépeden a másik csomagtárral a GitHubon.

A konzolba írd be a következőt (helyettesítsd a `<your-github-username>` a saját felhasználóneveddel, amivel a GitHubon regisztráltál, de a kacsacsőrök nélkül):

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Add meg a GitHub felhasználónevedet és jelszódat, valami hasonlót kell hogy láss:

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

A forráskódod most már fent van a GitHubon. Menj és nézd meg! Láthatod hogy jó társasága van - [Django][5], a [Django Girls Tutorial][6], és sok más szuper nyílt forráskódú szoftver forráskódja szintén a GitHubon található :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Tegyük fel a blogot a PythonAnywhere-re

> **Megjegyzés** Valószínűleg már létrehoztál egy PythonAnywhere fiókot korábban a telepítés során - ha így van, ezt nem kell újból megtenned.

{% include "/deploy/signup_pythonanywhere.md" %}

## Forráskód letöltése a PythonAnywhere-be

Amikor bejelentkezel a PythonAnywhere-be, egyből a dashboard-on, vagy "Consoles" oldalon találod magad. Válaszd a "Bash" konzol indítása opciót -- ez a PythonAnywhere konzolja, ugyanolyan, mint a parancssor a gépeden.

> **Megjegyzés** A PythonAnywhere Linux rendszeren alapszik, tehát ha Windows-ot használsz, a konzol egy kissé máshogy fog kinézni a te számítógépeden.

Töltsük be a forráskódodat a GitHubról a PythonAnywhere-be egy "clone" létrehozásával. Írd be az alábbiakat a konzolba a PythonAnywhere-ben (ne felejtsd, hogy a `<your-github-username>` helyébe a saját, GitHubon használt felhasználónevedet helyettesítsd be):

    $ git clone https://github.com/<your-github-username>/my-first-blog.git
    

Ez majd betölti a forráskódod másolatát a PythonAnywhere-be. Ellenőrizheted, ha beírod a konzolba, hogy `tree my-first-blog`:

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

### Virtuális környezet létrehozása a PythonAnywhere-en

Ugyanúgy, ahogy a saját gépeden csináltad, a PythonAnywhere-en is létrehozhatsz virtualenvet. Írd be a Bash konzolba:

```
$ cd my-first-blog

$ virtualenv --python=python3.4 myvenv
Running virtualenv with interpreter /usr/bin/python3.4
[...]
Installing setuptools, pip...done.

$ source myvenv/bin/activate

(mvenv) $  pip install django whitenoise
Collecting django
[...]
Successfully installed django-1.8.2 whitenoise-2.0
```


> **Megjegyzés** A `pip install` lépés eltarthat pár percig. Légy türelmes! De ha több mint 5 percig tart, akkor valószínűleg valami nincs rendben. Kérdezd meg a coachodat!

<!--TODO: think about using requirements.txt instead of pip install.-->

### Statikus fájlok összegyűjtése.

Kíváncsi vagy, mi ez a "whitenoise" nevű dolog? Egy eszköz az úgynevezett "statikus fájlok" kiszolgálására. A statikus fájlok olyan fájlok, amelyek nem változnak meg rendszeresen, vagy nem futtatnak programkódot - mint például a HTML vagy a CSS fájlok. A szervereken ezek másképp működnek, mint a saját gépünkön, ezért szükségünk van egy olyan eszközre, mint a "whitenoise", hogy kiszolgáljuk őket.

A statikus fájlokról többet is tanulsz majd a tutorial során, amikor a CSS-t fogod szerkeszteni a honlapodhoz.

Egyelőre csak egy `collectstatic` parancsot kell lefuttatnod a szerveren. Ez megmondja a Django-nak, hogy gyűjtse össze a szerveren az összes statikus fájlt, amire szüksége lesz. Ezek most többnyire olyan fájlok, amik az adminfelület kinézetét adják.

    (mvenv) $ python manage.py collectstatic
    
    You have requested to collect static files at the destination
    location as specified in your settings:
    
        /home/edith/my-first-blog/static
    
    This will overwrite existing files!
    Are you sure you want to do this?
    
    Type 'yes' to continue, or 'no' to cancel: yes
    

Írd be, hogy "yes", és el is tűnik! Te is imádod, ha kiírathatsz a gépeddel egy csomó érthetetlen szöveget? Én mindig fura hangokat adok ki ilyenkor, nagyon jól illik hozzá. Brp, brp, brp...

    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.
    

### Adatbázis létrehozása PythonAnywhere-en

Van még valami, ami máshogy működik a saját gépeden és a szerveren: különböző szervert használnak. Így a felhasználói fiókok és a blogposztok különbözőek lehetnek a szerveren és a gépeden.

A szerveren ugyanúgy tudod létrehozni az adatbázist, mint a saját gépeden, a `migrate` és `createsuperuser` parancsokkal:

    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK
    
    
    (mvenv) $ python manage.py createsuperuser
    

## Tegyük közzé a blogot a weben!

Most már fent van a kódod a PythonAnywhere-en, kész a virtuális környezet, össze vannak gyűjtve a statikus fájlok, és az adatbázist is elkészítetted. Készen állsz, hogy webes alkalmazást csinálj belőle!

Menj vissza a PythonAnywhere dashboardra (a logóra kattintva megteheted), majd kattints a **Web** tabra. Végül nyomd meg a **Add a new web app** gombot.

Miután leokéztad a domainnevedet, válaszd a **manual configuration**-t (kézi konfiguráció - vigyázz, *ne* a "Django" opciót válaszd!) a párbeszédablakban. Aztán válaszd ki a **Python 3.4**-et, majd nyomd meg a Nextet.

> **Megjegyzés** Fontos, hogy a "Manual configuration" lehetőséget válaszd, ne a "Django"-t. Túl menők vagyunk a PythonAnywhere-es Django setuphoz:)

### Virtuális környezet beállítása

Most a PythonAnywhere config oldalára kerülsz, ahol különböző dolgokat állíthatsz be az appeddel kapcsolatban. Ha bármit meg szeretnél változtatni később, ide kell visszajönnöd.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

A "Virtualenv" részben kattints rá a piros szövegre: "Enter the path to a virtualenv", majd írd be: `/home/<your-username>/my-first-blog/myvenv/`. Kattints a kék dobozra a pipajellel, hogy elmentsd a path-t, mielőtt továbblépsz.

> **Megjegyzés** Helyettesítsd be a saját felhasználóneved. Ha elrontasz valamit, a PythonAnywhere figyelmeztetni fog.

### A WSGI fájl konfigurálása

A Django a "WSGI protokollt" használja. Ez egy szabvány, ami a Python segítségével kiszolgált weboldalakra érvényes. A PythonAnywhere is támogatja ezt. Ahhoz, hogy a PythonAnywhere felismerje a Django blogunkat, egy WSGI konfigurációs fájlt kell szerkesztenünk.

Kattints a "WSGI configuration file" linkre (a "Code" szekcióban az oldal tetejénél -- olyasmi neve lesz, hogy `/var/www/<your-username>_pythonanywhere_com_wsgi.py`). Egy kódszerkesztőbe fogsz jutni.

Törölj ki mindent, és cseréld ki valami ilyesmire:

```python
import os
import sys

path = '/home/<your-username>/my-first-blog'  # itt a saját felhasználónevedet használd!
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Megjegyzés** Ne felejtsd el a saját felhasználóneveddel helyettesíteni a `<your-username>`-et!

Ennek a fájlnak az a dolga, hogy megmondja a PythonAnywhere-nek, hol lakik a webes alkalmazásunk, és mi annak a fájlnak a neve, ahol a Django beállításai vannak. Ezenkívül a "whitenoise"-t is beállítja, ami a statikus fájlok kiszolgálásában segít.

Nyomd meg a **Save** (Mentés) gombot, majd menj vissza a **Web** fülre.

Kész is vagyunk! Nyomd meg a nagy zöld **Reload** gombot, és máris meg fogod tudni nézni az alkalmazásodat. Az oldal tetején fogsz találni hozzá egy linket.

## Tippek debuggoláshoz

Ha hibát látsz, amikor megpróbálod meglátogatni az oldaladat, az első hely, ahol információt kaphatsz a debuggoláshoz, az **error log**. Ehhez a PythonAnywhere [Web tab][8]-ján találod meg a linket. Nézd meg, hogy van-e benne bármilyen hibaüzenet; a legfrissebbek lesznek alul. Gyakran előforduló problémák:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Kihagytad valamelyik lépést a konzolban: a virtualenv létrehozását, aktiválását, a Django installálását a virtualenvben, a collectstatic lefuttatását, az adatbázis migrálását.

*   Valamit elrontottál a virtualenv path-ban a Web fülön -- általában egy piros hibaüzenet jelzi, ha valami gond van.

*   Valamit elrontottál a WSGI konfigurációs fájlban -- jól írtad be a my-first-blog könyvtárhoz vezető elérési útvonalat?

*   Ugyanazt a Python verziót választottad a virtualenved számára, mint az alkalmazásodhoz? Mindkettőnek a 3.4-esnek kell lennie.

*   A [PythonAnywhere wikiben is találsz néhány általános hibakeresési tippet][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

És ne feledd, a coachod azért van, hogy segítsen!

# Él a weboldalad!

A honlapod alapértelmezett oldala a "Welcome to Django", ugyanúgy, mint a saját gépeden. Add hozzá az `/admin/`-t az URL végéhez, és az adminfelületre kerülsz. Jelentkezz be a felhasználóneveddel és a jelszavaddal, és látni fogod, hogy itt is tudsz új Postokat létrehozni.

Megérdemelsz egy *HATALMAS* vállveregetést! A szerver deployment a webfejlesztés legbonyolultabb részei közé tartozik, és a fejlesztők gyakran napokat töltenek azzal, hogy mindent működésre bírjanak. De neked most komolyan van egy működő weboldalad, az Interneten, és nem is tartott sokáig megcsinálni!
