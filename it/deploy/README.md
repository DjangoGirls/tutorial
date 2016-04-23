# Deploy!

> **Nota** Il seguente capitolo è abbastanza difficile da capire fino in fondo. Non mollare e cerca di portarlo a termine; deployment (termine abbastanza complicato da tradurre, ma indica tutto ciò che tu rendi LIVE, accessibile sul web e non più solo dal tuo computer) è una parte importante nel processo di costruzione di un sito web. Questo capitolo è inserito a metà del tutorial per far sì che il tuo tutor possa aiutarti con il processo leggermente più complesso di messa online del sito. Questo significa che puoi ancora finire il tutorial da sola se sei a corto di tempo.

Fino ad ora il tuo sito è accessibile solo dal tuo computer, ma ora imparerai come metterlo online! Deploying è il processo di pubblicazione online del tuo progetto in modo tale che sia visibile anche da altre persone :).

Come hai già visto, un sito internet ha sede in un server. Ci sono tantissimi server providers disponibili su internet. Noi ne useremo uno che ha un processo di deployment relativamente semplice: [PythonAnywere][1]. Questo provider è gratuito per piccole applicazioni che non hanno troppi visitatori. Sarà quindi perfetto per te al momento.

 [1]: http://pythonanywhere.com/

L'altro servizio esterno che useremo è [GitHub][2], che è un servizio di hosting di codice. Ne esistono altri, ma di questi tempi quasi tutti i programmatori hanno un account GitHub e ora lo avrai anche tu!

 [2]: http://www.github.com

Useremo GitHub come trampolino di lancio per importare ed esportare il nostro codice su PythonAnywhere.

# Git

Git è un "sistema di controllo versione" utilizzato da un sacco di programmatori. Questo software può tracciare le modifiche nel corso del tempo ad i file, in questo modo puoi ripristinare successivamente una specifica versione. Un pò come l'opzione "traccia modifiche" in Microsoft Word, ma molto più potente.

## Installare Git

> **Nota** Se hai già fatto la procedura di installazione, non devi farlo di nuovo - si può passare alla sezione successiva e iniziare a creare il tuo repository Git.

{% include "/deploy/install_git.md" %}

## Inizializzare un repository Git

Git tiene traccia delle modifiche a un particolare insieme di file in quello che è chiamato repository di codice (o "repo" in breve). Iniziamone uno per il nostro progetto. Apri la console ed esegui questi comandi nella directory `djangogirls`:

