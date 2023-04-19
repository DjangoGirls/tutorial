> For readers at home: this chapter is covered in the 
[Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) 
video.

> This section is based on a tutorial by Geek Girls Carrots 
(https://github.com/ggcarrots/django-carrots)

Django is written in Python. We need Python to do anything in Django. 
Let's start by installing it! We want you to install the latest version of 
Python 3, so if you have any earlier version, you will need to upgrade it. 
If you already have version {{ book.py_min_version }} or higher you should be fine.

Please install normal Python as follows, even when you have Anaconda installed 
on your computer.

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. 
To check if you have it installed (and which version it is), open a console and 
type the following command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python {{ book.py_release }}
```

If you have a different version of Python installed, at least 
{{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have 
to upgrade. 
If you don't have Python installed, or if you want a different version, first 
check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}
```
$ grep '^NAME=' /etc/os-release
```

Afterwards, depending on the result, follow one of the following installation 
guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}
```
$ sudo apt install python3
```

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}
```
$ sudo dnf install python3
```

If you're on older Fedora versions you might get an error that the command `dnf` 
is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}
```
$ sudo zypper install python3
```

<!--endsec-->

Verify the installation was successful by opening a command prompt and running 
the `python3` command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python {{ book.py_release }}
```
The version shown may be different from {{ book.py_release }} -- it should 
match the version you installed.

----

If you have any doubts, or if something went wrong and you have no idea what to 
do next, please ask your coach! 
Sometimes things don't go smoothly and it's better to ask for help from someone 
with more experience.
