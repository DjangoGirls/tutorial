# Deploy!

> __Note__: The following chapter can be sometimes a bit hard to get through. Persist and finish it; deployment is an important part of the website development process. This chapter is placed in the middle of the tutorial so that your mentor can help with the slightly tricker process of getting your website online. This means you can still finish the tutorial on your own if you run out of time.

Until now your website was only available on your computer, now you will learn how to deploy it! Deploying is the process of publishing your application on the Internet so people can finally go and see your app :).

As you learned, a website has to be located on a server. There are a lot of providers, but we will one of the ones with the simplest deployment process: [PythonAnywhere](http://pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors, it'll definitely be enough for you now.

The other external service we'll be using is [Github](http://www.github.com), which is a code hosting service.  There are others out there, but almost all programmers have a Github account these days, and now so will you!

We'll use Github as a stepping stone to transport our code to & from PythonAnywhere.


TODO: STATIC_ROOT in settings.py


## Git

Git is a "version control system" used by a lot of programmers - software which keeps track of changes to a file or set of files over time so that you can recall specific versions later. 

Go to your console and run these commands, in the `djangogirls` directory:

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config user.name "Your Name"
    $ git config user.email you@example.com

> __Note__: Check your current working directory with a `pwd` command before initializing the repository. You should be in the `djangogirls` folder.

Initializing the git repository is something we only need to do once per project (and you won't have to re-enter the username and email again ever)

Git will track changes to all the files and folders in this directory, but there are some files we want it to ignore.  We do this by creating a file called `.gitignore` in the base directory:

    *.pyc
    __pycache__
    myvenv
    db.sqlite3

The dot on the beginning of the file name is important!

It's a good idea to use a `git status` command before `git add` or whenever you find yourself unsure of what will be done, to prevent any surprises from happening (e.g. wrong files will be added or commited). The `git status` command returns information about any untracked/modifed/staged files, branch status and much more. The output should be similar to:

    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

      .gitignore
      blog/
      manage.py
      mysite/

    nothing added to commit but untracked files present (use "git add" to track)

And finally we save our changes. Go to your console and run these commands:

    $ git add -A .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py


## Pushing our code to github

Go to [www.github.com](http://www.github.com') and sign up for a new, free user account.  Then, create a new repository, giving it the name "my-first-blog".  Leave the "initialise with a README" tickbox un-checked, leave the .gitignore option blank (we've done that manually) and leave the License as None.

<img src="images/new_github_repo.png" />

On the next screen, you'll be shown your repo's clone URL.  Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:

<img src="images/github_get_repo_url_screenshotn.png" />

Now we need to hook up the Git repository on your computer to the one up on Github.

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master

Enter your github username and password, and you should see something like this:

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.

//TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention

Your code is now on Github.  Go and check it out!  You'll find it's in fine company - Django, the djangogirls tutorial, and many other great open source software projects also host their code on Github :)


# Setting up our blog on PythonAnywhere

Next it's time to sign up for a free "Beginner" account on PythonAnywhere.  

* [www.pythonanywhere.com](https://www.pythonanywhere.com/)


> __Note__: When choosing your username here, bear in mind that your blog's URL will take the form `yourusername.pythonanywhere.com`, so either choose your own nickname, or a name for what your blog is all about.


## Pulling our code down on PythonAnywhere

When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page.  Choose the option to start a "Bash" console -- that's the PythonAnywhere version of a console, just like the one on your PC

> __Note__: PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.

Let's pull down our code from github onto PythonAnywhere by creating a "clone" of the repo:

    $ git clone https://github.com/<your-github-username>/my-first-blog.git

This will pull down a copy of your code onto PythonAnywhere.  Check it out by typing:

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py


### Creating a virtualenv on PythonAnywhere

Just like you did on your own computer, you can create a virtualenv on PythonAnywhere.  In the Bash console, type:

    20:20 ~ $ cd my-first-blog

    20:20 ~ $ virtualenv --python=/usr/bin/python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.

    (mvenv)20:20 ~ $  pip install django whitenoise
    Collecting django
    [...]
    Successfully installed django-1.8 whitenoise-1.0.6


// TODO: think about using requirements.txt instead of pip install.


### Collecting static files.

We you wondering what "whitenoise" thing was?  It's a tool for serve so-called "static files".  Static files work differently on servers compared to on our own computer, and we need a tool like "whitenoise" to serve them.

We'll find out a bit more about static files later in the tutorial, when we edit the CSS for our site.

For now we just need to run an extra command called "collectstatic", on the server.  It tells django to gather up all the static files it needs on the server.  Mostly, these are the static files that make the admin site look pretty at the moment.


    20:20 ~ $ python manage.py collectstatic

    You have requested to collect static files at the destination
    location as specified in your settings:

        /home/edith/my-first-blog/static

    This will overwrite existing files!
    Are you sure you want to do this?

    Type 'yes' to continue, or 'no' to cancel: yes

Type "yes", and away it goes!  Don't you love making computers print out pages and pages of impenetrable text?  I always make little noises to accompany it.  Brp, brp brp...

    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.


### Creating the database on PythonAnywhere

Here's another thing that's different between your own computer and the server -- it uses a different database.  So, the user accounts and posts can be different on the server and on your computer.

So we initialise the database on the server just like we did the one on your own computer, with `migrate` and `createsuperuser`:


    (mvenv)20:20 ~ $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK


    (mvenv)20:20 ~ $ python manage.py createsuperuser


## Publishing our blog as a web app

Now our code is on PythonAnywhere, our virtualenv is ready, the static files are collected, and the database is initialised, we're ready to publish it as a web app.

Click back to the PythonAnywhere dashboard by clicking on its logo, and go click on the **Web** tab, and hit **Add a new web app**.

In the dialog, after confirming your domain name, choose **manual configuration** (not "Django". We're too cool for the default PythonAnywhere Django setup). Next, choose **Python 3.4**, and click Next to finish the wizard.  

### Setting the virtualenv

You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.


<img src="images/pythonanywhere_web_tab_virtualenv.png" />

In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter:  */home/yourusername/my-first-blog/myvenv/*

> __Note__: substitute your own username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.


### Configuring the WSGI file

Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports.  The way we configure PythonAnywhere to recognise our django blog is by editing a WSGI configuration file.  

Click the link to it at the top of the web tab (it'll be named something like 
`/var/www/yourusername_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.

Delete all the current contents, and replace them with:

```python
import os
import sys

path = '/home/edith/my-first-blog'   # this should have your username in
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

This file's job is to tell PythonAnywhere where our web app lives (so make sure to substitute your own username for "edith" above) and what the Django settings file's name is.  It also sets up the "whitenoise" static files tool.

Hit **Save**, and then go back to the **Web** tab.  

We're all done!  Hit the big green **Reload** button and you'll be able to go view your application.  You'll find a link to it at the top of the page.


## Debugging tips

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log** -- you'll find a link to this on the PythonAnywhere web tab.  See if there are any error messages in there.  The most recent ones are at the bottom.   Common problems include

- forgetting one of the steps we did in the console: creating the virtualenv, installing django into it, running collectstatic, initialising the database
- making a mistake in the virtualenv path on the web tab -- there will usually be a little red error message on there, if there is a problem
- making a mistake in the WSGI configuration file -- did you get the path to your my-first-blog folder right?

Your coach is here to help!


# You are live!

The default page for your site should say "Welcome to Django", just like it does on your local PC.  Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site.  Log in with the username and password, and you'll see you can add new Posts on the server.


Give yourself a *HUGE* pat on the back -- server deployments are one of the trickiest parts of web development, and it often takes people several days before they get them working.  But you've got your site live, on the real Internet, just like that!


