# Database

Most of web applications have their own database. A database is a collection of data. This is a place in which you will store all information about users, all your blog post texts, etc..

We will be using a PostgreSQL database to store our data. It would be easier to use a default Django database called *sqlite*, but it's not good for production use (by *production* we mean: real, running websites). If you want to have your application available in the Internet, not only on your computer, you will need PostgreSQL.

# PostgreSQL installation

## Windows

PostgreSQL is recommending to install it using a program you can find here: http://www.enterprisedb.com/products-services-training/pgdownload#windows

Choose a newest version available for your operating system. Download this Installer, run it and then follow the instructions available here: http://www.postgresqltutorial.com/install-postgresql/. Take note of the installation directory, you will need it in the next step (most likely it will be `C:\Program Files\PostgreSQL\9.3`).

## Mac OS X

The easiest way is to download a free [Postgres.app](http://postgresapp.com/) and install it like any other application on your operating system.

Go ahead, download it, drag to the Applications folder and run by double clicking.

You'll also have to add the Postgres command line tools to your `PATH` variable, what is described [here](http://postgresapp.com/documentation/cli-tools.html).

## Linux

Of course, installation depends on Linux distribution. We've added most popular ones, but if you can't find yours, [here are all the tutorials](https://wiki.postgresql.org/wiki/Detailed_installation_guides#General_Linux).

### Ubuntu

Go to your console and run a following command:

    sudo apt-get install postgresql postgresql-contrib

### Fedora

    sudo yum install postgresql93-server

# Create database

Now we need to create our database user and our first database. You can add many databases in PostgreSQL, so if you have more than one website, you should have a separate database for each one!

## Windows

If you're using Windows, there is a little bit more we need to do. For now you don't need to understand these steps, but feel free to ask your coach if you're curious!

1. Open the Command Prompt (Start menu → All Programs → Accessories → Command Prompt)
2. Type the following `setx PATH "%PATH%;C:\Program Files\PostgreSQL\9.3\bin"` (you can also paste things into the Command Prompt by right clicking and selecting `Paste`). Make sure that the path is the same as you noted during installation with `\bin` added at the end. You should see the message `SUCCESS: Specified value was saved.`.
3. Close the Command Prompt and it open again.

## Create the database

First, let's make our console into postgres mode by typing `psql`. Remember the part about console?
>On Mac OS X you can do this by launching the `Terminal` application (it's in Applications → Utilities). On Linux, it's probably under Applications → Accessories → Terminal. On Windows you need to go to Start menu → All Programs → Accessories → Command Prompt. Further, on Windows, `psql` might require logging in using the username and password you chose during installation. If `psql` is asking you for password and doesn't seem to work, try `psql -U <username> -W` first and enter the password later.

    $ psql
    psql (9.3.4)
    Type "help" for help.
    #

Our `$` now changed into `#`, it means that we're now giving commands to PostgreSQL. Let's create a user:

    # CREATE USER name;
    CREATE ROLE

Of course, replace `name` with your own name. Remember that you should not use diacritic letters and whitespaces, i.e. `bożena maria` is invalid! You need to transform it into `bozena_maria`.

Now it's time to create a database for your Django project:

    # CREATE DATABASE djangogirls OWNER name;
    CREATE DATABASE

Remember to replace `name` with the name you've chosen (i.e. `bozena_maria`).

Awesome! All ready!


