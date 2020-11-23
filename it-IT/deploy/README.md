# Pubblica Online!

> **Nota** Il seguente capitolo può essere un po' difficile da fare fino in fondo. Non mollare e cerca di portarlo a termine; la pubblicazione online è una parte importante nel processo di costruzione di un sito web. Questo capitolo è collocato a metà del tutorial in modo che il tuo coach ti possa aiutare con il processo leggermente più complicato di messa online del sito. Questo significa che puoi ancora finire il tutorial per conto tuo se sei a corto di tempo.

Fino ad ora il tuo sito web è stato presente solo sul tuo computer. Adesso imparerai come implementarlo! L'implementazione è il processo di pubblicazione online del tuo progetto in modo tale che sia visibile anche da altre persone. :)

Come abbiamo imparato, un sito Web deve trovarsi su un server. Ci sono molti server provider disponibili su Internet, noi useremo [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere è gratuito per le piccole applicazioni che non hanno troppi visitatori, sarà quindi perfetto per te al momento.

L'altro servizio esterno che useremo è [GitHub](https://www.github.com), che è un servizio di hosting di codice. Ne esistono altri, ma oggigiorno quasi tutti i programmatori hanno un account GitHub e ora lo avrai anche tu!

Questi tre servizi saranno importantissimi per te. Userai il tuo computer locale per sviluppare e fare test. Quando sarai soddisfatto delle modifiche, caricherai una copia del tuo programma su GitHub. Il tuo sito Web sarà su PythonAnywhere e lo aggiornerai con una nuova copia del codice da GitHub.

# Git

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Inizializzare un repository Git

Git tiene traccia delle modifiche a un particolare insieme di file in quello che è chiamato repository di codice (o "repo" in breve). Iniziamone uno per il nostro progetto. Apri la console ed esegui questi comandi nella directory `djangogirls`:

> **Nota** Controlla la tua cartella di lavoro corrente con a`pwd`(Mac OS X/Linux) o`cd` (Windows) comando prima di inizziare il repository. Dovresti essere nella cartella `djangogirls`.

{% filename %}comando-linea{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

L'inizializzazione del repository git é qualcosa che dobbiamo fare una sola volta per progetto (e non dovrai piú reinserire il nome utente e l'indirizzo email).

Git memorizzerà le modifiche a tutti i file e le cartelle in questa directory, ma ci sono alcuni file che vogliamo ignorare. Si fa creando un file chiamato `.gitignore` nella directory di base. Apri il tuo editor e crea un nuovo file con questo contenuto:

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
    

E salvalo come `.gitignore` all'interno della cartella "djangogirls".

> **Nota** Il punto all'inizio del nome del file è importante! Se hai difficoltá a crearlo (per esempio, Mac non piacere creare file che iniziano con un punto attraverso il Finder), usa la funzione "salva con nome" nell'editor, é a prova di proiettile. E assicurati di non aggiungere `.txt`, `.py`, o qualsiasi altra estensione al nome del file -- sarà riconosciuto da Git solo se il nome è `.gitignore`. Linux e MacOS trattano i file con un nome che inizia con `.` (come `.gitignore`) come nascosti ed il comando `Is` normale non mostrerà questi file. Invece usa `Is - a` per vedere il file `.gitignore`.
> 
> **Nota** Uno dei file che hai specificato nel tuo file `.ginignore` è `db.sqlite3`. Questo file è il tuo database locale, in cui sono archiviati i post e gli utenti. Seguiremo le pratiche standard di programmazione web, ovvero useremo due diversi database: uno per il sito con cui effettuarai i test locali, e uno per il sito online su PythonAnywhere. Come database PythonAnywhere potresti usare SQLite, ma ne userai più spesso uno che si chiama MySQL, che può gestire molti più vsitatori di SQLite. In entrambi i casi, ignorando il database SQLite per la copia di GitHub, vuol dire che tutti i post che hai creato finora saranno solo disponibili localmente, ma li aggiungeremo nuovamente in produzione. Dovresti pensare al database locale come un parco giochi dove si possono provare cose diverse e senza avere paura di eliminare i tuoi messaggi reali dal tuo blog.

È una buona idea usare il comando `git status` prima di `git add` oppure ogni volta che non sei sicuro di cosa sia cambiato. Questo aiuterà ad evitare eventuali brutte sorprese, come file sbagliati che vengono aggiunti o a cui viene fatto il commit. Il comando `git status` restituisce informazioni riguardanti qualsiasi file non tracciato/modificato/in staging, lo stato del branch e molto altro. L'output dovrebbe essere simile a quanto segue:

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
    

E finalmente salviamo le nostre modifiche. vai alla tua console ed esegui questi comandi:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Pubblica il tuo codice su GitHub

Vai su [GitHub.com](https://www.github.com) e crea un nuovo account gratuito. (Se lo hai già fatto nella preparazione al workshop, benissimo!) Assicurati di ricordare la tua password (aggiungila al tuo password manager, se ne usi uno).

Quindi, crea un nuovo repository con il il nome "my-first-blog". Lascia deselezionata la casella di controllo "initialise with a README", lascia vuota l'opzione .gitignore (lo abbiamo già fatto manualmente) e lascia License su None.

![](images/new_github_repo.png)

> **Nota** Il nome `my-first-blog` è importante -- potresti sceglierne un altro, ma il nome verrà ripetuto un sacco di volte nelle istruzioni qui sotto, e dovresti sostituirlo ogni volta. Probabilmente è più facile mantenere il nome `my-first-blog`.

Sulla prossima schermata, ti sarà mostrato il tuo clone URL ricopiato, che userai in alcuni dei comandi che seguono:

![](images/github_get_repo_url_screenshot.png)

Ora dobbiamo collegare il repository Git sul tuo computer a quello su GitHub.

Digita quanto segue sulla tua console (sostituisci `<your-github-username>` con il nome utente che hai inserito quando hai creato l'account GitHub, ma senza le parentesi angolari -- l'URL dovrebbe coincidere con L'URL clone che hai appena visto):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Quando si spinge su GitHub, ti verrà chiesto il tuo nome utente e password GitHub (o nella finestra di comando o in una finestra pop-up), e dopo aver inserito le credenziali si dovrebbe vedere qualcosa di simile a questo:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Adesso Il tuo codice è su GitHub. Guarda! Lo troverai in buona compagnia - [Django](https://github.com/django/django), il [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) e molti grandi progetti di software open source caricano il proprio codice su GitHub. :)

# Configurare il nostro blog su PythonAnywhere

## Crea un account PythonAnywhere

> **Nota** Potresti aver già creato un account PythonAnywhere prima, durante la fase di installazione - in questo caso, non c'è bisogno di crearlo di nuovo.

{% include "/deploy/signup_pythonanywhere.md" %}

## Configurare il nostro sito su PythonAnywhere

Torna alla [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) principale cliccando sul logo e scegli l'opzione per avviare una console "Bash” - questa è la versione PythonAnywhere di una riga di comando, proprio come quella sul tuo computer.

![La sezione 'Nuova Console' sull'interfaccia web PythonAnywhere, con un pulsante per 'bash'](images/pythonanywhere_bash_console.png)

> **Nota** PythonAnywhere si basa su Linux, quindi se sei su Windows, la console apparirà un po' diversa da quella del tuo computer.

Per implementare un'applicazione web su PythonAnywhere devi prendere il codice da GitHub, e configurare PythonAnywhere in modo che lo riconosca come un'applicazione web. Puoi farlo manualmente, ma PythonAnywhere ti fornisce uno strumento che farà tutto il lavoro al posto tuo. Prima di tutto installiamolo:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip{{ book.pa_py_version }} install --user pythonanywhere
    

Ora dovresti leggere: `Collecting pythonanywhere` e un'eventuale riga finale che dice `Successfully installed (...) pythonanywhere- (...)`.

Ora eseguiamo l'helper per configurare automaticamente la nostra applicazione da GitHub. Digita quanto segue nella console su PythonAnywhere (non dimenticare di usare il tuo nome utente di GitHub al posto di `<your-github-username>`) in modo che l'URL corrisponda all'URL clone di GitHub:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python={{ book.pa_py_version }} https://github.com/<your-github-username>/my-first-blog.git
    

Guardando l'esecuzione, potrai vedere cosa sta facendo:

- Scaricare il tuo codice da GitHub
- Creare un virtualenv su PythonAnywhere, come quello sul tuo computer
- Aggiornare il file di impostazioni con alcune impostazioni di implementazione
- Configurare un database su PythonAnywhere utilizzando il comando `manage.py migrate`
- Configurare i tuoi file statici (di cui parlaremo più avanti)
- E configurare PythonAnywhere per servire la tua app web tramite la sua API

Su PythonAnywhere tutti questi passaggi sono automatizzati, ma sono gli stessi passaggi che dovresti effettuare con qualsiasi altro server provider.

La cosa principale da notare ora è che il tuo database su PythonAnywhere è completamente separato dal database sul tuo computer, e quindi può avere post e account di amministrazione differenti. Di conseguenza, come abbiamo fatto sul computer, dobbiamo inizializzare l'account di amministrazione con `createsuperuser`. PythonAnywhere ha attivato automaticamente il tuo virtualenv, quindi ora devi solo eseguire il codice seguente:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Inserisci i dettagli per l'utente di amministrazione. È meglio utilizzare gli stessi che stai usando sul computer per evitare confusione, a meno che non desideri rendere la password su PythonAnywhere più sicura.

Ora, se vuoi, puoi anche dare un'occhiata al tuo codice su PythonAnywhere utilizzando `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls 
    blog db.sqlite3 manage.py mysite requirements.txt static 
    (ola.pythonanywhere.com) $ ls blog/ 
    __init__.py __pycache__ admin.py apps.py migrations models.py 
    tests.py views.py
    

Puoi anche andare alla pagina "File" e navigare in uso del browser di file integrato di PythonAnywhere. (Dalla pagina Console, puoi raggiungere altre pagine PythonAnywhere dal pulsante menu nell'angolo in alto a destra. Una volta che sei su una delle pagine, ci sono link agli altri vicini all'alto.)

## Ora sei online!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)

> **Nota** Questo è un tutorial per principianti, e nel distribuire questo sito abbiamo preso alcune scorciatoie che non sono ideali dal punto di vista della sicurezza. Se e quando decidi di usare questo progetto in produzione, oppure di avviare un nuovo progetto, dovresti controllare la [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) per alcuni consigli di sicurezza del tuo sito.

## Suggerimenti per il debug

Se si osserva un errore durante l'esecuzione dello script `pa_autoconfigure_django.py`, ecco alcune cause comuni:

- Dimenticare di creare il tuo token API PythonAnywhere.
- Errore nel tuo URL GitHub
- Se vedi un errore dicendo * "Non è stato possibile trovare le impostazioni.py"*, probabilmente perché non è riuscito ad aggiungere tutti i file a Git e/o non li hai spinti fino a GitHub con successo. Dai un altro sguardo alla sezione Git qui sopra
- Se ti sei registrato in precedenza con un account su PythonAnywhere e hai avuto un errore con il comando collectstatic, probabilmente, il tuo account ha una versione un po' vecchia di SQLite (es. 3..2). In tal caso, registrati per un nuovo account e prova i comandi nella sezione PythonAnywhere qui sopra.

Se vedi un errore quando provi a visitare il tuo sito, il primo posto dove cercare qualche info per il debugging è nel tuo **error log**. Troverai un link nella [ scheda Web](https://www.pythonanywhere.com/web_app_setup/) di PythonAnywhere. Vedi se ci sono messaggi di errore lì; i più recenti sono alla fine.

Ci sono alcuni [consigli generali per il debugging sulla wiki di PythonAnywhere](http://help.pythonanywhere.com/pages/DebuggingImportError).

E ricorda, il tuo coach è qui per aiutarti!

# Scopri il tuo Elenco di Vita!

La pagina predefinita per il tuo sito dovrebbe dire "Welcome to Django", esattamente come sul tuo Pc locale. Prova ad aggiungere `/admin/` alla fine della URL, e verrai portata al sito di amministrazione. Accedi con il nome utente e la password, e vedrai che puoi aggiungere nuovi post sul server -- ricorda che i post del database di test locale non sono stati inviati al tuo blog live.

Una volta che hai creato un paio di post, puoi tornare indietro alla copia locale (non PythonAnywhere). Da qui in poi, lavori sulla tua copia locale per fare le modifiche. Si tratta di un flusso di lavoro comune nello sviluppo Web (apportare modifiche localmente, inviare quei cambiamenti su GitHub, aggiornare le tue modifiche sul server Web. Questo consente di lavorare e fare esperimenti senza rompere il tuo sito Web. Bello, vero?

Dà a te stessa un' *ENORME* pacca sulla schiena! Il deploy dei server è tra le parti più complicate dello sviluppo web e di solito le persone ci impiegano svariati giorni prima di farli funzionare. Ma hai pubblicato il tuo sito su Internet senza sforzo!