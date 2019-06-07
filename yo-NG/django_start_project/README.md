# Iṣẹ́ Django àkọ́kọ́ rẹ!

> Apá kan lára àkòrí yìí dá lórí àwọn àlàyé ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Àwọn apá kan lára àkòrí yìí dá lórí [àlàyé django-marcador](http://django-marcador.keimlink.de/) náà tó ní ìwé-àṣẹ lábẹ́ Creative Commons Attribution-ShareAlike 4.0 International License. Àlàyé django-marcador náà ni ẹ̀tọ́ rẹ̀ jẹ́ ti Markus Zapke-Gründemann et al.

A óò ṣẹ̀dá blog kékeré kan!

Ìgbésẹ̀ àkọ́kọ́ ni láti bẹ̀rẹ̀ iṣẹ́ Django tuntun kan. Basically, this means that we'll run some scripts provided by Django that will create the skeleton of a Django project for us. Èyí wulẹ̀ jẹ́ àpapọ̀ àkójọpọ̀ fáìlì àti àwọn fáìlì kan tí a ó lò tó bá yá.

Orúkọ àwọn fáìlì àti àkójọpọ̀ fáìlì kan ṣe pàtàkì gan-an fún Django. You should not rename the files that we are about to create. Moving them to a different place is also not a good idea. Django needs to maintain a certain structure to be able to find important things.

> Remember to run everything in the virtualenv. If you don't see a prefix `(myvenv)` in your console, you need to activate your virtualenv. We explained how to do that in the **Django installation** chapter in the **Working with virtualenv** part. Typing `myvenv\Scripts\activate` on Windows or `source myvenv/bin/activate` on Mac OS X or Linux will do this for you.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

In your Mac OS X or Linux console, you should run the following command. **Don't forget to add the period (or dot) `.` at the end!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> The period `.` is crucial because it tells the script to install Django in your current directory (for which the period `.` is a short-hand reference).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin`. The `(myvenv) ~/djangogirls$` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

On Windows you should run the following command. **(Don't forget to add the period (or dot) `.` at the end)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> The period `.` is crucial because it tells the script to install Django in your current directory (for which the period `.` is a short-hand reference).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin.exe`. The `(myvenv) C:\Users\Name\djangogirls>` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

`django-admin.py` is a script that will create the directories and files for you. You should now have a directory structure which looks like this:

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

The `settings.py` file contains the configuration of your website.

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

## Bíbẹ̀rẹ̀ server ayélujára náà

O nílò láti wà nínú àkójọpọ̀ fáìlì tó kó fáìlì `manage.py` náà sínú (àkójọpọ̀ fáìlì `djangogirls` náà). Nínú console náà, a lè bẹ̀rẹ̀ server ayélujára náà nípasẹ̀ ṣíṣe `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Tí o bá wà lórí Chromebook kan, lo àṣẹ yìí dípò:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Tí o bá wà lórí Windows tí èyí sì kùnà pẹ̀lú àṣìṣe `UnicodeDecodeError`, lo àṣẹ yìí dípò:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Ní báyìí, o nílò láti ṣàyẹ̀wò tí ààyè ayélujára rẹ bá n ṣiṣẹ́. Ṣí aṣàwákiri rẹ (Firefox, Chrome, Safari, Internet Explorer tàbí èyíkéyìí tó bá n lò) kí o sì tẹ àdírẹ́ẹ̀sì yìí:

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