# Deploy!

Until now your website was only available on your computer, now we will learn how to deploy it! Deploying is a process of publishing your application on the Internet so people can finally go and see your app :)

As you learned, a website has to be located on a server. There are a lot of providers, but we will use the one with the simplest deployment process: [Heroku](http://heroku.com/). Heroku is free for small applications that don't have too many visitors, it'll definitely be enough for you too.

We will be following this tutorial: https://devcenter.heroku.com/articles/getting-started-with-django, but we pasted it here so it's easier for you.

## Requirements.txt

We need to create a `requirements.txt` file to tell Heroku what Python packages need to be installed on our server.

But first, Heroku needs us to install the `django-toolbelt` package. Go to your console with `virtualenv` activated and type this:

    $ pip install django-toolbelt

After the installation is finished, run this command:

    $ pip freeze > requirements.txt

This will create a file called `requirements.txt` with a list of your installed packages.

## Procfile

Another thing we need to create is a Procfile. Open up your code editor, create a file called `Procfile` in `mysite` directory and add this line:

    web: gunicorn mysite.wsgi

Then save it. Done!

## mysite/settings.py

Another thing we need to do is modify our website's `settings.py` file. Open `mysite/settings.py` in your editor and add the following lines:

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()

    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

    ALLOWED_HOSTS = ['*']

    STATIC_ROOT = 'staticfiles'

Then save the file.

## mysite/urls.py

Open `mysite/urls.py` file and add these two line in the begining of the file:

    from django.conf.urls.static import static
    from django.conf import settings

And add this line after last `)`:

     + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

The whole thing should look like this:

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

## Install Heroku toolbelt

You need to install your Heroku toolbelt which you can find here: https://toolbelt.heroku.com/

You can also create a free Heroku account here: https://id.heroku.com/signup/www-home-top

Then authenticate Heroku account on you computer by running this command:

    $ heroku login

## Git

Heroku uses git repository to manage your project files, so we need to use it to.

Create `.gitignore` file with following content:

    venv
    __pycache__
    staticfiles

and save it. The dot on the begining of the name file is important! This will tell Heroku to ignore this file and don't use it.

Next, we’ll create a new git repository and save our changes. Go to your console/command-line and run this commands:

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

## Deploy to Heroku!

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

You should now see your website in a browser! Congrats :)


