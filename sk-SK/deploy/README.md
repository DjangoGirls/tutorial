# Nasadenie!

> **Poznámka** Občas bude možno trochu ťažké prehrýzť sa touto kapitolou. Vydrž a dokonči ju, nasadenie je dôležitou časťou vývoja webových stránok. Táto kapitola je umiestnená uprostred tutoriálu, aby ti mentor/ka mohol/a pomôcť s trochu náročnejšími časťami procesu spúšťania tvojej webovej stránky online. To znamená, že môžeš dokončiť tutoriál aj sama, ak ti nevyjde čas.

Až do teraz, tvoja webová stránka bola dostupná len v počítači. Teraz sa naučíš, ako ju nasadiť! Nasadenie je proces publikovania aplikácie na internete, takže ju ľudia konečne budú môcť vidieť. :)

Ako už vieš, webová stránka musí byť umiestnená na serveri. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere je bezplatný pre malé aplikácie, ktoré nemajú príliš veľa návštevníkov, takže zatiaľ ti to určite bude stačiť.

Ďalšou externou službou, ktorú budeme využívať je [GitHub](https://www.github.com), kde sa uchovávajú zdrojové kódy. Existujú aj ďalšie podobné služby, no dnes už majú takmer všetci programátori na GitHube konto a teraz ho už budeš mať aj ty!

Tieto tri miesta budú pre teba dôležité. Lokálny počítač bude miestom, kde budeš vyvíjať a testovať. Keď si spokojná so zmenami, uložíš kópiu programu na GitHub. Tvoja webová stránka bude na PythonAnywhere a budeš ju aktualizovať stiahnutím novej kópie svojho kódu z GitHub-u.

# Git

> **Poznámka** Ak už máš za sebou inštaláciu, nemusíš to robiť znovu a môžeš preskočiť na ďalšiu časť a začať s vytváraním Git repozitára.

{% include "/deploy/install_git.md" %}

## Založenie Git repozitára

Git sleduje zmeny na konkrétnej množine súborov, v niečom, čo sa nazýva úložisko kódu alebo repozitár (skrátene "repo"). Založme si repo pre náš projekt. Otvor konzolu a spusti nasledujúce príkazy v adresári `djangogirls`:

> **Poznámka** Skontroluj si aktuálny pracovný adresár s príkazom`pwd` (Mac OS X/Linux) alebo `cd` (Windows) pred inicializáciou repozitára. Mala by si byť v priečinku `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Inicializácia git repozitára je niečo, čo musíme urobiť len raz za projekt (a už nikdy nebudeš musieť znovu zadať užívateľské meno a e-mail).

Git bude sledovať zmeny všetkých súborov a priečinkov v tomto adresári, ale sú aj niektoré súbory, ktoré chceme ignorovať. To urobíme tak, že vytvoríme súbor s názvom `.gitignore` v základnom adresári. Otvor si editor a vytvor nový súbor s týmto obsahom:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

A ulož ho ako `.gitignore` v priečinku "djangogirls".

> **Poznámka** Bodka na začiatku názvu súboru je dôležitá! Ak máš problém vytvoriť takýto súbor (napríklad Macom sa nepáči, ak chceš cez Vyhľadávanie (Finder) vytvoriť súbory, ktoré sa začínajú bodkou), potom použi funkciu "Uložiť ako" vo svojom editore, to je spôsob akým sa to určite uloží.
> 
> **Poznámka** Jeden zo súborov, ktoré ste zadali v súbore `.gitignore` je `db.sqlite3`. Tento súbor je vaša lokálna databáza, kde sú všetky vaše príspevky skladované. Nechceme to pridať do repozitára, lebo tvoja webová stránka na PythonAnywhere bude používať inú databázu. Možno to bude SQLite, tak ako na stroji na ktorom vyvíjaš, ale zvyčajne použiješ databázu, ktorá sa volá MySQL, ktorá zvládne oveľa viac navštevníkov ako SQLite. Či tak alebo onak, ignorovaním SQLite databázy v kópii na GitHub-e, všetky príspevky, ktoré si vytvorila doteraz, zostanú dostupné len lokálne, a budeš ich musieť znovu pridať na produkčnej stránke. Svoju lokálnu databázu si môžeš predstaviť ako pieskovisko na ktorom si môžeš vyskúšať rôzne veci a nebáť sa že zmažeš reálne príspevky zo svojho blogu.

Vždy je dobré použiť príkaz `git status` pred `git add` alebo kedykoľvek, keď si nebudeš istá, či sa niečo zmenilo. To ti pomôže vyhnúť sa prekvapeniam ako napríklad pridanie nesprávnych súborov. Príkaz `git status` dáva informácie o nesledovaných (untracked) či zmenených (modified) súboroch, alebo súboroch pripravených na zmenu (staged), o stave vetvy a veľa ďalších vecí. Výstup by mal byť podobný nasledovnému:

{% filename %}command-line{% endfilename %}

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
    

A nakoniec uložíme naše zmeny. Teraz prejdi na konzolu a zadaj nasledujúce príkazy:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (Ak si to už urobila počas prípravy na workshop, tak to je super!)
    
    Potom, vytvor nový repozitár a pomenuj ho "moj-prvy-blog". Checkbox "inicializuj s README" nechaj nezaškrtnutý, voľbu .gitignore nechaj prázdnu (urobili sme to manuálne) a Licenciu nechaj ako None.
    
    <img src="images/new_github_repo.png" />
    
    > **Poznámka** Názov `moj-prvy-blog` je dôležitý -- môžeš si vybrať aj niečo iné, ale v ďalších inštrukciách sa to bude vyskytovať veľakrát a musela by si to zakaždým nahradiť. Asi bude ľahšie, ak ostaneš pri názve `moj-prvy-blog`.
    
    Na ďalšej obrazovke, sa ti zobrazí URL tvojho klonu repozitára. Zvoľ "HTTPS" verziu, skopíruj ju a o chvíľu ju vložíme do terminálu:
    <img src="images/github_get_repo_url_screenshot.png" />
    Teraz musíme prepjiť Git repozitár na tvojom počítači s tým na Githube.
    
    Napíš do konzoly nasledujúci príkaz: (nahraď `<your-github-username>` svojím uživateľským menom na Githube, ale bez lemných zátvoriek):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Zadaj svoje Github uživateľské meno a heslo a uvidíš niečo podobné tomuto:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Tvoj kód je na Githube. Kľudne si to over!  Zistíš, že sa nachádza vo vyberanej spoločnosti - [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), a mnoho iných skvelých open source-ových softvérových projektov ukladá svoj kód na GitHube. :)
    
    
    # Umiestnenie nášho blogu na PythonAnywhere
    
    &gt; **Poznámka** Možno si si už vytvorila účet na PythonAnzwhere počas inštalácie - ak áno, tak nemusíš to robiť znova.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Stiahnutie nášho kódu na PythonAnywhere
    
    Keď si sa zaregistrovala do PythonAnywhere, budeš presmerovaná na dashboard alebo "Consoles" stránku. Vyber si možnosť spustiť "Bash" konzolu - to je PythonAnywhere konzola, podobná ako na tvojom počítači.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Poznámka** PythonAnywhere ja založené na Linuxe, takže ak používaš Windows, konzola sa bude líšiť od tej na tvojom počítači.
    
    Poďme teraz natiahnuť náš kód z GitHubu na PythonAnywhere vytvorením "klonu" nášho repozitára. Zadaj nasledujúci príkaz do konzoly na PythonAnywhere (nezabudni použiť užívateľské meno z GitHubu namiesto &lt;your-github-username&gt;):
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />Toto stiahne kópiu tvojho kódu na PythonAnywhere. Over si to zadaním príkazu `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Vytvorenie virtualenv na PythonAnywhere
    
    Presna tak ako na tvojom počítači, môžeš vytvoriť virtualenv na PythonAnywhere. V Bash konzole, zadaj príkaz:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; ** Poznámka ** "pip install" krok môže trvať niekoľko minút.  Trpezlivosť, trpezlivosť!  Ale ak trvá viac ako päť minút, niečo nie je v poriadku.  Opýtaj sa svojho mentora.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Vytváranie databázy na PythonAnywhere
    
    Ďalšia vec, ktorá je iná na tvojom počítači a na serveri: používa sa iná databáza. Takže používateľské kontá a príspevky na serveri a v počítači sa môžu líšiť.
    
    Rovnako ako sme to urobili na tvojom počítači, zopakuj krok pri inicializácii databázy na serveri, s `migrate` a `createsuperuser`:
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Zverejnenie nášho blogu ako webovej aplikácie
    
    Náš kód je teraz na PythonAnywhere, virtualenv je pripravené a databáza je inicializovaná. Sme pripravení publikovať webovú aplikáciu!
    
    Kliknutím na logo PythonAnywhere sa vráť na nástenku a tam klikni na kartu Web. Nakoniec, stlač **Add a new web app** (Pridaj novú aplikáciu).
    
    Po potvrdení názvu tvojej domény, vyber v dialógu **manual configuration** (pozor, nie "Django" možnosť). Ďalej vyber **Python 3.6** a kliknutím na tlačidlo Ďalej dokonči sprievodcu.
    
    &gt; **Poznámka** Uisti sa že si zvolila "Manual configuration", a nie "Django" možnosť. Sme príliš cool aby sme použili predvolené Django nastavenia PythonAnywhere. ;-)
    
    
    ### Nastavenie virtualenv
    
    Budeš presmerovaná na PythonAnywhere konfiguračnú obrazovku pre tvoju aplikáciu. Sem budeš musieť chodiť vždy, keď budeš chcieť urobiť nejaké zmeny v tvojej aplikácii na serveri.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    V časti "Virtualenv", klikni na červený text "Enter the path to a virtualenv", a zadah `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Klikni na modré políčko s fajočkou a ulož tak cestu predtým, ako budeš pokračovať ďalej.
    
    &gt; **Poznámka** Nahraď svoje PythonAnywhere uživateľské meno podľa potreby. Ak urobíš chybu, PythonAnywhere zobrazí malé upozornenie.
    
    
    ### Konfigurácia WSGI súboru 
    
     Django funguje pomocou "protokolu WSGI", ktorý je štandardom pre obsluhu webových stránok pomocou Pythonu, a ktorý PythonAnywhere podporuje. Aby PythonAnywhere rozpoznal náš Django blog, musíme upraviť WSGI konfiguračný súbor.
    
    Klikni na link "WSGI configuration file" (v časti "Code" v hornej časti stránky -- bude sa volať nejako takto `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`) a dostaneš sa do editora.
    
    Zmaž celý obsah a nahraď ho nasledovným:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

Úlohou tohto súboru je oznámiť PythonAnywhere kde sa naša aplikácia nachádza a aký je názov súboru s Django nastaveniami.

`StaticFilesHandler` sa stará o naše CSS. O toto sa stará automaticky príkaz `runserver`, počas vývoja na lokálnom počítači. O statických súboroch sa naučíme trochu viac neskôr, keď budeme upravovať CSS pre našu stránku.

Klikni na **Save** a vráť sa na kartu **Web**.

Hotovo! Klikni na veľké zelené tlačidlo **Reload** a potom sa už môžeš pozrieť na svoju aplikáciu. Odkaz na ňu nájdeš navrchu stránky.

## Tipy pre ladenie

Ak pri pokuse navštíviť svoju stránku uvidíš chybu, prvým miestom, kde hľadať problém je **error log**. Odkaz naňho nájdeš na PythonAnywhere v [karte Web](https://www.pythonanywhere.com/web_app_setup/). Pozri, či tam nie sú nejaké chybové hlášky - tie najnovšie sú naspodku. Najčastejšie problémy bývajú:

- Vynechaný krok, ktorý sme robili v konzole: vytvorenie virtualenv, jeho aktivácia, inštalácia Djanga do virtualenvu, spustenie collectstatic, presun databázy.

- Chyba v ceste virtualenv v karte Web -- ak je nejaký problém, zvyčajne tam bude malá červená chybová hláška.

- Chyba vo WSGI konfiguračnom súbore -- zadala si cestu do adresára my-first-blog správne?

- Vybrala si si rovnakú verziu Pythonu pre virtualenv ako pre webovú aplikáciu? Obidve by mali byť 3.6.

Môžeš skúsiť aj [Všeobecné tipy na ladenie na PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

A nezabudni, tvoj tréner je tu na to, aby ti pomohol!

# Si online!

Hlavná stránka tvojej aplikácie by ťa mala vítať nápisom "It worked!", tak ako na tvojom počítači. Skús pridať `/admin/` na koniec adresy URL, a budeš presmerovaná na stránky administrácie. Prihlás sa s užívateľským menom a heslom a uvidíš, že môžeš pridávať nové príspevky (posty) na server.

Keď vytvoríš niekolľko príspevkov, môžeš sa vrátiť do tvojho lokálneho prostredia (nie PythonAnywhere). Na zmenách by si mala pracovať v lokálnom prostredí. To je štandardný pracovný postup pri vývoji webových aplikácií - urobíš zmeny lokálne, dáš tieto zmeny na GitHub a stiahneš zmeny na svoj webový server. To ti umožní pracovať a experimentovať bez pokazenia živej webovej stránky. Docela cool, nie?

*OHROMNE* sa potľapkaj po chrbte! Nasadenie serveru je jedna z najzradnejších častí vývoja web stránok a často zaberie ľuďom aj niekoľko dní, kým to spojazdnia. Ale ty už máš teraz svoju stránku online, na skutočnom internete!