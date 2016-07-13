# Django admin

To add, edit and delete posts we've just modeled, we will use Django admin.

Let's open the `blog/admin.py` file and replace its content with this:

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

As you can see, we import (include) the Post model defined in the previous chapter. To make our model visible on the admin page, we need to register the model with `admin.site.register(Post)`.

OK, time to look at our Post model. Remember to run `python manage.py runserver` in the console to run the web server. Go to the browser and type the address http://127.0.0.1:8000/admin/ You will see a login page like this:

![Login page](images/login_page2.png)

To log in, you need to create a *superuser* - a user which has control over everything on the site. Go back to the command-line and type `python manage.py createsuperuser`, and press enter. 

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the <b>Your first Django project!</b> chapter, in the <b>Starting the web server</b> section.

When prompted, type your username (lowercase, no spaces), email address, and password. Don't worry that you can't see the password you're typing in - that's how it's supposed to be. Just type it in and press `enter` to continue. The output should look like this (where username and email should be your own ones):

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content - you can simply copy-paste some text from this tutorial to save time :).

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.9/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energise yourself. You created your first Django model - you deserve a little timeout!


