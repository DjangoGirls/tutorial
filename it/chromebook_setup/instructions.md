Puoi [saltare questa sezione](http://tutorial.djangogirls.org/en/installation/#install-python) se non utilizzi un Chromebook. L'installazione su Chromebook segue una procedura un po' diversa. Il resto delle istruzioni di installazione può essere ignorato.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE è uno strumento che mette a disposizione un editor di codice e l'accesso ad un computer virtuale su cui installare, scrivere ed eseguire il software. In questo tutorial, Cloud IDE avrà la funzione di un *computer locale*. Digiterai i comandi sull'interfaccia di un terminale, come le tue compagne di corso che utilizzano OS X, Ubuntu o Windows, ma il tuo terminale sarà connesso a un computer remoto che Cloud IDE ha creato per te. Puoi trovare di seguito le istruzioni per i Cloud IDE (PaizaCloud IDE, AWS Cloud9, Glitch.com). Puoi selezionare uno dei Cloud IDE e seguire le relative istruzioni.

#### PaizaCloud Cloud IDE

1. Vai su [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Crea un account
3. Clicca su *Nuovo server* oppure <0>New Server</0> e scegli l'app Django
4. Seleziona il pulsante Terminal (sul lato sinistro della pagina)

Ora dovresti vedere un'interfaccia con una barra laterale e dei pulsanti sulla sinistra. Fai click sul pulante "Terminal" per aprire la finestra del terminale con il prompt, così:

{% filename %}Terminal{% endfilename %}

    $
    

Il terminale su PaizaCloud Cloud IDE è pronto a ricevere istruzioni. Puoi ridimensionare la finestra o renderla un po' più più grande.

#### AWS Cloud9

Attualmente Cloud 9 richiede la registrazione con AWS e l'inserimento delle informazioni sulla carta di credito.

1. Installa Cloud9 dal [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Vai su [c9.io](https://c9.io) e clicca *Inizia con AWS Cloud9*
3. Registra un account AWS (richiede informazioni sulla carta di credito, ma puoi usarlo gratuitamente)
4. Nella Dashboard di AWS, inserisci *Cloud9* nella barra di ricerca e facci click
5. Nel cruscotto Cloud 9, clicca su *Crea ambiente*
6. Chiamalo *django-girls*
7. Durante la configurazione delle impostazioni, selezionare *Creare una nuova istanza per l'ambiente (EC2)* per "Tipo di Ambiente" e *t2.micro* "Tipo di Istanza" (dovrebbe essere "Free-tier."). L'impostazione di default per il risparmio dei costi va bene e puoi mantenere le altre impostazioni predefinite.
8. Clicca *Passo Successivo*
9. Fai click su *Create Environment*

Ora dovresti vedere un'interfaccia con una barra laterale, una grossa finestra principale con del testo, ed una piccola finestra in basso che sembra questa:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Questa finestra in basso è il tuo terminale. Puoi usare il terminale per inviare istruzioni al computer remoto Cloud9. Puoi cambiare le dimensioni della finestra e renderla più grande.

#### Glitch.com

1. Vai su [Glitch.com](https://glitch.com/)
2. Crea un account (https://glitch.com/signup) o, se lo possiedi, usa il tuo account GitHub (di seguito puoi trovare le istruzioni su GitHub).
3. Seleziona *New Project* e scegli *hello-webpage*
4. Seleziona l'elenco a discesa "Strumenti" (Tools, nella sezione della pagina in basso a sinistra), poi premi sul pulsante Terminale (Terminal) per aprire una scheda terminale con un prompt come il seguente:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

Quando utilizzi Glitch.com come il tuo Cloud IDE, non è necessario creare un ambiente virtuale. Puoi invece creare manualmente i seguenti file:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Una volta creati i file, vai al Terminale ed esegui i comandi seguenti per creare il tuo primo progetto Django:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

Per poter vedere dettagliatamente i messaggi di errore, puoi attivare i log di debug di Django per la tua applicazione Glitch. Aggiungi semplicemente questa dicitura alla fine del file `mysite/settings.py`.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

Questo procedimento creerà un file `debug.log` con i dettagli sulle operazioni effettuate da Django e su eventuali messaggi di errore che potrebbero apparire, rendendone più semplice la correzione se il tuo sito web non funzionasse.

Il riavvio iniziale del progetto Glitch potrebbe fallire. (Se selezioni il pulsante a discesa in alto `Show` e poi `In a New Window`, riceverai il messaggio di errore `DisallowedHost`) Non devi preoccupartene in questa fase, il tutorial lo correggerà non appena aggiorni le impostazioni del tuo progetto di Django nel file `mysite/settings.py`.

### Ambiente virtuale

Un ambiente virtuale (virtual environment, spesso abbreviato in virtualenv) è una specie di scatola privata in cui si può inserire un codice informatico per un progetto su cui si sta lavorando. Si usa per mantenere separati i numerosi pezzi di codice dei vari progetti, in modo da non creare confusione tra i progetti stessi.

Esegui:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(N.B. nell'ultima riga abbiamo usato una tilde seguita dal segno uguale: `~=`).

### GitHub

Crea un account [GitHub](https://github.com).

### PythonAnywhere

Il tutorial di Django Girls include una sezione su ciò che viene definito Deployment, ovvero il processo durante il quale si estrae il codice che alimenta la tua nuova applicazione web e lo si sposta su un computer accessibile al pubblico (chiamato server), in modo che altre persone possano vedere il tuo lavoro.

Questa parte del tutorial è un po' insolita se lo si segue su un Chromebook, siccome stiamo usando un computer che è già su internet (al contrario di un laptop, per esempio). È comunque utile, se consideriamo il nostro Cloud 9 come uno spazio per il nostro lavoro "in corso" e Python Anywhere come uno spazio per mostrare il nostro materiale quando è più completo.

Quindi, registra il tuo nuovo account Python Anywhere su [www.pythonanywhere.com](https://www.pythonanywhere.com).