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
    

Wenn du dazu aufgefordet wirst, gib den Benutzernamen (Kleinbuchstaben, keine Leerschläge), die Mailadresse und das Passwort ein. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!