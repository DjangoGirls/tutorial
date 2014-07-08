# Database

Most of web application have their own database. A database is a collection of data. This is a place in which you will store all information about users, all your blog post texts, etc..

We will be using a PostgreSQL database to store our data. It would be easier to just use a default Django database called sqlite, but it's not good for a production use. If you want to have your application available in the Internet, not only your computer, you will need PostgreSQL.

# PostgreSQL installation

## Windows

PostgreSQL is recommending to install it using a program you can find here: http://www.enterprisedb.com/products-services-training/pgdownload#windows

Choose a newest version available for your operating system. Download this Installer, run it and then follow the instructions available here: http://www.postgresqltutorial.com/install-postgresql/

## Mac OS X

The easiest way is to download a free [Postgres.app](http://postgresapp.com/) and install it like any other application on your operating system.

Go ahead, download it, drag to the Applications folder and run by double clicking. That's it!

## Linux

Of course, installation depends on Linux distribution. We've added most popular ones, but if you can't find yours, [here are all the tutorials](https://wiki.postgresql.org/wiki/Detailed_installation_guides#General_Linux).

### Ubuntu

Go to your console and run following command:

    sudo apt-get install postgresql postgresql-contrib

### Fedora

    sudo yum install postgresql93-server

# Create database

Now we need to create our database user and our first database!

First, let's make our console into postgres mode:

    $ psql
    psql (9.3.4)
    Type "help" for help.
    #

Our `$` now changed into `#`, it means that we're now giving commands to PostgreSQL. Let's create a user:

    # CREATE USER name;
    CREATE ROLE

Of course, replace `name` with your own name. Now it's time for a database for your Django project:

    # CREATE DATABASE djangogirls OWNER name;
    CREATE DATABASE

Awesome! All ready.


