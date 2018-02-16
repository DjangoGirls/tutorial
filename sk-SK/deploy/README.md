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
    
    
    # Setting up our blog on PythonAnywhere
    
    ## Sign up for a PythonAnywhere account
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Configuring our site on PythonAnywhere
    
    Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application.  There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pip3.6 install --user pythonanywhere

    <br />That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.
    
    Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git

    <br />As you watch that running, you'll be able to see what it's doing:
    
    - Downloading your code from GitHub
    - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
    - Updating your settings file with some deployment settings
    - Setting up a database on PythonAnywhere using the `manage.py migrate` command
    - Setting up your static files (we'll learn about these later)
    - And configuring PythonAnywhere to serve your web app via its API
    
    On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.  The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
    
    As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ python manage.py createsuperuser

    <br />Type in the details for your admin user.  Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
    
    Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!