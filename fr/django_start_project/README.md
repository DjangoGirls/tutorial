# Votre premier projet Django!

> Note: ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (http://django.carrots.pl/).
> 
> Des morceaux de ce chapitre sont inspirés du [tutoriel django-marcador][1], disponible sous licence Creative Commons Attribution-ShareAlike 4.0 International. Le tutoriel django-marcador a été créé par Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

Nous allons créer un petit blog!

La première étape consiste à démarrer un nouveau projet Django. En gros, ça veut dire que nous allons lancer quelques scripts fournis par Django qui vont nous créer un squelette de projet Django (une poignée de fichiers qui vont nous être utiles).

Il y a certains fichiers et dossiers dont les noms sur extrêmement importants pour Django. Il ne faut pas renommer les fichiers que nous sommes sur le point de créer. Ce n'est pas non plus une bonne idée de les déplacer. Django a besoin de maintenir une certaine structure pour retrouver les éléments importants.

Dans une console, lancez ça (n'oubliez pas, pas besoin de taper `(myvenv) ~/djangogirls$`):

> N'oubliez pas de tout lancer dans le virtualenv. Si vous ne voyez pas le préfixe `(myvenv)` dans votre console, vous avez besoin d'activer votre virtualenv. Nous vous avons expliqué comment faire ça dans le chapitre **Installation de Django**, dans la partie **Travailler avec virtualenv**.

Lancer sous Windows:

    (myvenv) ~/djangogirls$ python myvenv\Scripts\django-admin.py startproject mysite .
    

ou sous Linux ou Mac OS:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> **Remarque**: N'oubliez pas le point (`.`) à la fin de la commande. Il est super important.

`django-admin` est un script qui créé les dossiers et fichiers nécessaires pour vous. Vous devriez maintenant avoir une structure de dossier qui ressemble à celle-ci:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

`manage.py` est un script qui aide à gérer le site. Il permet notamment de lancer un serveur web sur notre ordinateur sans rien installer d'autre.

Le fichier `settings.py` contient la configuration de votre site web.

Vous vous souvenez de l'histoire du postier qui livre des lettres? `urls.py` contient une liste de modèles d'urls utilisés par `urlresolver`.

Ignorons les autres fichiers pour l'instant, nous n'allons pas avoir besoin d'y toucher. Le seul truc aucun il faut faire attention est de ne pas les supprimer par accident!

## Changer la configuration

Apportons quelques changements à `mysite/settings.py`. Ouvrez le fichier avec l'éditeur de code que vous avez installé tout à l'heure.

Ce serait sympa d'avoir les bonnes heures sur notre site web. Allez voir sur http://en.wikipedia.org/wiki/List_of_tz_database_time_zones et copiez le bon fuseau horaire (timezone, TZ). (par exemple, `Europe/Berlin`)

Vous devriez trouver des lignes qui contiennent `USE_TZ` et `TIME_ZONE`. Modifiez-les pour qu'elles ressemblent à ça (en remplaçant `Europe/Berlin` par le bon fuseau horaire):

    USE_TZ = False
    TIME_ZONE = 'Europe/Berlin'
    

## Configuration de la base de données

Il existe tout un tas de systèmes de gestion de bases de données qu'on pourrait utiliser pour stocker les données de votre site. On va utiliser celui par défaut, `sqlite3`.

Il est déjà configuré dans ce morceau de votre fichier `mysite/settings.py`:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
    

Pour créer la base de donnée de votre blog, il fait lancer la commande suivante dans la console: `python manage.py migrate` (on a besoin d'être dans le dossier `djangogirls` qui contient le fichier `manage.py`). Si tout se passe bien, vous devriez voir quelque chose comme ça:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: admin, contenttypes, auth, sessions
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying sessions.0001_initial... OK
    

Et voilà! Il ne plus qu'à lancer le server et voir si le site web marche!

Pour ça, vous avez besoin d'être dans le dossier qui contient le fichier `manage.py` (le dossier `djangogirls`). Dans la console, vous pouvez lancer le serveur en tapant `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Ensuite, il ne vous reste plus qu'à vérifier que le site tourne. Ouvrez votre navigateur (Firefox, Chrome, Safari, Internet Explorer, ou n'importe quel autre), et entre l'adresse:

    http://127.0.0.1:8000/
    

Le serveur web remplace la ligne de commande tant que vous ne l’arrêtez pas. Pour pouvoir taper de nouvelles commandes, vous devez soit lancer une nouvelle fenêtre de terminal (et n'oubliez pas d'y activer votre virtualenv), ou arrêter le serveur web en sélectionnant la fenêtre de terminal et où tourne le serveur et en appuyant sur CTRL+C (Contrôle et C en même temps). Sous Windows, ça sera Ctrl+Arrêt défil.

Bravo! Vous venez de créer votre premier site web, et de le lancer avec un serveur web! C'est génial, non?

![Ça a marché!][2]

 [2]: images/it_worked2.png

Prête pour la suite? Il est temps de créer du contenu!
