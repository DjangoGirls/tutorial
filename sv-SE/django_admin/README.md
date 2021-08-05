# Django admin

För att lägga till, redigera och ta bort de inlägg som vi just skapat modeller för använder vi Django admin.

Öppna filen `blog/admin.py` i kodredigeraren och ersätta dess innehåll med detta:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Som du kan se importerar vi (inkluderar) modellen Post definierad i förra kapitlet. För att göra vår modell synlig på administratörssidan måste vi registrera modellen med `admin.site.register(Post)`.

OK, dags att titta på vår modell Post. Kom ihåg att köra `python manage.py runserver` i konsolen för att köra webbservern. Gå till din webbläsare och skriv in adressen http://127.0.0.1:8000/admin/. Du kommer att se en inloggningssida lik denna:

![Login page](images/login_page2.png)

För att logga in måste du skapa en *superanvändare* - ett användarkonto som har kontroll över allt på webbplatsen. Gå tillbaka till kommandoraden, skriv `python manage.py createsuperuser` och tryck enter.

> Kom ihåg: För att skriva nya kommandon medan webbservern körs, öppna ett nytt terminalfönster och aktivera din virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

{% filename %}Mac OS X or Linux:{% endfilename %}

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

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content –- it's only visible to you on your local computer -- you can copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!