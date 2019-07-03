# اولین پروژه جنگو شما!

> قسمت‌هایی از این بخش بر اساس دوره آموزشی Geek Girls Carrots بنا شده است (https://github.com/ggcarrots/django-carrots).
> 
> قسمت‌هایی از این بخش هم بر اساس دوره آموزشی [django-marcador tutorial](http://django-marcador.keimlink.de/) تحت مجوز بین المللی Creative Commons Attribution-ShareAlike 4.0 International License تهیه شده است. امتیاز دوره آموزشی django-marcador متعلق به Markus Zapke-Gründemann و همکاران است.

قصد داریم تا یک وبلاگ کوچک بسازیم!

اولین قدم این است که یک پروژه جدید جنگو بسازیم. در وافع ساختن یک پروژه جنگو شامل اجرا کردن دستوراتی است که توسط جنگو آماده شده و با اجرای آن، بدنه اصلی پروژه ساخته می‌شود. این بدنه، شامل تعدادی پوشه و فایل است که ما بعداً از آن ها استفاده خواهیم کرد.

نام برخی از این فایل‌ها و پوشه‌ها برای جنگو بسیار مهم است. شما نباید نام فایل‌‌هایی که الان می‌خواهیم بسازیم را تغییر دهید. همچنین تغییر پوشه‌های آنها هم ایده خوبی نیست. جنگو باید در یک ساختار مشخص مورد استفاده قرار گیرد تا بتواند چیزهای مهم را پیدا کند.

> به یاد داشته باشید که همه دستورات را در محیط مجازی (virtualenv) اجرا کنید. اگر پیشوند `(myvenv)` را در کنسول خط فرمان نمی‌بینید، باید محیط مجازی را فعال کنید. فعال کردن محیط مجازی را در قسمت **کارکردن با محیط مجازی** از بخش **نصب جنگو** توضیح داده‌ایم. در ویندوز با تایپ `myvenv\Scripts\activate` و در لینوکس یا مک با نوشتن `source myvenv/bin/activate` می‌توانید محیط مجازی را فعال کنید.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

در کنسول لینوکس یا مک باید دستورات زیر را اجرا کنید. **فراموش نکنید که `علامت نقطه` را در آخر عبارت بگذارید!**

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> علامت `.` مهم است برای اینکه به سیستم می‌گوید که جنگو را در همین پوشه جاری نصب کند (به نوعی یک روش ارجاع خلاصه شده است).
> 
> **نکته** وقتی دستور بالا را می‌نویسید به یاد داشته باشید که فقط بخشی را می‌نویسید که با `django-admin` شروع می‌شود. بخش `(myvenv) ~/djangogirls$` نشان می‌دهد که شما باید دستورات ورودی را در مقابل آن بنویسید.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

در ویندوز باید دستور زیر را بنویسید. **(فراموش نکنید که `علامت نقطه` را در انتها بگذارید)**:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> علامت `.` مهم است برای اینکه به سیستم می‌گوید که جنگو را در همین پوشه جاری نصب کند (به نوعی یک روش ارجاع خلاصه شده است).
> 
> **نکته** وقتی دستور بالا را می‌نویسید به یاد داشته باشید که فقط بخشی را می‌نویسید که با `django-admin.exe` شروع می‌شود. بخش `(myvenv) C:\Users\Name\djangogirls>` نشان می‌دهد که شما باید دستورات ورودی را در مقابل آن بنویسید.

<!--endsec-->

`django-admin.py` دستوری است که پوشه‌ها و فایل‌ها را برای شما می‌سازد. الان باید ساختار پوشه‌ها و فایل‌های شما شبیه به این باشد:

    djangogirls
    ┤───manage.py
    ┤───mysite
    │        settings.py
    │        urls.py
    │        wsgi.py
    │        __init__.py
    ┘───requirements.txt
    

> **نکته**: در ساختار پوشه‌ها، شما پوشه `venv` را هم که قبلاً ساخته ایم خواهید دید.

`manage.py` دستوری است که به مدیریت سایت کمک می‌کند. به کمک این دستور (و برخی چیزهای دیگر) و بدون نصب نرم افزارهای دیگر می‌توانیم یک وب سرور بر روی کامپیوتر خود راه اندازی کنیم.

فایل `settings.py` حاوی تنظیمات وبسایت شما است.

Remember when we talked about a mail carrier checking where to deliver a letter? `urls.py` file contains a list of patterns used by `urlresolver`.

Let's ignore the other files for now as we won't change them. The only thing to remember is not to delete them by accident!

## Changing settings

Let's make some changes in `mysite/settings.py`. Open the file using the code editor you installed earlier.

**Note**: Keep in mind that `settings.py` is a regular file, like any other. You can open it from inside the code editor, using the "file -> open" menu actions. This should get you the usual window in which you can navigate to your `settings.py` file and select it. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

It would be nice to have the correct time on our website. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

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

{% filename %}خط فرمان{% endfilename %}

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

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}خط فرمان{% endfilename %}

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