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
> **Примечание** При вводе команд выше, помните что вам нужно набирать только часть, начинающуюся с `django-admin`. (myvenv) ~/djangogirls$ и `(myvenv) C:\Users\Name\djangogirls` — это просто примеры строк-приглашений терминала для последующего ввода команд.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

В Windows тебе необходимо запустить следующую команду **(Не забудь добавить точку `.` в конце)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> `.` Точка крайне важна, потому что говорит скрипту устанавливать Django в вашем текущем каталоге (который и обозначается сокращённо точкой `.`).
> 
> **Примечание** При вводе команд выше, помните что вам нужно набирать только часть, начинающуюся с `django-admin.exe`. (myvenv) ~/djangogirls$ и `(myvenv) C:\Users\Name\djangogirls` — это просто примеры строк-приглашений терминала для последующего ввода команд.

<!--endsec-->

`django-admin.py` это скрипт, который создаст необходимую структуру директорий и файлы для нас. Ты должна теперь иметь следующую структуру проекта:

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
    

> **Примечание**: в структуре каталогов, вы также увидите ваш `venv` каталог, который мы создали раньше.

`manage.py` это скрипт, который помогает управлять сайтом. С помощью него мы сможем запустить веб-сервер на твоем компьютере без установки дополнительных программ.

Файл `settings.py` содержит настройки для твоего веб-сайта.

Помнишь нашу аналогию с почтальоном? Файл `urls.py` содержит список шаблонов, по которым ориентируется `urlresolver`.

Давай пока забудем про остальные файлы - мы не будем их изменять. Только не удали их случайно!

## Изменяем настройки

Давай внесем изменения в `mysite/settings.py`. Открой файл в текстовом редакторе, который ты выбрала ранее.

**Примечание**: Имейте в виду, что `settings.py` является обычным файлом, как и любой другой. Вы можете открыть его из редактора кода, используя «файл-> открыть» меню действия. Вы должны попасть в привычное окно программы, в котором можно перейти к файлу `settings.py` и выбрать его. Кроме того можно открыть файл, перейдя к папке djangogirls на вашем рабочем столе и щелкнув правой кнопкой мыши на файле. Затем выберите ваш редактор кода из списка. Выбор редактора имеет важное значение, так как, возможно, у вас имеются другие установленные программы, которыми можно открыть файл, но нельзя редактировать его.

Было бы неплохо установить корректный часовой пояс на нашем сайте. Перейди к [Списку часовых поясов Википедии](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) и скопируй соответствующий вам часовой пояс (TZ) (например, `Europe/Berlin`).

В файле settings.py найди строку, содержащую `TIME_ZONE`, и модифицируй её в соответствии со своим часовым поясом. Например:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Код языка состоят из языка, например `en` для английского или `de` для немецкого языка и код страны, например `de` для Германии или `ch` для Швейцарии. Если английский - это не ваш родной язык, то можно добавить язык, чтобы изменить кнопки по умолчанию и уведомления с Django на ваш родной языке. Таким образом, кнопка «Отмена» будет переведена на язык, который вы определили здесь. [Django предоставляет множество готовых переводов](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Если вам нужен другой язык, измените код языка, изменив следующую строку:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Также необходимо добавить путь (path) для статичных файлов (static files). (Со статических файлах и CSS мы разберемся чуть позже в тьюториале.) Иди вниз к *концу* файла, и прямо под `STATIC_URL` данными, добавь новые `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Когда `DEBUG` установлен в значение `True` и `ALLOWED_HOSTS` не установлен, то хост располагается на `['localhost', '127.0.0.1', '[::1]']`. Это не соответствуют нашему имени хоста на PythonAnywhere после того, как мы развернули наше приложение, поэтому мы поменяем следующие настройки:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Примечание**: Если ты используешь Chromebook, то добавь эту строку в конец своего settings.py файла: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Также добавь `.amazonaws.com` в `ALLOWED_HOSTS` если используешь cloud9

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
    

Если вы работаете на Хромбуке, то используйте эту команду:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Если вы используете Windows, и команда падает с ошибкой `UnicodeDecodeError`, используйте вместо неё другую:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Теперь тебе нужно проверить работает ли веб-сайт - открой браузер (Firefox, Chrome, Safari, Internet Explorer или любой другой) и набери следующий адрес:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Если вы используете Chromebook и Cloud9, вместо этого нажмите на URL-адрес во всплывающем окне, которое должно появиться в правом верхнем углу окна команд, где выполняется веб-сервер. URL-адрес будет выглядеть примерно так:

{% filename %}browser{% endfilename %}

    https://&lt;a bunch of letters and numbers&gt;.vfs.cloud9.us-west-2.amazonaws.com
    

Поздравляем! Ты только что создала свой первый веб-сайт и запустила его на веб-сервере! Ну не круто ли?

![Установка работает!](images/install_worked.png)

Обратите внимание, что в окне команд в одно время можно запускать только один процесс, и в окне, которое вы открыли чуть раньше, запущен веб-сервер. До тех пор, пока веб-сервер запущен и ждет дополнительных входящих запросов, терминал будет принимать новый текст, но не будет выполнять новые команды.

> Мы сделали обзор того, как работает веб-сервер в главе **Как работает Интернет**.

Чтобы набрать дополнительные команды, пока веб-сервер работает, откройте новое окно терминала и активируйте ваш virtualenv - для просмотра инструкций о том, как открыть второе окно терминала, смотрите [Знакомство с командной строкой](../intro_to_command_line/README.md). Чтобы остановить веб-сервер, перейдите обратно в окно, в котором он работает и нажмите CTRL + C - кнопки Control и C вместе (в Windows, может потребоваться нажать клавиши Ctrl + Break).

Готова к следующему шагу? Пришло время создать наполнение для нашего блога!