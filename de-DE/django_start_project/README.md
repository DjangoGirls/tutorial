# Dein erstes Django-Projekt!

> Ein Teil dieses Kapitels basiert auf Tutorials der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Teile dieses Kapitels basieren auf dem [django-marcador Tutorial](http://django-marcador.keimlink.de/) lizenziert unter Creative Commons Attribution-ShareAlike 4.0 International License. Für das "django-marcador Tutorial" liegt das Urheberrecht bei Markus Zapke-Gründemann et al.

Wir werden einen kleinen Blog erstellen!

Der erste Schritt ist, ein neues Django-Projekt zu starten. Im Grunde bedeutet das, dass wir einige Skripte ausführen werden, die Django zur Verfügung stellt, um ein Skelett eines Django-Projekts für uns zu erzeugen. Das Projekt beinhaltet einen Haufen von Verzeichnissen und Dateien, die wir später verwenden werden.

Die Namen einiger Dateien und Verzeichnisse sind sehr wichtig für Django. Die Dateien, die erstellt werden, solltest du nicht umbenennen. Sie an eine andere Stelle zu verschieben, ist auch keine gute Idee. Django muss zwingend eine gewisse Struktur erhalten, um wichtige Dinge wiederzufinden.

> Denk daran, alles in der "Virtualenv"-Umgebung auszuführen. Wenn du kein Präfix `(myvenv)` in deiner Konsole siehst, musst du deine Virtualenv-Umgebung aktivieren. Wie das gemacht wird, erklären wir im Kapitel **Django-Installation**, im Abschnitt **Arbeiten mit Virtualenv**. Zur Erinnerung: Gib dazu auf Windows `myvenv\Scripts\activate` ein, bzw. auf OS X oder Linux `source myvenv/bin/activate`.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

In deiner OS X- oder Linux-Konsole solltest du den folgenden Befehl ausführen; **vergiss den Punkt (`.`) am Ende nicht!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Der Punkt `.` ist sehr wichtig, weil er dem Skript mitteilt, dass Django in deinem aktuellen Verzeichnis installiert werden soll. (der Punkt `.` ist eine Schnellreferenz dafür).
> 
> **Hinweis:** Wenn du das oben angegebene Kommando eingibst, denk daran, nur das einzutippen, was mit `django-admin` anfängt. Der `(myvenv) ~/djangogirls$`-Teil hier ist nur ein Beispiel für die Eingabeaufforderung (den "Prompt") auf der Kommandozeile.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Auf Windows solltest du den folgenden Befehl ausführen. **(Vergiss den Punkt (`.`) am Ende nicht!)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Der Punkt `.` ist sehr wichtig, weil er dem Skript mitteilt, dass Django in deinem aktuellen Verzeichnis installiert werden soll. (der Punkt `.` ist eine Schnellreferenz dafür).
> 
> **Hinweis:** Wenn du das oben angegebene Kommando eingibst, denk daran, nur das einzutippen, was mit `django-admin.exe` anfängt. Der `(myvenv) C:\Users\Name\djangogirls>`-Teil hier ist nur ein Beispiel für die Eingabeaufforderung (den "Prompt") auf der Kommandozeile.

<!--endsec-->

`django-admin.py` ist ein Skript, welches Verzeichnisse und Dateien für dich erstellt. Du solltest jetzt eine Verzeichnisstruktur haben, die folgendermaßen aussieht:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

> **Hinweis:** In deiner Verzeichnisstruktur wirst du auch den `venv`-Ordner sehen, den wir vorhin erzeugt haben.

`manage.py` ist ein Script, das das Management deines Projektes unterstützt. Mit dem Script bist du unter anderem in der Lage, den Webserver auf deinem Rechner zu starten, ohne etwas Weiteres installieren zu müssen.

Die Datei `settings.py` beinhaltet die Konfiguration deiner Website.

Erinnerst du dich, als wir über den Postboten gesprochen haben, der überlegt, wohin er den Brief liefern soll? Die `urls.py` Datei beinhaltet eine Liste von Patterns (Mustern), die vom `urlresolver` benutzt werden.

Lass uns kurz die anderen Dateien vergessen - wir werden sie nicht verändern. Denk aber dran, sie nicht versehentlich zu löschen!

## Einstellungen anpassen

Wir machen nun ein paar Änderungen in `mysite/settings.py`. Öffne die Datei mit dem Codeeditor, den du vorhin installiert hast.

**Note**: Keep in mind that `settings.py` is a regular file, like any other. You can open it from inside the code editor, using the "file -> open" menu actions. This should get you the usual window in which you can navigate to your `settings.py` file and select it. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

Es wäre schön, wenn die richtige Zeit auf deiner Webseite eingestellt ist. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

In `settings.py`, find the line that contains `TIME_ZONE` and modify it to choose your own timezone. For example:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/1.11/ref/settings/#language-code).

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
> Also add `.c9users.io` to the `ALLOWED_HOSTS` if you are using cloud9

## Set up a database

Es gibt viele verschiedene Datenbank Programme, welche die Daten unserer Website verwalten können. Wir werden die Standard Datenbanksoftware nehmen, `sqlite3`.

Das sollte schon in der `mysite/settings.py`-Datei eingestellt sein:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Um eine Datenbank für unseren Blog zu erstellen, müssen wir folgenden Befehl in der Konsole ausführen (Dazu müssen wir in dem `djangogirls`-Verzeichnis sein, in dem sich auch die `manage.py`-Datei befindet). Wenn alles glatt läuft, sollte das so aussehen:

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
      Applying sessions.0001_initial... OK
    

Und wir sind fertig! Zeit, unseren Webserver zu starten, um zu sehen, ob unsere Website funktioniert!

## Starting the web server

Kontrolliere, dass du in dem Verzeichniss bist, in dem die `manage.py`-Datei liegt (das `djangogirls`-Verzeichnis). Wir starten den Webserver, indem wir in der Konsole `python manage.py runserver` ausführen:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Wenn du Windows benutzt und dies mit dem `UnicodeDecodeError` fehlschläft, verwende diesen Befehl:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now all you need to do is check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook, you'll always visit your test server by accessing:

{% filename %}browser{% endfilename %}

    https://django-girls-<your cloud9 username>.c9users.io
    

Glückwunsch! Du hast gerade deine erste Website erstellt und sie auf deinem Webserver laufen! Ist das nicht toll?

![Es hat funktioniert!](images/it_worked2.png)

While the web server is running, you won't see a new command-line prompt to enter additional commands. The terminal will accept new text but will not execute new commands. This is because the web server continuously runs in order to listen for incoming requests.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv. To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Bereit für den nächsten Schritt? Es wird Zeit, ein paar Inhalte hinzuzufügen!