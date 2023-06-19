> For readers at home: this chapter is covered in the[Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) 
video.

> This section is based on a tutorial by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django is written in Python. We need Python to do anything in Django. Let's start by installing it! We want you to install the 
latest version of Python 3, so if you have any earlier version, you will need to upgrade it. If you already have version 
{{ book.py_min_version }} or higher you should be fine.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the 
App Store. Go to System Preferences (it's in the Applications folder), click"Security & Privacy," and then the "General" tab. 
If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-{{ book.py_release }}-macosx10.9.pkg* to run the installer.

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python {{ book.py_release }}
```
The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

----

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things 
don't go smoothly and it's better to ask for help from someone with more experience.
