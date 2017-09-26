# Django admin

To add, edit and delete the posts we've just modeled, we will use Django admin.

Let's open the `blog/admin.py` file and replace its contents with this:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Amint láthatod, importáljuk az előző fejezet végén definiált Post modellt, vagyis elérhetővé tesszük ebben a fájlban is. To make our model visible on the admin page, we need to register the model with `admin.site.register(Post)`.

Most nézzük meg, hogy néz ki a Post modell. Ne felejtsd el futtatni a `python manage.py runserver` parancsot a konzolban, hogy elindítsd a webszervert. Go to your browser and type the address http://127.0.0.1:8000/admin/. You will see a login page like this:

![Login page](images/login_page2.png)

To log in, you need to create a *superuser* - a user account that has control over everything on the site. Go back to the command line, type `python manage.py createsuperuser`, and press enter.

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

A következő lépésekben meg kell adnod egy felhasználónevet (ne használj nagybetűket és szóközt), emailcímet és jelszót. Don't worry that you can't see the password you're typing in – that's how it's supposed to be. Csak írd be, és nyomj `enter`t a folytatáshoz. The output should look like this (where the username and email should be your own ones):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Térj vissza a böngészőbe. Jelentkezz be a superuser adataival, amit az előbb adtál meg; ha minden jól megy, a Django admin dashboardra jutsz.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Állíts be legalább két-három posztnak (de ne mindegyiknek!) egy publish date-et (megjelenési dátumot). Később jól fog jönni.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!