> **Nota** controlla la directory su cui stai lavorando adesso con il comando `pwd`(OSX/Linux) oppure `cd`(Windows) prima di iniziare il repository. Dovresti essere nella cartella `djangogirls`.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Dobbiamo inizializzare il repository git solo una volta per ogni progetto (e non dovrai più reinserire il nome utente e l'email).

Git memorizzerà le modifiche a tutti i file e le cartelle in questa directory, ma ci sono alcuni file che vogliamo ignorare. Si fa creando un file chiamato `.gitignore` nella directory di base. Apri il tuo editor e crea un nuovo file con questo contenuto:

    *.pyc
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

E salvalo come `.gitignore` all'interno della cartella "djangogirls".

> **Nota** Il punto all'inizio del nome del file è importante! Se hai difficoltà nel crearlo (ad esempio, ai Mac non piace quando crei file che iniziano con un punto tramite il Finder), allora usa la funzionalità "Salva con nome" nel tuo editor, è a prova di bomba.

È una buona idea usare il comando `git status` prima di `git add` oppure ogni volta che non sei sicuro di cosa sia cambiato. Questo aiuterà ad evitare eventuali brutte sorprese, come file sbagliati che vengono aggiunti o a cui viene fatto il commit. Il comando `git status` restituisce informazioni riguardanti qualsiasi file non tracciato/modificato/in staging, lo stato del branch e molto altro. L'output dovrebbe essere simile a:

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
    

E finalmente salviamo le nostre modifiche. vai alla tua console ed esegui questi comandi:

    $ git add --all .
    $ git commit -m "La mia app Django Girls, primo commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Pubblichiamo il nostro codice su GitHub

Vai su [GitHub.com][2] e registrati per ottenere un nuovo account gratuito. (Se l'hai già fatto nella preparazione di laboratorio, è fantastico!)

Quindi, crea un nuovo repository, dandogli il nome "my-first-blog". Lascia deselezionata la casella di controllo "initialise with a README", lascia l'opzione di .gitignore vuota (lo abbiamo fatto manualmente) e License su None.

![][3]

 [3]: images/new_github_repo.png

> **Nota** Il nome `my-first-blog` è importante -- potresti scegliere qualcos'altro, ma si ripeterà un sacco di volte nelle istruzioni qui sotto, e dovrai sostituirlo ogni volta. Probabilmente è più facile mantenere il nome `my-first-blog`.

Nella schermata successiva, ti verrà mostrato l'URL per clonare il tuo repo:

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Ora abbiamo bisogno di collegare il repository Git sul tuo computer a quello su GitHub.

Digita quanto segue sulla tua console (Sostituisci `<your-github-username>` con il nome utente che hai inserito quando hai creato il account GitHub, ma senza le parentesi angolari):

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Inserisci il tuo username e la tua password di GitHub. Dovresti vedere qualcosa di simile:

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Adesso Il tuo codice è su GitHub. Ora controlla! Scoprirai che è in bella compagnia - [Django][5], il [Django Girls Tutorial][6] e molti altri grandi progetti open source software usano GitHub per ospitare il loro codice :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Configurare il nostro blog su PythonAnywhere

> **Nota** Potresti aver già creato un account di PythonAnywhere precedentemente, durante i passaggi di installazione - se è così, non c'è bisogno di farlo nuovamente.

{% include "/deploy/signup_pythonanywhere.md" %}

## Scaricare il nostro codice su PythonAnywhere

Quando ti sarai registrata su PythonAnywhere, verrai portata alla tua dashboard o alla pagina «Console». Scegli l'opzione per iniziare una console "Bash" -- quella è la versione PythonAnywhere di una console, proprio come quella sul tuo computer.

> **Nota** PythonAnywhere è basato su Linux, quindi se sei su Windows, la console apparirà un po' diversa da quella sul tuo computer.

Scarichiamo il nostro codice da GitHub e su PythonAnywhere creando un "clone" del nostro repo. Digita quanto segue nella console su PythonAnywhere ( non dimenticare di usare il tuo nome utente di GitHub al posto di `<your-github-username>`):

    $ git clone https://github.com/<your-github-username>/my-first-blog.git
    

Questo scaricherà una copia del tuo codice su PythonAnywhere. Dai un'occhiata digitando `tree my-first-blog`:

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
    

### Creare un virtualenv su PythonAnywhere

Proprio come hai fatto sul tuo computer, puoi creare un virtualenv su PythonAnywhere. Nella console di Bash, digita:

    cd my-first-blog
    
    $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.
    
    $ source myvenv/bin/activate
    
    (mvenv) $  pip install django==1.8 whitenoise==2.0
    Collecting django
    [...]
    Successfully installed django-1.8.2 whitenoise-2.0
    

> **Nota** Il passaggio `pip install` può richiedere un paio di minuti. Sii paziente! Ma se richiede più di 5 minuti, c'è qualcosa di sbagliato. Chiedi al tuo coach.

<!--TODO: think about using requirements.txt instead of pip install.-->

### Raccogliere file statici.

Ti stavi chiedendo cos'è quel "whitenoise"? È uno strumento per fornire i cosiddetti "file statici". I file statici sono i file che di solito non cambiano o non eseguono codice di programmazione, come i file HTML o CSS. Funzionano in modo diverso sui server e abbiamo bisogno di uno strumento come "whitenoise" per fornirli.

Scopriremo un po' di più sui file statici più tardi nell'esercitazione, quando modificheremo il CSS per il nostro sito.

Per ora abbiamo solo bisogno di eseguire un comando supplementare chiamato `collectstatic`, sul server. Dice a Django di raccogliere tutti i file statici di cui ha bisogno sul server. Al momento questi sono per lo più file che fanno apparire carino il sito di amministrazione.

    (mvenv) $ python manage.py collectstatic
    
    You have requested to collect static files at the destination
    location as specified in your settings:
    
        /home/edith/my-first-blog/static
    
    This will overwrite existing files!
    Are you sure you want to do this?
    
    Type 'yes' to continue, or 'no' to cancel: yes
    

Digita "yes" e si parte! Non ti piace far stampare al computer pagine e pagine di testo incomprensibile? Faccio sempre piccoli versi per accompagnarlo. Brp, brp brp...

    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.
    

### Creare il database su PythonAnywhere

Ecco un'altra differenza tra il tuo computer ed il server: usa un database diverso. Quindi gli account utente ed i post possono essere diversi sul server rispetto a come appaiono sul tuo computer.

Possiamo inizializzare il database sul server proprio come abbiamo fatto sul tuo computer, con `migrate` e `createsuperuser`:

    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK
    
    
    (mvenv) $ python manage.py createsuperuser
    

## Pubblicare il nostro blog come una web app

Ora il nostro codice è su PythonAnywhere, il nostro virutualenv è pronto, i file statici sono stati raccolti, ed il database è stato inizializzato. Siamo pronti a pubblicarlo come una web app!

Torna alla dashboard di PythonAnywhere cliccando sul suo logo, e clicca sulla scheda **Web**. Infine, premi **Add a new web app**.

Dopo aver confermato il nome del dominio, scegli **manual configuration** (NB *non* l'opzione "Django") nella finestra di dialogo. Successivamente, scegli **Python 3.4** e clicca su Avanti per completare la procedura guidata.

> **Nota** assicurati di aver scelto l'opzione "Manual configuration", non l'opzione "Django". Siamo troppo cool per l'installazione di Django di PythonAnywhere di default;-)

### Impostare il virtualenv

Verrai portato alla schermata di configurazione PythonAnywhere per tua webapp, che è dove dovrai andare ogni volta che desideri apportare modifiche all'applicazione sul server.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

Nella sezione "Virtualenv", clicca sul testo rosso che dice "Enter the path to a virtualenv" ed immetti: `/home/<your-username>/my-first-blog/myvenv/`. Clicca sul riquadro blu con il segno di spunta per salvare il percorso prima di andare avanti.

> **Note** Sostituisci il tuo nome utente come appropriato. se commetti un errore, PythonAnywhere ti avvertirà.

### Configurare il file WSGI

Django funziona usando il "protocollo WSGI", uno standard per fornire siti Web utilizzando Python, che PythonAnywhere supporta. Il modo in cui configuriamo PythonAnywhere per riconoscere il nostro blog in Django è modificando un file di configurazione WSGI.

Clicca sul link "WSGI configuration file" (nella sezione "Code" nella parte superiore della pagina -- avrà un nome tipo `/var/www/<il-tuo-username> _pythonanywhere_com_wsgi.py`), e accederai ad un editor.

Elimina tutti i contenuti e sostituiscili con qualcosa di simile:

```python
import os
import sys

path = '/home/<il-tuo-username>/my-first-blog'  # usa il tuo username qui
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Nota** non dimenticare di mettere il tuo nome utente dove dice `<il-tuo-username>`

Il compito di questo file è dire a PythonAnywhere dove si trova la nostra web app e qual è il nome del file che contiene le impostazioni Django. Inolte, configura lo strumento di file statici "whitenoise".

Clicca **Save** e poi torna alla scheda **Web**.

Abbiamo finito! Premi il grande pulsante verde **Reload** e potrai vedere la tua applicazione. Troverai un link nella parte superiore della pagina.

## Suggerimenti per il debug

Se vedi un errore quando provi a visitare il tuo sito, il primo posto dove cercare qualche info per il debugging è nel tuo **error log**. Troverai un link nella [ scheda Web][8] di PythonAnywhere. Vedi se ci sono messaggi di errore lì; i più recenti sono alla fine. I problemi comuni includono:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Dimenticare uno dei passi che abbiamo fatto nella console: creare il virtualenv, attivarlo, installarci Django, eseguire collecstatic, inizializzazione del database.

*   Commettere un errore nel percorso del virtualenv sulla scheda Web -- di solito c'è un piccolo messaggio di errore in rosso, se c'è un problema.

*   Commettere un errore nel file di configurazione WSGI -- il percorso che hai trovato per tua cartella my-first-blog è corretto?

*   Hai adottato la stessa versione di Python per il tuo virtualenv come hai fatto per la tua app web? entrambe dovrebbero essere 3.4.

*   Ci sono alcuni [consigli generali per il debugging sulla wiki di PythonAnywhere][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

E ricorda, il tuo coach è qui per aiutarti!

# Sei live!

La pagina predefinita per il tuo sito dovrebbe dire "Welcome to Django", esattamente come sul tuo Pc locale. Prova ad aggiungere `/admin/` alla fine della URL, e verrai portata al sito di amministrazione. Accedi con il tuo username e password, e vedrai che puoi aggiungere nuovi Post sul server.

Dà a te stessa un' *ENORME* pacca sulla schiena! Il deploy dei server è tra le parti più complicate dello sviluppo web e di solito le persone ci impiegano svariati giorni prima di farli funzionare. Ma hai pubblicato il tuo sito su Internet senza sforzo!
