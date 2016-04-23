# Nasazení!

> **Poznámka:** Projití následující kapitoly, může být někdy trochu těžké. Vydrž a dokonči to; nasazení je důležitou součástí procesu vývoje webových stránek. Tato kapitola je umístěna uprostřed kurzu, aby ti tvůj kouč mohl pomoci s mírně složitějším procesem nasazení tvého webu online. To znamená, že stále můžeš dokončit kurz později sama, pokud ti dojde čas.

Až dosud byly tvoje webové stránky k dispozici pouze ve tvém počítači, nyní se naučíš je nasadit! Nasazení je proces publikování aplikace na internetu, takže lidé konečně mohou najít a vidět tvou webovou aplikaci :).

Jak jsi se dozvěděla, webové stránky musí být umístěny na serveru. Na internetu existuje mnoho poskytovatelů serverů. My budeme používat jednoho, který má relativně jednoduchý proces nasazení: [PythonAnywhere][1]. PythonAnywhere je zdarma pro malé aplikace, které nemají příliš mnoho návštěvníků, takže to pro tebe bude teď stačit.

 [1]: http://pythonanywhere.com/

Další externí službu, kterou budeme používa je [GitHub][2], což je hostingová služba pro zdrojové kódy. Na interntu existují i jiné služby, ale téměř všichni programátoři mají účet na GitHubu nyní ho budeš mít také!

 [2]: http://www.github.com

Budeme používat GitHub jako odrazový můstek k přesunu našeho kódu do a z PythonAnywhere.

# Git

Git je "systém pro správu verzí" používaný spoustou programátorů. Tento software může sledovat změny v souborech v průběhu času tak, že konkrétní verze můžeš později znovu zobrazit. Trochu jako funkce "sledování změn" v aplikaci Microsoft Word, ale mnohem silnější.

## Instalace Git

> **Poznámka:** Pokud jsi již prošla instalační kroky, není třeba se k tomu vracet - můžeš přeskočit k další části a začít vytvářet Git repozitář.

{% include "/deploy/install_git.md" %}

## Spuštění Git repositáře

Git sleduje změny v sadě souborů v takzvaném úložišti kódu/repository (nebo zkráceně "repo"). Založme si jeden pro náš projekt. Otevři konzoli a v `djangogirls` adresáři spusť tyto příkazy:

> **Poznámka:** Zkontroluj si svůj aktuální pracovní adresář pomocí `pwd` (OS x/Linux) nebo příkazem `cd` (Windows) před inicializací úložiště. Měla bys být ve složce `djangogirls`.

```
    $ git init
     Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
```    

Inicializace úložiště git je něco, co musíme udělat jednou za projekt (a nebudeš muset znovu zadávat uživatelské jméno a e-mailovou adresu).

Git bude sledovat změny souborů a složek v tomto adresáři, ale jsou tam některé soubory, které chceme ignorovat. Uděláme to tak, že vytvoříš soubor s názvem `.gitignore` v základním adresáři. Otevři editor a vytvoř nový soubor s následujícím obsahem:

```
    *.pyc
    __pycache__
     myvenv
     db.sqlite3
    .DS_Store
```    

A ulož ho jako `.gitignore` ve složce nejvyšší úrovně "djangogirls".

> **Poznámka:** Tečka na začátku názvu souboru je důležitá! Pokud budeš mít jakékoliv potíže se vytvořením (například Macu se nelíbí vytvářet soubory, které začínají tečkou přes Finder), pak použij funkci "Uložit jako" v editoru, což je neprůstřelné.

Je vhodné použít příkaz `git status` před použitím příkazu `git add` nebo vždy, když si nejste jisti, co se změnilo. To pomůže předejít jakýmkoliv překvapením, například přidání nesprávných souborů. Příkaz `git status` vrátí informace o všech souborech nesledovaných (untracked), upravených (modified) a připravených ke commitu (staged), stav větve a mnoho dalšího. Výstup by měl být podobný tomuto:

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

A nakonec uložíme naše změny. Přejdi do konzole a spusť tyto příkazy:

```
    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
    [...]
    13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
    [...]
    create mode 100644 mysite/wsgi.py
```  

## Přenesení našeho kódu na GitHub

Přejdi na [GitHub.com][2] a zaregistruj si zdarma nový uživatelský účet. (Pokud jsi to již dříve ve workshopu udělala, tak to je skvělé!)

Potom vytvoř nové úložiště, dej mu název "my-first-blog". Ponech zaškrtávací políčko "initialise with a README" nezašrkrtlé, ponechej prázdnou .gitignore možnost (to už jsme udělali ručně) a ponech licenci jako None.

![][3]

 [3]: images/new_github_repo.png

> **Poznámka:** Název `my-first-blog` je důležitý – mohla by si vybrat něco jiného, ale použijeme ho ještě mnohokrát později a musela bys ho pokaždé nahrazovat. Tak je zřejmě snazší se držet názvu `my-first-blog`.

