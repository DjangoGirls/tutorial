# Déployer!

> **Note** Le chapitre suivant peut-être un peu difficile à comprendre. Accrochez-vous et allez jusqu'au bout : le déploiement fait partie intégrale du processus de développement d'un site internet. Ce chapitre a été placé au milieu du tutoriel afin de permettre à votre coach de vous aider dans cette étape un peu compliquée qu'est la mise en ligne de votre site. Si jamais vous manquez de temps à la fin de la journée, ne vous inquiétez pas ! Une fois ce chapitre terminé, vous serez en mesure de finir le tutoriel chez vous :)

Jusqu'à maintenant, votre site web est uniquement disponible sur votre ordinateur. Maintenant, vous allez apprendre à déployer! Déployer signifie mettre en ligne votre site pour que d'autres personnes puissent enfin voir votre app. :)

Comme vous l'avez appris, un site web a besoin d'être installé sur un serveur. Il existe de nombreux fournisseurs de serveurs disponibles sur Internet, nous les utiliserons [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere gratuit pour les petites applications qui n'ont pas trop de visiteurs, il sera certainement suffisant pour vous maintenant.

Nous allons aussi utiliser les services [GitHub](https://www.github.com), ce qui nous permettra d'héberger notre code en ligne. Il existe d'autres entreprises qui proposent des services similaires. Cependant, presque tous⋅tes les développeurs·ses possèdent aujourd'hui un compte Github et, dans quelques instants, vous aussi !

Ces trois endroits sont importants pour vous. Votre ordinateur local est l'endroit où vous faites de développement et de test. Lorsque vous êtes heureux avec les changements, vous aurez une copie de votre programme sur GitHub. Votre site sera en PythonAnywhere et vous le mettrez à jour en obtenant une copie de votre nouveau code de GitHub.

# Git

> **noter** Si vous avez déjà effectué les étapes d'installation, vous n'avez plus besoin de le faire - vous pouvez passer à la section suivante et commencer à créer votre référentiel Git.

{% include "/deploy/install_git.md" %}

## Démarrer un dépôt Git

Git conserve toutes les modifications apportées à un ensemble de fichiers dans un "repository" (ou "dépôt"). Nous allons devoir en créer un pour notre projet. Ouvrez votre terminal et allez dans le répertoire `djangogirls`. Ensuite, tapez les commandes suivantes :

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. Vous devriez vous trouver dans le dossier `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialise un dépôt Git vide à l'emplacement ~/djangogirls/.git/
    $ git config --global user.name "Votre nom"
    $ git config --global user.email you@exemple.com
    

L'initialisation d'un dépôt git est quelque chose que nous avons besoin de faire une seule fois par projet (et vous n'avez pas besoin de ressaisir ce nom d'utilisateur et d'envoyer un nouveau courriel).

Git va surveiller et conserver les modifications concernant l'ensemble des fichiers et dossiers présents dans ce répertoire, à l'exception de certains fichiers que nous aimerions exclure. Pour cela, nous allons créer un fichier appelé `.gitignore` dans le répertoire principal du projet. Ouvrez votre éditeur et créez un nouveau fichier en copiant le contenu suivant :

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

And save it as `.gitignore` in the "djangogirls" folder.

> **Attention** : le point au début du nom du fichier est important ! Si vous avez des difficultés à le faire (Mac n'aime pas que vous créiez des fichiers commençant par un point dans le Finder, par exemple), utilisez la fonction "Enregistrer sous" dans votre éditeur; c'est à l'épreuve des balles.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. Ce fichier est votre base de données locale, où tous vos articles sont stockés. Nous ne souhaitons pas l'ajouter à votre référentiel car votre site dans PythonAnywhere utilisera une base de données différente. La basis de données pourrait être SQLite, comme votre moteur de développement, mais vous utiliseriez généralement un MySQL qui pourrait gérer plus de visiteurs que SQLite. De toute façon, en ignorant votre base de données SQLite pour le GitHub de copie, cela signifie que tous les messages que vous avez créé jusqu'à présent vont y rester et ne sera disponible localement, mais vous allez avoir à ajouter de nouveau sur la production. Vous devriez penser à votre base de données locale comme un terrain de jeux où vous pouvez tester différentes choses et ne pas avoir peur de ce que vous allez supprimer votre réel les messages à partir de votre blog.

Avant de taper la commande `git add` ou lorsque vous ne vous souvenez plus des changements que vous avez effectué dans votre projet, pensez à taper la commande `git status`. Cela aidera à prévenir toute surprise de se produire, tels que les mauvais fichiers ajoutés ou engagés. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. La sortie doit être semblable au suivant:

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
    

Pour le moment, nous n'avons fait que regarder l'état de notre branche. Pour enregistrer nos changements, nous allons devoir taper les commandes suivantes :

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
    
    Then, create a new repository, giving it the name "my-first-blog". Laissez la case "initialisation avec README" décochée, laissez l'option .gitignore vide (nous l'avons fait manuellement) et laissez la Licence en tant que Aucune.
    
    <img src="images/new_github_repo.png" />
    
    > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. Il peut être plus facile de coller avec le nom `my-first-blog`.
    
    Sur l'écran suivant, vous verrez l'URL de votre clone de repo. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Now we need to hook up the Git repository on your computer to the one up on GitHub.
    
    Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': ola Password for 'https://ola@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/ola/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Allez jeter un coup d’œil !  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    ## Sign up for a PythonAnywhere account
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Configuring our site on PythonAnywhere
    
    Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application.  There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pip3.6 install --user pythonanywhere

    <br />That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.
    
    Maintenant, nous exécutez l'assistant pour configurer automatiquement votre application à partir de GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git

    <br />As you watch that running, you'll be able to see what it's doing:
    
    - Downloading your code from GitHub
    - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
    - Updating your settings file with some deployment settings
    - Setting up a database on PythonAnywhere using the `manage.py migrate` command
    - Setting up your static files (we'll learn about these later)
    - And configuring PythonAnywhere to serve your web app via its API
    
    On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.  The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
    
    As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ python manage.py createsuperuser

    <br />Saisissez les détails de votre compte d'utilisateur admin.  Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
    
    Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). Voir si il y a des messages d'erreur tout en là; les plus récents sont en bas.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

Et rappelez-vous, votre coach est là pour vous aider!

# Check out your site!

La page par défaut de votre site doit dire "Ça marche!", comme il le fait sur votre ordinateur local. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Connectez-vous avec le nom d'utilisateur et le mot de passe, et vous verrez que vous pouvez ajouter de nouveaux Messages sur le serveur.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). De là, vous devez travailler sur votre installation locale pour apporter des modifications. Il s'agit d'un flux de travail dans le développement web – apporter des modifications localement, pousser ces modifications sur GitHub, et tirez vos modifications en bas de votre serveur Web. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!