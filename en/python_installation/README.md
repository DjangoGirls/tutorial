# Let’s start with Python

We're finally here!

But first, let us tell you what Python is. Python is a very popular programming language that can be used for creating websites, games, scientific software, graphics, and much, much more.

Python originated in the late 1980s and its main goal is to be readable by human beings (not only machines!). This is why it looks much simpler than other programming languages. This makes it easy to learn, but don't worry, Python is also really powerful!


# Python installation

> This subchapter is based on a tutorial by Geek Girls Carrots (http://django.carrots.pl/)

Django is written in Python. We need Python to do anything in Django. Let's start with installing it! We want you to install Python 3.4, so if you have any earlier version, you will need to upgrade it.


### Windows

You can download Python for Windows from the website https://www.python.org/downloads/release/python-343/. After downloading the ***.msi** file, you should run it (double-click on it) and follow the instructions there. It is important to remember the path (the directory) where you installed Python. It will be needed later!

One thing to watch out for:  on the second screen of the installation wizard, marked "Customize", make sure you scroll down and choose the "Add python.exe to the Path" option, as shown here:

![Don't forget to add Python to the Path](images/add_python_to_windows_path.png)


### Linux

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

```:command-line
$ python3 --version
Python 3.4.2
```

If you don't have Python installed, or if you want a different version, you can install it as follows:


#### Debian or Ubuntu

Type this command into your console:

```:command-line
$ sudo apt-get install python3.4
```


#### Fedora (up to 21)

Use this command in your console:

```:command-line
$ sudo yum install python3.4
```


#### Fedora (22+)

Use this command in your console:

```:command-line
$ sudo dnf install python3.4
```


### OS X

You need to go to the website https://www.python.org/downloads/release/python-342/ and download the Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* *DMG* file,
* Double click to open it,
* Double click *Python.mpkg* to run the installer.

Verify the installation was successful by opening the *Terminal* application and running the `python3` command:

```:command-line
$ python3 --version
Python 3.4.2
```

----

If you have any doubts, or if something went wrong and you have no idea what to do next - please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.
