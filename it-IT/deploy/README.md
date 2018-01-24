# Deploy!

> **Nota** Il seguente capitolo è abbastanza difficile da capire fino in fondo. Non mollare e cerca di portarlo a termine; deployment (termine abbastanza complicato da tradurre, ma indica tutto ciò che tu rendi LIVE, accessibile sul web e non più solo dal tuo computer) è una parte importante nel processo di costruzione di un sito web. Questo capitolo è inserito a metà del tutorial per far sì che il tuo tutor possa aiutarti con il processo leggermente più complesso di messa online del sito. Questo significa che puoi ancora finire il tutorial da sola se sei a corto di tempo.

Fino ad ora, il tuo sito web era presente solo sul tuo computer. Adesso imparerai come fare il deploy! Il deploy è il processo di pubblicazione online del tuo progetto in modo tale che sia visibile anche da altre persone. :)

Come si è appreso, un sito Web deve trovarsi su un server. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

L'altro servizio esterno che useremo è [GitHub](https://www.github.com), che è un servizio di hosting di codice. Ne esistono altri, ma di questi tempi quasi tutti i programmatori hanno un account GitHub e ora lo avrai anche tu!

Questi tre servizi saranno importantissimi per te. Il tuo computer in locale sarà il posto in cui svilupperai e farai test. Quando sei soddisfatto delle modifiche, caricherai una copia del programma su GitHub. Il tuo sito Web sarà su PythonAnywhere e lo aggiornerai con una nuova copia del codice da GitHub.

# Git

> **Nota** Se hai giá eseguito i passagi di installazione, non é necessario eseguire nuovamente questa operazione - puoi andare alla sezione successiva e iniziare a creare il tuo repository Git.

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

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /statica
    .DS_Negozio
    

E salvalo come `.gitignore` all'interno della cartella "djangogirls".

> **Nota** Il punto all'inizio del nome del file è importante! Se hai difficoltá a crearlo (per esempio, Mac non piacere creare file che iniziano con un punto attraverso il Finder), usa la funzione "salva con nome" nell'editor, é a prova di proiettile.
> 
> **Nota** Uno dei file che hai specificato nel tuo`.ginignore`il file é`db.sqlite3`. Quel file é il tuo database locale, in cui sono archiviate tutte le tue pubblicazioni. Non vogliamo aggiungere questo al tuo repository perché il tuo sitio web in PythonAnywhere utilizzerá un database diverso. Quel database potrebbe essere SQLite, come la tua macchina di sviluppo, ma generalmente usa una chiamata MySQL che puó gestire molti piú visitatori del sitio di SQLite. Ad ogni modo, ignorando il tuo database SQLite per la copia di GitHub, significa che tutte le pubblicazioni che hai creato fino ad ora rimarranno e saranno disponibili solo localmente, ma dovrai aggiungerle nuovamente in produzione. Dovresti pensare al database locale come un parco giochi dove si possono provare cose diverse e senza avere paura di eliminare i tuoi messaggi reali dal tuo blog.

È una buona idea usare il comando `git status` prima di `git add` oppure ogni volta che non sei sicuro di cosa sia cambiato. This will help prevent any surprises from happening, such as wrong files being added or committed. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. The output should be similar to the following:

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
    

E finalmente salviamo le nostre modifiche. vai alla tua console ed esegui questi comandi:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!)
    
    Then, create a new repository, giving it the name "my-first-blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.
    
    <img src="images/new_github_repo.png" />
    
    > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. It's probably easier to just stick with the name `my-first-blog`.
    
    On the next screen, you'll be shown your repo's clone URL. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Now we need to hook up the Git repository on your computer to the one up on GitHub.
    
    Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Ora controlla!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Scarichiamo il nostro codice da GitHub e su PythonAnywhere creando un "clone" del nostro repo. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/mio-primo-blog.git

    <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd mio-primo-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Patience, patience!  But if it takes more than five minutes, something is wrong.  Ask your coach.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Creating the database on PythonAnywhere
    
    Here's another thing that's different between your own computer and the server: it uses a different database. So the user accounts and posts can be different on the server and on your computer.
    
    Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publishing our blog as a web app
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. We're ready to publish it as a web app!
    
    Click back to the PythonAnywhere dashboard by clicking on its logo, and then click on the **Web** tab. Finally, hit **Add a new web app**.
    
    After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Next choose **Python 3.6**, and click Next to finish the wizard.
    
    &gt; **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. We're too cool for the default PythonAnywhere Django setup. ;-)
    
    
    ### Setting the virtualenv
    
    You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Click the blue box with the checkmark to save the path before moving on.
    
    &gt; **Note** Substitute your own PythonAnywhere username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.
    
    
    ### Configuring the WSGI file
    
    Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. The way we configure PythonAnywhere to recognize our Django blog is by editing a WSGI configuration file.
    
    Click on the "WSGI configuration file" link (in the "Code" section near the top of the page – it'll be named something like `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.
    
    Delete all the contents and replace them with the following:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

Questo al fine di dire a PythonAnywhere dove è la nostra web app e qual è il nome del file Django.

Il `StaticFilesHandler` si occupa dei nostri CSS. Questo è gestito automaticamente durante lo sviluppo locale dal comando `runserver`. Scopriremo un po' di più sui file statici più tardi nell'esercitazione, quando modificheremo il CSS per il nostro sito.

Clicca **Save** e poi torna alla scheda **Web**.

Abbiamo finito! Premi il grande pulsante verde **Reload** e potrai vedere la tua applicazione. Troverai un link nella parte superiore della pagina.

## Suggerimenti per il debug

Se vedi un errore quando provi a visitare il tuo sito, il primo posto dove cercare qualche info per il debugging è nel tuo **error log**. Troverai un link nella [ scheda Web](https://www.pythonanywhere.com/web_app_setup/) di PythonAnywhere. Vedi se ci sono messaggi di errore lì; i più recenti sono alla fine. Problemi comuni includono:

- Dimenticare uno degli step che abbiamo fatto nella console: creare il virtualenv, attivarlo, installare Django, migrare il database.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Hai adottato la stessa versione di Python per il tuo virtualenv come hai fatto per la tua app web? entrambe dovrebbero essere 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

E ricorda, il tuo coach è qui per aiutarti!

# Sei live!

The default page for your site should say "It worked!", just like it does on your local computer. Prova ad aggiungere `/admin/` alla fine della URL, e verrai portata al sito di amministrazione. Accedi con il tuo username e password, e vedrai che puoi aggiungere nuovi Post sul server.

Una volta che hai creato un paio di post, puoi tornare indietro alla copia locale (non PythonAnywhere). Da qui in poi, lavori sulla tua copia locale per fare le modifiche. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. Questo consente di lavorare e fare esperimenti senza rompere il tuo sito Web. Bello, vero?

Dà a te stessa un' *ENORME* pacca sulla schiena! Il deploy dei server è tra le parti più complicate dello sviluppo web e di solito le persone ci impiegano svariati giorni prima di farli funzionare. Ma hai pubblicato il tuo sito su Internet senza sforzo!