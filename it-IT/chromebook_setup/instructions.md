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
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

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

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

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

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Ambiente virtuale

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).