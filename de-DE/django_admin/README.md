# Django Administration

Wir benutzen den Django Admin um die soeben modellierten Posts hinzuzufügen, zu ändern oder zu löschen.

Öffne die Datei `blog/admin.py` und ersetze den Inhalt wie folgt:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Wie du siehst, importieren wir hier das Modell "Post", das wir im vorigen Kapitel erstellt haben. Damit unser Model auf der Admin-Seite sichtbar wird, müssen wir es mit `admin.site.register(Post)` registrieren.

Okay, wir sehen uns nun unser Post-Modell an. Denk daran, `python manage.py runserver` in die Konsole einzugeben, um den Webserver zu starten. Öffne deinen Browser und gebe die Adresse http://127.0.0.1:8000/admin/ ein. Du siehst eine Anmeldeseite:

![Login Seite](images/login_page2.png)

Um dich einloggen zu können musst du zunächst einen *superuser* erstellen - einen User, der alles auf der Website steuern darf. Geh zurück zur Kommandozeile, tippe `python manage.py createsuperuser` und drücke Enter.

> Denke daran, damit du neue Kommandos eingeben kannst während der Webserver läut, musst du ein neues Terminal öffnen und deine virtualenv aktivieren. Wie man neue Kommandos eingeben kann, haben wir im Kapitel **Your first Django project!** im **Starting the web server**-Bereich behandelt.

{% filename %}Mac OS X oder Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

Wenn du dazu aufgefordet wirst, gib den Benutzernamen (Kleinbuchstaben, keine Leerschläge), die Mailadresse und das Passwort ein. **Mach dir keine Gedanken, wenn du das Passwort bei der Eingabe nicht sehen kannst - so soll es sein.** Tippe einfach weiter und drücke `enter` zum Weiterfahren. Du solltest nun Folgendes sehen (wobei Benutzername und Email deine eigenen sein sollten):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Geh nochmal in deinen Browser und log dich mit den Daten des Superusers ein, den du gerade erstellt hast. Du solltest nun das Django Admin Dashboard sehen.

!["Django Admin"-Weboberfläche](images/django_admin3.png)

Gehe zu Posts und experimentiere ein wenig damit. Füge 5 oder 6 Blogposts hinzu. Mach dir keine Sorgen wegen des Inhalts - du kannst einfach etwas Text aus diesem Tutorial kopieren und einfügen, um Zeit zu sparen :-).

Achte darauf, dass bei wenigstens zwei oder drei Posts (aber nicht bei allen) das Veröffentlichungsdatum (publish date) eingetragen ist. Das werden wir später noch brauchen.

!["Django Admin"-Weboberfläche](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

Jetzt ist wahrscheinlich ein guter Moment, um dir einen Kaffee (oder Tee) zu gönnen und neue Kraft zu tanken. Du hast dein erstes Django-Modell erstellt - du hast dir eine kleine Pause verdient!