# Déployer!

> **Note** Le chapitre suivant peut-être parfois un peu difficile à comprendre. Accrochez-vous et allez jusqu'au bout. Le déploiement fait partie intégrale du processus de développement d'un site internet. Nous avons décidé de placer ce chapitre au milieu du tutoriel afin que votre coach puisse vous aider dans cette tâche compliquée qu'est la mise en ligne d'un site web. Ça signifie que vous serez capable de finir le tutoriel par vous-même plus tard si jamais vous êtes à court de temps à la fin de la journée.

Jusqu'à présent, votre site Internet était seulement disponible sur votre ordinateur. Maintenant, vous allez apprendre à le déployer! Déployer signifie mettre en ligne votre site pour que d'autres personnes puissent enfin voir votre app :).

Comme vous l'avez appris, un site web a besoin d'être installé sur un serveur. Il existe de nombreux fournisseurs. Nous allons utiliser celui qui possède le processus de déploiement le plus simple: [Heroku][1]. Heroku est gratuit pour les petits sites qui n'ont pas beaucoup de visiteurs, ce qui devrait vous convenir pour le moment.

 [1]: http://heroku.com/

Nous allons suivre ce tutoriel: https://devcenter.heroku.com/articles/getting-started-with-django. Nous l'avons reproduit (et traduit!) ici pour que cela soit plus simple pour vous.

## Le fichier `requirements.txt`

Le fichier `requirements.txt` permet de communiquer à Heroku la liste des paquets Python qui ont besoin d'être installés sur le serveur qui hébergera votre site.

Mais avant de créer ce fichier, nous avons besoin d'installer quelques paquets sur Heroku. Reprenez votre console, vérifiez que `virtualenv` est bien activé, puis tapez ceci:

    (myvenv) $ pip install dj-database-url waitress whitenoise
    

Une fois l'installation terminée, allez dans le dossier `djangogirls` et tapez cette commande:

    (myvenv) $ pip freeze > requirements.txt
    

Cette commande va créer le fichier `requirements.txt` qui contiendra la liste de tous les paquets Python que vous avez installés, c'est-à-dire toutes les librairies Python que vous utilisez, comme Django par exemple :).

> **Note**: `pip freeze` va lister toutes les librairies Python installées dans votre virtualenv tandis que `>` va se charger de mettre cette liste dans un fichier. Essayez de lancer `pip freeze` sans `> requirements.txt` et regardez ce qui se passe!

Ouvrez le fichier créé et ajoutez ceci à la fin:

    psycopg2==2.5.3
    

Vous avez besoin de cette dernière ligne pour que votre site web fonctionne sur Heroku.

## Procfile

Nous avons aussi besoin de créer un Procfile. Cela va permettre à Heroku de savoir quelles commandes lancer pour démarrer votre site web. Ouvrez votre éditeur de texte, créez un fichier `Procfile` dans le dossier `djangogirls` et ajoutez y la ligne suivante:

    web: waitress-serve --port=$PORT mysite.wsgi:application
    

Cela signifie que nous allons déployer une application `web` et que nous allons le faire en lançant la commande `waitress-serve --port=$PORT mysite.wsgi:application`. `waitress-serve` est un programme qui est une sorte de version plus puissante de la commande `runserver` de Django.

N'oubliez pas de sauvegarder votre fichier. Et voilà, c'est fait!

## Le fichier `runtime.txt`

Nous avons besoin de préciser à Heroku la version de Python que nous souhaitons utiliser. Pour cela, nous avons à nouveau besoin de créer un fichier dans le dossier `djangogirls`. Prenez votre éditeur de texte et créez le fichier `runtime.txt` qui contiendra ce tout petit bout de texte:

    python-3.4.2
    

## mysite/local_settings.py

Il existe une différence entre la configuration que nous utilisons localement (sur notre ordinateur) et la configuration utilisée sur notre serveur. Heroku utilise une base de données qui est différente de celle de votre ordinateur. Nous allons devoir créer un fichier de configuration différent qui ne sera utilisé que dans notre environnement local.

Créez le fichier `mysite/local_settings.py`. Il doit contenir la même chose que la configuration de la partie `DATABASE` de votre fichier `mysite/settings.py`. Ça doit ressembler à ceci:

    import os
    BASE_DIR = os.path.dirname(os.path.dirname(__file__))
    
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
    
    DEBUG = True
    

