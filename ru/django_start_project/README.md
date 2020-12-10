# Твой первый проект на Django!

> Часть этой главы основана на учебных пособиях Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

> Отдельные части этой главы основаны на учебном пособии [django-marcador ][1], лицензированном под Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

Мы собираемся создать простой блог!

Первый шаг — создать новый проект Django. В сущности, это значит, что мы запустим несколько стандартных скриптов из поставки Django, которые создадут для нас скелет проекта. Это просто куча каталогов и файлов, которые мы используем позже.

Названия этих каталогов и файлов очень важны для Django. Ты не должна переименовывать их. Перемещать их в другое место тоже не самая удачная идея. Django необходима определенная структура, чтобы иметь возможность найти важные вещи.

> Не забудь: ты должна запускать все команды в virtualenv. Если ты не видишь в командной строке префикса `(myvenv)`, то необходимо активировать virtualenv. Мы объясняли, как это сделать, в разделе __Работаем с virtualenv__ главы __Установка Django__. Для этого нужно набрать `myvenv\Scripts\activate` в Windows или `source myvenv/bin/activate` в Mac OS / Linux.

<!--sec data-title="OS X или Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

В консоли Mac OS или Linux нужно запустить следующую команду (**не забудь добавить точку `.` в конце**):

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ django-admin startproject mysite .
```

> Точка `.` крайне важна, потому что говорит скрипту установить Django в вашем текущем каталоге (который и обозначается сокращённо точкой `.`)
>
> **Примечание:** при вводе приведённой команды помни, что тебе нужно набирать только часть, начинающуюся с `django-admin`. `(myvenv) ~/djangogirls$` — это просто пример строки-приглашения терминала.

<!--endsec-->

<!--sec data-title="Windows" data-id="django_start_project_windows" data-collapse=true ces-->

В Windows запусти следующую команду (**не забудь добавить точку `.` в конце**):

{% filename %}command-line{% endfilename %}
```
(myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
```
> Точка `.` крайне важна, потому что говорит скрипту установить Django в вашем текущем каталоге (который и обозначается сокращённо точкой `.`)

> **Примечание:** при вводе приведённой команды помни, что тебе нужно набирать только часть, начинающуюся с `django-admin.exe`. `(myvenv) C:\Users\Name\djangogirls>` — это просто пример приглашения командной строки.

<!--endsec-->

`django-admin.py` — это скрипт, который создаст необходимую структуру директорий и файлы для нас. Теперь у твоего проекта должна быть следующая структура:

```
djangogirls
├───manage.py
├───mysite
│        settings.py
│        urls.py
│        wsgi.py
│        __init__.py
└───requirements.txt
```
> **Примечание:** в своей структуре директорий ты также увидишь ранее созданную нами директорию с виртуальным окружением.

`manage.py` — это другой скрипт, который помогает с управлением сайтом. С помощью него мы, помимо прочего, сможем запустить веб-сервер на твоем компьютере без установки дополнительных программ.

Файл `settings.py` содержит настройки для твоего веб-сайта.

Помнишь нашу аналогию с почтальоном? Файл `urls.py` содержит список шаблонов, по которым ориентируется `urlresolver`.

Давай пока забудем про остальные файлы — мы не будем их изменять. Только не удали их случайно!


## Изменяем настройки

Давай внесём изменения в `mysite/settings.py`. Открой файл в текстовом редакторе, который ты выбрала ранее.

**Примечание:** помни, что `settings.py` — самый обычный файл. Ты можешь открыть его из своего редактора кода, используя меню «Файл -> Открыть». При этом ты увидишь обычное окно, в котором ты можешь перейти к своему файлу `settings.py` и выбрать его. Либо ты можешь открыть этот файл, перейдя в директорию проекта djangogirls на твоём рабочем столе и щёлкнув по нему правой кнопкой мыши; затем выбери свой редактор кода из предложенного списка. Важно выбрать именно редактор, поскольку у тебя могут быть установлены программы, которые откроют наш файл, но не позволят его изменить.

Было бы неплохо установить корректный часовой пояс на нашем сайте. Перейди к [списку часовых поясов википедии][2] и скопируй название своего часового пояса (TZ) (например, `Europe/Moscow`).

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

В файле settings.py найди строку, содержащую `TIME_ZONE`, и измени её в соответствии со своим часовым поясом:

{% filename %}mysite/settings.py{% endfilename %}
```python
TIME_ZONE = 'Europe/Moscow'
```

Код языка состоит из сокращённого названия языка, например `en` для английского или `ru` для русского, и кода страны, например, `ru` для России или `ch` для Швейцарии. Тебе понадобится эта настройка, если ты хочешь, чтобы все встроенные кнопки и уведомления от Django были на твоём языке. Таким образом, надпись на кнопке «Cancel» будет переведена на заданный тобой язык. [Django поставляется с большим набором готовых переводов](https://docs.djangoproject.com/en/1.11/ref/settings/#language-code).

Измени язык, отредактировав следующую строку:

{% filename %}mysite/settings.py{% endfilename %}
```python
LANGUAGE_CODE = 'ru-ru'
```


Нам также необходимо добавить в настройки информацию о расположении статических файлов (мы познакомимся со статическими файлами и CSS в следующих главах). Спустись в *конец* файла и после переменной `STATIC_URL` добавь новую — `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}
```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Когда наcтройка `DEBUG` имеет значение `True`, а настройка `ALLOWED_HOSTS` пуста, имя хост твоего веб-сайта сверяется со списком `['localhost', '127.0.0.1', '[::1]']`.
Ни одно из значений не будет соответствовать имени хоста на PythonAnywhere при публикации нашего приложения, поэтому нам необходимо изменить следующую настройку:

{% filename %}mysite/settings.py{% endfilename %}
```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Примечание**: В случае если вы используете Chromebook, добавьте следующую строку в конец файла settings.py:
> `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`

