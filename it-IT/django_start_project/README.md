# Il tuo primo progetto Django!

> Parte di questo capitolo è tratto dal tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parti di questo capitolo si basano sul [django-marcador tutorial](http://django-marcador.keimlink.de/) con licenza Creative Commons Attributions-ShareAlike 4.0 International License. Il tutorial di django-marcador è protetto da copyright di Markus Zapke-Gründemann et al.

Creeremo un piccolo blog!

Il primo passo è quello di iniziare un nuovo progetto di Django. Fondamentalmente, questo significa che eseguiremo alcuni script forniti da Django che creerà per noi lo scheletro di un progetto Django. Si tratta solo di un insieme di directory e file che verranno utilizzati dopo.

I nomi di alcuni file e cartelle sono molto importanti per Django. Non dovresti modificare i nomi dei file che stiamo per creare. Neanche spostarli in un altro posto è una buona idea. Django deve mantenere una determinata struttura per essere in grado di trovare le cose importanti.

> Ricordati di eseguire tutto nel virtualenv. Se non vedi il prefisso `(myvenv)` nella tua console, devi attivare il tuo virtualenv. Abbiamo spiegato come farlo nel capitolo **installazione Django** nella parte **Lavorando con virtualenv**. Digitando `myvenv\Scripts\activate` su Windows oppure `source myvenv/bin/activate` su Mac OS / Linux farà questo per te.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Dovresti eseguire il seguente comando nella tua console MacOS X o Linux; **non dimenticarti di aggiungere il punto `.` alla fine! **

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Il punto `.` è cruciale perché dice allo script d'installare Django nell'attuale directory (quindi il punto `.` è un riferimento di abbreviazione).
> 
> **Nota** Quando digiti i comandi sopra, ricorda che si digita soltanto la parte che inizia con django-admin oppure ``. Le parti mostrate qui come (myvenv) ~/djangogirls$ e `(myvenv) C:\Users\Name\djangogirls` sono solo esempi del prompt che starà invitando il tuo input sulla tua command line.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Dovresti eseguire nella tua console MacOS o Linux il seguente comando; **non dimenticarti di aggiungere il punto `.` alla fine **:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Il punto `.` è cruciale perché dice allo script d'installare Django nell'attuale directory (quindi il punto `.` è un riferimento di abbreviazione).
> 
> **Nota** Quando digiti i comandi sopra, ricorda che si digita soltanto la parte che inizia con django-admin oppure ``. Le parti mostrate qui come (myvenv) ~/djangogirls$ e `(myvenv) C:\Users\Name\djangogirls` sono solo esempi del prompt che starà invitando il tuo input sulla tua command line.

<!--endsec-->

`django-admin.py` è uno script che creerà le cartelle ed i file per te. Adesso dovresti avere una struttura di directory simile a questa:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Nota**: nella struttura della directory, vedrai anche la tua cartella `venv` che abbiamo creato prima.

`manage.py` è uno script che aiuta a gestire il sito. Usandolo saremo in grado di avviare un web server sul nostro computer senza dover istallare nient'altro, tra l'altro.

Il file `settings.py` contiene la configurazione del tuo sito web.

Ricordi quando abbiamo parlato di un postino che controlla dove rilasciare la lettera? il file `urls.py` contiene una lista di schemi usati da `urlresolver`.

Ignoriamo gli altri file per ora dal momento che non li modificheremo. L'unica cosa da ricordare è di non cancellarli per sbaglio!

## Modificare le impostazioni

Facciamo qualche cambiamento in `mysite/settings.py`. Apri il file usando il code editor che hai istallato prima.

**Nota**: Ricorda che `settings.py` è un file regolare, come qualsiasi altro. Puoi aprirlo all'interno dell'editor di codice, utilizzando le azioni di menu "file -> apri". Questo dovrebbe portarti la finestra abituale in cui puoi navigare nel file `settings.py` e selezionarlo. In alternativa, puoi aprire il file navigando nella cartella djangogirls sul tuo desktop e facendo clic destro su di esso. Quindi, seleziona l'editor di codice dall'elenco. La selezione dell'editor è importante perché potresti avere altri programmi installati che possono aprire il file ma non ti permetterà di modificarlo.

Sarebbe bello avere l'ora corretta sul nostro sito Web. Vai alla lista delle zone orarie [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) e copia la tua zona di tempo (TZ) (ad esempio. `Europa/Berlino`).

In settings.py, trova la riga che contiene `TIME_ZONE` e modificala per scegliere il tuo fuso orario:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Un codice lingua è costituito dalla lingua, ad esempio`en` per l'inglese o `de` per il tedesco e il codice del paese, ad esempio`de` per la Germania o `ch` per la Svizzera. Se l'inglese non è la tua lingua nativa, puoi aggiungere questo per cambiare i pulsanti e le notifiche predefinite da Django per essere nella tua lingua. Quindi, il pulsante "Annulla" verrebbe tradotto nella lingua che hai definito qui. [Django arriva con molte traduzioni preparate](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Se vuoi una lingua diversa, cambia il codice lingua modificando la seguente riga:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Dovremo anche aggiungere un percorso per i file statici. (Più tardi scopriremo tutti i file statici e CSS nel tutorial.) Vai alla *end* del file, e appena sotto la voce `STATIC_URL` aggiungi un nuovo nome chiamato `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Quando `DEBUG` è `Vero` e `ALLOWED_HOSTS` è vuoto, l'host è convalidato contro `['localhost', '127.0.0.1', '[::1]']`. Questo non abbina il nostro hostname su PythonAnywhere dopo aver distribuito la nostra applicazione in modo da modificare le seguenti impostazioni:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Nota**: se stai usando un Chromebook, aggiungi questa linea nella parte inferiore del file settings.py: `MESSAGE_STORAGE = 'django.contrib.storage.session.SessionStorage'`
> 
> Aggiunge anche `.amazonaws.com` a `ALLOWED_HOSTS` se stai usando cloud9
> 
> Se stai presentando il tuo progetto su `Glitch.com`, bisogna proteggere la chiave segreta di Django, che deve rimanere confidenziale (altrimenti chiunque faccia un remix del tuo progetto potrebbe vederla):
> 
> - Prima di tutto, si crea una chiave segreta casuale. Apri nuovamente il terminale Glitch e digita il comando seguente:
>     
>     {% filename %}command-line{% endfilename %}
>     
>     ```bash
>     python -c 'from django.core.management.utils import get_random_secret_key; \
>           print(get_random_secret_key())'
>     ```
>     
>     Il comando dovrebbe mostrare una lunga stringa casuale, perfetta da usare come chiave segreta per il tuo nuovo sito web Django. Si incolla poi questa chiave in un file `.env` che Glitch mostrerà solamente se sei il proprietario del sito web.
> 
> - Crea un file `.env` alla base del tuo progetto e aggiungi al suo interno la proprietà seguente:
>     
>     {% filename %}.env{% endfilename %}
>     
>     ```bash
>     # Qui, all'interno delle virgolette, puoi tagliare e incollare la chiave casuale generata precedentemente
>     SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl'
>     ```
> 
> - Aggiorna poi il file delle impostazioni di Django per inserire questo valore segreto e impostare il nome del sito web:
>     
>     {% filename %}mysite/settings.py{% endfilename %}
>     
>     ```python
>     SECRET_KEY = os.getenv('SECRET')
>     ```
> 
> - Poco più avanti nello stesso file, inserisci il nome del tuo nuovo sito web Glitch:
>     
>     {% filename %}mysite/settings.py{% endfilename %}
>     
>     ```python
>     ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"]
>     ```
>     
>     Il valore `PROJECT_DOMAIN` è generato automaticamente da Glitch. Corrisponderà al nome del tuo progetto.

## Imposta un database

Ci sono un sacco di software di database diversi che possono immagazzinare dati per il tuo sito. Noi useremo quello di default, `sqlite3`.

È già impostato in questa parte del file `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Per creare un database per il nostro blog, eseguiamo questo nella console: `python manage.py migrate` (abbiamo bisogno di essere nella directory `djangogirls` che contiene il file `manage.py`). Se funziona, dovresti vedere qualcosa di simile:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

E abbiamo finito! Tempo di avviare il server web e vedere se il nostro sito Web funziona!

## Avvio del server web

Devi essere nella directory che contiene il file di `manage.py` (la directory `djangogirls`). Nella console, possiamo avviare il server web eseguendo `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Se invece stai usando un Chromebook, digita questo comando:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

o questo se stai usando Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> Abbiamo esaminato come funzionano i server web nel capitolo **Come funziona il capitolo** .

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!