N'oubliez pas de sauvegarder votre fichier! :)

## mysite/settings.py

il va aussi falloir modifier le fichier `settings.py` de notre site web. Pour cela, ouvrez `mysite/settings.py` dans votre éditeur de texte et ajoutez les lignes suivantes à la toute fin du fichier:

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()
    
    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
    
    ALLOWED_HOSTS = ['*']
    
    STATIC_ROOT = 'staticfiles'
    
    DEBUG = False
    

Toujours à la fin du fichier `mysite/settings.py`, copier-coller ceci:

    try:
        from .local_settings import *
    except ImportError:
        pass
    

Si le fichier existe, cela va vous permettre d'importer l'intégralité de votre configuration locale.

Sauvegardez le fichier.

## mysite/wsgi.py

Ouvrez le fichier `mysite/wsgi.py` et ajoutez les lignes suivantes à la toute fin:

    from whitenoise.django import DjangoWhiteNoise
    application = DjangoWhiteNoise(application)
    

Hop, on enchaine!

## Se créer un compte sur Heroku

Pour continuer, vous allez devoir installer la toolbelt Heroku qui se trouve ici: https://toolbelt.heroku.com/. Vous pouvez passer cette partie si vous l'avez déjà installé avec votre coach.

> Lorsque vous lancez l'installation de la toolbelt d'Heroku sous Windows, n'oubliez pas de choisir "Custom Installation" (installation personnalisée) lorsque l'on vous demandera quels composants vous souhaitez installer. N'oubliez pas de cocher "Git and SSH" dans la liste des composants disponibles à l'installation.
> 
> Sous Windows, vous avez aussi besoin de lancer la commande suivante afin que Git et SSH soient ajoutés au `PATH` de votre prompt: `setx PATH "%PATH%;C:\Program Files\Git\bin"`. Relancez votre console afin que les changements soient pris en compte.

Il vous sera nécessaire de vous créer un compte gratuit sur Heroku. Vous pouvez le faire à cette adresse: https://id.heroku.com/signup/www-home-top

Ensuite, authentifiez votre compte Heroku sur votre ordinateur en lançant la commande suivante:

    $ heroku login
    

Si vous n'avez pas encore de clef SSH, cette commande va vous permettre d'en créer une automatiquement. Les clefs SSH sont obligatoires afin de pusher du code sur Heroku.

## Git

Git est un logiciel de gestion de versions décentralisé utilisé par de nombreux·ses programmeurs⋅ses. C'est un logiciel qui permet de garder un historique des changements d'un ou plusieurs fichiers: cela permet d'aller rechercher une version antérieure plus tard. Heroku utilise un repository git pour gérer les fichiers de votre projet. Nous allons donc devoir nous aussi l'utiliser.

Créez un fichier `.gitignore` dans votre dossier `djangogirls` et copiez y le contenu suivant:

    myvenv
    __pycache__
    staticfiles
    local_settings.py
    db.sqlite3
    

Sauvegardez ce fichier. Le point au début du nom de fichier est important! Comme vous pouvez le voir, nous disons à Heroku d'ignorer le fichier `local_settings.py` et de ne pas le télécharger. Il ne sera disponible que sur votre ordinateur (localement).

Ensuite, nous allons créer un nouveau repository git et sauvegarder nos changements. Prenez votre console et lancez les commandes suivantes:

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config user.name "Votre nom"
    $ git config user.email you@example.com
    

Initialiser le repository git est quelque chose qu'il est nécessaire de ne faire qu'une fois par projet.

Enfin, sauvegardons nos changements. Une nouvelle fois, prenez votre console et lancez les commandes suivantes:

    $ git add -A .
    $ git commit -m "My Django Girls app"
    [master (root-commit) 2943412] My Django Girls
     7 files changed, 230 insertions(+)
     create mode 100644 .gitignore
     create mode 100644 Procfile
     create mode 100644 mysite/__init__.py
     create mode 100644 mysite/settings.py
     create mode 100644 mysite/urls.py
     create mode 100644 mysite/wsgi.py
     create mode 100644 manage.py
     create mode 100644 requirements.txt
     create mode 100644 runtime.txt
    

## Trouver un nom à son application

