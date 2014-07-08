# Django admin

To add, edit and delete posts we've just modeled, we will use Django admin.

Let's open `mysite/blog/admin.py` file and replace its content with this:

    from django.contrib import admin
    from .models import Post

    admin.site.register(Post)

As you can see, we import (include) the Post model defined in the previous chapter. To make our model visible on admin page, we need to register the model with `admin.site.register(Post)`.

Ok, time to look at our Post model. Go to the browser and type an address:

    http://127.0.0.1:8000/admin/

You will see a login page like this:

![Login page](images/login_page2.png)

You should use the username and password you chose when you were creating a database (in __Starting Django project__ chapter). After login in, you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Post and experiment a little bit with it. Add five or six blog posts. Don't worry about the content - you can simply copy-paste some text from this tutorial as your posts content to save time :).

Make sure that at least two or three posts (but not all) have publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.6/ref/contrib/admin/

It is probably a good moment to grab a coffee (or tea) and eat something sweet. You created your first Django model - you deserve a little treat!


