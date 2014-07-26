# Django installation

> Part of this chapter is based on tutorials by Geek Girls Carrots (http://django.carrots.pl/).

> Parts of this chapter is based on the [django-marcador
tutorial](http://django-marcador.keimlink.de/) licensed under Creative Commons
Attribution-ShareAlike 4.0 International License. The django-marcador tutorial
is copyrighted by Markus Zapke-Gründemann et al.


## Virtual environment

Before we install Django, we'll get you to install an extremely useful tool that will help keep your coding environment tidy on your computer. It's possible to skip this step, but it's highly recommended not to - starting with the best possible setup will save you a lot of trouble in the future!

So, let's create a **virtual environment** (also called a *virtualenv*). It will isolate your Python/Django setup on a per-project basis, meaning that any changes you make to one website won't affect any others you're also developing. Neat, right?

All you need to do is find a folder in which you want to create the `virtualenv`; your home directory, for example. On Windows it might look like `C:\Users\Name\` (where `Name` is the name of your login).

For this tutorial we will be using a new directory `djangogirls` from your home directory:

    mkdir djangogirls

We will make a virtualenv called `venv`. The general command will be in the format python -m venv `name_of_venv`.

### Windows

To create a new `virtualenv`, you need to open the console (we told you about that a few tutorials ago - remember?) and run `C:\Python\python -m venv venv`. It will look like this:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv venv

where `C:\Python34\python` is the folder in which you previously installed Python and the second `venv` is the name of your `virtualenv`. You can use any other name, but stick to lowercase and use no spaces. It is also good idea to keep the name short - you'll be referencing it a lot!

### Linux and OS X

Creating a `virtualenv` on both Linux and OS X is as simple as running:

    ~/djangogirls$ python3 -m venv venv

## Working with virtualenv

The command above will create a folder called `venv` that contains our virtual environment (basically bunch of folders and files). All we want to do now is starting it by running:

    C:\Users\Name> venv\Scripts\activate

on Windows, or:

    ~/djangogirls$ source venv/bin/activate

on OS X and Linux.

You will know that you have `virtualenv` started when you see that the prompt in your console looks like:

    (venv) C:\Users\Name\djangogirls>

or:

    (venv) ~/djangogirls$

Notice the prefix `(venv)` appears!

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django

Now that you have your `virtualenv` started, you can install Django using `pip`. In the console, run `pip install django==1.6.5` (note that we use a double equal sign: `==`).

    (venv) ~$ pip install django==1.6.5
    Downloading/unpacking django==1.6.5
    Installing collected packages: django
    Successfully installed django
    Cleaning up...

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

### Installing PostgreSQL package for Python

First, install Heroku Toolbelt from https://toolbelt.heroku.com/ While we will need this mostly for deploying your site later on, it also includes Git, which might come in handy already.

Next up, we need to install a package which lets Python talk to PostgreSQL - this is called `psycopg2`. The installation instructions differ slightly between Windows and Linux/OS X.

### Windows

For Windows, download the pre-built file from http://www.stickpeople.com/projects/python/win-psycopg/

Make sure you get the one corresponding to your Python version (3.4 should be the last line) and to the correct architecture (32 bit in the left column or 64 bit in the right column).

Rename the downloaded file and move it so that it's now available at `C:\psycopg2.exe`.

Once that's done, enter the following command in the terminal (make sure your `virtualenv` is activated):

    easy_install C:\psycopg2.exe

### Linux and OS X

Run the following in your console:

    (venv) ~/djangogirls$ pip install psycopg2

If that goes well, you'll see something like this

    Downloading/unpacking psycopg2
    Installing collected packages: psycopg2
    Successfully installed psycopg2
    Cleaning up...

---

Once that's completed, run `python -c "import psycopg2"`. If you get no errors, everything's installed successfully.

That's it! You're now (finally) ready to create a Django application! But to do that, you need a nice program to write your code in...
