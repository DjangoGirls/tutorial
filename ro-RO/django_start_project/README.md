# Primul proiect Django!

> O parte capitolului acesta este bazată pe tutoriale realizate de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte din acest capitol se bazează pe [django-marcador tutorial](http://django-marcador.keimlink.de/) sub licenţa de Creative Commons Attribution-ShareAlike 4.0 International License. Tutorialul django-marcador este protejat de drepturi de autor de Markus Zapke-Gründemann et al.

O să creăm un mic blog!

Primul pas este de a crea un nou proiect Django. În principiu, acesta înseamnă că o să executăm niște Django scripturi care vor crea o structură proiectului Django. Acesta este numai un număr de directoriile și fișierile pe care vom utiliza în viitor.

Denumirele unor fișiere și directorii sunt foarte importante în Django. Nu trebuie să redenumiți fișierile pe care urmați o să le creați. Mutarea lor într-un loc diferit nu este o idee bună. Django trebuie să mențină o structură anumită pentru a afla lucruri importante.

> Trebuie să țineți minte să executați toate comenzile în virtualenv. Dacă nu vedeți prefix-ul `(myvenv)` în linie de comandă, trebuie să activați virtualenv. Am explicat cum să faceți acesta în secțiune **Django installation** în capitolul **Working with virtualenv**. Executând `myvenv\Scripts\activate` în Windows sau `source myvenv/bin/activate` în Mac OS X sau Linux va face acesta.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

În linie de comandă Mac OS X sau Linux executați comandă următoare. Nu uitați să adăugați punct la sfârșit `.`!

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Punct `.` este important pentru că el indică ca Django să fie instalat în directoriu curent (punct `.` este o referență).
> 
> **Notă** Când executați comandă de mai sus, țineți minte că trebuie să tapați numai o parte care începe cu `django-admin`. `(myvenv) ~/djangogirls$` este doar un exemplu de prompt în linie de comandă care va arăta că trebuie de a tapa comandă.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

În Windows puteți să executați comandă următoare **(Nu uitați să adăugați punct `.` la sfârșit)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Punct `.` este foarte important pentru că astfel Django va fi instalat în directoriu curent (punct `.` este o abreviere).
> 
> **Notă** Când executați comandă de mai sus, țineți minte că trebuie să tapați numai o parte care începe cu `django-admin.exe`. Parte `(myvenv) C:\Users\Name\djangogirls>` este un exemplu de prompt care va arăta că trebuie de a tapa o comandă în linie de comandă.

<!--endsec-->

`django-admin.py` este un script care va crea directoriile și fișierile. Acum trebuie să aveți următoare structura directoriilor:

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
    

> **Notă**: în structura directoriului o să vedeți directoriu `venv` care a fost creat înainte.

`manage.py` este un script care ajută în managementul site-ului. Cu ajutorul lui putem (printre alte lucruri) să pornim web serverul pe calculatorul fără a instala instrumente adăugătoare.

Fișierul `settings.py` conține configurația site-ului.

Ținteți minte am vorbit despre trasmiterea corespondenței, verificând unde să livrăm scriisoare? Fișierul `urls.py` conține o listă de scheme, utlizate de `urlresolver`.

Hai să ignorăm până când alte fișierile pentru că n-o să le modificăm. Un lucru de care trebuie să ținem minte este ca să nu le ștergem!

## Modificarea setărilor

Hai să facem niște schimbări în fișier `mysite/settings.py`. Deschideți fișierul, utilizând editorul de cod pe care l-ai instalat.

**Notă**: Țineți minte că fișierul `settings.py` este un fișier obiișnuit, ca și alte. Puteți să-l deschideți din editorul de cod, utilizând meniu "file -> open". O fereastră obișnuită trebuie să fie deschisă în care puteți să alegeți fișierul `settings.py`. Un alt mod de a deschide este de a merge la directoriu djangogirls de pe desktop și a face dublu-click pe el. Apoi alegeți editorul de cod din listă. Este important să alegeți editorul de cod pentru că există programe care pot să deschidă fișierul, dar n-o să vă da voie să-l editați.

Ar fi plăcut să avem timp corect pe site-ul nostru. Deschideți [listă de fusuri orare din Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) și copiați fusul apropiat (TZ) (de exemplu `Europe/Berlin`).

În `settings.py`, găsiți o linie care conține `TIME_ZONE` și o modificați ca ea să conțină fusul ales. De exemplu:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Codul de limbă constă din limbă, de exemplu `en` pentru engleză sau `de` pentru germană, și codul de țară, de exemplu `de` pentru germană sau `ch` pentru for Elveția. Dacă engleză nu este limbă nativă, puteți să adăugați codul de mai jos pentru a face ca butoanele standarde și notificațiile de la Django să fie în limba voastră. În astfel mod, butonul "Cancel" va fi tradus în limbă definită aici. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Dacă doriți o altă limbă, schimbați codul de limbă, schimbând linie următoare:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Avem nevoie să adăugăm o cale pentru fișiere statice. (O să aflăm despre fișiere statice și CSS mai târziu în tutorial.) La *sfârșitul* fișierului, sub textul `STATIC_URL` adăugați o linie nouă `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Când `DEBUG` este `True` și `ALLOWED_HOSTS` n-are valoare, host este validat în domeniu `['localhost', '127.0.0.1', '[::1]']`. Acesta v-a fi diferit de denumirea domeniului pe PythonAnywhere când o să publicăm aplicație, de aceea schimbăm configurație următoare:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Notă**: Dacă utilizați pe Chromebook, adăugați linie aceasta la sfârșitul fișierului settings.py: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Mai adăugați `.amazonaws.com` la sfârșitul `ALLOWED_HOSTS`, dacă utilizați cloud9
> 
> If you are hosting your project on `Glitch.com`, let us protect the Django secret key that needs to remain confidential (otherwise, anyone remixing your project could see it): * First, we are going to create a random secret key. Open the Glitch terminal again, and type the following command: {% filename %}.env{% endfilename %} 
> 
>     bash
>         python -c 'from django.core.management.utils import get_random_secret_key; \
>               print(get_random_secret_key())' This should display a long random string, perfect to use as a secret key for your brand new Django web site. We will now paste this key into a 
> 
> `.env` file that Glitch will only show you if you are the owner of the web site.  
>   
> * Create a file `.env` at the root of your project and add the following property in it: {% filename %}.env{% endfilename %} 
> 
>     bash
>         # Here, inside the single quotes, you can cut and paste the random key generated above
>         SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl' * Then update the Django settings file to inject this secret value and set the Django web site name: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         SECRET_KEY = os.getenv('SECRET') * And a little further, in the same file, we inject the name of your new Glitch website: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"] The 
> 
> `PROJECT_DOMAIN` value is automatically generated by Glitch. It will correspond to the name of your project.

## Setare bazei de date

Există multe baze de date pentru a păstra dată pentru site-ul vostru. O să utilizăm opțiune standartă, `sqlite3`.

Acesta este deja predifinit în parte acesta a fișierului `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Pentru a crea baza de date pentru blogul vostru, hai să executăm comandă următoare în linie de comandă: `python manage.py migrate` (trebuie să fim în directoriu `djangogirls` care conține fișierul `manage.py`). Dacă totul va fi bine, o să vedeți codul următor:

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
    

Și am terminat! Este timp să pornim serverul web și să vedem că website-ul lucrează!

## Pornirea serverului web

Trebuie să fiți în directoriu care conține fișierul `manage.py` (directoriu `djangogirls`). În linie de comandă, putem să pornim serverul web, executând `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Dacă utilizați Chromebook, executați comandă de mai jos:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

or this one if you are using Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> Am făcut cunoștință cum lucrează serverul web în capitolul **Cum lucrează Internet**.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!