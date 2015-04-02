# Deploy!

> __Note__: The following chapter can be sometimes a bit hard to get through. Persist and finish it; deployment is an important part of the website development process. This chapter is placed in the middle of the tutorial so that your mentor can help with the slightly tricker process of getting your website online. This means you can still finish the tutorial on your own if you run out of time.

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

> __Note__: `pip freeze` outputs a list of all the Python libraries installed in your virtualenv, and the `>` takes the output of `pip freeze` and puts it into a file. Try running `pip freeze` without the `> requirements.txt` to see what happens!

Open this file and add the following line at the bottom:

    psycopg2==2.5.4

This line is needed for your application to work on Heroku.


## Procfile

Another thing we need to create is a Procfile. This will let Heroku know which commands to run in order to start our website.
Open up your code editor, create a file called `Procfile` in `djangogirls` directory and add this line:

    web: gunicorn mysite.wsgi

This line means that we're going to be deploying a `web` application, and we'll do that by running the command `gunicorn mysite.wsgi` (`gunicorn` is a program that's like a more powerful version of Django's `runserver` command).

Then save it. Done!

## The `runtime.txt` file

We need to tell Heroku which Python version we want to use. This is done by creating a `runtime.txt` in the `djangogirls` directory using your editor's "new file" command, and putting the following text (and nothing else!) inside:

    python-3.4.2

## mysite/local_settings.py

There is a difference between settings we are using locally (on our computer) and settings for our server. Heroku is using one database, and your computer is using a different database. That's why we need to create a separate file for settings that will only be available for our local environment.

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
    DATABASES['default'] = dj_database_url.config()

    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

    ALLOWED_HOSTS = ['*']

    STATIC_ROOT = 'staticfiles'

    DEBUG = False

    try:
        from .local_settings import *
    except ImportError:
        pass

It'll do necessary configuration for Heroku and also it'll import all of your local settings if `mysite/local_settings.py` exists.

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

> After restarting your command prompt, don't forget to go to your `djangogirls` folder again and activate your virtualenv! (Hint: [Check the Django installation chapter](../django_installation/README.md#working-with-virtualenv))

Please also create a free Heroku account here: https://id.heroku.com/signup/www-home-top

Then authenticate your Heroku account on your computer by running this command:

    $ heroku login

In case you don't have an SSH key this command will automatically create one. SSH keys are required to push code to the Heroku.

## Git
Git is a version control system used by a lot of programmers - software which keeps track of changes to a file or set of files over time so that you can recall specific versions later. Heroku uses a git repository to manage your project files, so we need to use it too.

Create a file named `.gitignore` in your `djangogirls` directory with the following content:

    myvenv
    __pycache__
    staticfiles
    local_settings.py
    db.sqlite3
    *.py[co]

and save it. The dot on the beginning of the file name is important! As you can see, we're now telling Heroku to ignore `local_settings.py` and don't download it, so it's only available on your computer (locally).

Next, we’ll create a new git repository and save our changes.

> __Note__: Check out your current working directory with a `pwd` command before initializing the repository. You should be in the `djangogirls` folder.

Go to your console and run these commands:

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config user.name "Your Name"
    $ git config user.email you@example.com

Initializing the git repository is something we only need to do once per project.

It's a good idea to use a `git status` command before `git add` or whenever you find yourself unsure of what will be done, to prevent any surprises from happening (e.g. wrong files will be added or commited). The `git status` command returns information about any untracked/modifed/staged files, branch status and much more. The output should be similar to:

    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

      .gitignore
      Procfile
      mysite/__init__.py
      mysite/settings.py
      mysite/urls.py
      mysite/wsgi.py
      manage.py
      requirements.txt
      runtime.txt

    nothing added to commit but untracked files present (use "git add" to track)

And finally we save our changes. Go to your console and run these commands:

    $ git add -A .
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

## Pick an application name

We'll be making your blog available on the Web at `[your blog's name].herokuapp.com`, so we need to choose a name that nobody else has taken. This name doesn't need to be related to the Django `blog` app or to `mysite` or anything we've created so far. The name can be anything you want, but Heroku is quite strict as to what characters you can use: you're only allowed to use simple lowercase letters (no capital letters or accents), numbers, and dashes (`-`).

Once you've thought of a name (maybe something with your name or nickname in it), run this command, replacing `djangogirlsblog` with your own application name:

    $ heroku create djangogirlsblog

> __Note__: Remember to replace `djangogirlsblog` with the name of your application on Heroku.

If you can't think of a name, you can instead run

    $ heroku create

and Heroku will pick an unused name for you (probably something like `enigmatic-cove-2527`).

If you ever feel like changing the name of your Heroku application, you can do so at any time with this command (replace `the-new-name` with the new name you want to use):

    $ heroku apps:rename the-new-name

> __Note__: Remember that after you change your application's name, you'll need to visit `[the-new-name].herokuapp.com` to see your site.

## Deploy to Heroku!

That was a lot of configuration and installing, right? But you only need to do that once! Now you can deploy!

When you ran `heroku create`, it automatically added the Heroku remote for our app to our repository. Now we can do a simple git push to deploy our application:

    $ git push heroku master

> __Note__: This will probably produce a *lot* of output the first time you run it, as Heroku compiles and installs psycopg. You'll know it's succeeded if you see something like `https://yourapplicationname.herokuapp.com/ deployed to Heroku` near the end of the output.

## Visit your application

You’ve deployed your code to Heroku, and specified the process types in a `Procfile` (we chose a `web` process type earlier).
We can now tell Heroku to start this `web process`.

To do that, run the following command:

    $ heroku ps:scale web=1

This tells Heroku to run just one instance of our `web` process. Since our blog application is quite simple, we don't need too much power and so it's fine to run just one process. It's possible to ask Heroku to run more processes (by the way, Heroku calls these processes "Dynos" so don't be surprised if you see this term) but it will no longer be free.

We can now visit the app in our browser with `heroku open`.

    $ heroku open

> __Note__: you will see an error page! We'll talk about that in a minute.

This will open a url like [https://djangogirlsblog.herokuapp.com/]() in your browser, and at the moment you will probably see an error page. Since we only created the admin view for the app so far, add `admin/` to the url (e.g. [https://djangogirlsblog.herokuapp.com/admin/]()) to see a working page of our web app.

The error you saw was because we when we deployed to Heroku, we created a new database and it's empty. We need to run the ```migrate``` command like we did when we first started our project to set our database up properly:

    $ heroku run python manage.py migrate

    $ heroku run python manage.py createsuperuser

The command prompt will ask you to choose a username and a password again. These will be your login details on your live website's admin page. Refresh it in your browser, and you're good to go!

You should now be able to see your website in a browser! Congrats :)!