Na další obrazovce se zobrazí clon URL tvého repo. Zvol verzi "HTTPS", zkopíruj jí, a za chvilku ji použijeme v terminálu:

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Teď potřebujeme připojit úložiště Git na tvém počítači s úložištěm na GitHub.

Zadej následující příkaz do konzole (nahraď `< your-github-username >` uživatelským jménem, které jsi zadala, když jsi vytvořila svůj účet na GitHub, ale bez ostrých závorek):

```
    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
```    

Zadej své uživatelské jméno pro GitHub a heslo a měla bys vidět něco takového:

```
    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git  
    * [new branch] master -> master
    Branch master set up to track remote branch master from origin.
```    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Tvůj kód je nyní na GitHubu. Můžeš jít a mrknout se na to! Zjistíš, že je v dobré společnosti - [Django][5], [Django girls tutorial][6] a mnoha dalších velkých open source software projektů, které také hostí svůj kód na GitHubu :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Vytvoření našeho blogu na PythonAnywhere

> **Poznámka:** Možná, že jsi vytvořila účet PythonAnywhere již dříve, během instalačních kroků - pokud ano, nemusíš to nyní dělat znovu.

{% include "/deploy/signup_pythonanywhere.md" %}

## Natáhnutí našeho kódu na PythonAnywhere

Když jsi se zaregistrovala na PythonAnywhere, budeš přesměrována na dashboard nebo na stránku "Konzole". Zvol možnost spustit konzoli "Bash" – je to PythonAnywhere verze konzole, stejná jako na tvém počítači.

> **Poznámka:** PythonAnywhere je založen na Linuxu, takže pokud jsi na Windows, konzole bude vypadat trochu jinak, než ta, která je na tvém počítači.

Pojďme natáhnout náš kód z GitHubu na PythonAnywhere vytvořením "klonu" našeho repo. Zadej následující příkaz do konzole na PythonAnywhere (nezapomeň používat GitHub uživatelské jméno namísto `<your-github-username>`):

```
    $ git clone https://github.com/<your-github-username>/my-first-blog.git
```    

Tento příkaz nahraje kopii tvého kódu, na PythonAnywhere. Podívej se zadáním `tree my-first-blog`:

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

### Vytvoření virtualenv na PythonAnywhere

Stejně jako na tvém počítači, můžeš vytvořit virtualenv na PythonAnywhere. V Bash konzoli zadej postupně následující příkazy:

```
    $ cd my-first-blog

    $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.

    $ source myvenv/bin/activate

    (mvenv) $ pip install django whitenoise
    Collecting django
    [...]
    Successfully installed django-1.8.2 whitenoise-2.0
```    

> **Poznámka:** Krok `pip install` může trvat několik minut. Trpělivost, trpělivost! Ale pokud to trvá déle než 5 minut, něco není v pořádku. Zeptej se svého kouče.

<!--TODO: think about using requirements.txt instead of pip install.-->

### Shromažďování statických souborů.

Byla jsi zvědavá, co bylo to "whitenoise" vlastně zač? Je to nástroj pro obsluhu takzvaných "statických souborů". Statické soubory jsou soubory, které se pravidelně nemění nebo nespouštějí programový kód, například soubory HTML nebo CSS. Na serverech fungují odlišně než na tvém osobním počítači a proto potřebujeme nástroj jako "whitenoise" k jejich obsloužení.

O statických souborech zjistíme trochu více později v tomto kurzu, až budeme upravovat CSS pro naše stránky.

Nyní jen musíme spustit další příkaz na serveru s názvem `collectstatic`. Ten řekne Djangu, aby posbíral všechny statické soubory, které potřebuje na serveru. V současnosti jsou to hlavně soubory, které upravují vzhled admin stránky.

```
    (mvenv) $ python manage.py collectstatic

    You have requested to collect static files at the destination
    location as specified in your settings:
         /home/edith/my-first-blog/static

    This will overwrite existing files!
    Are you sure you want to do this?

    Type 'yes' to continue, or 'no' to cancel: yes
```    

Zadej "Ano" a pokračujeme! Také zbožňuješ, když ti počítač začne vypisovat ty dlouhé stránky kódu? Já jsem to vždy doprovázela tichými zvuky. Brp, brp, brp...

```
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js' Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js' [...] Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css' Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css' 62 static files copied to '/home/edith/my-first-blog/static'.
```    

### Vytvoření databáze na PythonAnywhere

Zde je další věc, která se liší mezi tvým počítačem a serverem: server používá jinou databázi. Takže uživatelské účty a příspěvky mohou být jiné, na serveru a na tvém počítači.

Můžeme inicializovat databázi na serveru, stejně jako jsi to udělala v počítači, `migrate` a `createsuperuser`:

