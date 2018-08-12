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

> **Note** : n'oubliez pas de vérifier dans quel répertoire vous vous trouvez avant d'initialiser votre dépôt. Pour cela tapez la commande `pwd` (OSX/Linux) ou `cd` (Windows). Vous devriez vous trouver dans le dossier `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialise un dépôt Git vide à l'emplacement ~/djangogirls/.git/
    $ git config --global user.name "Votre nom"
    $ git config --global user.email you@exemple.com
    

L'initialisation d'un dépôt git ne doit être faite qu'une seule fois par projet (et vous n'avez plus jamais besoin de re-saisir le nom d'utilisateur et adresse email).

Git va surveiller les modifications faites à tous les fichiers et dossiers présents dans ce répertoire, mais il y a certains fichiers que nous voudrions qu'il ignore. Pour cela, nous allons créer un fichier appelé `.gitignore` dans le répertoire principal du projet. Ouvrez votre éditeur et créez un nouveau fichier en copiant le contenu suivant :

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

Enregistrez ce fichier sous le nom `.gitignore` dans votre répertoire principal "djangogirls".

> **Attention** : le point au début du nom du fichier est important ! Si vous avez des difficultés à le faire (les Macs n'aiment pas que vous créiez des fichiers commençant par un point dans le Finder, par exemple), utilisez la fonction "Enregistrer sous" dans votre éditeur; ça marche toujours.
> 
> **Remarque** un de fichiers que vous avez spécifié dans votre fichier `.gitignore` est `db.sqlite3`. Ce fichier est votre base de données locale, où tous vos articles sont stockés. Nous ne souhaitons pas l'ajouter à votre dépôt car votre site sur PythonAnywhere utilisera une base de données différente. Cette base de données pourrait être de type SQLite, comme sur votre version de développement, mais on utiliserait plutôt une BDD de type MySQL qui peut gérer un plus grand nombre de visiteurs que SQLite. Dans tous les cas, parce que vous votre base de données SQLite est ignorée pour l'archivage sur GitHub, tous les messages que vous avez créé jusqu'à maintenant ne seront accessibles que localement, et vous devrez les ajouter de nouveau en production. Vous devriez penser à votre base de données locale comme un terrain de jeux où vous pouvez tester différentes choses et ne pas avoir peur de supprimer vos messages réels sur votre blog.

C'est une bonne idée d'utiliser la commande `git status` avant `git add` ou dès que vous n'êtes plus sûr de ce qui a changé dans le projet. Cela vous évitera des surprises comme ajouter ou envoyer un mauvais fichier. La commande `git status` permet d'obtenir des informations sur tous les fichiers non-suivis/modifiés/ajoutés, l'état de la branche, et bien plus encore. La commande devrait renvoyer ceci:

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
    

Et pour finir, nous allons enregistrer nos modifications. Tapez ces commandes dans votre terminal:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "Mon app Django Girls, premier commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Publier votre code sur GitHub

Allez sur [GitHub.com](https://www.github.com) et inscrivez-vous gratuitement (si vous possédez déjà un compte, c'est parfait!)

Ensuite, créez un nouveau dépôt en lui donnant le nom "my-first-blog". Laissez la case "initialisation avec README" décochée, laissez l'option .gitignore vide (nous l'avons fait manuellement) et laissez la Licence en tant que Aucune.

![](images/new_github_repo.png)

> **Note** : dans le cadre de ce tutoriel, le nom `my-first-blog` est très important. Cependant, vous êtes libre de le changer mais, attention : à chaque fois que ce nom apparaîtra dans le tutoriel, vous allez devoir le remplacer par le nom que vous avez choisi. Il est probablement plus simple de garder le nom `my-first-blog` pour cette fois.

La page suivante vous donne l'URL qui va vous permettre de cloner votre dépôt. Choisissez la version « HTTPS » et copiez l'URL car nous allons rapidement en avoir besoin :

![](images/github_get_repo_url_screenshot.png)

Nous avons maintenant besoin de relier nos deux dépôts ("hook" en anglais) : celui sur notre ordinateur et celui sur GitHub.

Tapez les instructions suivantes dans votre console (remplacez `<your-github-username>` avec le nom d'utilisateur de votre compte GitHub et sans les chevrons "<" et ">") :

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Entrez votre nom d'utilisateur et mot de passe Github. Vous devriez voir quelque chose comme cela :

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': ola
    Password for 'https://ola@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Votre code est maintenant sur GitHub. Allez jeter un coup d’œil ! Votre code est maintenant au même endroit que d'autres projets super cool : [Django](https://github.com/django/django), [le tutoriel Django Girls](https://github.com/DjangoGirls/tutorial) et les nombreux autres projets libres qui sont hébergés sur GitHub. :)

# Mettre votre blog en ligne avec PythonAnywhere

## Créez votre compte utilisateur sur PythonAnywhere

> **Note** Vous avez peut être déjà créé un compte PythonAnyWhere au cours de la phase d'installation - si c'est le cas, inutile de le refaire.

{% include "/deploy/signup_pythonanywhere.md" %}

## Configurer votre site sur PythonAnywhere

Allez sur le [Panneau de Contrôle de PythonAnywhere](https://www.pythonanywhere.com/) en cliquant sur le logo, et choisissez l'option de démarrer un terminal "Bash". C'est comme votre terminal à vous, mais chez PythonAnywhere.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Note** : PythonAnywhere utilise Linux. Si vous êtes sous Windows, la console sera un peu différente de celle de votre ordinateur.

Pour déployer une application sur PythonAnywhere, vous devez y télécharger votre code depuis GitHub, puis configurer PythonAnywhere pour qu'il la reconnaisse et commence à la faire tourner en tant qu'application web. Cela peut se faire de façon manuelle, mais PythonAnywhere fourni un outil qui va tout faire pour vous. Commençons par l'installer:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Vous devriez voir quelque chose comme `Collecting pythonanywhere`, et au bout d'un moment une dernière ligne disant `Successfully installed (...) pythonanywhere-(...)`.

Maintenant, nous exécutez l'assistant pour configurer automatiquement votre application à partir de GitHub. Tapez la commande suivante dans la console de PythonAnywhere (n'oubliez pas d'utiliser votre nom d'utilisateur Github à la place de `<your-github-username>`):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

En regardant la commande s'exécuter, vous devriez voir ce qui ce passe:

- Téléchargement de votre code depuis GitHub
- Création d'un virtualenv chez PythonAnywhere, comme celui sur votre propre PC
- Mise à jour de votre fichier de paramètres avec des paramètres de déploiement
- Mise en place d’une base de données sur PythonAnywhere en utilisant la commande `manage.py migrate`
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.

As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Vous avez oublié de créer votre jeton d'API PythonAnywhere.
- Faites une erreur dans votre URL GitHub
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Regardez à nouveau la section Git ci-dessus

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!