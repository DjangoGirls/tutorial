# Django Admin

Kako bismo dodali, izmenili ili izbrisali postove koje smo upravo podesili, koristićemo Django admina.

Hajde da otvorimo `blog/admin.py` fajl u editoru i da zamenimo njegov sadržaj ovim:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Kao što možete da vidite, uvozimo model posta koji je definisan u prethodnom poglavlju. Kako bi naš model bio vidljiv na admin stranici, potrebno je da ga registrujemo pomoću `admin.site.register(Post)`.

Ok, vreme je da pogledamo naš model. Ne zaboravite da pokrenete `python manage.py runserver` u konzoli kako biste pokrenuli veb server. Idite na Vaš pretraživač i ukucajte adresu http://127.0.0.1:8000/admin/. Trebalo bi da vidite stranicu koja ovako izgleda:

![Login page](images/login_page2.png)

Kako biste se ulogovali, potrebno je da kreirate *superuser-a* (super korisnika) - korisnički nalog koji ima kontrolu nad svim stvarima na tom sajtu. Zatim se vratite na komandnu liniju i ukucajte `python manage.py createsuperuser` i pritisnite enter.

> Ne zaboravite da napišete nove komande dok je veb server pokrenut, da otvorite nov prozor terminala i da aktivirate virtuelno okruženje. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

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

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!