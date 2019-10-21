# Tvůj první Django projekt!

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parts of this chapter are based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. Ochranou známku pro Django-marcador drží Markus Zapke-Gründemann et al.

We're going to create a small blog!

Prvním krokem je začít s novým projektem Django. V podstatě to znamená, že budeš spouštět některé skripty z Django, které vytvoří kostru Django projektu pro tebe. To je jen halda adresářů a souborů, které budeme později používat.

Názvy některých souborů a adresářů jsou pro Django velmi důležité. Neměla by jsi přejmenovávat soubory, které vytvoříme. Přesouvat je na jiné místo také není dobrý nápad. V Django je třeba zachovat určitou strukturu, aby jsme mohli najít důležité věci.

> Nezapomeň spouštět vše ve svém virtualenv. If you don't see a prefix `(myvenv)` in your console, you need to activate your virtualenv. Jak se to dělá jsme vysvětlili v kapitole **Django instalace** v části **práce s virtualenv**. Typing `myvenv\Scripts\activate` on Windows or `source myvenv/bin/activate` on Mac OS X or Linux will do this for you.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

In your Mac OS X or Linux console, you should run the following command. **Don't forget to add the period (or dot) `.` at the end!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Tečka `.` je zásadní, protože říká že skript pro instalaci Django se má provést v aktuálním adresáři (pro který je tečka `.` zkratkou - odkazem).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin`. The `(myvenv) ~/djangogirls$` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

On Windows you should run the following command. **(Don't forget to add the period (or dot) `.` at the end)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Tečka `.` je zásadní, protože říká že skript pro instalaci Django se má provést v aktuálním adresáři (pro který je tečka `.` zkratkou - odkazem).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin.exe`. The `(myvenv) C:\Users\Name\djangogirls>` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

`django-admin.py` je skript, který za tebe vytvoří adresáře a soubory. Nyní bys měla mít adresářovou strukturu, která vypadá následovně:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Note**: in your directory structure, you will also see your `venv` directory that we created before.

`manage.py` is a script that helps with management of the site. With it we will be able (amongst other things) to start a web server on our computer without installing anything else.

Soubor `settings.py` obsahuje konfiguraci tvé webové stránky.

Pamatuješ, jak jsme mluvili o pošťákovi který zjišťuje kam doručit dopis? Soubor `urls.py` obsahuje seznam vzorů, které používá `urlresolver`.

Prozatím budeme ignorovat ostatní soubory - nechceme v nich nic měnit. Jediná věc, kterou nezapomeň, žádný ze souborů se nemaže!

## Změna nastavení

Pojďme udělat nějaké změny v `mysite/settings.py`. Otevři soubor pomocí editoru kódu, který jsi si nainstalovala dříve.

**Note**: Keep in mind that `settings.py` is a regular file, like any other. You can open it from inside the code editor, using the "file -> open" menu actions. This should get you the usual window in which you can navigate to your `settings.py` file and select it. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

Bylo by hezké mít správný čas na našich stránkách. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

In `settings.py`, find the line that contains `TIME_ZONE` and modify it to choose your own timezone. For example:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

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

Existuje mnoho různých databázových softwarů, které mohou ukládat data pro tvůj web. My budeme používat výchozí `sqlite3`.

Ta je již nastavena v konfiguračním souboru `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Chceš-li vytvořit databázi pro náš blog, spusť následující příkaz v konzoli: `python manage.py migrate` (pro spuštění musíš být v adresáři `djangogirls`, který obsahuje soubor `manage.py`). Pokud vše půjde dobře, měla bys vidět něco takového:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE   Applying contenttypes.0001_initial... OK
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
    

A máme hotovo! Čas spustit webový server a měla by jsi vidět naše fungující webové stránky!

## Starting the web server

Pro spuštění musíš být v adresáři, který obsahuje soubor `manage.py` (adresář `djangogirls`). V konzoli spustíš webový server zadáním `pythonu manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Pokud pracuješ v systému Windows a nezdaří se to s chybovou zprávou `UnicodeDecodeError`, použij tento příkaz:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Blahopřejeme! Právě jsi vytvořila svůj první web a spustila jej pomocí webového serveru! Není to super?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Připravena pro další krok? Je tu čas k vytvoření nějakého obsahu!