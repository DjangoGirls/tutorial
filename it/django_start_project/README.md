# Il tuo primo progetto Django!

> Parte di questo capitolo è basato su esercitazioni di Geek Girls (https://github.com/ggcarrots/django-carrots).
> 
> Parti di questo capitolo sono basate sul [django-marcador tutorial][1] sotto la licenza Creative Commons Attributions-ShareAlike 4.0 International License. Il tutorial di django-marcador è protetto da copyright di Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

Creeremo un semplice blog!

Il primo passo è quello di iniziare un nuovo progetto di Django. Fondamentalmente, questo significa che eseguiremo alcuni script forniti da Django che creerà per noi lo scheletro di un progetto Django. Si tratta solo di un insieme di directory e file che verranno utilizzati dopo.

I nomi di alcuni file e cartelle sono molto importanti per Django. Non dovresti modificare i nomi dei file che stiamo per creare. Neanche spostarli in un altro posto è una buona idea. Django deve mantenere una determinata struttura per essere in grado di trovare le cose importanti.

> Ricordati di eseguire tutto nel virtualenv. Se non vedi un prefisso `(myvenv)` nella tua console devi attivare il tuo virtualenv. Abbiamo spiegato come farlo nel capitolo **installazione Django** nella parte **Lavorando con virtualenv**. Digitando `myvenv\Scripts\activate` su Windows oppure `source myvenv/bin/activate` su Mac OS / Linux farà questo per te.

Dovresti eseguire nella tua console MacOS o Linux il seguente comando; **non dimenticarti di aggiungere il punto `.` alla fine **:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

Su Windows; **non dimenticarti di aggiungere il punto `.` alla fine**:

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .
    

> Il punto `.` è cruciale perché dice allo script d'installare Django nell'attuale directory (quindi il punto `.` è un riferimento di abbreviazione)
> 
> **Nota** Quando digiti i comandi sopra, ricorda che si digita soltanto la parte che inizia con `django-admin` oppure `django-admin.py`. Le parti mostrate qui come `(myvenv) ~/djangogirls$` e `(myvenv) C:\Users\Name\djangogirls>` sono solo esempi del prompt che starà invitando il tuo input sulla tua command line.

`django-admin.py` è uno script che creerà le cartelle ed i file per te. Adesso dovresti avere una struttura di directory simile a questa:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

`manage.py` è uno script che aiuta a gestire il sito. Usandolo saremo in grado di avviare un web server sul nostro computer senza dover installare nient'altro, tra l'altro.

Il file `settings.py` contiene la configurazione del tuo sito web.

Ricordi quando abbiamo parlato di un postino che controlla dove rilasciare la lettera? il file `urls.py` contiene una lista di schemi usati da `urlresolver`.

Ignoriamo gli altri file per ora dal momento che non li modificheremo. L'unica cosa da ricordare è di non cancellarli per sbaglio!

## Modificare le impostazioni

Facciamo qualche cambiamento in `mysite/settings.py`. Apri il file usando il code editor che hai installato prima.

Sarebbe bello avere l'ora corretta sul nostro sito Web. Vai alla [lista di fusi orari di wikipedia][2] e copia il tuo fuso orario (TZ). (es. `Europe/Berlin`)

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

In settings.py, trova la riga che contiene `TIME_ZONE` e modificala per scegliere il tuo fuso orario:

```python
TIME_ZONE = 'Europe/Berlin'
```

Modifica "Europe/Berlin" nel modo corretto

Avrai anche bisogno di aggiungere un percorso per i file statici (scopriremo tutto su file statici e CSS più avanti nell'esercitazione). Scendi fino alla *fine* del file e sotto la voce `STATIC_URL`, aggiungi un nuovo percorso chiamato `STATIC_ROOT`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

## Imposta un database

Ci sono un sacco di software di database diversi che possono immagazzinare dati per il tuo sito. Noi useremo quello di default, `sqlite3`.

È già impostato in questa parte del file `mysite/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Per creare un database per il nostro blog, eseguiamo questo nella console: `python manage.py migrate` (abbiamo bisogno di essere nella directory `djangogirls` che contiene il file `manage.py`). Se funziona, dovresti vedere qualcosa di simile:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK
    

E abbiamo finito! Tempo di avviare il server web e vedere se il nostro sito Web funziona!

Devi essere nella directory che contiene il file di `manage.py` (la directory `djangogirls`). Nella console, possiamo avviare il server web eseguendo `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Se sei su Windows e non funziona con `UnicodeDecodeError`, usa questo comando:

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Ora tutto quello che devi fare è controllare che il tuo sito sia in esecuzione. Apri il tuo browser (Firefox, Chrome, Safari, Internet Explorer o qualsiasi altro tu usi) e digita l'indirizzo:

    http://127.0.0.1:8000/
    


Il server web assumerà il controllo del command prompt finché non lo fermi. Per digitare più comandi mentre è in esecuzione apri una nuova finestra di terminale e attiva il tuo virtualenv. Per fermare il server web, torna alla finestra dove è in esecuzione e premi i pulsanti CTRL+C - Control e C insieme (su Windows, è probabile che tu deva premere Ctrl+Break).

Congratulazioni! Hai appena creato il tuo primo sito e l'hai avviato usando un web server! Non è fantastico?

![Ha funzionato!][3]

 [3]: images/it_worked2.png

Pronto/a per il prossimo passo? È ora di creare un po' di contenuti!
