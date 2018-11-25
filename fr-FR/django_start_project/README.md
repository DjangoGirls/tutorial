# Votre premier projet Django !

> Une partie de ce chapitre s’inspire du tutoriel des Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Des morceaux de ce chapitre sont inspirés du [tutoriel django-marcador](http://django-marcador.keimlink.de/), disponible sous licence Creative Commons Attribution-ShareAlike 4.0 International. Le tutoriel django-marcador a été créé par Markus Zapke-Gründemann et al.

Nous allons créer un petit blog !

La première étape consiste à démarrer un nouveau projet Django. En gros, cela veut dire que nous allons lancer quelques scripts fournis par Django qui vont créer un squelette de projet Django. Il s'agit de fichiers et de dossiers que nous utiliserons par la suite.

Il y existe certains fichiers et dossiers dont les noms sont extrêmement importants pour Django. Il ne faut pas renommer les fichiers que nous sommes sur le point de créer. Ce n'est pas non plus une bonne idée de les déplacer. Django a besoin de maintenir une certaine structure pour retrouver les éléments importants.

> N'oubliez pas de tout exécuter dans votre virtualenv. Si vous ne voyez pas le préfixe `(myvenv)` dans votre console, vous avez besoin d'activer votre virtualenv. Nous vous avons expliqué comment faire ça dans le chapitre **Installation de Django**, dans la partie **Travailler avec virtualenv**. Tapez `myvenv\Scripts\activate` dans votre console Windows ou `source myvenv/bin/activate` dans celle de Mac OS ou Linux afin d'activer votre virtualenv.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Retournons à la création de notre premier projet. Tapez la commande suivant dans votre console MacOS ou Linux. **N'oubliez pas le point `.`à la fin !**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Le point `.` est très important : c'est lui qui permet de dire au script d'installer Django dans votre répertoire courant (le point `.` est une référence abrégée à celui-ci).
> 
> **Note** : lorsque vous tapez la commande précédente dans votre console, vous ne devez recopier que la partie qui commence par `django-admin`. La partie `(myvenv) ~/djangogirls$` montrée ici n'est qu'un exemple pour vous rappeler de taper la commande dans votre console.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Sur Windows, vous devez taper la commander suivante. ** (N'oubliez pas le point `.` à la fin) ** :

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Le point `.` est très important : c'est lui qui permet de dire au script d'installer Django dans votre répertoire courant (le point `.` est une référence abrégée à celui-ci).
> 
> **Note** : lorsque vous tapez la commande précédente dans votre console, vous ne devez recopier que la partie qui commence par `django-admin.exe`. La partie `(myvenv) C:\Users\Name\djangogirls>` montrée ici n'est qu'un exemple pour vous rappeler de taper la commande dans votre console.

<!--endsec-->

`django-admin.py` est un script qui crée les dossiers et fichiers nécessaires pour vous. Vous devriez maintenant avoir une structure de dossier qui ressemble à celle-ci:

    djangogirls
    ├───manage.py
    ├───mysite
    │        settings.py
    │        urls.py
    │        wsgi.py
    │        __init__.py
    └───requirements.txt
    

> **Note** : dans votre structure de dossier, vous pourrez voir également le répertoire `venv` que nous avons créé avant.

`manage.py` est un script qui aide à gérer ou maintenir le site. Entre autres, il permet notamment de lancer un serveur web sur notre ordinateur sans rien installer d'autre.

Le fichier `settings.py` contient la configuration de votre site web.

Vous vous souvenez de l'histoire du postier qui livre des lettres ? `urls.py` contient une liste de patterns d'urls utilisés par `urlresolver`.

Ignorons les autres fichiers pour l'instant, nous n'allons pas avoir besoin d'y toucher. La seule chose à retenir est qu'il ne faut pas les supprimer par accident !

## Changer la configuration

Apportons quelques changements à `mysite/settings.py`. Ouvrez le fichier avec l'éditeur de code que vous avez installé tout à l'heure.

**Note** : Gardez à l’esprit que `settings.py` est un fichier ordinaire, comme les autres. Vous pouvez l’ouvrir depuis l’éditeur de code, en cliquant sur « file-> open » dans le menu. This should get you the usual window in which you can navigate to your `settings.py` file and select it. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

Ça serait sympa d'avoir l'heure correcte sur notre site Web. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

In `settings.py`, find the line that contains `TIME_ZONE` and modify it to choose your own timezone. For example:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

We'll also need to add a path for static files. (We'll find out all about static files and CSS later in the tutorial.) Go down to the *end* of the file, and just underneath the `STATIC_URL` entry, add a new one called `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

When `DEBUG` is `True` and `ALLOWED_HOSTS` is empty, the host is validated against `['localhost', '127.0.0.1', '[::1]']`. This won't match our hostname on PythonAnywhere once we deploy our application so we will change the following setting:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Note**: If you're using a Chromebook, add this line at the bottom of your settings.py file: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9

## Set up a database

Il existe tout un tas de systèmes de gestion de bases de données qu'il est possible d'utiliser pour stocker les données de votre site. Nous allons va utiliser celui par défaut : `sqlite3`.

Il est déjà configuré dans cette partie de votre fichier `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Pour créer la base de donnée de notre blog, il faut lancer la commande suivante dans la console : `python manage.py migrate` (vous avez besoin d'être dans le dossier `djangogirls` qui contient le fichier `manage.py`). Si tout se passe bien, vous devriez voir quelque chose comme ça:

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
    

Et voilà ! Il ne reste plus qu'à lancer le serveur et voir si notre site web fonctionne !

## Starting the web server

Pour cela, vous avez besoin d'être dans le dossier qui contient le fichier `manage.py` (le dossier `djangogirls`). Dans votre console, vous pouvez lancer le serveur en tapant `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Si vous utilisez Windows et que vous obtenez l'erreur `UnicodeDecodeError`, tapez plutôt cette commande :

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Bravo ! Vous venez de créer votre premier site web, et de le lancer avec un serveur web ! C'est génial, non?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv. To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Prête pour la suite ? Il est temps de créer du contenu!