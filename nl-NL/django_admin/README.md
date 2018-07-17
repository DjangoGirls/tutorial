# Django admin

Om berichten die we zojuist gemodelleerd hebben toe te voegen, te bewerken of te verwijderen, gebruiken we de Django admin.

Open het `blog/admin.py` bestand en vervang de inhoud door:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Zoals je ziet importeren we het Post model omschreven in het vorige hoofdstuk. Om ons model zichtbaar te maken op de admin pagina, moeten we het model eerst registreren met `admin.site.register(Post)`.

OK, nu is het tijd om ons Post model te bekijken. Vergeet niet om `python manage.py runserver` te draaien in de terminal om de webserver op te starten. Open je browser en typ het adres http://127.0.0.1:8000/admin/. Je ziet een loginpagina zoals deze:

![Login pagina](images/login_page2.png)

Om in te loggen moet je eerst een *superuser* aanmaken: een gebruikersaccount wat controle heeft over de hele site. Ga terug naar je terminal en typ `python.manage.py createsuperuser`, en druk op enter.

> Onthoud: om nieuwe commando's in te voeren terwijl de webserver nog draait moet je een nieuw terminalscherm openen en je virtualenv activeren. We hebben uitgelegd hoe je nieuwe commando's moet schrijven in het **Je eerste Django project!** hoofdstuk, in het **De webserver opstarten** gedeelte.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

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

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!