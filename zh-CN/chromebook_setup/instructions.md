如果不使用 Chromebook, 则可以 [ 跳过本节 ](http://tutorial.djangogirls.org/en/installation/#install-python)。 如果您是使用 Chromebook,, 您的安装体验将会有一点不同。 您可以忽略其余的安装说明。

### Django 视野-快来创造吧！

Cloude IDE (云集成开发环境）是为你提供代码编辑器并可以访问在Internet上运行的计算机，并且可以在期间安装、编写和运行程序的工具。 在课程期间，cloude IDE 将会充当你的<本地计算机> 你仍将会在终端界面运行命令，就像你的同学使用OS X, Ubuntu, or Windows一样，但是你的终端将会连接一台cloude IDE（云开发）为你设置的计算机上运行。 以下是cloude IDEs 的操作指示（PaizaCloud Cloud IDE, AWS Cloud9）. 你可以选择其中一个cloude IDEs, 然后根据指示进行操作。

#### PaizaCloud 云集成开发环境

1. 转到 [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. 注册一个账户
3. 点击新的*服务器*，然后选择Django应用
4. 点击“终端‘’按钮（在窗口的左侧）

现在你可看见一个带有侧边栏、左边按钮的界面。 点击“Terminal”按钮打开终端窗口，如下所示：

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE的终端是为你的指示准备的。 你可以调整窗口大小或者最大化窗口，令其显示更大。

#### AWS Cloud9（AWS云开发9）

Currently Cloud 9 requires you to sign up with AWS and enter credit card information.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io) and click *Get started with AWS Cloud9*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    你的用户名：~工作区 $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### 虚拟环境

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### Python无处不在

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).