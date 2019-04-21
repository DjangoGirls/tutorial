# Django admin

Om berichten die we zojuist gemodelleerd hebben toe te voegen, te bewerken of te verwijderen, gebruiken we de Django admin.

Laten we het `blog/admin.py` bestand openen in de code editor en de inhoud daarvan vervangen door:

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

{% filename %}Mac OS X of Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Ga naar Posts en experimenteer er er een beetje mee. Voeg vijf of zes blogposts toe. Maak je geen zorgen over de inhoud - het is alleen zichtbaar op je lokale computer -- je kunt tekst kopiëren en plakken van deze tutorial om tijd te besparen. :)

Zorg ervoor dat ten minste twee of drie posts (maar niet alle) een publicatiedatum hebben. Dit zal later van pas komen.

![Django beheer](images/edit_post3.png)

Als je meer wil weten over de Django admin, neem dan eens een kijkje in Django's documentatie: https://docs.djangoproject.com/en/2.0/ref/contrib/admin

Dit is een goed moment om jezelf te trakteren op een kopje koffie (of thee), of om even wat te eten om weer energie te krijgen. Je hebt net je eerste Django model gemaakt - je verdient een kleine pauze!