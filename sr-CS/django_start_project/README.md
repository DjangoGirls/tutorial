# Vaš prvi Django projekat!

> Deo ovog poglavlja je zasnovan na priručnicima iz Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Delovi ovog poglavlja su takođe zasnovani na [django-marcador priručniku](http://django-marcador.keimlink.de/), pod Creative Commons Attribution-ShareAlike 4.0 Internacionalnom Licencom. Sva prava za django-marcador priručnik zadržava Markus Zapke-Gründemann.

Napravićemo mali blog!

Prvi korak je da pokrenemo novi Django projekat. U suštini, to znači da ćemo pokrenuti neke skripte napisane u Django-u koje će kreirati kostur našeg Django projekta. To je samo skup direktorijuma i fajlova koji ćemo kasnije koristiti.

Imena nekih fajlova i direktorijuma su veoma važna. Ne biste smeli da menjate nazive tih fajlova, koje ćemo sada kreirati. Takođe, ni njihovo premeštanje u druge foldere nije dobra ideja. Django treba da održi određenu strukturu kako bi mogao da pronađe važne stvari.

> Ne zaboravite da sve pokrenete u virtualenv-u. Ukoliko ne vidite u svojoj konzoli prefiks `(myvenv)`, potrebno je da aktivirate svoj virtualenv. Objasnili smo kako da to uradite u poglavlju **Django instalacija** u delu **Rad sa virtualenv-om**. To možete da uradite kucanjem `myvenv\Scripts\activate` na Windows-u ili `source myvenv/bin/activate` na Mac OS X ili Linux-u.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Potrebno je da pokrenete sledeću komandu u Vašoj Mac OS ili Linux konzoli.** Ne zaboravite da dodate tačku `.` na kraju!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Tačka `.` je izuzetno važna jer govori skripti da instalira Django u trenutnom direktorijumu (za koji je ta tačka `.` referenca).
> 
> **Napomena** Kada kucate prethodnu komandu, zapamtite da kucate samo deo koji počinje sa `django-admin`. Deo `(myvenv) ~/djangogirls$` koji je ovde prikazan je samo primer ulaza gde treba da unesete input na Vašoj komandnoj liniji.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Na Windowsu bi trebalo da pokrenete sledeću komandu **(ne zaboravite da dodate tačku na kraju)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Tačka je jako važna jer govori skripti da instalira Django u trenutnom direktorijumu (za koji je ta tačka referenca).
> 
> **Napomena** Kada unosite prethodnu komandu, zapamtite da samo unosite deo koji počinje sa `django-admin.exe`. Deo `(myvenv) C:\Users\Name\djangogirls>` koji je ovde prikazan je samo primer ulaza koji očekuje Vaš input u komandnoj liniji.

<!--endsec-->

`django-admin.py` je skripta koja za Vas kreira direktorijume i fajlove. Sada bi trebalo da imate strukturu direktorijuma koja izgleda ovako:

    djangogirls
    ├───manage.py
    ├───mysite
    │        settings.py
    │        urls.py
    │        wsgi.py
    │        __init__.py
    └───requirements.txt
    

> **Napomena**: U Vašoj strukturi direktorijuma, videćete takođe `venv` direktorijum koji smo ranije kreirali.

`manage.py` je skripta koja pomaže u vezi sa organizovanjem sajta. Ona nam omogućava između ostalog da pokrenemo veb server na našem računaru bez dodatnih instalacija.

Fajl `settings.py` sadrži konfiguraciju Vašeg veb sajta.

Sećate li se priče o poštaru koji proverava gde da dostavi pismo? Fajl `urls.py` sadrži listu šablona koje koristi `urlresolver`.

Zanemarimo za sada ostale fajlove, tako da ih nećemo menjati. Jedina stvar koju treba da zapamtite je da ne smete da ih obrišete!

## Promena podešavanja

Hajde da napravimo izmene u `mysite/settings.py`. Otvorite fajl pomoću editora koji ste ranije instalirali.

**Napomena**: Ne zaboravite da je `settings.py` običan fajl, kao i svaki drugi. Možete da ga otvorite u editoru pomoću opcije "file -> open". Zatim bi trebalo da se otvori prozor pomoću kog možete da pronađete i izaberete `settings.py` fajl. Takođe, možete da otvorite fajl pronalaženjem djangogirls foldera na desktopu i desnim klikom na isti. Onda, sa liste izaberite editor. Važno je da izaberete editor jer možda imate druge programe koji su instalirani i koji mogu da otvore fajl ali ne mogu da ga izmene.

Bilo bi lepo da imamo ispravno podešeno vreme na sajtu. Idite na [Wikipedia listu vremenskih zona](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) i kopirajte određenu vremensku zonu (eng. Time Zone) (npr. ` Evropa/Berlin`).

U fajlu `settings.py` pronađite liniju koja sadrži `TIME_ZONE` i izmenite je tako da se odnosi na Vašu izabranu vremensku zonu. Na primer:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Jezički kod se sastoji od jezika, npr. `en` za engleski ili `de` za Nemački, dok je državni kod npr. `de` za Nemačku ili `ch` za Švajcarsku. Ukoliko engleski nije Vaš maternji jezik, možete da dodate ovaj deo kako biste učinili da opcije i obaveštenja u Django-u budu na Vašem jeziku. Tako da biste imali "Cancel" dugme prevedeno na Vaš jezik koji ste tu definisali. [Uz Django ide i dosta gotovih prevoda](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

Ako želite neki drugi jezik, promenite jezički kod tako što ćete izmeniti sledeću liniju:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Takođe treba da dodamo putanju za statičke fajlove. (Naučićemo sve o njima i o CSS-u kasnije) Idite do kraja fajla i ispod `STATIC_URL` dela dodajte novi deo `STATIC_ROOT`:

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

There's a lot of different database software that can store data for your site. We'll use the default one, `sqlite3`.

This is already set up in this part of your `mysite/settings.py` file:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

To create a database for our blog, let's run the following in the console: `python manage.py migrate` (we need to be in the `djangogirls` directory that contains the `manage.py` file). If that goes well, you should see something like this:

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
    

And we're done! Time to start the web server and see if our website is working!

## Starting the web server

You need to be in the directory that contains the `manage.py` file (the `djangogirls` directory). In the console, we can start the web server by running `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!