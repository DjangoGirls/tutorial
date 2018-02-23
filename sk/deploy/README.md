# Nasadenie!

> **Poznámka** Občas bude možno trochu ťažké prehrýzť sa touto kapitolou. Vydrž a dokonči ju, nasadenie je dôležitou časťou vývoja webových stránok. Táto kapitola je umiestnená uprostred tutoriálu, aby ti mentor/ka mohol/a pomôcť s trochu náročnejšími časťami procesu spúšťania tvojej webovej stránky online. To znamená, že môžeš dokončiť tutoriál aj sama, ak ti nevyjde čas.

Až do teraz, tvoja webová stránka bola dostupná len v počítači. Teraz sa naučíš, ako ju nasadiť! Nasadenie je proces publikovania aplikácie na internete, takže ju ľudia konečne budú môcť vidieť. :)

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
    ```
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
    

Username for 'https://github.com': ola Password for 'https://ola@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/ola/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Tvoj kód je na Githube. Kľudne si to over!  Zistíš, že sa nachádza vo vyberanej spoločnosti - [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), a mnoho iných skvelých open source-ových softvérových projektov ukladá svoj kód na GitHube. :)
    
    
    # Umiestnenie nášho blogu na PythonAnywhere
    
    ## Vztvor si PythonAnywhere účet
    
    &gt; **Poznámka** Možno si si už vytvorila účet na PythonAnzwhere počas inštalácie - ak áno, tak nemusíš to robiť znova.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Nastavenie našej stránky na PythonAnywhere
    
    Choď do hlavneho [PythonAnywhere panelu](https://www.pythonanywhere.com/) kliknutím na logo a klikni na spustenie "Bash" konzoly – to je PythonAnywhere verzia príkazového riadku, presne ako ten na tvojom počítači.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
    
    &gt; **Poznámka** PythonAnywhere ja založené na Linuxe, takže ak používaš Windows, konzola sa bude líšiť od tej na tvojom počítači.
    
    Nasadenie webovej aplikácie na PythonAnywhere znamená stiahnutie kódu z GitHubu, a nakonfigurovania PythonAnywhere aby ho rozpoznal a začal ho poskytovať ako webovú aplikáciu.  Sú manuálne spôsoby ako to urobiť, ale PythonAnywhere poskytuje pomocný nástroj, ktorý všetko urobí za teba. Nainštalujme ho najprv:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pip3.6 install --user pythonanywhere

    <br />Malo by to zobraziť niečo ako `Collecting pythonanywhere`, a ukončiť riadkom ktorý hovorí `Successfully installed (...) pythonanywhere- (...)`.
    
    Teraz spustíme pomocníka, ktorý automaticky nakonfiguruje našu aplikáciu z GitHubu. Zadaj nasledujúci príkaz do konzoly na PythonAnywhere (nezabudni použiť užívateľské meno z GitHubu namiesto &lt;your-github-username&gt;):
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git

    <br />Kým sa pozerá ako to beží, uvidíš čo robí:
    
    - Sťahuje tvoj kód z GitHubu
    - Vytvára virtualenv na PythonAnywhere, presne ako ten na tvojom PC
    - Nastaví v sittings súbore niektoré nastavenia pre nasadenie
    - Nastaví databázu na PythonAnywhere pomocou `manage.py migrate` príkazu
    - Nastaví tvoje statické súbory (o nich si povieme neskôr)
    - A nastaví PythonAnywhere aby ukazovalo tvoju webovú aplikáciu cez svoje API
    
    Na PythonAnywhere všetky tie kroky sú automatizované, ale sú to tie isté kroky, ktoré by si musela urobiť u hociktorého poskytovateľa serverov.  Dôležitá vec, ktorú si treba teraz všimnúť je, že tvoja databáza na PYthonAnywhere je vlastne úplne iná a oddelená od databázy ba tvojom PC - to znamená, že budeš mať iné príspevky a admin účet.
    
    Kvôli tomu, presne ako sme to urobili na vlastnom počítači, musíme inicializovať admin účet pomocou `createsuperuser`. PythonAnywhere automaticky aktivoval tvoj virtualenv, takže celé čo potrebuješ urobiť, je spustiť:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ python manage.py createsuperuser

    <br />Zadaj detaily pre admin uživateľa.  Najlepšie je použiť tie isté, ako používaš na vlastnom počítači a predísť tak zmätku, pokiaľ nechceš lepším heslom zabezpečiť PythonAnywhere.
    
    Teraz, ak chceš, možeš sa pozrieť na sovj kód na PythonAnywhere pomocou`ls`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```

Môžeš tiež ísť do záložky "Files" a pozrieť sa pomocou vbudovaného PythonAnywhere prehliadača súborov.

## Si online!

Tvoja stránka by teraz mala by dostupná na verejnom internete. Preklikni sa do PythonAnywhere "Web" záložky aby si získala link na ňu. Môžeš to vyzielať s kýmkoľvek :)

## Tipy pre ladenie

Ak uviídíš chybu počas behu `pa_autoconfigure_django.py` skriptu, toto sú najčastejšie dôvody:

- Zabuudla si vytvoriť PythonAnywhere API token.
- Urobila si chybu v tvojej GitHub URL
- Ak sa ti zobrazí chybové hlásenie, že *"Could not find your settings.py"*, pravdepodobne je to spôsobené tým že sa ti nepodarilo pridať všetky súbory do Git a/alebo sa ich nepodarilo úspešne pridať na GitHub. Znovu sa pozri na Git odstavec vyššie

Ak pri pokuse navštíviť svoju stránku uvidíš chybu, prvým miestom, kde hľadať problém je **error log**. Odkaz naňho nájdeš na PythonAnywhere v [záložke Web](https://www.pythonanywhere.com/web_app_setup/). Pozri, či tam nie sú nejaké chybové hlášky - tie najnovšie sú dolu.

Môžeš skúsiť aj [Všeobecné tipy na ladenie na PythonAnywhere help stránke](http://help.pythonanywhere.com/pages/DebuggingImportError).

A nezabudni, tvoj mentor je tu na to, aby ti pomohol!

# Pozri sa na svoju stránku!

Hlavná stránka tvojej aplikácie by ťa mala vítať nápisom "It worked!", tak ako na tvojom počítači. Skús pridať `/admin/` na koniec adresy URL, a budeš presmerovaná na stránky administrácie. Prihlás sa s užívateľským menom a heslom a uvidíš, že môžeš pridávať nové príspevky (posty) na server.

Keď vytvoríš niekolľko príspevkov, môžeš sa vrátiť do tvojho lokálneho prostredia (nie PythonAnywhere). Na zmenách by si mala pracovať v lokálnom prostredí. To je štandardný pracovný postup pri vývoji webových aplikácií - urobíš zmeny lokálne, dáš tieto zmeny na GitHub a stiahneš zmeny na svoj webový server. To ti umožní pracovať a experimentovať bez pokazenia živej webovej stránky. Docela cool, nie?

Môžeš si *pogratulovať*! Nasadenie serveru je jedna z najzradnejších častí vývoja web stránok a často zaberie ľuďom aj niekoľko dní, kým to spojazdnia. Ale ty už máš teraz svoju stránku online, na skutočnom internete!