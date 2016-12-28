# Nasadenie!

> **Poznámka** Občas bude možno trochu ťažké prehrýzť sa touto kapitolou. Vydrž a dokonči ju, nasadenie je dôležitou časťou vývoja webových stránok. Táto kapitola je umiestnená uprostred tutorialu, takže mentor ti môže pomôcť s trochu náročnejšími časťami procesu spúšťania tvojej web stránky online. To znamená, že môžeš dokončiť tutorial aj sama, ak ti nevyjde čas.

Až doteraz bola tvoja web stránka dostupná len v tvojom počítači, teraz sa však naučíš, ako ju nasadiť! Nasadenie je proces publikovania aplikácie na internete, takže ju ľudia konečne môžu vidieť :).

Ako už vieš, web stránka musí byť umiestnená na serveri. Na internete je množstvo poskytovateľov serverov. My použijeme jedného, ktorý má pomerne jednoduchý proces nasadenia: [PythonAnywhere][1]. PythonAnywhere je bezplatný pre malé aplikácie, ktoré nemajú príliš veľa návštevníkov, takže zatiaľ ti to určite bude stačiť.

 [1]: https://pythonanywhere.com/

Ďalšou externou službou, ktorú budeme využívať je [GitHub][2], kde sa uchovávajú zdrojové kódy. Existujú aj ďalšie takéto služby, no dnes už majú takmer všetci programátori na GitHube konto a teraz ho budeš mať už aj ty!

 [2]: https://www.github.com

GitHub použijeme ako odrazový mostík na prenos nášho kódu z a do PythonAnywhere.

# Git

Git je "systém na správu verzií", ktorý využíva množstvo programátorov. Tento softvér sleduje v priebehu času zmeny v tvojich súboroch, takže sa kedykoľvek môžeš vrátiť ku konkrétnej verzii. Niečo ako funkcia "sledovať zmeny" vo Worde, ale oveľa výkonnejšie.

## Inštalácia Gitu

> **Poznámka** Ak si už kroky inštalácie robila, nemusíš to robiť znova a môžeš preskočiť na ďalšiu časť a začať vytvárať Git repozitár.

{% include "/deploy/install_git.md" %}

## Spustenie Git repozitára

Git sleduje zmeny na konkrétnej množine súborov, v niečom, čo sa nazýva úložisko kódu alebo repozitár (skrátene "repo"). Založme si repo pre náš projekt. Otvor konzolu a spusti nasledujúce príkazy v adresári `djangogirls`:

> **Poznámka** Skontroluj si aktuálny pracovný adresár s príkazom`pwd` v OSX/Linux alebo `cd` vo Windowse pred inicializáciou úložiska. Mala by si byť v priečinku `djangogirls`.

```
    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
```

Inicializácia git repozitára je niečo, čo musíme urobiť len raz za projekt (a už nikdy nebudeš musieť znovu zadať užívateľské meno a e-mail).

Git bude sledovať zmeny všetkých súborov a priečinkov v tomto adresári, ale sú aj niektoré súbory, ktoré chceme ignorovať. To urobíme tak, že vytvoríme súbor s názvom `.gitignore` v základnom adresári. Otvor si editor a vytvor nový súbor s týmto obsahom:

```
    *.pyc
    __pycache__
    myvenv
    db.sqlite3
    .DS_Store
```

A ulož ho ako `.gitignore` do hlavného adresára "djangogirls".

> **Poznámka** Bodka na začiatku názvu súboru je dôležitá! Ak máš problém vytvoriť takýto súbor (napríklad Macom sa nepáči, ak chceš cez Vyhľadávanie (Finder) vytvoriť súbory, ktoré sa začínajú bodkou), potom použi funkciu "Uložiť ako" vo svojom editore, to je nepriestrelné.

Vždy je dobré použiť príkaz `git status` pred `git add` alebo kedykoľvek, keď si nebudeš istá, čo sa zmenilo. To ti pomôže vyhnúť sa prekvapeniam ako napríklad pridanie nesprávnych súborov. Príkaz `git status` dáva informácie o nesledovaných (untracked) či zmenených (modified) súboroch, alebo súboroch pripravených na zmenu (staged), o stave vetvy a veľa ďalšieho. Výstup by mal vyzerať takto nejako:

```
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
```

A nakoniec uložíme naše zmeny. Teraz prejdi na konzolu a zadaj nasledujúce príkazy:

```
    $ git add -A .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
```

## Prenos nášho kódu na GitHub

Choď na [GitHub.com][2] a zaregistruj sa na nové bezplatné konto. (Ak si to už urobila v prípravke na workshop, tak to je skvelé!)

Potom vytvor nové úložisko a pomenuj ho "my-first-blog". Nechaj políčko "initialise with README" nezaškrtnuté, možnosť .gitignore nechaj prázdnu (to sme už urobili ručne) a nechaj licenciu nastavenú ako None.

![][3]

 [3]: images/new_github_repo.png

