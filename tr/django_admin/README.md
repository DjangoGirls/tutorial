# Django admin

To add, edit and delete the posts we've just modeled, we will use Django admin.

Let's open the `blog/admin.py` file and replace its contents with this:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Gördüğünüz gibi, bir önceki bölümde tanımladığımız Post modelini admin.py dosyamıza dahil (import) ettik. To make our model visible on the admin page, we need to register the model with `admin.site.register(Post)`.

Tamam, artık admin sayfasında Post modelimize göz atabiliriz. Web sunucusunu çalıştırmak için komut satırında `python manage.py runserver` komutunu çalıştırmayı unutmayın. Go to your browser and type the address http://127.0.0.1:8000/admin/. You will see a login page like this:

![Giriş sayfası](images/login_page2.png)

To log in, you need to create a *superuser* - a user account that has control over everything on the site. Go back to the command line, type `python manage.py createsuperuser`, and press enter.

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

Giriş satırı geldiğinde, kullanıcı adınızı (küçük harfler ile ve boşluksuz), email adresinizi ve parolanızı girin. Don't worry that you can't see the password you're typing in – that's how it's supposed to be. Sadece yazın ve `enter` tuşuna basıp devam edin. The output should look like this (where the username and email should be your own ones):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Tarayıcınıza dönün. Oluşturduğunuz superuser'ın bilgileri ile giriş yaptığınızda Django'nun admin panelini göreceksiniz.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

En azından iki ya da üç yazıya (ama hepsinin değil) yayınlama tarihi girdiğinizden emin olun. Bunu ileriki adımlarda kullanacağız.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!