## Настройка базы данных

Существует множество различных баз данных, которые могут хранить данные для твоего сайта. Мы будем использовать стандартную — `sqlite3`.

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


Чтобы создать базу данных для нашего блога, набери в командной строке следующее: `python manage.py migrate` (мы должны быть в директории `djangogirls`, где расположен файл `manage.py`). Если всё прошло успешно, то ты увидишь следующий результат:

{% filename %}command-line{% endfilename %}
```
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
  Applying sessions.0001_initial... OK
```

Вот и всё! Пришло время запустить веб-сервер и посмотреть, работает ли наш веб-сайт!

## Запуск веб-сервера

Ты должна быть в директории, где расположен файл `manage.py` (в нашем случае — `djangogirls`). Запустим веб-сервер из командной строки: `python manage.py runserver`:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py runserver
```

Если ты работаешь в Windows, и команда падает с ошибкой `UnicodeDecodeError`, используй вместо неё другую:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py runserver 0:8000
```


Теперь тебе нужно проверить, работает ли веб-сайт — открой браузер (Firefox, Chrome, Safari, Internet Explorer или любой другой) и набери следующий адрес:

{% filename %}browser{% endfilename %}
```
http://127.0.0.1:8000/
```
Если ты используешь Chromebook или Cloud9, вместо этого нажми на ссылку во всплывающем окне, которая должна появиться в правом верхнем углу командного окна, в котором запущен веб сервер. Ссылка может выглядеть так:

{% filename %}browser{% endfilename %}
```
https://<странные буквы и цифры>.vfs.cloud9.us-west-2.amazonaws.com
```
Поздравляем! Ты только что создала свой первый веб-сайт и запустила его на веб-сервере! Ну не круто ли?

![Сработало!][3]

 [3]: images/it_worked2.png

Пока работает веб-сервер, в терминале не будет приглашения для ввода команд. Ты всё ещё сможешь ввести текст, но не сможешь выполнить никакую другую команду. Это происходит потому, что сервер продолжает работу, "слушая" входящие запросы.

> Мы рассматривали, как работают веб-сервера, в главе <b>Как работает интернет</b>.

Веб-сервер займёт командную строку, пока ты его не остановишь. Чтобы и дальше иметь возможность набирать команды, открой ещё одно окно терминала и активируй в нём виртуальное окружение. Чтобы остановить веб-сервер, перейди обратно в окно, в котором он работает, и нажми CTRL + C — кнопки Control и C вместе (в Windows может потребоваться нажать клавиши Ctrl + Break).

Готова к следующему шагу? Пришло время создать содержимое для нашего блога!
