# Твой первый проект на Django!

> Часть этой главы основана на учебных пособиях Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Отдельные части этой главы основаны на учебном пособии [django-marcador ][1], лицензированном под Creative Commons Attribution-ShareAlike 4.0 International License. Руководство django-marcador защищено авторским правом Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

Мы собираемся создать простой блог!

Первый шаг — создать новый проект Django. Попросту, это значит что мы запустим несколько стандартных скриптов из поставки Django, которые создадут для нас скелет проекта. Это просто куча каталогов и файлов, которые мы будем использовать позже.

Имена этих каталог и файлов очень важны для Django. Ты не должна переименовывать их. Перемещать их в другое место тоже не самая удачная идея. Django необходима определенная структура, чтобы иметь возможность найти важные вещи.

> Не забудь: ты должна запускать все команды в virtualenv. Если ты не видишь в командной строке префикса `(myvenv)`, то необходимо активировать virtualenv. Мы объясняли как это сделать в разделе **Работаем с virtualenv** главы **Установка Django**. Для этого нужно набрать `myvenv\Scripts\activate` в Windows или `source myvenv/bin/activate` в Mac OS / Linux.

В консоли Mac OS или Linux нужно запустить следующую команду; **не забудьте добавить точку `.` в конце**:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

В Windows; **не забудьте добавить точку `.` в конце**:

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .
    

> `.` Точка крайне важна, потому что говорит скрипту устанавливать Django в вашем текущем каталоге (который и обозначается сокращённо точкой `.`)
> 
> **Примечание** При вводе команд выше, помните что вам нужно набирать только часть, начинающуюся с `django-admin` или `django-admin.py`. `(myvenv) ~/djangogirls$` и `(myvenv) C:\Users\Name\djangogirls>` — это просто примеры строк-приглашений терминала.

`django-admin.py` это скрипт, который создаст необходимую структуру директорий и файлы для нас. Ты должна теперь иметь следующую структуру проекта:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

`manage.py` это другой скрипт, который помогает с управлением сайтом. С помощью него мы сможем запустить веб-сервер на твоем компьютере без установки дополнительных программ.

Файл `settings.py` содержит настройки для твоего веб-сайта.

Помнишь нашу аналогию с почтальоном? Файл `urls.py` содержит список шаблонов, по которым ориентируется `urlresolver`.

Давай пока забудем про остальные файлы - мы не будем их изменять. Только не удали их случайно!

## Изменяем настройки

Давай внесем изменения в `mysite/settings.py`. Открой файл в текстовом редакторе, который ты выбрала ранее.

Было бы неплохо установить корректный часовой пояс на нашем сайте. Перейди к [списку часовых поясов википедии][2] и скопируй название своего часового пояса (TZ). (например, `Europe/Moscow`)

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

В файле settings.py найди строку, содержащую `TIME_ZONE`, и модифицируй её в соответствии со своим часовым поясом:

```python
TIME_ZONE = 'Europe/Moscow'
```
    

Замени "Europe/Moscow" на соответствующий часовой пояс

Нам также необходимо добавить в настройки информацию о расположении статических файлов (мы познакомимся со статичными файлами и CSS в следующих главах). Спустись в *конец* файла и после переменной `STATIC_URL` добавь новую - `STATIC_ROOT`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```
    

## Настройка базы данных

Существует множество различных баз данных, которые могут хранить данные для твоего сайта. Мы будем использовать стандартную -- `sqlite3`.

Она уже выбрана по умолчанию в файле `mysite/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```
    

Чтобы создать базу данных для нашего блога, набери в командной строке следующее: `python manage.py migrate` (мы должны быть в директории `djangogirls`, где расположен файл `manage.py`). Если все прошло успешно, то ты увидишь следующий результат:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK
    

И мы закончили! Пришло время запустить веб-сервер и посмотреть работает ли наш веб-сайт!

Ты должна быть в директории, где расположен файл `manage.py` (в нашем случае -- `djangogirls`). Запустим веб-сервер из командной строки: `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Если вы используете Windows, и команда падает с ошибкой `UnicodeDecodeError`, используйте вместо неё другую:

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Теперь тебе нужно проверить работает ли веб-сайт - открой браузер (Firefox, Chrome, Safari, Internet Explorer или любой другой) и набери следующий адрес:

    http://127.0.0.1:8000/
    

Веб-сервер займёт командную строку, пока вы его не остановите. Чтобы и дальше иметь возможность набирать команды, откройте ещё одно окно терминала и активируйте в нём виртуальное окружение. Чтобы остановить веб-сервер, перейдите обратно в окно, в котором он работает и нажмите CTRL + C - кнопки Control и C вместе (в Windows, может потребоваться нажать клавиши Ctrl + Break).

Поздравляем! Ты только что создала свой первый веб-сайт и запустила его на веб-сервере! Ну не круто ли?

![Сработало!][3]

 [3]: images/it_worked2.png

Готова к следующему шагу? Пришло время создать наполнение для нашего блога!
