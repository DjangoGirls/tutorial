# Déployer!

> **Note** Le chapitre suivant peut-être parfois un peu difficile à comprendre. Accrochez-vous et allez jusqu'au bout. Le déploiement fait partie intégrale du processus de développement d'un site internet. Nous avons décidé de placer ce chapitre au milieu du tutoriel afin que votre coach puisse vous aider dans cette tâche compliquée qu'est la mise en ligne d'un site web. Ça signifie que vous serez capable de finir le tutoriel par vous-même plus tard si jamais vous êtes à court de temps à la fin de la journée.

Jusqu'à présent, votre site Internet était seulement disponible sur votre ordinateur. Maintenant, vous allez apprendre à le déployer! Déployer signifie mettre en ligne votre site pour que d'autres personnes puissent enfin voir votre app :)

Comme vous l'avez appris, un site web a besoin d'être installé sur un serveur. Il existe de nombreux fournisseurs. Nous allons utiliser celui qui possède le processus de déploiement le plus simple: [PythonAnywhere][1]. PythonAnywhere est gratuit pour les petits sites qui n'ont pas beaucoup de visiteurs, ce qui devrait vous convenir pour le moment.

L'autre service externe que nous utiliserons est [GitHub][2], qui est un service d'hébergement de code. Il en existe d'autres, mais presque tous les programmeurs ont un compte GitHub aujourd'hui, et maintenant vous aussi!

Ces trois emplacement vous serons important. Votre ordinateur sera l'endroit ou vous développerez et testerez. Quand vous êtes satisfait·e des modifications, vous placerez une copie de votre programme sur GitHub. Votre site Internet sera sur PythonAnywhere et vous le mettrez à jour en récupérant une nouvelle copie de votre code depuis GitHub.

 [1]: http://pythonanywhere.com/
 [2]: http://www.github.com/

# Git

Git est un "logiciel de gestion de versions" (version control system, abrégé VCS) utilisé par un grand nombre de programmeurs. Ce logiciel permet de suivre les modifications des fichiers à travers le temps afin que vous puissiez rappeler des versions spécifiques ultérieurement. Un peu comme la fonctionnalité de "suivi des modifications" dans Microsoft Word, mais bien plus puissante.

## Installation de Git

<!-- **Note** Si vous avez déjà suivi l'étape d'Installation, il n'est pas utile de le refaire — vous pouvez sauter cette section et commencer à créer votre dépôt Git. -->

{% include "/deploy/install_git.md" %}




## Lancer notre dépôt Git

Git suit les modifications d'un ensemble de fichiers particuliers dans ce que l'on appelle un dépôt (repository, abrégé « repo »). Créons-en un pour notre projet. Ouvrez votre console et exécutez ces commandes, dans le répertoire `djangogirls` :

> **Note** Vérfiez votre répertoire courant à l'aide de la commande `pwd` (OSX/Linux) ou `cd` (Windows) avant d'initialiser le dépôt. Vous devriez être dans le répertoire `djangogirls`.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Votre nom"
    $ git config --global user.email vous@example.fr

L'initialisation du dépôt Git n'est nécessaire qu'une fois par projet (et vous n'aurez plus jamais à retaper votre nom et adresse).

Git suivra les modifications de tous les fichiers et dossiers dans ce répertoire, mais il y a des fichiers que l'on souhaite ignorer. Pour ce faire, on crée un fichier appelé `.gitignore` dans le répertoire de base. Ouvrez votre éditeur et créez un nouveau fichier avec le contenu suivant :

```
*.pyc
__pycache__
myvenv
db.sqlite3
/static
.DS_Store
```

Et enregistrez le sous `.gitignore` dans le dossier "djangogirls".

