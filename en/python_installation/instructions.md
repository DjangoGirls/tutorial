> For readers at home: this chapter is covered in the [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) video.

> This section is based on a tutorial by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django is written in Python. We need Python to do anything in Django. Let's start by installing it! We want you to install the latest version of Python 3, so if you have any earlier version, you will need to upgrade it. If you already have version {{ book.py_min_version }} or higher you should be fine.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

First check whether your computer is running a 32-bit version or a 64-bit version of Windows, on the "System type" line of the System Info page. To reach this page, try one of these methods:
* Press the Windows key and Pause/Break key at the same time
* Open your Control Panel from the Windows menu, then navigate to System & Security, then System
* Press the Windows button, then navigate to Settings > System > About
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. It will start making suggestions as soon as you type. You can select the entry once it shows up.

You can download Python for Windows from the website https://www.python.org/downloads/windows/. Click on the "Latest Python 3 Release - Python x.x.x" link. If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 executable installer**. Otherwise, download the **Windows x86 executable installer**. After downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-{{ book.py_release }}-macosx10.9.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python {{ book.py_release }}
```

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}
```
$ grep '^NAME=' /etc/os-release
```

Afterwards, depending on the result, follow one of the following installation guides below this section.

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

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}
```
$ sudo zypper install python3
```

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python {{ book.py_release }}
```
The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

----

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.
