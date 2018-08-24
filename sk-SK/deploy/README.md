# Nasadenie!

> **Poznámka** Občas bude možno trochu ťažké prehrýzť sa touto kapitolou. Vydrž a dokonči ju, nasadenie je dôležitou časťou vývoja webových stránok. Táto kapitola je umiestnená uprostred tutoriálu, aby ti mentor/ka mohol/a pomôcť s trochu náročnejšími časťami procesu spúšťania tvojej webovej stránky online. To znamená, že môžeš dokončiť tutoriál aj sama, ak ti nevyjde čas.

Až doteraz, tvoja webová stránka bola dostupná len v počítači. Teraz sa naučíš, ako ju nasadiť! Nasadenie je proces publikovania aplikácie na internete, takže ju ľudia konečne budú môcť vidieť. :)

Ako už vieš, webová stránka musí byť umiestnená na serveri. Na Internete je dostupné mnoho poskytovateľov servrov, my použijeme [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere je bezplatný pre malé aplikácie, ktoré nemajú príliš veľa návštevníkov, takže zatiaľ ti to určite bude stačiť.

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
> **Poznámka** Jeden zo súborov, ktoré ste zadali v súbore `.gitignore` je `db.sqlite3`. Tento súbor je vaša lokálna databáza, kde sú všetky vaše príspevky uložené. Nechceme to pridať do repozitára, lebo tvoja webová stránka na PythonAnywhere bude používať inú databázu. Možno to bude SQLite, tak ako na stroji na ktorom vyvíjaš, ale zvyčajne použiješ databázu, ktorá sa volá MySQL, ktorá zvládne oveľa viac navštevníkov ako SQLite. Či tak alebo onak, ignorovaním SQLite databázy v kópii na GitHub-e, všetky príspevky, ktoré si vytvorila doteraz, zostanú dostupné len lokálne, a budeš ich musieť znovu pridať na produkčnej stránke. Svoju lokálnu databázu si môžeš predstaviť ako pieskovisko na ktorom si môžeš vyskúšať rôzne veci a nebáť sa že zmažeš reálne príspevky zo svojho blogu.

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
            requirements.txt
    
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
    

## Pushing your code to GitHub

Choď na [GitHub.com](https://www.github.com) a zaregistruj sa na nové bezplatné konto. (Ak si to už urobila v prípravke na workshop, tak to je skvelé!)

Potom vytvor nové úložisko a pomenuj ho "my-first-blog". Checkbox "inicializuj s README" nechaj nezaškrtnutý, voľbu .gitignore nechaj prázdnu (urobili sme to manuálne) a Licenciu nechaj ako None.

![](images/new_github_repo.png)

> **Poznámka** Názov `my-first-blog` je dôležitý -- mohla by si si vybrať aj niečo iné, ale bude sa to ďalej vyskytovať veľakrát a musela by si to zakaždým nahradiť. It's probably easier to stick with the name `my-first-blog`.

Na ďalšej obrazovke sa zobrazí klon URL tvojho repozitára. Vyber si verziu "HTTPS", skopírujte ju, a o chvíľu ju použijeme v termináli:

![](images/github_get_repo_url_screenshot.png)

Teraz musíme pripojiť Git repozitár v počítači k tomu na GitHube.

Napíš do konzoly nasledujúci príkaz (nahraď `<tvoje-github-meno>` svojím užívateľským menom na GitHube, ale bez lomených zátvoriek):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Zadaj svoje užívateľské meno a heslo na GitHube a malo by sa ti zobraziť niečo takého:

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': ola
    Password for 'https://ola@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Tvoj kód je na GitHube. Kľudne si to over! Zistíš, že sa nachádza vo vyberanej spoločnosti - [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) a mnoho iných skvelých open sourcových softvérových projektov uchováva svoj kód na GitHube. :)

# Vytvorenie nášho blogu na PythonAnywhere

## Sign up for a PythonAnywhere account

> **Poznámka** Možno si už účet na PythonAnywhere vytvorila počas inštalácie - ak áno, nemusíš to robiť znova.

{% include "/deploy/signup_pythonanywhere.md" %}

## Configuring our site on PythonAnywhere

Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Poznámka** PythonAnywhere je založený na Linuxe, takže ak si vo Windowse, konzola bude vyzerať trochu inak ako v tvojom počítači.

Nasadenie webovej aplikácie na PythonAnywhere znamená stiahnutie kódu z GitHubu, a nakonfigurovania PythonAnywhere aby ho rozpoznal a začal ho poskytovať ako webovú aplikáciu. Sú manuálne spôsoby ako to urobiť, ale PythonAnywhere poskytuje pomocný nástroj, ktorý všetko urobí za teba. Let's install it first:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Teraz spustíme pomocníka, ktorý automaticky nakonfiguruje našu aplikáciu z GitHubu. Zadaj nasledujúci príkaz do konzoly na PythonAnywhere (nezabudni použiť užívateľské meno z GitHubu namiesto `<tvoje-github-meno>`):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own PC
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. Dôležitá vec, ktorú si treba teraz všimnúť je, že tvoja databáza na PythonAnywhere je vlastne úplne iná a oddelená od databázy na tvojom PC - to znamená, že budeš mať iné príspevky a admin účet.

Kvôli tomu, presne ako sme to urobili na vlastnom počítači, musíme inicializovať admin účet pomocou `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

Môžeš tiež ísť do záložky "Files" a pozrieť sa pomocou zabudovaného PythonAnywhere prehliadača súborov.

## Si online!

Tvoja stránka by teraz mala by dostupná na verejnom internete. Preklikni sa do PythonAnywhere "Web" záložky, aby si na ňu získala link . Môžeš to vyzdieľať s kýmkoľvek :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## Tipy pre ladenie

Ak uvídíš chybu počas behu `pa_autoconfigure_django.py` skriptu, toto sú najčastejšie dôvody:

- Zabudla si vytvoriť PythonAnywhere API token.
- Urobila si chybu v tvojej GitHub URL
- Ak sa ti zobrazí chybové hlásenie, že *"Could not find your settings.py"*, pravdepodobne je to spôsobené tým, že sa ti nepodarilo pridať všetky súbory do Git a/alebo sa ich nepodarilo úspešne pridať na GitHub. Znovu sa pozri na Git odstavec vyššie

Ak pri pokuse navštíviť svoju stránku uvidíš chybu, prvým miestom, kde hľadať problém je **error log**. Odkaz naňho nájdeš na PythonAnywhere v [karte Web](https://www.pythonanywhere.com/web_app_setup/). Pozri, či tam nie sú nejaké chybové hlášky - tie najnovšie sú naspodku.

Môžeš skúsiť aj [Všeobecné tipy na ladenie na PythonAnywhere help stránke](http://help.pythonanywhere.com/pages/DebuggingImportError).

A nezabudni, tvoj tréner je tu na to, aby ti pomohol!

# Pozri sa na svoju stránku!

Hlavná stránka tvojej aplikácie by ťa mala vítať nápisom "It worked!", tak ako na tvojom počítači. Skús pridať `/admin/` na koniec adresy URL, a budeš presmerovaná na stránky administrácie. Prihlás sa s užívateľským menom a heslom a uvidíš, že môžeš pridávať nové príspevky (posty) na server.

Keď vytvoríš niekolľko príspevkov, môžeš sa vrátiť do tvojho lokálneho prostredia (nie PythonAnywhere). Na zmenách by si mala pracovať v lokálnom prostredí. To je štandardný pracovný postup pri vývoji webových aplikácií - urobíš zmeny lokálne, dáš tieto zmeny na GitHub a stiahneš zmeny na svoj webový server. To ti umožní pracovať a experimentovať bez pokazenia živej webovej stránky. Docela cool, nie?

*OHROMNE* sa potľapkaj po chrbte! Nasadenie serveru je jedna z najzradnejších častí vývoja web stránok a často zaberie ľuďom aj niekoľko dní, kým to spojazdnia. But you've got your site live, on the real Internet!