```
    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
       Applying sessions.0001_initial... OK


    (mvenv) $ python manage.py createsuperuser
```    

## Publikování našeho blogu jako webové aplikace

Nyní je náš kód na PythonAnywhere a náš virtualenv je připraven, statické soubory jsou shromážděny a databáze inicializována. Jsme připraveni zveřejnit blog jako webovou aplikaci!

Dostaň se zpět na dashboard PythonAnywhere kliknutím na logo a poté, klikni na kartu **Web**. Nakonec klikni na **Add a new web app**.

Po potvrzení tvého názvu domény, zvol **manual configuration** (NB *není* "Django" volba) v dialogovém okně. Dále zvol **Python 3.4** a klepni na tlačítko Next pro dokončení průvodce.

> **Poznámka:** Ujisti se, že volíš možnost "Manual configuration", nikoliv "Django". Jsme příliš cool pro výchozí nastavení PythonAnywhere Django ;-)

### Nastavení virtualenv

Budeš přesměrována na PythonAnywhere konfigurační obrazovku pro tvou webovou aplikaci, sem budeš muset jít pokaždé, když budeš chtít provést změny aplikace na serveru.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

V části "Virtualenv" klepni na červený text, který říká "Enter the path to a virtualenv" a zadej: `/home/ <your-username>/my-first-blog/myvenv/`. Klikni na modré zaškrtávací políčko a tím uložit cestu před pokračováním.

> **Poznámka:** Nahraď své vlastní uživatelské jméno podle potřeby. Pokud uděláš chybu, PythonAnywhere Ti zobrazí malé varování.

### Konfigurace souboru WSGI

Django používá "WSGI protokol", standard pro obsluhu webových stránek pomocí Pythonu, který PythonAnywhere podporuje. Aby PythonAnywhere poznal a mohl používat náš Django blog upravme WSGI konfigurační soubor.

Klikni na odkaz "WSGI configuration file" (v sekci "Code" v horní části stránky – bude pojmenována nějak takto `/var/www/<your-username>_pythonanywhere_com_wsgi.py`), a budeš přesměrována do editoru.

Odstraň veškerý obsah a nahraď jej upraveným následujícím kódem:

```python
    import os
    import sys

    path = '/home/<your-username>/my-first-blog' # use your own username here
    if path not in sys.path:
         sys.path.append(path)

    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

    from django.core.wsgi import get_wsgi_application
    from whitenoise.django import DjangoWhiteNoise
    application = DjangoWhiteNoise(get_wsgi_application())
```    

> **Poznámka:** Nezapomeň nahradit své vlastní uživatelské jméno, za `<your-username>`

Úkolem tohoto souboru je říct PythonAnywhere, kde je naše webová aplikace a jaký je název souboru nastavení Djanga. Také nastavuje nástroj pro statické soubory "whitenoise".

Klikni na **Save** a přejdi zpět na kartu **Web**.

Zvládli jsme to! Klikni na velké zelené tlačítko **Reload** a budeš mít možnost zobrazit svou aplikaci. Odkaz na to najdeš v horní části stránky.

## Ladící tipy

Pokud se ti zobrazí chyba při pokusu navštívit web, první místo kam se podívat na nějaké informace o ladění je v **error log**. Odkaz na něj najdeš na PythonAnywhere v [kartě Web][8]. Zkontroluj jestli tam nejsou nějaké chybové zprávy; nejnovější záznamy jsou na konci. Mezi běžné problémy patří:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Často zapomínané kroky jsou ty, které jsme dělali v konzoly: vytvoření virtualenv, aktivace, instalace Django, spuštění collectstatic, přenesení databáze.

*   Chyba k cestě virtualenv na kartě Web – bude obvykle označená malou červenou zprávou na stejném místě.

*   Chyba v konfiguračním souboru WSGI – máš cestu do složky my-first-blog v pořádku?

*   Vybrala jsi stejnou verzi Pythonu pro svůj virtualenv stejně jako pro svoji webovou aplikaci? Obe verze by měly být 3.4.

*   Existují některé [obecné tipy ladění na PythonAnywhere wiki][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

A pamatuj si, že tvůj coach je tady, aby ti pomohl!

# Jsme online!

Výchozí stránka tvé webové aplikace by měla ukázat "Welcome to Django", stejně jako to dělá na tvém počítači. Zkus přidat `/admin/` na konec adresy URL, a budeš přesměrována na admin stránku. Přihlas se pomocí uživatelského jména a hesla, a uvidíš, že můžeš přidávat nové příspěvky na server.

Poplácej sama sebe *ohromně* po zádech! Nasazení serveru je jednou z nejsložitější částí vývoje webových aplikací a trvá lidem často i několik dní, než je funkční. Ale ty máš své stránky online na Internetu, právě teď!
