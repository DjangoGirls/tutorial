# Твой первый проект на Django!

> Часть этой главы основана на учебных пособиях Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Отдельные части этой главы основаны на учебном пособии [django-marcador ](http://django-marcador.keimlink.de/), лицензированном под Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

Давайте сделаем небольшой блог!

Первый шаг — создать новый проект Django. Попросту, это значит что мы запустим несколько стандартных скриптов из поставки Django, который создадут для нас скелет проекта. Это просто куча каталогов и файлов, которые мы будем использовать позже.

Имена этих каталог и файлов очень важны для Django. Ты не должна переименовывать их. Перемещать их в другое место тоже не самая удачная идея. Django необходима определенная структуру, чтобы иметь возможность найти важные вещи.

> Не забудьте: вы должны запускать все команды в virtualenv. Если ты не видишь в командной строке префикс `(myvenv)`, то необходимо активировать virtualenv. Мы объясняли как это сделать в разделе **Работаем с virtualenv** главы **Установка Django**. Для этого нужно набрать `myvenv\Scripts\activate` в Windows или `source myvenv/bin/activate` в Mac OS / Linux.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

В консоли Mac OS или Linux нужно запустить следующую команду; **не забудьте добавить точку `.` в конце**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> `.` Точка крайне важна, потому что говорит скрипту устанавливать Django в вашем текущем каталоге (который и обозначается сокращённо точкой `.`).
> 
> **Примечание** При вводе команд выше, помните что вам нужно набирать только часть, начинающуюся с `django-admin`. The `(myvenv) ~/djangogirls$` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

On Windows you should run the following command. **(Don't forget to add the period (or dot) `.` at the end)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> `.` Точка крайне важна, потому что говорит скрипту устанавливать Django в вашем текущем каталоге (который и обозначается сокращённо точкой `.`).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin.exe`. The `(myvenv) C:\Users\Name\djangogirls>` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

`django-admin.py` это скрипт, который создаст необходимую структуру директорий и файлы для нас. Ты должна теперь иметь следующую структуру проекта:

    djangogirls
    ├───manage.py
    ├───mysite
    │        settings.py
    │        urls.py
    │        wsgi.py
    │        __init__.py
    └───requirements.txt
    

> **Note**: in your directory structure, you will also see your `venv` directory that we created before.

`manage.py` is a script that helps with management of the site. With it we will be able (amongst other things) to start a web server on our computer without installing anything else.

Файл `settings.py` содержит настройки для твоего веб-сайта.

Помнишь нашу аналогию с почтальоном? Файл `urls.py` содержит список шаблонов, по которым ориентируется `urlresolver`.

Давай пока забудем про остальные файлы - мы не будем их изменять. Только не удали их случайно!

## Изменяем настройки

Давай внесем изменения в `mysite/settings.py`. Открой файл в текстовом редакторе, который ты выбрала ранее.

**Note**: Keep in mind that `settings.py` is a regular file, like any other. You can open it from inside the code editor, using the "file -> open" menu actions. This should get you the usual window in which you can navigate to your `settings.py` file and select it. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

Было бы неплохо установить корректный часовой пояс на нашем сайте. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

In `settings.py`, find the line that contains `TIME_ZONE` and modify it to choose your own timezone. For example:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

We'll also need to add a path for static files. (We'll find out all about static files and CSS later in the tutorial.) Go down to the *end* of the file, and just underneath the `STATIC_URL` entry, add a new one called `STATIC_ROOT`:

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

## Создание базы данных

Существует множество различных баз данных, которые могут хранить данные для твоего сайта. Мы будем использовать стандартную -- `sqlite3`.

Она уже выбрана по умолчанию в файле `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Чтобы создать базу данных для нашего блога, набери в командной строке следующее: `python manage.py migrate` (мы должны быть в директории `djangogirls`, где расположен файл `manage.py`). Если все прошло успешно, то ты увидишь следующий результат:

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
    

И мы закончили! Пришло время запустить веб-сервер и посмотреть работает ли наш веб-сайт!

## Запуск веб-сервера

Ты должна быть в директории, где расположен файл `manage.py` (в нашем случае -- `djangogirls`). Запустим веб-сервер из командной строки: `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Если вы используете Windows, и команда падает с ошибкой `UnicodeDecodeError`, используйте вместо неё другую:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Поздравляем! Ты только что создала свой первый веб-сайт и запустила его на веб-сервере! Ну не круто ли?

![Установка работает!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Готова к следующему шагу? Пришло время создать наполнение для нашего блога!