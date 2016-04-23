> Part of this section is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

> Part of this section is based on the [django-marcador
tutorial](http://django-marcador.keimlink.de/) licensed under Creative Commons
Attribution-ShareAlike 4.0 International License. The django-marcador tutorial
is copyrighted by Markus Zapke-Gründemann et al.


## Virtual environment

Before we install Django we will get you to install an extremely useful tool to help keep your coding environment tidy on your computer. It's possible to skip this step, but it's highly recommended. Starting with the best possible setup will save you a lot of trouble in the future!

So, let's create a **virtual environment** (also called a *virtualenv*). Virtualenv will isolate your Python/Django setup on a per-project basis. This means that any changes you make to one website won't affect any others you're also developing. Neat, right?

All you need to do is find a directory in which you want to create the `virtualenv`; your home directory, for example. On Windows it might look like `C:\Users\Name\` (where `Name` is the name of your login).

For this tutorial we will be using a new directory `djangogirls` from your home directory:

    $ mkdir djangogirls
    $ cd djangogirls

We will make a virtualenv called `myvenv`. The general command will be in the format:

    $ python3 -m venv myvenv

### Windows

To create a new `virtualenv`, you need to open the console (we told you about that a few chapters ago - remember?) and run `C:\Python34\python -m venv myvenv`. It will look like this:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv

where `C:\Python34\python` is the directory in which you previously installed Python and `myvenv` is the name of your `virtualenv`. You can use any other name, but stick to lowercase and use no spaces, accents or special characters. It is also good idea to keep the name short - you'll be referencing it a lot!

### Linux and OS X

Creating a `virtualenv` on both Linux and OS X is as simple as running `python3 -m venv myvenv`.
It will look like this:

    $ python3 -m venv myvenv

`myvenv` is the name of your `virtualenv`. You can use any other name, but stick to lowercase and use no spaces. It is also good idea to keep the name short as you'll be referencing it a lot!

> __NOTE:__ On some versions of Debian/Ubuntu you may receive the following error

>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>       apt-get install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>
> In this case, follow the instructions above and install the `python3-venv` package:
>
>     $ sudo apt-get install python3-venv

> __NOTE:__ Initiating the virtual environment on Ubuntu 14.04 like this currently gives the following error:

>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1

> To get around this, use the `virtualenv` command instead.

>     $ sudo apt-get install python-virtualenv
>     $ virtualenv --python=python3.4 myvenv


## Working with virtualenv

The command above will create a directory called `myvenv` (or whatever name you chose) that contains our virtual environment (basically a bunch of directory and files). 

#### Windows 

Start your virtual environment by running:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate

#### Linux and OS X 

Start your virtual environment by running:

    $ source myvenv/bin/activate

Remember to replace `myvenv` with your chosen `virtualenv` name!

> __NOTE:__ sometimes `source` might not be available. In those cases try doing this instead:

>     $ . myvenv/bin/activate

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django

Now that you have your `virtualenv` started, you can install Django using `pip`. In the console, run `pip install django~=1.9.0` (note that we use a tilde followed by an equal sign: `~=`).

    (myvenv) ~$ pip install django~=1.9.0
    Downloading/unpacking django==1.9
    Installing collected packages: django
    Successfully installed django
    Cleaning up...

on Windows
> If you get an error when calling pip on Windows platform please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does please consider using another place without spaces, accents or special characters (suggestion is: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

on Windows 8 and Windows 10
> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:

>     C:\Users\Name\djangogirls> python -m pip install django~=1.9.0

on Linux
> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

That's it! You're now (finally) ready to create a Django application!
