# Your first Django project!

*This chapter is based on awesome tutorials by Geek Girls Carrots (http://django.carrots.pl/) and django-marcador (http://django-marcador.keimlink.de/).*

We're going to create a simple blog!

The first step towards creating it is starting a new Django project. Basically, this means that we'll run some scripts provided by Django that will create the skeleton of a Django project for us: a bunch of directories and files that we will later use.

The names of some files and directories are very important for Django. You should not rename the files that we are about to create. Moving them to a different place is also not a good idea. Django needs to maintain a certain structure in order to be able to find important things.

In console you should run (remember that you don't type `(blog) ~$`, ok?):

> Remember to run everything in the virtualenv. If you don't see a prefix `(blog)` in your console you need to activate your virtualenv. We explained how to that in __Django installation__ chapter in __Working with virtualenv__ part.

    (blog) ~$ django-admin.py startproject mysite

`django-admin.py` is a script that will create the folders and files for you. You should now have a folder structure which looks like this:

    mysite
    │   manage.py
    │
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py


`manage.py` is a script that helps with management of the site. With it we will be able to start a web server on our computer without installing anything else, amongst other things.

The `settings.py` file contains the configuration of your website.

Remember when we talked about a postman checking where to deliver a letter? `urls.py` file contains a list of patterns used by `urlresolver`.

Let's ignore the other files for now - we won't change them. The only thing to remember is to not delete them by accident!

## Changing settings

Let's make some changes in `mysite/mysite/settings.py`.

It would be nice to have the correct time on our website. You should find lines that contain `USE_TZ` and `TIME_ZONE` and modify them to look like this:

    USE_TZ = False
    TIME_ZONE = 'Europe/Berlin'

## Setup a database

There's a lot of different database software that can store data for your site. We'll use one of the best ones, `PostgreSQL`, which we installed in __Database__ chapter.

Find this part in your `mysite/mysite/settings.py` file:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }

And replace it with this:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': 'djangogirls',
            'USER': 'yourname',
            'PASSWORD': '',
            'HOST': 'localhost',
            'PORT': '',
        }
    }

Make sure to replace `yourname` with the username you created in __Database__ section, then save the file.

To create a database for our blog, let's run the following in the console: `python manage.py syncdb` (we need to be in a parent `mysite` directory that contains `manage.py` file). If that goes well, you should see something like this:

    (blog) ~/mysite python manage.py syncdb
    Creating tables ...
    Creating table django_admin_log
    Creating table auth_permission
    Creating table auth_group_permissions
    Creating table auth_group
    Creating table auth_user_groups
    Creating table auth_user_user_permissions
    Creating table auth_user
    Creating table django_content_type
    Creating table django_session

    You just installed Django's auth system, which means you don't have any superusers defined.
    Would you like to create one now? (yes/no): yes
    Username (leave blank to use 'Name'):
    Email address: admin@example.com
    Password:
    Password (again):
    Superuser created successfully.
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

It will ask you if you want to create a *superuser* - a user which has control over everything on the site. Type `yes`, press enter and type your username (lowercase, no spaces), email address and password when you're asked for them. Remember this username and password! We'll use it later.

And we're done! Time to start the web server and see if our website is working!

You need to be in the folder that contains the `manage.py` file (the `mysite` folder). In the console, we can start the web server by running `python manage.py runserver`:

    (blog) ~/mysite python manage.py runserver

Now all you need to do is check that your website is running - open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter the address:

    http://127.0.0.1:8000/

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![It worked!](images/it_worked2.png)

Ready for the next step? It's time to create some content!
