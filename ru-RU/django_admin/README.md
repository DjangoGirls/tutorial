# Администрирование Django

Чтобы добавлять, редактировать и удалять записи, для которых мы только сделали модель, нам потребуется использовать права администратора в Django.

Let's open the `blog/admin.py` file in the code editor and replace its contents with this:

{% filename %}command-line{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Как ты можешь заметить, мы импортировали (включили) модель Post, которая была определена в предыдущей главе. Чтобы наша модель стала доступна на странице администрирования, нам нужно зарегистрировать её при помощи `admin.site.register(Post)`.

Хорошо, теперь нам нужно взглянуть на модель Post. Не забудь запустить веб-сервер командой `python manage.py runserver`. Перейдите в ваш браузер и введите адрес http://127.0.0.1:8000/admin /. Ты увидишь страничку авторизации:

![Страница авторизации](images/login_page2.png)

Чтобы залогиниться, тебе сначала нужно создать суперпользователя *superuser* - пользователя, который имеет полный доступ к управлению сайтом. Вернись к консоли, напечатай `python manage.py createsuperuser`, и нажми Enter.

> Помните о том, что вводить новые команды нужно в режиме работающего сервера, откройте новое окно терминала и активируйте ваше вируальное окружение (virtualenv). We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

{% filename %}Mac OS X или Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Вернись в браузер и войди в систему при помощи имени пользователя и пароля, которые ты только что выбрала. Ты должна попасть в панель управления Django.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

Сейчас, вероятно, подходящий момент, чтобы порадовать себя кружечкой кофе (или чая), а также съесть чего-нибудь для пополнения энергии. Ты только что создала свою первую Django модель и заслужила перерыв!