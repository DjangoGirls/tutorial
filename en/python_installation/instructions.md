> For readers at home: this chapter is covered in the [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) video.

> This section is based on a tutorial by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django is written in Python. We need Python to do anything in Django. Let's start by installing it! We want you to install Python 3.5, so if you have any earlier version, you will need to upgrade it.


### Windows

You can download Python for Windows from the website https://www.python.org/downloads/release/python-351/. After downloading the ***.msi** file, you should run it (double-click on it) and follow the instructions there. It is important to remember the path (the directory) where you installed Python. It will be needed later!

One thing to watch out for:  on the second screen of the installation wizard, marked "Customize", make sure you scroll down to the "Add python.exe to the Path" option and select "Will be installed on local hard drive", as shown here:

![Don't forget to add Python to the Path](../python_installation/images/add_python_to_windows_path.png)

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu → All Programs → Accessories → Command Prompt. (On newer versions of Windows, you might have to search for "Command Prompt" since it's sometimes hidden.)

### Linux

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python 3.5.1
```

If you have a different 'micro version' of Python installed, e.g. 3.5.0, then you don't have to upgrade. If you don't have Python installed, or if you want a different version, you can install it as follows:


#### Debian or Ubuntu

Type this command into your console:

{% filename %}command-line{% endfilename %}
```
$ sudo apt-get install python3.5
```

#### Fedora (up to 21)

Use this command in your console:

{% filename %}command-line{% endfilename %}
```
$ sudo yum install python3
```

#### Fedora (22+)

Use this command in your console:

{% filename %}command-line{% endfilename %}
```
$ sudo dnf install python3
```

#### openSUSE

Use this command in your console:

{% filename %}command-line{% endfilename %}
```
$ sudo zypper install python3
```

### OS X

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/release/python-351/ and download the Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-3.5.1-macosx10.6.pkg* to run the installer.

Verify the installation was successful by opening the *Terminal* application and running the `python3` command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python 3.5.1
```

----

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.
