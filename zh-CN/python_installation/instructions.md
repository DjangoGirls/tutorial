> For readers at home: this chapter is covered in the [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) video.
> 
> 本节基于 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)的教程

Django 是用 Python 写成的，要使用Django做任何东西我们都需要Python。让我们先开始安装它！我们希望您安装 Python 3.6, 所以如果你使用的是早期版本的Python，那么你就需要升级它。

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

首先，请检查您的计算机运行的是32位版本还是64位版本的 Windows, 方法是按 windows 键 + Break键，打开系统信息, 然后查看 "系统类型" 行。 您可以从 https://www.python.org/downloads/windows/ 网站上下载 Windows版的Python。 点击 "Latest Python 3 Release - Python x.x.x"。 如果你的电脑运行的是 ** 64 位 ** 版本的 windows, 请下载 ** Windows x86-64 可执行安装程序 **。 否则, 仅下载 ** Windows x86 可执行安装程序 **即可。 下载完成之后，你应该运行它 （双击它），并按照提示安装。

有一件事要注意：在安装过程中, 您会注意到一个名字是 "Setup"的窗口。请确保勾选"Add Python 3.6 to PATH"复选框, 然后单击 "Install Now", 如下所示:

![别忘了增加 Python 到 Path](../python_installation/images/python-installation-options.png)

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window.

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python 3.6 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

你需要去到网站 https://www.python.org/downloads/release/python-361/然后下载 Python 安装程序：

* 下载 *Mac OS X 64-bit/32-bit installer* 文件，
* Double click *python-3.6.1-macosx10.6.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

很有可能你的系统已经默认安装了Python。要检查你是否安装了 （并且它是哪一个版本），打开控制台，并键入以下命令：

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. 如果你未曾安装过 Python 或者你想要一个不同的版本，你可以按如下所示安装它：

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

在控制台中键入此命令：

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

在您的控制台中使用此命令：

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use yum instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

在您的控制台中使用此命令：

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! 有时事情都不顺利，这时寻求其他更多经验的人的帮助会更好。