# L'admin di Django

Per aggiungere, modificare ed eliminare le pubblicazioni che abbiamo appena modellato, useremo l'amministratore di Django.

Stiamo per aprire il ` blog/admin.py` archiviare e sostituire il suo contenuto con questo:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Come puoi vedere, stiamo importando (include) il modello di Post che abbiamo definito nel capitolo precedente. Per far si che il nostro modello sia visibile nella pagina di admin, dobbiamo registrare questo modello con `admin.site.register(Post)`.

OK, è tempo di guardare il nostro Post. Ricorda di eseguire `python manage.py runserver` nella console per avviare il web server. Vai al tuo browser e digitare l'indirizzo http://127.0.0.1:8000/admin/. Vedrai una pagina login simile a questa:

![Login page](images/login_page2.png)

Per accedere, devi creare un * superutente* - una conta utente che ha il controllo su tutto sul sitio. Torna alla riga di comando, digita` python manage.py crearesuperutente`, e premi invio.

> Ricorda, per scrivere nuovi comandi mentre il web server è insecuzione, apri una nuova finestra di terminale e attiva il tuo virtualenv. Esaminiamo come scrivere nuovi comandi nel capitolo ** Il tuo primo progetto Django! **, nel ** Avvio del server web** sezione.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!