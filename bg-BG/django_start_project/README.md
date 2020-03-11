# Вашият първи проект с Django!

> Част от тази глава е базирана на уроци от Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Части от тази глава се основават на [django-marcador tutorial](http://django-marcador.keimlink.de/), лицензиран съгласно лиценза Creative Commons Attribution-ShareAlike 4.0 International. Урокът за джанго-маркадор е защитен с авторско право от Markus Zapke-Gründemann et al.

Ще създадем малък блог!

Първата стъпка е да започнете нов проект на Django. По принцип това означава, че ще изпълним някои скриптове, предоставени от Django, които ще създадат скелета на проект на Django за нас. Това е само куп директории и файлове, които ще използваме по-късно.

Имената на някои файлове и директории са много важни за Django. Не трябва да преименувате файловете, които предстои да създадем. Преместването им на друго място също не е добра идея. Джанго трябва да поддържа определена структура, за да може да намери важни неща.

> Не забравяйте да стартирате всичко във virtualenv (виртуално пространство). Ако не видите префикс `(myvenv)` в конзолата си, трябва да активирате своя virtualenv. Обяснихме как да направим това в главата **Инсталация на Django** в частта **Работа с virtualenv**. Въвеждането `myvenv\Scripts\activate`` в Windows или <0>source myvenv/bin/activate` в Mac OS X или Linux ще направи това вместо вас.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Във вашата Mac OS X или Linux конзола трябва да изпълните следната команда. ** Не забравяйте да добавите точка `.` в края!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Точката `.` е от решаващо значение, тъй като казва на скрипта да инсталира Django във вашата текуща директория (за която точката `.` е препратка).
> 
> **Забележка** Когато пишете командата по-горе, не забравяйте, че въвеждате само частта, която започва от `django-admin`. Частта `(myvenv) ~/djangogirls$`, показана тук, е само пример за подкана, която ще покани вашия вход във вашия команден ред.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

В Windows трябва да изпълните следната команда. **(Не забравяйте да добавите точка `.` в края)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Точката `.` е от решаващо значение, тъй като казва на скрипта да инсталира Django във вашата текуща директория (за която точката `.` е препратка).
> 
> **Забележка** Когато пишете командата по-горе, не забравяйте, че въвеждате само частта, която започва от `django-admin.exe`. Частта `(myvenv) C:\Users\Name\djangogirls>`, показана тук, е само пример за подкана, която ще покани вашия вход във вашия команден ред.

<!--endsec-->

`django-admin.py` е скрипт, който ще създаде директории и файлове за вас. Сега трябва да имате структура на директория, която изглежда така:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Забележка**: в структурата на вашата директория ще видите и вашата `venv` директория, която създадохме преди.

`manage.py` е скрипт, който помага при управлението на сайта. С него ще можем (освен всичко друго) да стартираме уеб сървър на нашия компютър, без да инсталираме нищо друго.

Файлът `settings.py` съдържа конфигурацията на вашия уебсайт.

Спомняте ли си, когато говорихме за пощенски превозвач, проверяващ къде да достави писмо? `urls.py` файлът съдържа списък от модели, използвани от `urlresolver`.

За сега игнорираме останалите файлове, тъй като няма да ги променяме. Единственото нещо, което трябва да запомните, е да не ги изтриете случайно!

## Промяна на настройките

Нека направим някои промени в `mysite/settings.py`. Отворете файла с помощта на редактора на кода, който сте инсталирали по-рано.

**Забележка**: Имайте предвид, че `settings.py` е обикновен файл, като всеки друг. Можете да го отворите от редактора на кода, като използвате действията от менюто "файл -> отвори". Това трябва да ви изведе обичайния прозорец, в който можете да се придвижите до вашия файл `settings.py` и да го изберете. Освен това можете да отворите файла, като отворите папката djangogirls на вашия работен плот и щракнете с десния бутон върху него. След това изберете редактора на кода от списъка. Изборът на редактора е важен, тъй като може да имате инсталирани други програми, които могат да отворят файла, но няма да ви позволят да го редактирате.

Би било хубаво да имаме точното време на нашия уебсайт. Отидете в [списъка на часовите зони на Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) и копирайте съответната часова зона (ЧЗ) (напр. `Европа/Берлин`).

В `settings.py` намерете реда, който съдържа `TIME_ZONE` и го модифицирайте, за да изберете своя собствена часова зона. Например:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Езиков код се състои от езика, напр. `en` за английски или `de` за немски, и кодът на държавата, напр. `de` за Германия или `ch` за Швейцария. Ако английският не е вашият роден език, можете да добавите това, за да промените бутоните по подразбиране и известията от Django, за да бъдат на вашия език. Така че ще имате бутон „Отказ“, преведен на езика, който сте дефинирали тук. [Django идва с много подготвени преводи](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Ако искате друг език, променете езиковия код, като промените следния ред:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Ще трябва също да добавим път за статични файлове. (Ще разберем всичко за статичните файлове и CSS по-късно в урока.) Слезте до *края* на файла и точно под надписа `STATIC_URL` добавете нов, наречен `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

When `DEBUG` is `True` and `ALLOWED_HOSTS` is empty, the host is validated against `['localhost', '127.0.0.1', '[::1]']`. This won't match our hostname on PythonAnywhere once we deploy our application so we will change the following setting:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Note**: If you're using a Chromebook, add this line at the bottom of your settings.py file: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9

## Set up a database

There's a lot of different database software that can store data for your site. We'll use the default one, `sqlite3`.

This is already set up in this part of your `mysite/settings.py` file:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

To create a database for our blog, let's run the following in the console: `python manage.py migrate` (we need to be in the `djangogirls` directory that contains the `manage.py` file). If that goes well, you should see something like this:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

And we're done! Time to start the web server and see if our website is working!

## Starting the web server

You need to be in the directory that contains the `manage.py` file (the `djangogirls` directory). In the console, we can start the web server by running `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!