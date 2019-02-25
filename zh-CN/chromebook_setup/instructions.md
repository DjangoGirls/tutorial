如果不使用 Chromebook, 则可以 [ 跳过本节 ](http://tutorial.djangogirls.org/en/installation/#install-python)。 如果您是使用 Chromebook,, 您的安装体验将会有一点不同。 您可以忽略其余的安装说明。

### Django 视野-快来创造吧！

Cloude IDE (云集成开发环境）是为你提供代码编辑器并可以访问在Internet上运行的计算机，并且可以在期间安装、编写和运行程序的工具。 在课程期间，cloude IDE 将会充当你的<本地计算机> 你仍将会在终端界面运行命令，就像你的同学使用OS X, Ubuntu, or Windows一样，但是你的终端将会连接一台cloude IDE（云开发）为你设置的计算机上运行。 以下是cloude IDEs 的操作指示（PaizaCloud Cloud IDE, AWS Cloud9）. 你可以选择其中一个cloude IDEs, 然后根据指示进行操作。

#### PaizaCloud 云集成开发环境

1. 转到 [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. 注册一个账户
3. 点击*New Server*
4. 点击“终端‘’按钮（在窗口的左侧）

现在你可看见一个带有侧边栏、左边按钮的界面。 点击“Terminal”按钮打开终端窗口，如下所示：

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE的终端是为你的指示准备的。 你可以调整窗口大小或者最大化窗口，令其显示更大。

#### AWS Cloud9（AWS云开发9）

1. 转到 [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. 创建一个用户
3. 点击 *Create Environment*

现在你应该看见一个拥有侧边栏，一个包含文本的大主窗口，以及一个位于底部的小窗口-看起来像这样：

{% filename %}bash{% endfilename %}

    你的用户名：~工作区 $
    

底部的区域是你的终端。你可以用终端来向远程的cloude9计算机发送指示。你可以调整该窗口使之更大。

### 虚拟环境

虚拟环境（也称virtualenv）就像个私人的盒子，我们可以将正在做的项目中有用的计算机代码储存进去。 我们使用虚拟环境来区分开我们不同项目里所用的各种各样代码，以免不同项目的代码相互混淆。

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).