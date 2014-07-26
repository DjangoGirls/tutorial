# Deploy!

Until now your website was only available on your computer, now you will learn how to deploy it! Deploying is a process of publishing your application on the Internet so people can finally go and see your app :).

As you learned, a website has to be located on a server. There are a lot of providers, but we will use the one with the simplest deployment process: [Heroku](http://heroku.com/). Heroku is free for small applications that don't have too many visitors, it'll definitely be enough for you now.

We will be following this tutorial: https://devcenter.heroku.com/articles/getting-started-with-django, but we pasted it here so it's easier for you.

## Requirements.txt

We need to create a `requirements.txt` file to tell Heroku what Python packages need to be installed on our server.

But first, Heroku needs us to install the `django-toolbelt` package. Go to your console with `virtualenv` activated and type this:

    (blog) $ pip install django-toolbelt

After the installation is finished, run this command:

    (blog) $ pip freeze > requirements.txt

This will create a file called `requirements.txt` with a list of your installed packages (i.e. Python libraries that you are using, for example Django :)).

## Procfile

Another thing we need to create is a Procfile. Open up your code editor, create a file called `Procfile` in `mysite` directory and add this line:

    web: gunicorn mysite.wsgi

Then save it. Done!

## Runtime.txt

We need to tell Heroku which Python version we want to use. This is simply done by creating a `runtime.txt` and putting the following text inside:

    python-3.4.1

## mysite/local_settings.py

There is a difference between settings we are using locally (on our computer) and settings for our server. Heroku is using one database, and your computer is using a different database.  That's why we need to create a seperate file for settings that will only be available for our local enviroment.

Go ahead and create `mysite/local_settings.py` file. It should contain your `DATABASE` setup from your `mysite/settings.py` file. Just like that:

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

Then just save it! :)

## mysite/settings.py

Another thing we need to do is modify our website's `settings.py` file. Open `mysite/settings.py` in your editor and add the following lines at the end of the file:

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()

    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

    ALLOWED_HOSTS = ['*']

    STATIC_ROOT = 'staticfiles'

At the end of the `mysite/settings.py`, copy and paste this:

    try:
        from .local_settings import *
    except:
        pass

It'll import all of your local settings if the file exists.

Then save the file.

## mysite/urls.py

Open `mysite/urls.py` file and add these two lines in the beginning of the file:

    from django.conf.urls.static import static
    from django.conf import settings

And add this line after last `)`:

     + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

The whole thing should look like this:

    from django.conf.urls.static import static
    from django.conf import settings
    from django.conf.urls import patterns, include, url

    from django.contrib import admin
    admin.autodiscover()

    urlpatterns = patterns('',
        url(r'', include('blog.urls')),
        url(r'^admin/', include(admin.site.urls)),
    ) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

## mysite/wsgi.py

Open the `mysite/wsgi.py` file and replace this line:

    application = get_wsgi_application()

with this:

    from dj_static import Cling
    application = Cling(get_wsgi_application())

All right!

## Heroku account

You need to install your Heroku toolbelt which you can find here (you can skip the installation if you've already installed it during setup): https://toolbelt.heroku.com/

> When running the Heroku toolbelt installation program on Windows make sure to choose "Custom Installation" when being asked which components to install. In the list of components that shows up after that please additionally check the checkbox in front of "Git and SSH".

> On Windows you also must run the following command to add Git and SSH to your command prompt's `PATH`: `setx PATH "%PATH%;C:\Program Files\Git\bin"`. Restart the command prompt program afterwards to enable the change.

Please also create a free Heroku account here: https://id.heroku.com/signup/www-home-top

Then authenticate Heroku account on you computer by running this command:

    $ heroku login

In case you don't have SSH key that command would automatically create one. SSH keys are required to push code to the Heroku.

## Git

Heroku uses git repository to manage your project files, so we need to use it to.

Create `.gitignore` file with following content:

    venv
    __pycache__
    staticfiles
    local_settings.py

and save it. The dot on the beginning of the file name is important! As you can see, we're now telling Heroku to ignore `local_settings.py` and don't download it, so it's only available on your computer (locally).

Next, we’ll create a new git repository and save our changes. Go to your console and run this commands:

    $ git init
    Initialized empty Git repository in /Users/kreitz/hellodjango/.git/
    $ git add .
    $ git commit -m "My Django Girls app"
    [master (root-commit) 2943412] My Django Girls
     7 files changed, 230 insertions(+)
     create mode 100644 .gitignore
     create mode 100644 Procfile
     create mode 100644 mysite/__init__.py
     create mode 100644 mysite/settings.py
     create mode 100644 mysite/urls.py
     create mode 100644 mysite/wsgi.py
     create mode 100644 manage.py
     create mode 100644 requirements.txt
     create mode 100644 runtime.txt

## Deploy to Heroku!

It was a lot of configuration and installing, right? But you need to do that once! Now you can deploy!

It's as simple as running this command, replacing `djangogirlsblog` with your own application name:

    $ heroku create djangogirlsblog

This automatically added the Heroku remote for our app  to our repository. Now we can do a simple git push to deploy our application:

    $ git push heroku master

## Visit your application

You’ve deployed your code to Heroku, and specified the process types in a `Procfile`. You can now instruct Heroku to execute a process type.

Let’s ensure we have one dyno running the web process type:

    $ heroku ps:scale web=1

We can now visit the app in our browser with `heroku open`.

    $ heroku open

As you can see, there is an error. Heroku created a new database for us and it's empty.  We also need to sync it:

    $ heroku run python manage.py syncdb

You should now see your website in a browser! Congrats :)!


