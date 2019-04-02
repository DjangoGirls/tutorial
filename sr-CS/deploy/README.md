# Obezbedite dostupnost!

> **Napomena** Sledeće poglavlje može ponekad da bude zahtevno. Istrajte i završite ga; dostupnost je važan deo procesa pravljenja sajtova. Ovo poglavlje je postavljeno u sredinu priručnika kako bi Vaš mentor mogao da Vam pomogne u vezi sa postavljanjem sajta na internet. To znači da i dalje možete da završite priručnik sami, ukoliko Vam ponestane vremena.

Do sada, Vaš sajt je bio dostupan isključivo na Vašem računaru. Sada ćete naučiti kako da ga dopremite na internet! Ovaj proces se odnosi na objavljivanje Vaše aplikacije na internetu, tako da ljudi konačno mogu da je vide. :)

Kao što ste do sada naučili, sajt mora da se nalazi na nekom serveru. Postoji dosta provajdera za servere koji su dostupni na internetu, a mi ćemo koristiti [PythonAnywhere](https://www.pythonanywhere.com/). On je besplatan za male aplikacije koje nemaju puno posetilaca, tako da će to za sada biti dovoljno.

Drugi servis koji ćemo koristiti je [GitHub](https://www.github.com), koji će nam omogućiti hostovanje kodova. Postoje i drugi servisi, ali ovih dana skoro svi programeri imaju GitHub nalog, tako da ćete i Vi napraviti jedan!

Ta tri mesta će Vam biti važna. Vaš lokalni računar će biti mesto gde razvijate program i testirate ga. Kada budete bili zadovoljni izmenama, možete da postavite kopiju svog programa na GitHub. Vaš sajt će biti na PythonAnywhere i ažuriraćete ga preuzimanjem nove kopije koda sa GitHub-a.

# Git

> **Napomena** Ako ste već prošli kroz sve instalacione korake, nema potrebe da ovo radite ponovo - možete da odmah pređete na sledeći deo i da počnete da pravite svoje Git skladište.

{% include "/deploy/install_git.md" %}

## Pokretanje Git skladišta

Git prati izmene na određenom skupu fajlova koji se nalaze u nečemu što se naziva skladište za kodove (eng. code repository). Hajde da kreiramo jedno skladište za naš projekat. Otvorite konzolu i ukucajte sledeće komande, u `djangogirls` direktorijumu:

> **Napomena** Proverite trenutni radni direktorijum pomoću `pwd` (Mac OS/Linux) ili `cd` (Windows) komande, pre inicijalizovanja skladišta. Trebalo bi da se nalazite u `djangogirls` folderu.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Inicijalizovanje Git skladišta je nešto što treba da se uradi samo jednom tokom jednog projekta (nakon toga nećete više morati da unosite korisničko ime i email).

Git će pratiti sve izmene na svim fajlovima i folderima u ovom direktorijumu, ali postoje neki fajlovi za koje želimo da budu ignorisani. To se radi kreiranjem fajla `.gitignore` u osnovnom direktorijumu. Otvorite editor i kreirajte novi fajl sa sledećim sadržajem:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

Sačuvajte to kao `.gitignore` u "djangogirls" folderu.

> **Napomena** Tačka na početku naziva fajla je važna! Ukoliko imate poteškoće tokom kreiranja (Apple-ovi računari ne vole kada kreirate fajlove koji počinju tačkom putem Finder-a) koristite "Save As" (sačuvajte kao) opciju u editoru, to bi trebalo da pomogne. I budite sigurni da niste dodali `.txt`, `.py` ili neku drugu ekstenziju u naziv - fajl će biti prepoznat od strane Git-a samo ako je ime `.gitignore`.
> 
> **Napomena** Jedan od fajlova koje ste naveli u `.gitignore` je i `db.sqlite3`. Taj fajl je Vaša lokalna baza podataka, gde su sačuvani svi korisnici i postovi. Mi ćemo ovde pratiti standardnu praksu u veb programiranju, koja podrazumeva korišćenje odvojenih baza podataka za lokalni test sajt i za sajt na PythonAnywhere. PythonAnywhere baza podataka može da bude SQLite, kao i Vaša mašina na kojoj radite, ali se obično koristi MySQL koji može da podrži dosta više posetilaca sajta nego SQLite. Kako god, isključivanje SQLite baze podataka iz GitHub kopije znači da će svi postovi i korisnici koje ste kreirali do sada moći da budu dostupni isključivo lokalno i Vi ćete morati da kreirate nove tokom rada. Trebalo bi da posmatrate Vašu lokalnu bazu podataka kao poligon na kom možete da testirate različite stvari i da se ne plašite da ćete da izbrišete neki stvaran post sa Vašeg bloga.

Dobra ideja je da koristite `git status` komandu pre komande `git add` ili kada god niste sigurni u to šta je sve izmenjeno. To će pomoći da se spreče stvari kao što su dodavanje ili objavljivanje pogrešnih fajlova. Komanda `git status` vraća informacije o svim neispraćenim, izmenjenim ili organizovanim fajlovima, status ogranka (eng. branch status) i dr. Izlaz bi trebalo da izgleda ovako:

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
    

I na kraju, možemo da sačuvamo izmene pomoću sledećih komandi:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Objavljivanje koda na GitHub-u

Idite na [GitHub.com](https://www.github.com) i napravite nov, besplatan nalog. (Ako ste to već odradili tokom priprema za ovu radionicu, utoliko bolje!) Postarajte se da zapamtite Vašu šifru (dodajte je u svoj organizator za šifre (eng. password manager) ukoliko ga koristite).

Zatim, kreirajte novo skladište i nazovite ga "my-first-blog". Ostavite "initialize with a README" polje prazno, takođe ostavite .gitignore opciju nepopunjenu (to smo već uradili ručno) i postavite licencu kao "None".

![](images/new_github_repo.png)

> **Napomena** Naziv `my-first-blog` je važan - možete da izaberete neki drugi naziv, ali biste u tom slučaju kasnije morali svaki put da ga menjate jer je tokom sledećih instrukcija svuda korišćen navedeni naziv. Verovatno je lakše ostaviti ga kao `my-first-blog`.

Na sledećem prikazu, videćete URL za kloniranje Vašeg skladišta, koji ćete koristiti u nekim od sledećih komandi:

![](images/github_get_repo_url_screenshot.png)

Sada treba da povežemo Git skladište na Vašem računaru sa onim na GitHub-u.

Ukucajte sledeće komande u konzolu (zamenite `<your-github-username>` sa korisničkim imenom koje ste uneli kada ste kreirali GitHub nalog, ali bez uglastih zagrada - URL bi trebalo da se poklapa sa URL-om za kloniranje koji ste videli):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Kada objavljujete na GitHubu, moraćete da unesete korisničko ime i šifru (ili u komandnoj liniji ili u pop-up prozoru) i nakon unošenja podataka ćete videti nešto što bi trebalo ovako da izgleda:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Vaš kod je sada na GitHub-u. Pogledajte! Naćićete ga u dobrom društvu - [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) i mnogi drugi dobri projekti otvorenog koda takođe drže svoj kod na GitHub-u. :)

# Podešavanje bloga na PythonAnywhere

## Napravite nalog na PythonAnywhere

> **Napomena** možda ste već kreirali nalog na PythonAnywhere ranije, tokom instalacije - ukoliko je to slučaj, nema potreba da ga kreirate ponovo.

{% include "/deploy/signup_pythonanywhere.md" %}

## Podešavanje sajta na PythonAnywhere

Vratite se natrag na glavnu [PythonAnywhere kontrolnu tablu](https://www.pythonanywhere.com/) klikom na logo i izaberite opciju da pokrenete "Bash" konzolu - to je PythonAnywhere verzija komandne linije, koja izgleda kao ona na Vašem računaru.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Napomena** PythonAnywhere se zasniva na Linux-u, tako da će konzola izgledati drugačije od one na Vašem računaru ukoliko koristite Windows.

Dopremanje veb aplikacije na PythonAnywhere uključuje povlačenje koda sa GitHub-a i zatim konfigurisanje okruženja kako bi kod bio prepoznat kao veb aplikacija. Postoje načini na koje to može ručno da se uradi, ali PythonAnywhere obezbeđuje pomoćni alat koji će to sve uraditi umesto Vas. Hajde da ga prvo instaliramo:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own computer
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.

The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own computer, so it can have different posts and admin accounts. As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!