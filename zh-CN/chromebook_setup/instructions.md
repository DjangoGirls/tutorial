如果不使用 Chromebook, 则可以 [ 跳过本节 ](http://tutorial.djangogirls.org/en/installation/#install-python)。 如果您是, 您的安装体验将会有一点不同。 您可以忽略其余的安装说明。

### Cloud 9

Cloud 9 is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. For the duration of the tutorial, Cloud 9 will act as your *local machine*. You'll still be running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that Cloud 9 sets up for you.

1. 从[Chrome商店](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp) 安装Cloud 9
2. Go to [c9.io](https://c9.io)
3. Sign up for an account
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