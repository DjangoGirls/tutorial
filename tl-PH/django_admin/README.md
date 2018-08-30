# Admin ng Django

Para makadagdag, maka-edit, at makabura ng mga post na kakamodel lang, gagamitin natin ang admin ng Django.

Let's open the `blog/admin.py` file in the code editor and replace its contents with this:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Sa makikita mo, ating ini-import (isinama) ang model na Post na ating binigyan kahulugan sa dating kabanata. Para makita sa pahina ng admin ang ating model, kailangan natin itong i-rehistro gamit ang `admin.site.register(Post)`.

Sige, oras na para tingnan ang ating model na Post. Huwag kalimutan na patakbuhin ang `python manage.py runserver` sa iyong console para gumana ang web server. Pumunta sa iyong browser at ilagay ang address na ito http://127.0.0.1:8000/admin/. Makikita mo ang pahina sa pag-login gaya nito:

![Pahina para sa Login](images/login_page2.png)

Para maglog-in, kailangan mong maglikha ng *superuser* - isang user account na may kontrol sa lahat ng laman ng site. Bumalik sa command line, at i-type ang `python manage.py createsuperuser`, at pindutin ang enter.

> Tandaan, para maka sulat ng bagong mga command habang tumatakbo ang iyong web server, magbukas ng bagong terminal window at gawing aktibo ang iyong virtualenv. Kami ay nagbalik-aral kung paano magsulat ng mga bagong command kabanata na **Your first Django project!**, sa loob ng seksyon na **Starting the web server**.

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