> **Note** Le point au début du nom du fichier est important ! Si vous rencontrez des difficultés à le créer (Mac n'aime pas que vous créiez des fichiers qui commencent par un point via Finder, par exemple), utilisez le fonction "Enregistrer sous" de votre éditeur, c'est du béton.

> **Note** Un des fichiers spécifiés dans votre fichier `.gitignore` est `db.sqlite3`. Ce fichier est votre base de données locale, où sont stockés tous vos posts. On ne veut pas l'ajouter au dépôt car votre site Internet sur PythonAnywhere utilisera une base de données différente. Cette base de données peut être SQLite, comme votre machine de développement, mais généralement, vous en utiliserez une appelée MySQL qui est capable de gérer un nombre beaucoup plus important de visiteurs que SQLite. Dans tous les cas, en omettant votre base de données SQLite de votre copie GitHub, tous les posts que vous aurez ajouté jusque là resteront et ne serons accessibles que localement, donc vous devrez les ajouter à nouveau en production. Vous dvriez voir votre base de données locale comme un bon terrain d'entraînement où vous pouvez essayer diverses choses sans avoir peur de supprimer vos posts réels de votre blog.

C'est une bonne idée d'utiliser la commande `git status` avant `git add` ou lorsque vous n'êtes pas certain·e de ce qui a changé. Ça permet d'éviter des suprises, comme l'ajout ou l'enregistrement de mauvais fichier. La commande `git status` renvoie des informations sur les fichiers non-suivis/modifiés/remis (untracked/modifed/staged), l'état de la branche, et bien plus. La sortie devrait ressembler à :

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

Enfin, on enregistre (commit) nos modifications. Allez dans votre console et tapez ces commandes :

    $ git add -A .
    $ git commit -m "Mon appli Django Girls, premier commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py


## Pousser notre code sur GitHub

Allez sur [GitHub.com][1] et créez vous un nouveau compte gratuit. <!-- (Si vous l'avez déjà fait pendant la préparation de l'atelier, c'est parfait !) -->

 [1]: http://www.github.com/

Ensuite, créez un nouveau dépôt (repository) et appelez le "mon-premier-blog". Laisse la case "initialiser avec un LisezMoi" (**initialise with a README**) décochée, laissez l'option .gitignore vierge (on a fait ça manuellement) et laissez la licence sur aucune.

<img src="images/new_github_repo.png" />

> **Note** Le nom `mon-premier-blog` est important — vous pourriez choisir quelque chose d'autre, cependant il va apparaître à des nombreuses reprises dans les instructions à venir et vous devriez le substituer à chaque fois. C'est sans doute plus simple de rester sur `mon-premier-blog`.

À l'écran suivant, vous disposerez de l'URL de clonage de votre dépôt. Choisissez la version "HTTPS", copiez-la, et on la collera dans la console d'ici peu :

<img src="images/github_get_repo_url_screenshot.png" />

Maintenant, on doit rattacher le dépôt Git sur votre ordinateur à celui sur GitHub.

Tapez ce qui suit dans votre console (remplacez `<votre-nom-d'utilisateur-GitHub>` par le nom d'utilisateur que vous avez entré lors de la création de votre compte GitHub, mais sans les chevrons) :

    $ git remote add origin https://github.com/<votre-nom-d'utilisateur-GitHub>/mon-premier-blog.git
    $ git push -u origin master

Entrez votre nom d'utilisateur et mot de passe GitHub et vous devriez voir quelque chose qui ressemble à ça :

    Username for 'https://github.com': DjangoGirls
    Password for 'https://DjangoGirls@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/DjangoGirls/mon-premier-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.

Votre code est désormais sur GitHub. Allez voir ! Vous verrez qu'il est bien entouré — [Django][1], le [Tutoriel Django Girls][2], et bien d'autres très bon projets open source hébergent aussi leur code sur GitHub :)

  [1]: https://github.com/django/django
  [2]: https://github.com/DjangoGirls/tutorial

# Mettre en place notre blog sur PythonAnywhere

> **Note** Il se peut que vous ayez déjà créer un compte PythonAnywhere au cours des étapes précédentes — si c'est le cas, inutile de le refaire.

{% include "/deploy/signup_pythonanywhere.md" %}

## Récupérer notre code sur PythonAnywhere

Une fois inscrit·e sur PythonAnywhere, vous serez amené·e vers votre tableau de bord ou page "Consoles". Choisissez l'option de démarrer une console "Bash" — c'est la version PythonAnywhere d'une console, juste comme celle sur votre ordinateur.

> **Note** PythonAnywhere est basé sur Linux donc si vous êtes sous Windows, la console sera légèrement différente de celle sur votre ordinateur.

Récupérons notre code depuis GitHub et sur PythonAnywhere en créant un "clone" de notre dépôt. Tapez les instructions suivantes dans la console sur PythonAnywhere (n'oubliez pas d'utiliser votre nom d'utilisateur GitHub à la place de `<votre-nom-d'utilisateur-GitHub>`) :

    $ git clone https://github.com/<votre-nom-d'utilisateur-GitHub>/mon-premier-blog.git

Ceci créera une copie de votre code sur PythonAnywhere. Vérifiez en tapant `tree mon-premier-blog`:

    $ tree mon-premier-blog
    mon-premier-blog/
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


### Créer un environnement virtuel sur PythonAnywhere

Comme sur votre propre ordinateur, vous pouvez créer un environnement virtuel sur PythonAnywhere. Dans la console Bash, tapez :

```
$ cd mon-premier-blog

$ virtualenv --python=python3.4 myvenv
Running virtualenv with interpreter /usr/bin/python3.4
[...]
Installing setuptools, pip...done.

$ source myvenv/bin/activate

(mvenv) $  pip install django whitenoise
Collecting django
[...]
Successfully installed django-1.8.2 whitenoise-2.0
```


> **Note** L'étape `pip install` peut prendre quelques minutes. Patience, patience ! Toutefois, si elle prend plus de 5 minutes, quelque chose ne va pas. Demandez à votre coach.


### Collecter les fichiers statiques.

Vous vous demandiez ce qu'était ce "whitenoise" ?  C'est un outil pour servir les fichiers dit "fichiers statiques". Les fichiers statiques sont les fichiers qui ne changent pas régulièrement ou n'exécutent pas de code de programmation, tels que les fichiers HTML et CSS. Ils fonctionnent différemment sur les serveurs par comparaison à notre propre ordinateur et il nous faut un outil tel que "whitenoise" pour les servir.

On en découvrira un peu plus sur les fichiers statiques plus tard dans ce tutoriel, lorsqu'on modifiera le CSS pour notre site.

Pour l'instant, on a juste besoin de lancer une commande supplémentaire appelée `collectstatic`, sur le serveur. Ceci indique à Django de collecter tous les fichiers statiques dont il a besoin sur le serveur. Pour l'instant, c'est essentiellement des fichiers servant à rendre le site administrateur joli.

    (mvenv) $ python manage.py collectstatic

    You have requested to collect static files at the destination
    location as specified in your settings:

        /home/edith/mon-premier-blog/static

    This will overwrite existing files!
    Are you sure you want to do this?

    Type 'yes' to continue, or 'no' to cancel: yes

Tapez "yes", et c'est parti ! Est-ce que c'est pas génial de faire imprimer des pages et des pages de texte impénétrable ? Je fais toujours des petits bruits pour aller avec. Brp, brp brp...

    Copying '/home/edith/mon-premier-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/mon-premier-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/mon-premier-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/mon-premier-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/mon-premier-blog/static'.


### Créer la base de données sur PythonAnywhere

Voilà encore quelque chose de différent entre votre ordinateur et le serveur : il utilise une base de données différente. Comme ça les comptes utilisateurs et les posts peuvent être différents sur le serveur et sur votre ordinateur.

On peut initialiser la base de données sur le serveur de la même manière qu'on l'avait fait sur votre propre ordinateur, à l'aide de `migrate` et de `createsuperuser` :


    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK


    (mvenv) $ python manage.py createsuperuser


## Publier notre blog comme qu'appli web

Désormais notre code se trouve sur PythonAnywhere, notre environnement virtuel est prêt, les fichiers statiques sont collectés et la base de données est initialisée. On est prêt à le publier comme appli web !

Retourner au tableau de bord PythonAnywhere and cliquant sur son logo et allez dans l'onglet **Web**. Enfin, cliquez sur "Ajouter une nouvelle appli web" (**Add a new web app**).

Après avoir confirmé votre nom de domaine, choisissez la configuration manuelle (**manual configuration**) (N.B. *pas* l'option "Django") dans la boîte de dialogue. Ensuite, choisissez **Python 3.4** et cliquez sur Suivant (**Next**) pour terminer.

> **Note** Assurez-vous de bien choisir l'option "Manual configuration", pas la "Django". On est trop cool pour l'installation Django par défaut de PythonAnywhere ;-)


### Régler l'environnement virtuel

Vous serez amené·e à l'interface PythonAnywhere de configuration de votre appli web, c'est là que vous devrez vous rendre lorsque vous voudrez appliquer des changements à l'appli sur le serveur.


<img src="images/pythonanywhere_web_tab_virtualenv.png" />

Dans la section "Virtualenv", cliquez sur le texte rouge qui lit "Entrez le chemin vers un environnement virtuel" (**Enter the path to a virtualenv**), et entrez :  `/home/<votre-nom-d'utilisateur>/mon-premier-blog/myvenv/`. Cochez la case bleue pour enregistrer le chemin avant de passer à la suite.

> **Note** Remplacez votre nom d'utilisateur comme il se doit. Si vous vous trompez, PythonAnywhere vous affichera un petit avertissement.


### Configurer le fichier WSGI

Django fonctionne à l'aide du "protocole WSGI" (WSGI protocol), un standard pour servir des sites web en Python, ce que supporte PythonAnywhere. Afin que PythonAnywhere reconnaisse notre blog Django, il nous faut éditer un fichier de configuration WSGI.

Cliquez sur le "fichier de configuration WSGI" (**WSGI configuration file**, dans la section "Code" près du haut de la page — il s'appelera quelque chose comme `/var/www/<votre-nom-d'utilisateur>_pythonanywhere_com_wsgi.py`), et vous serez amené·e vers un éditeur.

Supprimez tout son contenu et remplacez le par quelque chose ressemblant à ça :

```python
import os
import sys

path = '/home/<votre-nom-d'utilisateur>/mon-premier-blog'  # utilisez votre nom d'utilisateur ici
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Note** N'oubliez pas de remplacer par votre nom d'utilisateur où il est indiqué `<votre-nom-d'utilisateur>`

Le rôle de ce fichier est d'indiquer à PythonAnywhere où réside notre appli web et comment s'appelle le fichier de configuration Django. Il met aussi en place l'outil pour fichiers statiques "whitenoise".

Cliquez sur "Enregistrer" (**Save**) et retournez dans l'onglet **Web**.

Fini ! Cliquez sur le gros bouton vers "Recharger" (**Reload**) et vous pourrez visualiser votre application. Vous trouverez un lien vers cette-dernière en haut de la page.


## Conseils de débogage

Si vous rencontrez une erreur lorsque vous consultez votre site, le premier endroit où aller chercher des informations de débogage est dans votre "registre d'erreur" (**error log**). Vous trouverez un lien dans l'onglet [Web][1] de PythonAnywhere vous permettant d'y accéder. Regardez s'il y a des messages d'erreur ; les plus récents se trouvent à la fin. Les problèmes les plus courants comprennent :

  [1]: https://www.pythonanywhere.com/web_app_setup/

- Oublier une des étapes que l'on a réalisé dans la console : créer l'environnement virtuel, l'activer, y installer Django, lancer `collectstatic`, migrer la base de données.

- Faire une erreur dans le chemin de l'environnement virtuel dans l'onglet Web — il y aura généralement un petit message d'erreur rouge s'il y a un problème.

- Faire une erreur dans le fichier de configuration WSGI — est-ce que le chemin vers le dossier mon-premier-blog est correct ?

- Avez-vous choisi la même version de Python pour votre environnement virtuel que pour votre appli web ? Les deux devraient être 3.4.

- Vous trouverez des informations de débogage générales sur le [wiki PythonAnywhere][1] (en Anglais).

  [1]: https://www.pythonanywhere.com/wiki/DebuggingImportError

Et souvenez vous, votre coach est là pour vous aider !


# Vous êtes prêt·e !

La page par défaut de votre site devrait désormais indiquer "Welcome to Django", comme il le fait sur votre ordinateur local. Essayez d'ajouter `/admin/` à la fin de l'URL, vous serez amené·e sur le site d'administration. Connectez-vous avec votre nom d'utilisateur et mot de passe, vous verrez que vous pouvez ajouter de nouveaux posts sur le serveur.


Prenez le temps de vous faire un **ÉNORME** compliment ! Les déploiements de serveurs sont une des parties les plus délicates du développement web et il faut souvent plusieurs jours aux gens pour y arriver. Mais vous avez mis votre site en ligne, sur le véritable Internet, juste comme ça !