> **Poznámka** Názov `my-first-blog` je dôležitý -- mohla by si si vybrať aj niečo iné, ale bude sa to ďalej vyskytovať veľakrát a musela by si to zakaždým nahradiť. Asi bude ľahšie, ak ostaneš pri názve `my-first-blog`.

Na ďalšej obrazovke sa zobrazí klon URL tvojho repozitára. Vyber si verziu "HTTPS", skopírujte ju, a o chvíľu ju použijeme v termináli:

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Teraz musíme pripojiť Git repozitár v počítači k tomu na GitHube.

Napíš do konzoly nasledujúci príkaz (nahraď `<tvoje-github-meno>` svojím užívateľským menom na GitHube, ale bez lomených zátvoriek):

```
$ git remote add origin https://github.com/<tvoje-github-meno>/my-first-blog.git
$ git push -u origin master
```

Zadaj svoje užívateľské meno a heslo na GitHube a malo by sa ti zobraziť niečo takého:

```
Username for 'https://github.com': hjwp
Password for 'https://hjwp@github.com':
Counting objects: 6, done.
Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/hjwp/my-first-blog.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Tvoj kód je na GitHube. Kľudne si to over! Zistíš, že sa nachádza vo vyberanej spoločnosti - [Django][5], [Django Girls Tutorial][6] a mnoho iných skvelých open sourcových softvérových projektov uchováva svoj kód na GitHube :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Vytvorenie nášho blogu na PythonAnywhere

> **Poznámka** Možno si už účet na PythonAnywhere vytvorila počas inštalácie - ak áno, nemusíš to robiť znova.

{% include "/deploy/signup_pythonanywhere.md" %}

## Natiahnutie nášho kódu na PythonAnywhere

Po registrácii na PythonAnywhere, budeš presmerovaná na svoju nástenku alebo stránku "Konzoly". Vyber si možnosť spustiť "Bash" konzolu - to je PythonAnywhere verzia konzoly, rovnaká ako na tvojom počítači.

> **Poznámka** PythonAnywhere je založený na Linuxe, takže ak si vo Windowse, konzola bude vyzerať trochu inak ako v tvojom počítači.

Poďme teraz natiahnuť náš kód z GitHubu na PythonAnywhere vytvorením "klonu" nášho repo. Zadaj nasledujúci príkaz do konzoly na PythonAnywhere (nezabudni použiť užívateľské meno z GitHubu namiesto `<tvoje-github-meno>`):

```
$ git clone https://github.com/<tvoje-github-meno>/my-first-blog.git
```

Toto natiahne kópiu tvojho kódu na PythonAnywhere. Môžeš si to overiť zadaním `tree my-first-blog`:

```
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
```

### Vytvorenie virtualenv na PythonAnywhere

Tak ako si to urobila vo svojom počítači, virtualenv môžeš vytvoriť aj na PythonAnywhere. V Bash konzole zadaj:

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

> **Poznámka:** Krok `pip install` môže trvať aj niekoľko minút. Trpezlivosť, trpezlivosť! Ale ak to trvá dlhšie ako 5 minút, niečo nie je v poriadku. Spýtaj sa svojho tútora.

<!--TODO: think about using requirements.txt instead of pip install.-->

### Zber statických súborov.

Zaujímalo ťa, čo je to vlastne ten "whitenoise"? Je to nástroj na obsluhu takzvaných "statických súborov". Statické súbory su také súbory, ktoré sa pravidelne nemenia, ani nespúšťajú kód programu, ako napríklad HTML či CSS súbory. Na serveroch fungujú inak ako na tvojom počítači a na ich obsluhu potrebujeme nástroj ako je "whitenoise".

O statických súboroch sa naučíme trochu viac neskôr, keď budeme upravovať CSS pre našu stránku.

Teraz len musíme na serveri spustiť jeden príkaz navyše - `collectstatic`. Ten povie Djangu, aby na serveri zhromaždil všetky statické súbory, ktoré potrebuje. Práve teraz sú to väčšinou súbory, ktoré zabezpečujú, aby adminská stránka vyzerala dobre.

```
(mvenv) $ python manage.py collectstatic

You have requested to collect static files at the destination
location as specified in your settings:

    /home/edith/my-first-blog/static

This will overwrite existing files!
Are you sure you want to do this?

Type 'yes' to continue, or 'no' to cancel: yes
```

Napíš "yes" a ono to zmizne! Aj ty zbožňuješ vyrábať stránky plné výstupov z počítačov alebo nepochopiteľného textu? Ja osobne si k tomu vymýšľam čudné zvuky. Brp, brp, brp...

```
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
[...]
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
62 static files copied to '/home/edith/my-first-blog/static'.
```

### Vytvorenie databázy na PythonAnywhere

Ďalšia vec, v ktorej sa líši tvoj počítač od servera: používa inú databázu. Takže užívateľské kontá a posty sa môžu na serveri líšiť od tých v počítači.

Môžeme inicializovať databázu na serveri, rovnako ako sme to urobili v tvojom počítači, pomocou `migrate` a `createsuperuser`:

```
(mvenv) $ python manage.py migrate
Operations to perform:
[...]
  Applying sessions.0001_initial... OK


