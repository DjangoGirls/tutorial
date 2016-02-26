# Ваш перший Django проект!

> Частина цього розділу базується на матеріалах Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

> Частина цього розділу базується на матеріалх [django-marcador tutorial](http://django-marcador.keimlink.de/)
ліцензованих Creative Commons Attribution-ShareAlike 4.0 International License.
Авторське право на навчальні матеріали django-marcador tutorial належить
Markus Zapke-Gründemann та ін.

Ми збираємося створити простий блог!

Перший крок - це почати новий проект Django. По суті, це означає що ми запустимо деякі скрипти, які надає Django, що створять для нас скелет Django проекту. Це просто кілька каталогів та файлів, якими ми користуватимемось пізніше.

Імена деяких файлів і папок є дуже важливими для Django. Не можна перейменовувати файли, які ми зараз будемо створювати. Їх переміщення в різні місця також не є хорошою ідеєю. Для того щоб Django міг знаходити важливі речі, потрібно підтримувати задану архітектуру.

> Пам'ятайте, що усе треба запускати у віртуальному середовищі. Якщо ви не бачите префікс `(myvenv)` в консолі, то потрібно активувати ваше віртуальне середовище. Ми пояснювали як це зробити у розділі __Встановлення Django__ в частині __Робота з віртуальним середовищем__.
Команда `myvenv\Scripts\activate` на Windows або `source myvenv/bin/activate` на Mac OS / Linux зробить це за вас.

В терміналі Mac OS або Linux слід запустити наступну команду; **не забудьте додати крапку `.` в кінці**:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .

У Windows; **не забудьте додати крапку `.` в кінці**:

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .

> Крапка `.` має ключове значення, оскільки вона означає "встанови Django в поточний каталог" (символ крапки `.` використовується, щоб не писати повний шлях)

> **Примітка** Коли набираете команду вище, пам'ятайте, що потрібно друкувати тільки ту частину, яка починається з `django-admin` або `django-admin.py`.
Частини шляху `~/djangogirls$ (myvenv)` та `(myvenv) C:\Users\Name\djangogirls >`вказані тут лише
як приклад запрошення командного рядка до введення команд.

`django-admin.py` - це скрипт, що створить для вас усі необхідні папки і файли. Наразі ви повинні мати структуру, котра виглядає наступним чином:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py


`manage.py` - скрипт, що допомагає керувати сайтом. З його допомогою ми зможемо запускати веб сервер без встановлення чогось іще додатково, серед іншого.

Файл `settings.py` містить конфігурацію вашого веб сайту.

Пам'ятаєте, коли ми розмовляли про листоношу, що перевіряє, куди треба доправити листа? Файл `urls.py` містить список шаблонів, що використовуються елементом `urlresolver`.

Проігноруємо поки інші файли, адже ми не будемо їх змінювати. Єдина річ, яку варто пам'ятати - не видалити їх ненароком!


## Зміна налаштувань

Здійснимо деякі зміни в `mysite/settings.py`. Відкриємо файл в текстовому редакторі, який ви мали встановити раніше.

Було б непогано мати коректний час на нашому сайті. Перейдіть до [списку часових поясів на Вікіпедії](http://en.wikipedia.org/wiki/List_of_tz_database_time_zones) та скопіюйте відповідний часовий пояс (TZ). (напр. `Europe/Kiev`)

У файлі settings.py знайдіть рядок, що містить `TIME_ZONE` і замініть його на ваш часовий пояс:

```python
TIME_ZONE = 'Europe/Kiev'
```

Попередній рядок показує як обрати часовий пояс "Europe/Kiev"


Нам також необхідно додати шлях для статичних файлів (згодом із посібника ви дізнаетесь все про "статичні файли" та листи стилів (CSS)). Перейдіть *в кінець* файлу та додайте новий запис `STATIC_ROOT` одразу під словом `STATIC_URL`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```


## Налаштування бази даних

Існує безліч різноманітних програмних продуктів, що працюють із базами даних і можуть зберігати дані для вашого сайту. Ми будемо користуватися таким, що вказаний за замовчуванням - `sqlite3`.

Відповідні налаштування вже прописані у файлі `mysite/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Щоб створити базу даних для нашого блогу, давайте запустимо наступне в консолі: `python manage.py migrate` (ми повинні знаходитися всередині директорії `djangogirls`, яка містить файл `manage.py`). Якщо все пройшло успішно, ви маєте побачити щось на кшталт:

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

Ми це зробили! Час запустити веб сервер і перевірити чи працює наш сайт!

Ви повинні знаходитися в папці, що містить файл `manage.py` (папка `djangogirls`). В консолі ми можемо активувати веб сервер запустивши `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver

Якщо ви використовуєте Windows і бачите помилку `UnicodeDecodeError` слід виконати наступну команду:

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000


А зараз ви повинні перевірити, чи запущений ваш веб-сайт. Відкрийте браузер (Firefox, Chrome, Safari, Internet Explorer або будь-який інший) і введіть адресу:

    http://127.0.0.1:8000/

Веб-сервер забирає на себе керування командним рядком, доки ви його не зупините. Моб мати можливість виконувати нові команди, поки працює веб-сервер, відкрийте нове вікно командного рядка (терміналу) та активуйте ваш virtualenv. Щоб зупинити веб-сервер, переключіться назад до вікна, в якому він працює і використайте сполучення клавіш CTRL + C (натисніть клавіші разом) (на Windows, можливо, доведеться натиснути клавіші Ctrl + Break).

Вітаємо! Ви щойно створили свій перший веб-сайт та запустили його на веб-сервері! Хіба ж це не круто?

![Працює!](images/it_worked2.png)

Готові до наступного кроку? Час додати трішки контенту!
