# Ձեր առաջին Django նախագիծը:

> Այս գլխի մի մասը հիմնված է Geek Girls Carrots- ի ձեռնարկների վրա (https://github.com/ggcarrots/django-carrots):
> 
> Այս գլխի մասերը հիմնված են django-marcador ձեռնարկի վրա, որը լիցենզավորված է Creative Commons Attribution-ShareAlike 4.0 միջազգային լիցենզիայի կողմից: Django-marcador ձեռնարկի հեղինակային իրավունքները պաշտպանված են Markus Zapke-Gründemann- ի և այլոց կողմից:

Մենք պատրաստվում ենք ստեղծել փոքրիկ բլոգ:

Առաջին քայլը նոր Django նախագիծ սկսելն է: Ըստ էության, սա նշանակում է, որ մենք գործարկելու ենք մի քանի ստանդարտ սցենարներ Django բաշխումից, որոնք կստեղծեն նախագծի կմախք մեզ համար: Սա ընդամենը գրացուցակների և ֆայլերի մի խումբ է, որոնք մենք կօգտագործենք ավելի ուշ:

Որոշ ֆայլերի և գրացուցակների անունները շատ կարևոր են Django- ի համար: Դուք չպետք է վերանվանեք այն ֆայլերը, որոնք մենք պատրաստվում ենք ստեղծել: Նրանց այլ տեղ տեղափոխելը նույնպես լավ գաղափար չէ: Django- ն պետք է որոշակի կառուցվածք պահպանի, որպեսզի կարողանա գտնել կարևոր բաներ:

> Մի մոռացեք. Դուք պետք է գործադրեք բոլոր հրամանները virtualenv- ով: Եթե ​​հրամանի տողում չեք տեսնում `(myvenv)` նախածանցը, ապա ձեզ հարկավոր է ակտիվացնել virtualenv- ը: Մենք բացատրեցինք, թե ինչպես դա անել, **Django installation/Django տեղադրում** գլխի **Working with virtualenv/ Աշխատանք virtualenv-ի հետ ** բաժնում: Դա անելու համար մուտքագրեք `myvenv\Scripts\activate` Windows- ում կամ `source myvenv/bin/activate` Mac OS / Linux- ում:

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Mac OS- ի կամ Linux- ի վահանակի վրա գործարկեք հետևյալ հրամանը. **մի մոռացեք կետ ավելացնել `  ` at the end!/վերջում**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> `.` կետը կարևոր է, քանի որ այն ասում է, որ սցենարը Django- ն տեղադրի ձեր ընթացիկ գրացուցակում (որի համար `.` կետը կարճ հղում է):
> 
> **Նշում** Վերը նշված հրամանը մուտքագրելիս հիշեք, որ դուք մուտքագրում եք միայն այն հատվածը, որը սկսվում է `django-admin` - ի կողմից: Այս `(myvenv) ~/djangogirls$` հատվածը, որը ցույց է տրված այստեղ, ուղղակի հուշման օրինակ է ՝ հետագա հրամանի մուտքագրման համար:

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Windows- ում պետք է գործարկել հետևյալ հրամանը: ** (Մի մոռացեք վերջում ավելացնել կետը) `. `) **:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> The period `.` is crucial because it tells the script to install Django in your current directory (for which the period `.` is a short-hand reference).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin.exe`. The `(myvenv) C:\Users\Name\djangogirls>` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

`django-admin.py` is a script that will create the directories and files for you. You should now have a directory structure which looks like this:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

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

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

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
> 
> If you are hosting your project on `Glitch.com`, let us protect the Django secret key that needs to remain confidential (otherwise, anyone remixing your project could see it): * First, we are going to create a random secret key. Open the Glitch terminal again, and type the following command: {% filename %}.env{% endfilename %} 
> 
>     bash
>         python -c 'from django.core.management.utils import get_random_secret_key; \
>               print(get_random_secret_key())' This should display a long random string, perfect to use as a secret key for your brand new Django web site. We will now paste this key into a 
> 
> `.env` file that Glitch will only show you if you are the owner of the web site.  
>   
> * Create a file `.env` at the root of your project and add the following property in it: {% filename %}.env{% endfilename %} 
> 
>     bash
>         # Here, inside the single quotes, you can cut and paste the random key generated above
>         SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl' * Then update the Django settings file to inject this secret value and set the Django web site name: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         SECRET_KEY = os.getenv('SECRET') * And a little further, in the same file, we inject the name of your new Glitch website: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"] The 
> 
> `PROJECT_DOMAIN` value is automatically generated by Glitch. It will correspond to the name of your project.

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
    

or this one if you are using Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!