(mvenv) $ python manage.py createsuperuser
```

## Publikovanie nášho blogu ako webovú aplikáciu

Teraz je náš kód na PythonAnywhere, náš virtualenv pripravený, statické súbory sú zhromaždené a databáza inicializovaná. Môžeme to teda zverejniť ako webovú aplikáciu!

Kliknutím na logo PythonAnywhere sa vráť na nástenku a tam klikni na kartu **Web**. Nakoniec, stlač **Add a new web app** (Pridaj novú aplikáciu).

Po potvrdení názvu tvojej domény, vyber v dialógu **manual configuration** (pozor, *nie* "Django" možnosť). Ďalej vyber **Python 3.4** a kliknutím na tlačidlo Ďalej dokonči sprievodcu.

> **Poznámka** Uisti sa, že si si vybrala možnosť "Manual configuration" (Manuálne nastavenie), nie "Django". Sme príliš cool, aby sme používali predvolené nastavenia PythonAnywhere Django ;-)

### Nastavenie virtualenv

Budeš presmerovaná na PythonAnywhere konfiguračnú obrazovku pre tvoju aplikáciu. Sem budeš musieť chodiť vždy, keď budeš chcieť urobiť nejaké zmeny v tvojej aplikácii na serveri.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

V časti "Virtualenv" klikni na červený text "Enter the path to a virtualenv" a zadaj: `/home/<toje-uzivatelske-meno>/my-first-blog/myvenv/`. Klikni na modré políčko s fajočkou a ulož tak cestu predtým, ako budeš pokračovať ďalej.

> **Poznámka** Nahraď svoje užívateľské meno podľa potreby. Ak urobíš chybu, PythonAnywhere ti zobrazí malé upozornenie.

### Konfigurácia súboru WSGI

Django funguje pomocou "protokolu WSGI", ktorý je štandardom pre obsluhu webových stránok pomocou Pythonu, a ktorý PythonAnywhere podporuje. Aby PythonAnywhere rozpoznal náš Django blog, musíme upraviť WSGI konfiguračný súbor.

Klikni na link "WSGI configuration file" (v časti "Code" v hornej časti stránky -- bude sa volať nejako takto `/var/www/<tvoje-uzivatelske-meno>_pythonanywhere_com_wsgi.py`) a dostaneš sa do editora.

Vymaž celý obsah a nahraď ho niečím takýmto:

```python
import os
import sys

path = '/home/<tvoje-uzivatelske-meno>/my-first-blog'  # use your own username here
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Poznámka** Nezabudni nahradiť svoje vlastné užívateľské meno namiesto `<tvoje-uzivatelske-meno>`

Úlohou tohto súboru je povedať PythonAnywhere, kde nájde našu aplikáciu a ako sa volá súbor s nastaveniami Djanga. Taktiež nastavuje nástroj "whitenoise" pre statické súbory.

Klikni na **Save** a vráť sa na kartu **Web**.

Hotovo! Klikni na veľké zelené tlačidlo **Reload** a potom sa už môžeš pozrieť na svoju aplikáciu. Odkaz na ňu nájdeš navrchu stránky.

## Tipy pre ladenie

Ak pri pokuse navštíviť svoju stránku uvidíš chybu, prvým miestom, kde hľadať problém je **error log**. Odkaz naňho nájdeš na PythonAnywhere v [karte Web][8]. Pozri, či tam nie sú nejaké chybové hlášky - tie najnovšie sú naspodku. Najčastejšie problémy bývajú:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Vynechaný krok, ktorý sme robili v konzole: vytvorenie virtualenv, jeho aktivácia, inštalácia Djanga do virtualenvu, spustenie collectstatic, presun databázy.

*   Chyba v ceste virtualenv v karte Web -- ak je nejaký problém, zvyčajne tam bude malá červená chybová hláška.

*   Chyba vo WSGI konfiguračnom súbore -- zadala si cestu do adresára my-first-blog správne?

*   Vybrala si si rovnakú verziu Pythonu pre virtualenv ako pre webovú aplikáciu? Obidve by mali byť 3.4.

*   Môžeš skúsiť aj [Všeobecné tipy na ladenie na PythonAnywhere wiki][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

A nezabudni, tvoj tréner je tu na to, aby ti pomohol!

# Si online!

Hlavná stránka tvojej aplikácie by ťa mala vítať nápisom "Welcome to Django", tak ako na tvojom počítači. Skús pridať `/admin/` na koniec adresy URL, a budeš presmerovaná na stránky administrácie. Prihlás sa s užívateľským menom a heslom a uvidíš, že môžeš pridávať nové príspevky (posty) na server.

*OHROMNE* sa potľapkaj po chrbte! Nasadenie serveru je jedna z najzradnejších častí vývoja web stránok a často zaberie ľuďom aj niekoľko dní, kým to spojazdnia. Ale ty už máš teraz svoju stránku online, na skutočnom internete!
