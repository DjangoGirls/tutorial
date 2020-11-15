# Obezbedite dostupnost!

> **Napomena** Sledeće poglavlje može ponekad da bude zahtevno. Istrajte i završite ga; dostupnost je važan deo procesa pravljenja sajtova. Ovo poglavlje je postavljeno u sredinu priručnika kako bi Vaš mentor mogao da Vam pomogne u vezi sa postavljanjem sajta na internet. To znači da i dalje možete da završite priručnik sami, ukoliko Vam ponestane vremena.

Do sada, Vaš sajt je bio dostupan isključivo na Vašem računaru. Sada ćete naučiti kako da ga dopremite na internet! Ovaj proces se odnosi na objavljivanje Vaše aplikacije na internetu, tako da ljudi konačno mogu da je vide. :)

Kao što ste do sada naučili, sajt mora da se nalazi na nekom serveru. Postoji dosta provajdera za servere koji su dostupni na internetu, a mi ćemo koristiti [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere je besplatan za male aplikacije koje nemaju puno posetilaca, tako da će to za sada biti dovoljno.

Drugi servis koji ćemo koristiti je [GitHub](https://www.github.com), koji će nam omogućiti hostovanje kodova. Postoje i drugi servisi, ali ovih dana skoro svi programeri imaju GitHub nalog, tako da ćete i Vi napraviti jedan!

Ta tri mesta će Vam biti važna. Vaš lokalni računar će biti mesto gde razvijate program i testirate ga. Kada budete bili zadovoljni izmenama, možete da postavite kopiju svog programa na GitHub. Vaš sajt će biti na PythonAnywhere i ažuriraćete ga preuzimanjem nove kopije koda sa GitHub-a.

# Git

> **Note** If you already did the installation steps, there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Pokretanje Git skladišta

Git prati izmene na određenom skupu fajlova koji se nalaze u nečemu što se naziva skladište za kodove (eng. code repository). Hajde da kreiramo jedno skladište za naš projekat. Otvorite konzolu i ukucajte sledeće komande, u `djangogirls` direktorijumu:

> **Napomena** Proverite trenutni radni direktorijum pomoću `pwd` (Mac OS/Linux) ili `cd` (Windows) komande, pre inicijalizovanja skladišta. Trebalo bi da se nalazite u `djangogirls` folderu.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Inicijalizovanje Git skladišta je nešto što treba da se uradi samo jednom tokom rada na projektu (nakon toga nećete više morati da unosite korisničko ime i email).

Git će pratiti sve izmene na svim fajlovima i folderima u ovom direktorijumu, ali postoje neki fajlovi za koje želimo da budu ignorisani. To se radi kreiranjem fajla `.gitignore` u osnovnom direktorijumu. Otvorite editor i kreirajte novi fajl sa sledećim sadržajem:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder
    static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

Sačuvajte to kao `.gitignore` u "djangogirls" folderu.

> **Napomena** Tačka na početku naziva fajla je važna! Ukoliko imate poteškoće tokom kreiranja (Apple-ovi računari ne vole kada kreirate fajlove koji počinju tačkom putem Finder-a) koristite "Save As" (sačuvajte kao) opciju u editoru, to bi trebalo da pomogne. I budite sigurni da niste dodali `.txt`, `.py` ili neku drugu ekstenziju u naziv - fajl će biti prepoznat od strane Git-a samo ako je ime `.gitignore`. Linux and MacOS treat files with a name that starts with `.` (such as `.gitignore`) as hidden and the normal `ls` command won't show these files. Instead use `ls -a` to see the `.gitignore` file.
> 
> **Napomena** Jedan od fajlova koje ste naveli u `.gitignore` je i `db.sqlite3`. Taj fajl je Vaša lokalna baza podataka, gde su sačuvani svi korisnici i postovi. Mi ćemo ovde pratiti standardnu praksu u veb programiranju, koja podrazumeva korišćenje odvojenih baza podataka za lokalni test sajt i za sajt na PythonAnywhere. PythonAnywhere baza podataka može da bude SQLite, kao i Vaša mašina na kojoj radite, ali se obično koristi MySQL koji može da podrži dosta više posetilaca sajta nego SQLite. Kako god, isključivanje SQLite baze podataka iz GitHub kopije znači da će svi postovi i korisnici koje ste kreirali do sada moći da budu dostupni isključivo lokalno i Vi ćete morati da kreirate nove tokom rada. Trebalo bi da posmatrate Vašu lokalnu bazu podataka kao poligon na kom možete da testirate različite stvari i da se ne plašite da ćete da izbrišete neki stvaran post sa Vašeg bloga.

Dobra ideja je da koristite `git status` komandu pre komande `git add` ili kada god niste sigurni u to šta je sve izmenjeno. To će pomoći da se spreče stvari kao što su dodavanje ili objavljivanje pogrešnih fajlova. Komanda `git status` vraća informacije o svim neispraćenim, izmenjenim ili organizovanim fajlovima, status ogranka (eng. branch status) i dr. Izlaz bi trebalo da izgleda ovako:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Datoteke bez praćenja:
     (koristite „git add <file> ...“ da biste uključili šta će biti objavljeno)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    ništa nije dodato za objavljivanje, ali prisutne su i datoteke bez praćenja (za praćenje koristite „git add“)
    

I na kraju, možemo da sačuvamo izmene pomoću sledećih komandi:

{% filename %}command-line{% endfilename %}

    $ git add .
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

![Odeljak "New Console" (nova konzola) na PythonAnywhere interfejsu, sa dugmetom za "bash"](images/pythonanywhere_bash_console.png)

> **Napomena** PythonAnywhere se zasniva na Linux-u, tako da će konzola izgledati drugačije od one na Vašem računaru ukoliko koristite Windows.

Dopremanje veb aplikacije na PythonAnywhere uključuje povlačenje koda sa GitHub-a i zatim konfigurisanje okruženja kako bi kod bio prepoznat kao veb aplikacija. Postoje načini na koje to može ručno da se uradi, ali PythonAnywhere obezbeđuje pomoćni alat koji će to sve uraditi umesto Vas. Hajde da ga prvo instaliramo:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Ovo bi trebalo da ispiše neke stvari kao `Collecting pythonanywhere` i da se eventualno završi natpisom `Successfully installed (...) pythonanywhere- (...)`.

Sada treba da pokrenemo alat koji će nam pomoći da automatski konfigurišemo našu aplikaciju sa GitHub-a. Ukucajte sledeće u konzolu na PythonAnywhere (ne zaboravite da upotrebite Vaše GitHub korisničko ime umesto `<your-github-username>`, tako da se URL poklapa sa URL-om za kloniranje sa GitHub-a):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.6 https://github.com/<your-github-username>/my-first-blog.git
    

Dok posmatrate kako se to izvršava, moći ćete da vidite šta se dešava:

- Preuzimanje Vašeg koda sa GitHub-a
- Kreiranje virtuelnog okruženja na PythonAnywhere, koje je kao ono na Vašem računaru
- Ažuriranje fajla sa podešavanjima
- Pokretanje baze podataka na PythonAnywhere korišćenjem `manage.py migrate` komande
- Podešavanje statičkih fajlova (pričaćemo više o njima kasnije)
- Konfigurisanje PythonAnywhere da radi sa Vašom aplikacijom putem API-ja

Na PythonAnywhere su svi ovi koraci automatizovani i isti su kao i svi koraci kroz koje bi trebalo da prođete ako koristite nekog drugog server provajdera.

Glavna stvar koju treba da primetite je da je Vaša baza podataka na PythonAnywhere u potpunosti razdvojena od baze podataka na Vašem računaru, tako da može da ima drugačije naloge za postovanje i za administratore. Kao rezultat, trebalo bi da inicijalizujemo admin nalog pomoću `createsuperuser`, kao što smo to uradili na Vašem računaru. PythonAnywhere je automatski pokrenuo virtuelno okruženje za Vas, tako da je sve što treba da uradite pokretanje sledećih komandi:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Unesite podatke o administratoru. Najbolje je da koristite iste one kao na Vašem računaru, kako bi se izbegla bilo kakva zabuna, osim ako ne želite da šifru na PythonAnywhere dodatno osigurate.

Sada, ukoliko to želite, možete da pogledate Vaš kod na PythonAnywhere korišćenjem naredbe `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

Možete takođe da odete na stranicu "Files" (fajlovi) i da je pretražujete koristeći ugrađeni PythonAnywhere pretraživač. (Sa stranice sa konzolom možete da odete do ostalih PythonAnywhere stranica iz menija u gornjem desnom uglu). Kada se jednom nađete na nekoj od stranica, blizu vrha možete da pronađete linkove do ostalih)

## Oživeli ste projekat!

Vaš sajt bi trebalo da ide sada uživo i javno na internetu! Prođite kroz PythonAnywhere "Web" stranicu da nađete link koji možete da podelite s kim god želite :)

> **Napomena** Ovo je priručnik za početnike i zbog toga smo tokom dopremanja ovog sajta primenili nekoliko prečica koje nisu baš idealne, gledano sa stanovišta sigurnosti. Ako i kada odlučite da nadogradite na ovaj projekat ili započnete novi projekat, trebalo bi da pogledate [ Kontrolni spisak za postavljanje u Djangu ](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) za neke savete o obezbeđivanju web lokacije.

## Saveti za otklanjanje grešaka

Ukoliko vidite grešku tokom pokretanja skripte `pa_autoconfigure_django.py`, evo nekoliko uobičajenih razloga:

- Možda ste zaboravili da kreirate PythonAnywhere API token.
- Možda ste pogrešili u GitHub URL-u
- Ukoliko vidite poruku *"Could not find your settings.py"*, verovatno niste uspeli da dodate sve Vaše fajlove na Git i/ili ih niste postavili uspešno na GitHub. Pogledajte još jednom prethodni deo koji se odnosi na Git
- Ako ste se prethodno prijavili za PythonAnywhere nalog i imali ste grešku sa collectstatic, verovatno imate stariju verziju SQLite (npr. 3.8.2) za svoj nalog. U tom slučaju se prijavite za novi nalog i isprobajte naredbe iz gornjeg odeljka PythonAnywhere.

Ako dobijate poruku o grešci kada pokušate da odete na sajt, prvo mesto na kom bi trebalo da potražite više informacija o otklanjanju greške je **evidencija o greškama** (eng. error log). Možete da pronađete link do te evidencije na PythonAnywhere ["Web" stranici](https://www.pythonanywhere.com/web_app_setup/). Pogledajte da li se tu nalaze bilo kakve poruke o greškama; one najnovije se nalaze na dnu.

Takođe postoje i neki [opšti saveti o uklanjanju grešaka na PythonAnywhere sajtu za pomoć](http://help.pythonanywhere.com/pages/DebuggingImportError).

I zapamtite, Vaš instruktor je tu da Vam pomogne!

# Pogledajte svoj sajt!

Na podrazumevanoj stranici za Vaš sajt bi trebalo da piše "It worked!" (Uspeh!), kao i na Vašem lokalnom računaru. Pokušajte da dodate nastavak `/admin/` na kraju URL-a i to će vas odvesti na sajt za administratore. Ulogujte se sa korisničkim imenom i šifrom i videćete da možete da dodate nove postove na server, samo zapamtite - postovi sa Vaše lokalne baze podataka za testiranje se ne šalju na Vaš blog.

Jednom kada kreirate nekoliko postova, možete da se vratite na Vaša lokalna podešavanja (ne na PythonAnywhere). Odatle bi trebalo da radite na lokalnim podešavanjima, ukoliko biste želeli da napravite neku izmenu. To je uobičajeni tok rada u veb programiranju - napravite izmene lokalno, postavite to na GitHub i zatim ih pošaljete dalje na vaš veb server. To omogućava da radite i eksperimentišete bez obustavljanja rada Vašeg sajta. Prilično kul, zar ne?

Potapšite sebe po ramenu, jer to i zaslužujete! Dopremanje na server je jedna od težih stvari u veb razvoju i često je potrebno ljudima po nekoliko dana da to savladaju. Ali Vi ste uspeli da pokrenete svoj sajt uživo na internetu!