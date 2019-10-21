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
    

Dacă utilizați Windows și primiți eroare `UnicodeDecodeError`, utilizați comandă următoare:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Acum trebuie să verificați că website-ul lucrează. Deschideți browser (Firefox, Chrome, Safari, Internet Explorer sau orice alt pe care îl utilizați) și întroduceți adresa următoare:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Dacă utilizați Chromebook și Cloud9, în schimb faceți click pe URL în fereastră pop-up care trebuie să apare în colțul din dreapta sus a liniei de comandă, unde serverul web este pornit. URL va arăta în mod următor:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Felicitări! Ați creat primul site-ul web și ați porinit utilizând serverul web! Nu este minunat?

![Instalare a fost cu success!](images/install_worked.png)

Observați că fereastră cu linie de comandă poate să execute numai un singur lucru și în fereastră cu linie de comandă pe care ați deschis mai devreme este pornit serverul web. Atât timp cât serverul web este pornit și așteaptă pe cereri de intrare, în linie de comandă se poate de introdus textul, dar comenzile noi nu va fi executate.

> Am făcut cunoștință cum lucrează serverul web în capitolul **Cum lucrează Internet**.

Pentru a executa comenzile adiționale când serverul web este pornit, deschideți o fereastră nouă cu linie de comandă și activați virtualenv -- pentru a revizui instrucțiile cum să deschideți al doilea fereastră cu linie de comandă, vedeți capitolulul [Introducere în linie de comandă](../intro_to_command_line/README.md). Pentru a stopa serverul web, deschideți fereastră unde el este pornit și apăsați CTRL+C - taste Control și C împreună (pe Windows, poate o să aveți nevoie să apăsați Ctrl+Break).

Sunteți gata de pasul următor? Este timp să creăm careva conținut!