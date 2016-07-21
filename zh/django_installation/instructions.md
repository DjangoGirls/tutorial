> 本节部分内容基于 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 教程而来。
> 
> 本章的部分内容基于 [django-marcador 教程](http://django-marcador.keimlink.de/) ，使用知识共享署名-4.0 国际许可协议许可。 Django-marcador 教程的版权归 Markus Zapke-Gründemann 所有。

## 虚拟环境

在安装 Django 之前，我们会让你安装一个非常实用的工具，它可以让你计算机上的编码环境保持整洁。 这个步骤可以跳过，但我们强烈建议你跟着做。 从最佳实践设置开始将会在未来为你省去无数的烦恼！

所以，让我们创建一个 **虚拟环境** （也称为 *virtualenv*）。 虚拟环境会以项目为单位将你的 Python/Django 安装隔离开。 这意味着对一个网站的修改不会影响到你同时在开发的其他任何一个网站。 优雅吧？

你需要做的就是找到您想创建 `虚拟环境`的一个目录 ；比如您的主目录。 在 Windows 上，它可能看起来像 `C:\Users\Name` （其中 `Name` 是您的登录名）。

在本教程中我们将使用您的 home 目录下的一个新目录 `djangogirls` ：

    mkdir djangogirls
    cd djangogirls
    

我们将虚拟环境称为 `myvenv`。一般的命令格式是：

    python3 -m venv myvenv
    

### Windows系统

若要创建新的 `虚拟环境`，您需要打开的控制台 （我们在前几章里已经告诉过你了，还记得吗？），然后运行 `C:\Python34\python -m venv myvenv`。 它看起来会像这样：

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

`C:\Python34\python` 是您之前安装Python的目录， `myvenv` 是您`虚拟环境` 的名字。 你可以使用其他任何名字，但请坚持使用小写，并不要使用空格、重音符号或特殊字符。 始终保持名称短小是个好主意 — — 你会大量引用它 ！

### Linux 和 OS X

在 Linux 和 OS X 上创建的 `虚拟环境` 就和运行 `python3 -m venv myvenv` 一样简单。看起来像这样：

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` 是您 `虚拟环境` 的名字。 您可以使用其他任何名称，但请始终使用小写以及不要有空格。 始终保持名称短小是个好主意，因为你会大量引用它！

> **注意：** 在Ubuntu 14.04上启动虚拟环境会报以下错误：
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> 为了解决这个问题，请使用 `virtualenv` 命令。
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## 使用虚拟环境

上面的命令将创建一个名为 `myvenv` 目录 （或任何你选择的名字），其中包含我们的虚拟环境 （基本上是一堆的目录和文件）。

#### Windows系统

运行如下命令进入你的虚拟环境：

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

#### Linux 和 OS X

运行如下命令进入你的虚拟环境：

    ~/djangogirls$ source myvenv/bin/activate
    

记住要将 `myvenv` 替换成你选择的 `虚拟环境`的 名字 ！

> **注：** 有时 `source` 可能不可用。在这些情况下试着做这面这些事情：
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

当你看到在您的控制台中有如下提示就知道你已经进入 `虚拟环境` ：

    (myvenv) C:\Users\Name\djangogirls>
    

或：

    (myvenv) ~/djangogirls$
    

注意 `（myvenv）`前缀的出现 ！

当在一个虚拟的环境中工作时，`python` 将自动指向正确的版本，因此您可以使用 `python` 代替 `python3`.

好的现在所有重要的依赖关系已经就位。最后，我们可以安装 Django ！

## 安装 Django

既然你有了`虚拟环境` ，您可以使用 `pip`安装 Django 。在控制台中，运行 `pip install django==1.8` （注意我们使用双等于号： `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

在 Windows上

> 如果你在 Windows 平台上调用 pip 时得到一个错误，请检查是否您项目的路径名是否包含空格、 重音符号或特殊字符 (如：`C:\Users\User Name\djangogirls`)。 若的确如此，请尝试移动它到另外一个没有空格、重音符号或特殊字符的目录，（例如：`C:\djangogirls`）。 在移动之后，请重试上面的命令。

在 Linux 上

> 如果你在Ubuntu 12.04上得到一个错误，请运行 `pip python -m pip install -U --force-reinstall pip`来修复虚拟环境中的pip安装。

就是这样！你现在（终于）准备好创建一个 Django 应用程序！
