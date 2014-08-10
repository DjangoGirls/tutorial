# PostgreSQL installation

> Part of this chapter is based on tutorials by Geek Girls Carrots (http://django.carrots.pl/).

> Parts of this chapter is based on the [django-marcador
tutorial](http://django-marcador.keimlink.de/) licensed under Creative Commons
Attribution-ShareAlike 4.0 International License. The django-marcador tutorial
is copyrighted by Markus Zapke-Gründemann et al.


## Windows

The easiest way to install Postgres on Windows is using a program you can find here: http://www.enterprisedb.com/products-services-training/pgdownload#windows

Choose the newest version available for your operating system. Download the installer, run it and then follow the instructions available here: http://www.postgresqltutorial.com/install-postgresql/. Take note of the installation directory as you will need it in the next step (typically, it's `C:\Program Files\PostgreSQL\9.3`).

## Mac OS X

The easiest way is to download the free [Postgres.app](http://postgresapp.com/) and install it like any other application on your operating system.

Download it, drag to the Applications directory and run by double clicking. That's it!

You'll also have to add the Postgres command line tools to your `PATH` variable, what is described [here](http://postgresapp.com/documentation/cli-tools.html).

## Linux

Installation steps vary from distribution to distribution. Below are the commands for Ubuntu and Fedora, but if you're using a different distro [take a look at the PostgreSQL documentation](https://wiki.postgresql.org/wiki/Detailed_installation_guides#General_Linux).

### Ubuntu

Run the following command:

    sudo apt-get install postgresql postgresql-contrib

### Fedora

Run the following command:

    sudo yum install postgresql93-server

# Create database

Next up, we need to create our first database, and a user that can access that database. PostgreSQL lets you create as many databases and users as you like, so if you're running more than one site you should create a database for each one.

## Windows

If you're using Windows, there's a couple more steps we need to complete. For now it's not important for you to understand the configuration we're doing here, but feel free to ask your coach if you're curious as to what's going on.

1. Open the Command Prompt (Start menu → All Programs → Accessories → Command Prompt)
2. Run the following by typing it in and hitting return: `setx PATH "%PATH%;C:\Program Files\PostgreSQL\9.3\bin"`. You can paste things into the Command Prompt by right clicking and selecting `Paste`. Make sure that the path is the same one you noted during installation with `\bin` added at the end. You should see the message `SUCCESS: Specified value was saved.`.
3. Close and then reopen the Command Prompt.

## Create the database

First, let's launch the Postgres console by running `psql`. Remember how to launch the console?
>On Mac OS X you can do this by launching the `Terminal` application (it's in Applications → Utilities). On Linux, it's probably under Applications → Accessories → Terminal. On Windows you need to go to Start menu → All Programs → Accessories → Command Prompt. Furthermore, on Windows, `psql` might require logging in using the username and password you chose during installation. If `psql` is asking you for a password and doesn't seem to work, try `psql -U <username> -W` first and enter the password later.

    $ psql
    psql (9.3.4)
    Type "help" for help.
    #

Our `$` now changed into `#`, which means that we're now sending commands to PostgreSQL. Let's create a user:

    # CREATE USER name;
    CREATE ROLE

Replace `name` with your own name. You shouldn't use accented letters or whitespace (e.g. `bożena maria` is invalid - you need to convert it into `bozena_maria`).

Now it's time to create a database for your Django project:

    # CREATE DATABASE djangogirls OWNER name;
    CREATE DATABASE

Remember to replace `name` with the name you've chosen (e.g. `bozena_maria`).

Great - that's databases all sorted!

# Updating settings

Find this part in your `mysite/settings.py` file:

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

Remeber to change `yourname` to the name of the database that you created earlier in this chapter.

# Installing PostgreSQL package for Python

First, install Heroku Toolbelt from https://toolbelt.heroku.com/ While we will need this mostly for deploying your site later on, it also includes Git, which might come in handy already.

Next up, we need to install a package which lets Python talk to PostgreSQL - this is called `psycopg2`. The installation instructions differ slightly between Windows and Linux/OS X.

## Windows

For Windows, download the pre-built file from http://www.stickpeople.com/projects/python/win-psycopg/

Make sure you get the one corresponding to your Python version (3.4 should be the last line) and to the correct architecture (32 bit in the left column or 64 bit in the right column).

Rename the downloaded file and move it so that it's now available at `C:\psycopg2.exe`.

Once that's done, enter the following command in the terminal (make sure your `virtualenv` is activated):

    easy_install C:\psycopg2.exe

## Linux and OS X

Run the following in your console:

    (myvenv) ~/djangogirls$ pip install psycopg2

If that goes well, you'll see something like this

    Downloading/unpacking psycopg2
    Installing collected packages: psycopg2
    Successfully installed psycopg2
    Cleaning up...

---

Once that's completed, run `python -c "import psycopg2"`. If you get no errors, everything's installed successfully.
