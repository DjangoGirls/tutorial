# Veröffentlichen!

> **Hinweis:** Durch das folgende Kapitel muss man sich manchmal durchbeißen. Bleib dran und gib nicht auf; die Website zu veröffentlichen ist ein sehr wichtiger Schritt. Dieses Kapitel ist in der Mitte des Tutorials platziert, damit dir dein Mentor mit dem etwas anspruchsvolleren Vorgang der Veröffentlichung deiner Website helfen kann. Den Rest des Tutorials kannst du dann auch alleine beenden, sollte die Zeit nicht ausreichen.

Bis jetzt war deine Webseite nur auf deinem Computer verfügbar. Jetzt wirst du lernen wie du sie 'deployst'! Deployen bedeutet, dass du deine Anwendung im Internet veröffentlichst, so dass endlich jeder darauf zugreifen kann. :)

Wie du schon gelernt hast, muss eine Webseite auf einem Server liegen. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

Als weiteren externen Dienst werden wir [GitHub](https://www.github.com) nutzen, einen "Code Hosting"-Dienst. Es gibt noch andere solcher Dienste, aber die meisten Programmierer haben heute ein Konto bei GitHub, und du gleich auch!

Diese drei Orte werden für dich wichtig sein. Die Entwicklung und das Testing wirst du auf deinem lokalen Rechner durchführen. Wenn du mit deinen Änderungen zufrieden bist, wirst du eine Kopie deines Programms auf GitHub veröffentlichen. Deine Website wird auf PythonAnywhere gehostet werden. Ändern kannst du sie, indem du eine neue Version deines Codes von GitHub herunter lädst.

# Git

> **Note** If you already did the Installation steps, there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Unser Git-Repository

Git verwaltet die Veränderungen an einer Sammlung von Dateien in einem sogenannten Repository (oder kurz "Repo"). Legen wir eines für unser Projekt an. Öffne deine Konsole und gibt folgende Kommandos im `djangogirls`-Verzeichnis ein:

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. Du musst dich im `djangogirls`-Verzeichnis befinden, bevor du fortfährst.

{% filename %}command-line{% endfilename %}

    $ git init 
    Initialized empty Git repository in ~/djangogirls/.git/ 
    $ git config --global user.name "Dein Name" 
    $ git config --global user.email du@beispiel.com
    

Initializing the git repository is something we need to do only once per project (and you won't have to re-enter the username and email ever again).

Git wird die Änderungen an all den Dateien und Ordnern in diesem Verzeichnis aufzeichnen. Wir wollen aber, dass einige Dateien ignoriert werden. Dazu legen wir eine Datei `.gitignore` im Basisverzeichnis des Repos an. Öffne deinen Editor und erstelle eine neue Datei mit dem folgenden Inhalt:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

And save it as `.gitignore` in the "djangogirls" folder.

> **Hinweis:** Der Punkt vor dem Dateinamen ist wichtig! If you're having any difficulty creating it (Macs don't like you to create files that begin with a dot via the Finder, for example), then use the "Save As" feature in your editor; it's bulletproof.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. That file is your local database, where all of your posts are stored. We don't want to add this to your repository because your website on PythonAnywhere is going to be using a different database. That database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts you created so far are going to stay and only be available locally, but you're going to have to add them again on production. You should think of your local database as a good playground where you can test different things and not be afraid that you're going to delete your real posts from your blog.

Es ist hilfreich den Befehl `git status` vor `git add` auszuführen oder immer dann, wenn du dir unsicher bist, was geändert wurde. This will help prevent any surprises from happening, such as wrong files being added or committed. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. Deine Ausgabe sollte dem hier ähneln:

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
    

Nun speichern wir unsere Änderungen durch folgende Eingabe in der Konsole:

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
    
    Your code is now on GitHub. Schau gleich mal nach!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Lass uns den Code von GitHub auf PythonAnywhere übertragen, indem wir einen "Klon" unseres Repositorys erzeugen. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

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
    

This file's job is to tell PythonAnywhere where our web app lives and what the Django settings file's name is.

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. Wir werden später im Tutorial ein wenig mehr über statische Dateien erfahren, wenn wir das CSS für unsere Seite bearbeiten.

Klicke auf **Save** und gehe dann zu dem **Web**-Tab zurück.

Wir sind fertig! Drücke auf den großen, grünen **Reload**-Knopf und du kannst dir deine Applikation anschauen. Du findest einen Link zu ihr oben auf der Seite.

## Debugging Tipps

Falls du beim Versuch deine Seite zu besuchen, einen Fehler siehst, ist der erste Ort, an dem man nach Debugging-Infos schauen sollte, dein **error log**. Einen Link dazu findest du auf dem PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). Schau nach, ob Fehlermeldungen enthalten sind; die neuesten findest du unten. Häufige Probleme sind:

- Forgetting one of the steps we did in the console: creating the virtualenv, activating it, installing Django into it, migrating the database.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Hast du die selbe Pythonversion für dein virtualenv gewählt wie für deine Web-App? Beide sollten 3.6 sein.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

Und denk dran, dein Coach ist da, um dir zu helfen!

# Du bist live!

The default page for your site should say "It worked!", just like it does on your local computer. Versuch `/admin/` am Ende der URL hinzuzufügen und du gelangst zur Adminseite. Melde dich mit deinen Benutzernamen und Passwort an. Wie du siehst, kannst du neue Posts auf dem Server hinzufügen.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Ziemlich cool, oder?

Klopf dir *kräftig* auf die Schulter! Das Deployment ist eines der kompliziertesten Dinge der Web-Entwicklung und es dauert oftmals mehrere Tage, bis alles läuft. Aber du hast deine Site jetzt live, im echten Internet, einfach so!