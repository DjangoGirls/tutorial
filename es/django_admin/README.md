# Administrador de Django

To add, edit and delete the posts we've just modeled, we will use Django admin.

Let's open the `blog/admin.py` file and replace its contents with this:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Como puedes ver, importamos (incluimos) el modelo Post definido en el capítulo anterior. To make our model visible on the admin page, we need to register the model with `admin.site.register(Post)`.

Ok, es hora de ver nuestro modelo Post. Recuerda ejecutar `python manage.py runserver` en la consola para correr el servidor web. Go to your browser and type the address http://127.0.0.1:8000/admin/. You will see a login page like this:

![Página de inicio de sesión](images/login_page2.png)

To log in, you need to create a *superuser* - a user account that has control over everything on the site. Go back to the command line, type `python manage.py createsuperuser`, and press enter.

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

Cuando te lo pida, escribe tu nombre de usuario (en minúscula, sin espacios), email y contraseña. Don't worry that you can't see the password you're typing in – that's how it's supposed to be. Simplemente escríbela y pulsa `intro` para continuar. The output should look like this (where the username and email should be your own ones):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Vuelve al navegador. Inicia sesión con las credenciales de súper usuario que elegiste; deberías ver el panel de administración de Django.

![Administrador de Django](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Asegúrate que al menos dos o tres entradas (pero no todas) tengan la fecha de publicación. Será de ayuda más tarde.

![Administrador de Django](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!