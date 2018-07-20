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
    

> Der Punkt `.` ist sehr wichtig, weil er dem Skript mitteilt, dass Django in deinem aktuellen Verzeichnis installiert werden soll. (Der Punkt `.` ist eine Schnellreferenz dafür.)
> 
> **Hinweis:** Wenn du das oben angegebene Kommando eingibst, denk daran, nur das einzutippen, was mit `django-admin` anfängt. Der `(myvenv) ~/djangogirls$`-Teil hier ist nur ein Beispiel für die Eingabeaufforderung (den "Prompt") auf der Kommandozeile.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Auf Windows solltest du den folgenden Befehl ausführen. **(Vergiss den Punkt (`.`) am Ende nicht!)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Der Punkt `.` ist sehr wichtig, weil er dem Skript mitteilt, dass Django in deinem aktuellen Verzeichnis installiert werden soll. (Der Punkt `.` ist eine Schnellreferenz dafür.)
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

**Hinweis**: `settings.py` ist eine Datei wie jede andere. Du kannst sie aus deinem Code-Editor heraus öffnen, in dem du im "Datei"-Menü die "Öffnen"-Aktion wählst. So solltest du das normale Fenster zur Dateiauswahl bekommen, in dem du zur `settings.py`-Datei navigieren und sie auswählen kannst. Stattdessen kannst du die Datei aber auch öffnen, in dem du im Dateimanager zum "djangogirls"-Ordner navigierst und auf die Datei rechtsklickst. Wähle dann deinen Code-Editor aus der Liste der "Öffnen mit"-Programme. Das ist wichtig, da du andere programme installiert haben könntest, die diese Datei zwar öffnen können, aber die dich die Datei nicht editieren lassen würden.

Es wäre schön, wenn die richtige Zeit auf deiner Webseite eingestellt ist. Gehe zur [Zeitzonen-Liste auf Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) und kopiere die für dich geltende Zeitzone (Spalte "TZ"), z.B. `Europe/Berlin`.

Suche in `settings.py` die Zeile, die `TIME_ZONE` enthält und ändere sie ab, um deine eigene Zeitzone auszuwählen. Zum Beispiel:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Ein Sprachkennung besteht aus einem Kürzel für die Sprache, z.B. `en` für Englisch oder `de` für Deutsch, und einem Länder-Kürzel z.B. `de` für Deutschland oder `ch` für die Schweiz. Falls Englisch nicht deine Muttersprache ist, kannst du damit die Standard-Knöpfe und -Meldungen von Django auf deine Sprache wechseln. Der "Cancel"-Knopf würde dann in diese Sprache übersetzt (und z.B. bei Deutsch mit "Abbrechen" beschriftet). [Django enthält viele fix-fertige Übsersetzungen](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

Wenn du eine andere Sprache als Englisch willst, ändere die Sprachkennung, indem du die folgende Zeile änderst:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Ausserdem müssen wir einen Pfad für statische Dateien festlegen. (Über statische Dateien und CSS lernst du später in diesem Tutorial etwas.) Geh hinunter zum *Ende* der Datei und füge direkt unter dem `STATIC_URL`-Eingrag einen neuen Eintrag namens `STATIC_ROOT` ein:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Wenn `DEBUG` auf `True` gesetzt ist und `ALLOWED_HOSTS` leer, dann wird der "Host" gegen `['localhost', '127.0.0.1', '[::1]']` validiert. Unser Hostname auf PythonAnywhere, wo wir unsere Anwendung deployen werden, würde da nicht passen. Deswegen ändern wir folgende Einstellung:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Hinweis**: Wenn du ein Chromebook verwendest, füge noch diese Zeile am Ende deiner settings.py-Datei hinzu: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Füge außerdem `.c9users.io` zu deinen `ALLOWED_HOSTS` hinzu, wenn du cloud9 verwendest.

## Eine Datenbank erstellen

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

## Den Webserver starten

Kontrolliere, dass du in dem Verzeichniss bist, in dem die `manage.py`-Datei liegt (das `djangogirls`-Verzeichnis). Wir starten den Webserver, indem wir in der Konsole `python manage.py runserver` ausführen:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Wenn du ein Chromebook verwendest, benutze stattdessen diesen Befehl:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Wenn du Windows benutzt und dies mit dem `UnicodeDecodeError` fehlschläft, verwende diesen Befehl:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Jetzt wollen wir schauen, ob unsere Website funktioniert: Öffne deinen Browser (Firefox, Chrome, Safari, Edge oder was du sonst nutzt) und gib diese Adresse ein:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Wenn du ein Chromebook verwendest, wirst du den Test-Server immer unter folgender Adresse finden:

{% filename %}browser{% endfilename %}

    https://django-girls-<your cloud9 username>.c9users.io
    

Glückwunsch! Du hast gerade deine erste Website erstellt und sie auf deinem Webserver laufen! Ist das nicht toll?

![Installation hat funktioniert!](images/install_worked.png)

Während der Webserver läuft, siehst du keinen neuen Kommandozeilen-Promt, bei dem du weitere Befehle eingeben könntest. Die Konsole akzeptiert zwar weitere Texteingaben, führt die entsprechenden Kommandos aber nicht aus. Das ist, weil der Webserver laufend auf neue eingehende Requests wartet.

> Wie Webserver funktionieren, haben wir im Kapitel **"Wie das Internet funktioniert"** angesehen.

Öffne ein neues Terminal und aktiviere dort dein virtualenv, damit du – auch während der Webserver läuft – neue Kommandos eingeben kannst. Um den Webserver zu stoppen, wechsel zurück in das Fenster, in dem er läuft, und drücke STRG+C - Steuerung und C gleichzeitig. (In Windows kann es sein, dass du STRG und "Pause"-Taste drücken musst).

Bereit für den nächsten Schritt? Es wird Zeit, ein paar Inhalte hinzuzufügen!