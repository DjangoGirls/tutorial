# Deploy!

Until now your website was only available on your computer, now you will learn how to deploy it! Deploying is the process of publishing your application on the Internet so people can finally go and see your app :).

As you learned, a website has to be located on a server. There are a lot of providers, but we will use the one with the simplest deployment process: [Heroku](http://heroku.com/). Heroku is free for small applications that don't have too many visitors, it'll definitely be enough for you now.

We will be following this tutorial: https://devcenter.heroku.com/articles/getting-started-with-django, but we pasted it here so it's easier for you.

## The `requirements.txt` file

We need to create a `requirements.txt` file to tell Heroku what Python packages need to be installed on our server.

But first, Heroku needs us to install a few packages. Go to your console with `virtualenv` activated and type this:

    (myvenv) $ pip install dj-database-url gunicorn whitenoise

After the installation is finished, go to the `djangogirls` directory and run this command:

    (myvenv) $ pip freeze > requirements.txt

This will create a file called `requirements.txt` with a list of your installed packages (i.e. Python libraries that you are using, for example Django :)).

Open this file and add the following line at the bottom:

    psycopg2==2.5.3

This line is needed for your application to work on Heroku.


## Procfile

Another thing we need to create is a Procfile. This will let Heroku know which commands to run in order to start our website.
Open up your code editor, create a file called `Procfile` in `djangogirls` directory and add this line:

    web: gunicorn mysite.wsgi

This line means that we're going to be deploying a `web` application, and we'll do that by running the command `gunicorn mysite.wsgi` (`gunicorn` is a program that's like a more powerful version of Django's `runserver` command).

Then save it. Done!

## The `runtime.txt` file

We need to tell Heroku which Python version we want to use. This is simply done by creating a `runtime.txt` and putting the following text inside:

    python-3.4.1

## mysite/local_settings.py

There is a difference between settings we are using locally (on our computer) and settings for our server. Heroku is using one database, and your computer is using a different database.  That's why we need to create a seperate file for settings that will only be available for our local enviroment.

Go ahead and create `mysite/local_settings.py` file. It should contain your `DATABASE` setup from your `mysite/settings.py` file. Just like that:

    import os
    BASE_DIR = os.path.dirname(os.path.dirname(__file__))

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }

    DEBUG = True

Then just save it! :)

## mysite/settings.py

Another thing we need to do is modify our website's `settings.py` file. Open `mysite/settings.py` in your editor and add the following lines at the end of the file:

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()

    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

    ALLOWED_HOSTS = ['*']

    STATIC_ROOT = 'staticfiles'

    DEBUG = False

At the end of the `mysite/settings.py`, copy and paste this:

    try:
        from .local_settings import *
    except ImportError:
        pass

It'll import all of your local settings if the file exists.

Then save the file.

## mysite/wsgi.py

Open the `mysite/wsgi.py` file and add these lines at the end:

    from whitenoise.django import DjangoWhiteNoise
    application = DjangoWhiteNoise(application)

All right!

## Heroku account

You need to install your Heroku toolbelt which you can find here (you can skip the installation if you've already installed it during setup): https://toolbelt.heroku.com/

> When running the Heroku toolbelt installation program on Windows make sure to choose "Custom Installation" when being asked which components to install. In the list of components that shows up after that please additionally check the checkbox in front of "Git and SSH".

> On Windows you also must run the following command to add Git and SSH to your command prompt's `PATH`: `setx PATH "%PATH%;C:\Program Files\Git\bin"`. Restart the command prompt program afterwards to enable the change.

Please also create a free Heroku account here: https://id.heroku.com/signup/www-home-top

Then authenticate your Heroku account on your computer by running this command:

    $ heroku login

In case you don't have an SSH key this command will automatically create one. SSH keys are required to push code to the Heroku.

## Ignore some files

We don't want to send all of our project files to Heroku. Some of them, like `local_settings.py` or our database, need to stay only on our local computer. In order to tell Heroku which files should it ignore, we need to create a `.gitignore` file in our project main directory.

Create `.gitignore` file with the following content:

    myvenv
    __pycache__
    staticfiles
    local_settings.py
    db.sqlite3

and save it. The dot on the beginning of the file name is important!

> __Note:__ Remember to replace `myvenv` with the name you gave your `virtualenv`!

## Deploy to Heroku!

It was a lot of configuration and installing, right? But you only need to do that once! Now you can deploy:

It's as simple as running this command, replacing `djangogirlsblog` with your own application name:

    $ heroku create djangogirlsblog

One more thing: let's install [heroku-push plugin](https://github.com/ddollar/heroku-push) by running this command:

    $ heroku plugins:install https://github.com/ddollar/heroku-push

Now we can do a simple push to deploy our application:

    $ heroku push --app djangogirlsblog

> __Note__: Remember to replace `djangogirlsblog` with the name of your application on Heroku.

## Visit your application

You’ve deployed your code to Heroku, and specified the process types in a `Procfile` (we chose a `web` process type earlier).
We can now tell Heroku to start this `web process`.

To do that, run the following command:

    $ heroku ps:scale web=1 --app djangogirlsblog

This tells Heroku to run just one instance of our `web` process. Since our blog application is quite simple, we don't need too much power and so it's fine to run just one process. It's possible to ask Heroku to run more processes (by the way, Heroku calls these processes "Dynos" so don't be surprised if you see this term) but it will no longer be free.

We can now visit the app in our browser with `heroku open`.

    $ heroku open --app djangogirlsblog

One final step; Heroku created a new database for us but we also need to sync it:

    $ heroku run python manage.py migrate --app djangogirlsblog

You should now be able to see your website in a browser! Congrats :)!
