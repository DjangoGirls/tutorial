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

> Kom ihåg: För att skriva nya kommandon medan webbservern körs, öppna ett nytt terminalfönster och aktivera din virtualenv. Vi gick igenom hur man skriver nya kommandon i kapitlet **Ditt första Django-projekt!** i avsnittet **Starta webbservern**.

{% filename %}Mac OS X eller Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

När du blir ombedd, skriv in ditt användarnamn (med gemener, inga mellanslag), e-postadress och lösenord. **Oroa dig inte för att du inte kan se lösenordet du skriver in – det är så det ska vara.** Skriv in det och tryck `enter` för att fortsätta. Utskriften ska se ut så här (där användarnamn och e-post ska vara dina egna):

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

Återgå till din webbläsare. Logga in med superanvändarens användaruppgifter du valde; du bör se Django admins instrumentpanel.

![Django admin](images/django_admin3.png)

Gå till Posts och experimentera lite. Lägg till fem eller sex blogginlägg. Oroa dig inte för innehållet – det är bara synligt för dig på din lokala dator – du kan kopiera och klistra in text från den här handledningen för att spara tid. :)

Se till att minst två eller tre inlägg (men inte alla) har publiceringsdatum. Det kommer att vara till hjälp senare.

![Django admin](images/edit_post3.png)

Om du vill veta mer om Django admin, kolla in Djangos dokumentation: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

Detta är förmodligen ett bra ögonblick att ta en kaffe (eller te) eller något att äta för att ge dig energi. Du skapade din första Django-modell – du förtjänar en liten paus!