如果不使用 Chromebook, 则可以 [ 跳过本节 ](http://tutorial.djangogirls.org/en/installation/#install-python)。 如果您是, 您的安装体验将会有一点不同。 您可以忽略其余的安装说明。

### Cloud 9

Cloud 9是一个方便的工具, 它为你提供代码编辑器并使你可以访问在 Internet 上运行的计算机, 你可以在其中安装、编写和运行该软件。 在本教程接下来的时间内, Cloud 9将充当您的 * 本地计算机 *。 你仍将在终端界面中运行命令, 就像使用 OS X、Ubuntu 或 Windows 的同学一样, 但你的终端将连接到一台 Cloud 9 为你设置的运行在其他位置的计算机上。

1. 从[Chrome商店](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp) 安装Cloud 9
2. 转到 [c9.io](https://c9.io)
3. 注册一个帐户
4. 单击 * Create a New Workspace *
5. 将其命名为*django-girls*
6. Select the *Blank* (second from the right on the bottom row with orange logo)

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### 虚拟环境

虚拟环境 (也称为 virtualenv) 就像一个私人的盒子, 我们可以为正在做的项目提供有用的计算机代码。 我们使用虚拟环境来分隔各种不同项目的代码的不同部分, 避免在项目之间混淆。

在Cloud 9 的底部的终端中，进行以下操作

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
    pip install django~=1.11.0
    

(请注意, 在最后一行中, 我们使用一个波形符后跟等号: ~ =)。

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Django Girls的教程有一节关于部署（Deployment）的内容。部署，是把实现页面新功能的代码移植到一个可公开访问的计算机（我们称之为服务器）使其他人可以看到和使用的一个过程。

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).