Nous allons rendre votre blog accessible en ligne à l'adresse `[nom de votre blog].herokuapp.com`. Pour cela, il va être nécessaire de choisir un nom qui n'est pas encore pris. Ce nom n'a pas besoin d'être en lien avec l'application `blog` de Django, `mysite`, où n'importe quoi d'autre que nous avons pu créer jusqu'à présent. Vous pouvez choisir le nom que vous voulez, tant qu'il est conforme aux règles strictes définies par Heroku: pas de majuscules, pas d'accents, pas de nombres ni de tirets (`-`).

Si vous ne savez pas quoi prendre, pourquoi ne pas chercher quelque chose en rapport avec votre nom ou votre surnom? Une fois que vous avez choisi, lancez cette commande en remplaçant `djangogirlsblog` par le nom de votre application:

    $ heroku create djangogirlsblog
    

> **Note**: N'oubliez pas de remplacer `djangogirlsblog` avec le nom de votre application sur Heroku.

Si jamais vous n'avez vraiment pas d'idées de nom, vous pouvez lancer cette commande:

    $ heroku create
    

Heroku choisira alors un nom pour vous. Ce sera probablement quelque chose de l'ordre de `enigmatic-cove-2527`).

Si jamais vous avez envie de changer le nom de votre application Heroku, vous pouvez le faire facilement et quand vous voulez en tapant cette commande (n'oubliez pas de remplacer `the-new-name` par le nouveau nom que vous avez choisi):

    $ heroku apps:rename the-new-name
    

> **Note**: N'oubliez pas que lorsque vous aurez changer le nom de votre application, elle ne sera plus disponible à l'ancienne adresse, mais à `[the new name].herokuapp.com`.

## Déployer sur Heroku!

Nous venons de consacrer énormément de temps à configurer et à installer des choses mais rassurez vous, vous n'avez besoin de faire tout cela qu'une seule fois! Maintenant, nous allons enfin pouvoir passer au déploiement!

Lorsque vous lancez `heroku create`, Heroku est alors ajouté à la liste des repository distants. Par conséquent, nous n'avons plus qu'à faire un simple git push pour déployer notre application:

    $ git push heroku master
    

> **Note**: il est probable que cela produise *énormément* d'output (sortie) la première fois que vous lancez cette commande car Heroku va installer et compiler psycopg. Pour savoir si ça a marché, vous allez voir apparaitre `https://yourapplicationname.herokuapp.com/ deployed to Heroku` vers la fin de l'output.

## Consulter son application

Tout ce que vous venez de faire vous a permis de déployer votre code sur Heroku. Vous avez aussi spécifié le type de processus dans le fichier `Procfile`: rappelez vous, nous avons choisi le processus de type `web` tout à l'heure. Maintenant, nous pouvons dire à Heroku de lancer ce `processus web`.

Pour cela, tapez la commande suivante:

    $ heroku ps:scale web=1
    

Cela dit à Heroku de lancer une seule instance de notre processus `web`. Comme l'application blog que nous avons créée est relativement simple, nous n'avons pas besoin d'énormément de ressources. Un seul processus devrait faire l'affaire. Il est possible de demander à Heroku de lancer plusieurs processus (appelés "Dynos" sur Heroku) mais cette option est payante.

Maintenant, vous pouvez aller sur votre app dans votre navigateur à l'aide de la commande `heroku open`.

    $ heroku open
    

> **Note**: vous allez rencontrer une page d'erreur! Pas de soucis, nous allons y venir dans un instant.

Cette commande va ouvrir une url du type [https://djangogirlsblog.herokuapp.com/]() dans votre navigateur qui affichera une page d'erreur. Nous n'avons, pour l'instant, que créé l'interface d'administration de notre site. Essayez d'ajouter `admin/` à la fin de l'url ([https://djangogirlsblog.herokuapp.com/admin/]()). Cette page doit normalement fonctionner :)

L'erreur que vous venez de voir est liée au fait que lorsque nous avons déployé notre application sur Heroku, nous avons créé une base de données vide. Pour cela, nous avons besoin de lancer la commande ~~~ migrate~~~ comme lorsque nous avons démarré notre projet pour la première fois. Cela permettra de générer notre base de données correctement:

    $ heroku run python manage.py migrate
    
    $ heroku run python manage.py createsuperuser
    

Normalement, votre site web devrait maintenant pouvoir se charger dans votre navigateur! Félicitations! :)
