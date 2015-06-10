# Deploy!

> **Note** The following chapter can be sometimes a bit hard to get through. Persist and finish it; deployment is an important part of the website development process. This chapter is placed in the middle of the tutorial so that your mentor can help with the slightly tricker process of getting your website online. This means you can still finish the tutorial on your own if you run out of time.

Until now your website was only available on your computer, now you will learn how to deploy it! Deploying is the process of publishing your application on the Internet so people can finally go and see your app :).

As you learned, a website has to be located on a server. There are a lot of providers, but we will use one that has a relatively simple deployment process: [PythonAnywhere](http://pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors, it'll definitely be enough for you now.

The other external service we'll be using is [GitHub](http://www.github.com), which is a code hosting service. There are others out there, but almost all programmers have a GitHub account these days, and now so will you!

We'll use GitHub as a stepping stone to transport our code to and from PythonAnywhere.


# Git

Git is a "version control system" used by a lot of programmers - software which tracks changes to files over time so that you can recall specific versions later. A bit like "track changes" in Microsoft Word, but much more powerful.


## Installing Git

### Windows

You can download Git from [git-scm.com](http://git-scm.com/). You can hit "next next next" on all steps except for one; in the 5th step entitled "Adjusting your PATH environment", choose "Run Git and associated Unix tools from the Windows command-line" (the bottom option). Other than that, the defaults are fine. Checkout Windows-style, commit Unix-style line endings is good.

### MacOS

Download Git from [git-scm.com](http://git-scm.com/) and just follow the instructions.


### Linux

If it isn't installed already, git should be available via your package manager, so try:

```:command-line
sudo apt-get install git
# or for Fedora 21 and older
sudo yum install git
# or for Fedora 22 and newer
sudo dnf install git
```

## Starting our Git repository

Git tracks changes to a particular set of files in what's called a code repository (or "repo" for short). Let's start one for our project. Open up your console and run these commands, in the `djangogirls` directory:

> **Note** Check your current working directory with a `pwd` (OSX/Linux) or `cd` (Windows) command before initializing the repository. You should be in the `djangogirls` folder.

```:command-line
$ git init
Initialized empty Git repository in ~/djangogirls/.git/
$ git config --global user.name "Your Name"
$ git config --global user.email you@example.com
```

Initializing the git repository is something we only need to do once per project (and you won't have to re-enter the username and email again ever).

Git will track changes to all the files and folders in this directory, but there are some files we want it to ignore. We do this by creating a file called `.gitignore` in the base directory. Open up your editor and create a new file with the following contents:

```:.gitignore
*.pyc
__pycache__
myvenv
db.sqlite3
.DS_Store
```

And save it as `.gitignore` in the top-level "djangogirls" folder.

> **Note** The dot at the beginning of the file name is important!  If you're having any difficulty creating it (Macs don't like you to create files that begin with a dot via the Finder, for example), then use the "Save As" feature in your editor, it's bulletproof.

It's a good idea to use a `git status` command before `git add` or whenever you find yourself unsure of what will be done, to prevent any surprises from happening (e.g. wrong files will be added or commited). The `git status` command returns information about any untracked/modifed/staged files, branch status and much more. The output should be similar to:

```:command-line
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
```

And finally we save our changes. Go to your console and run these commands:
```:command-line
$ git add -A .
$ git commit -m "My Django Girls app, first commit"
 [...]
 13 files changed, 200 insertions(+)
 create mode 100644 .gitignore
 [...]
 create mode 100644 mysite/wsgi.py
 ```


## Pushing our code to GitHub

Go to [GitHub.com](http://www.github.com) and sign up for a new, free user account. Then, create a new repository, giving it the name "my-first-blog". Leave the "initialise with a README" tickbox un-checked, leave the .gitignore option blank (we've done that manually) and leave the License as None.

<img src="images/new_github_repo.png" />

> **Note** The name `my-first-blog` is important -- you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. It's probably easier to just stick with the name `my-first-blog`.

On the next screen, you'll be shown your repo's clone URL. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:

<img src="images/github_get_repo_url_screenshot.png" />

Now we need to hook up the Git repository on your computer to the one up on GitHub.

Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, and there should be no angle-brackets):

```:command-line
$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
$ git push -u origin master
```

Enter your GitHub username and password, and you should see something like this:

```:command-line
Username for 'https://github.com': hjwp
Password for 'https://hjwp@github.com':
Counting objects: 6, done.
Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/hjwp/my-first-blog.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Your code is now on GitHub. Go and check it out!  You'll find it's in fine company - [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub :)


# Setting up our blog on PythonAnywhere

Next it's time to sign up for a free "Beginner" account on PythonAnywhere.

* [www.pythonanywhere.com](https://www.pythonanywhere.com/)


> **Note** When choosing your username here, bear in mind that your blog's URL will take the form `yourusername.pythonanywhere.com`, so either choose your own nickname, or a name for what your blog is all about.


## Pulling our code down on PythonAnywhere

When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console -- that's the PythonAnywhere version of a console, just like the one on your PC

> **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.

Let's pull down our code from GitHub onto PythonAnywhere by creating a "clone" of the repo. Type this into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`:

```:command-line
$ git clone https://github.com/<your-github-username>/my-first-blog.git
```

This will pull down a copy of your code onto PythonAnywhere. Check it out by typing:

```:command-line
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
```


### Creating a virtualenv on PythonAnywhere

Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:

```:command-line
20:20 ~ $ cd my-first-blog

20:20 ~ $ virtualenv --python=python3.4 myvenv
Running virtualenv with interpreter /usr/bin/python3.4
[...]
Installing setuptools, pip...done.

20:20 ~ $ source myvenv/bin/activate

(mvenv)20:20 ~ $  pip install django whitenoise
Collecting django
[...]
Successfully installed django-1.8 whitenoise-1.0.6
```


> **Note** The `pip install` step can take a couple of minutes.  Patience, patience!  But if it takes more than 5 minutes, something is wrong.  Ask your coach.

<!--TODO: think about using requirements.txt instead of pip install.-->


### Collecting static files.

Were you wondering what "whitenoise" thing was?  It's a tool for serve so-called "static files". Static files work differently on servers compared to on our own computer, and we need a tool like "whitenoise" to serve them.

We'll find out a bit more about static files later in the tutorial, when we edit the CSS for our site.

For now we just need to run an extra command called `collectstatic`, on the server. It tells Django to gather up all the static files it needs on the server. Mostly, these are the static files that make the admin site look pretty at the moment.

```:command-line
20:20 ~ $ python manage.py collectstatic

You have requested to collect static files at the destination
location as specified in your settings:

    /home/edith/my-first-blog/static

This will overwrite existing files!
Are you sure you want to do this?

Type 'yes' to continue, or 'no' to cancel: yes
```

Type "yes", and away it goes!  Don't you love making computers print out pages and pages of impenetrable text?  I always make little noises to accompany it. Brp, brp brp...

```:command-line
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
[...]
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
62 static files copied to '/home/edith/my-first-blog/static'.
```


### Creating the database on PythonAnywhere

Here's another thing that's different between your own computer and the server -- it uses a different database. So, the user accounts and posts can be different on the server and on your computer.

So we initialise the database on the server just like we did the one on your own computer, with `migrate` and `createsuperuser`:

```:command-line
(mvenv)20:20 ~ $ python manage.py migrate
Operations to perform:
[...]
  Applying sessions.0001_initial... OK


(mvenv)20:20 ~ $ python manage.py createsuperuser
```


## Publishing our blog as a web app

Now our code is on PythonAnywhere, our virtualenv is ready, the static files are collected, and the database is initialised, we're ready to publish it as a web app.

Click back to the PythonAnywhere dashboard by clicking on its logo, and go click on the **Web** tab, and hit **Add a new web app**.

In the dialog, after confirming your domain name, choose **manual configuration** (NB *not* the "Django" option). Next, choose **Python 3.4**, and click Next to finish the wizard.

> **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. We're too cool for the default PythonAnywhere Django setup ;-)


### Setting the virtualenv

You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.


<img src="images/pythonanywhere_web_tab_virtualenv.png" />

In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter:  `/home/<your-username>/my-first-blog/myvenv/`

> **Note** Substitute your own username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.


### Configuring the WSGI file

Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. The way we configure PythonAnywhere to recognise our Django blog is by editing a WSGI configuration file.

Click on the "WSGI configuration file" link (in the "Code" section near the top of the page -- it'll be named something like `/var/www/<your-username>_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.

Delete all the current contents, and replace them with something like this:

```python:&lt;your-username&gt;_pythonanywhere_com_wsgi.py
import os
import sys

path = '/home/<your-username>/my-first-blog'  # use your own username here
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```


> **Note** Don't forget to substitute in your own username where it says `<your-username>`

This file's job is to tell PythonAnywhere where our web app lives and what the Django settings file's name is. It also sets up the "whitenoise" static files tool.

Hit **Save**, and then go back to the **Web** tab.

We're all done!  Hit the big green **Reload** button and you'll be able to go view your application. You'll find a link to it at the top of the page.


## Debugging tips

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log** -- you'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom. Common problems include:

- Forgetting one of the steps we did in the console: creating the virtualenv, activating it, installing Django into it, running collectstatic, migrating the database

- Making a mistake in the virtualenv path on the Web tab -- there will usually be a little red error message on there, if there is a problem

- Making a mistake in the WSGI configuration file -- did you get the path to your my-first-blog folder right?

- Did you pick the same version of Python for your virtualenv as you did for your web app? Both should be 3.4.

- There are some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError)

And remember, your coach is here to help!


# You are live!

The default page for your site should say "Welcome to Django", just like it does on your local PC. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.


Give yourself a *HUGE* pat on the back -- server deployments are one of the trickiest parts of web development, and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!


