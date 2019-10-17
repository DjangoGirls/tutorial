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

目前，Cloud 9要求您使用AWS账号注册并且需要输入信用卡 信息。

1. 从[Chrome网上商店](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)下载安装Cloud9.
2. 转到 [c9.io](https://c9.io)并点击 *开始使用 AWS Cloud9*
3. 注册一个 AWS 帐户 (需要信用卡信息，但您可以免费使用)
4. 在 AWS 仪表盘中，在搜索栏输入 *Cloud9*并点击
5. 在Cloud9 面板中，点击 *创建环境*
6. 将其命名为*django-girls*
7. 在配置设置时，选择 *创建一个新的环境实例 (EC2)* 用于 "环境类型" 和 *t2.micro*"实例类型" (这个VM类型是可以免费账户可以使用的） 缺省的设置是费用最好的，不需要修改缺省的设置。
8. 点击*下一步*
9. 点击 *创建环境*

现在你应该看见一个拥有侧边栏，一个包含文本的主窗口，以及一个位于底部的小窗口-看起来像这样：

{% filename %}bash{% endfilename %}

    你的用户名：~工作区 $
    

底部的区域是你的终端。你可以用终端来向远程的Cloud9计算机发送指示。你可以调整该窗口使之更大。

### 虚拟环境

虚拟环境（也称virtualenv）就像个私人的盒子，我们可以将正在做的项目中有用的计算机代码储存进去。 我们使用虚拟环境来区分开我们不同项目里所用的各种各样代码，以免不同项目的代码相互混淆。

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

创建一个[GitHub](https://github.com)账户

### Python无处不在

Django Girls的教程有一节关于部署（Deployment）的内容。这个部分是把实现页面新功能的代码移植到一个可公开访问的计算机（我们称之为服务器）使其他人可以看到和使用的一个过程。

当我们在Chromebook上做课程的时候，这部分就显得有些怪异了，因为我们已经有计算机连接到互联网了。 然而，它仍然有用，因为我们可以认为我们的云工作区 用于我们的“正在进行中”工作，以及使用Python无处不在的功能让我们的代码可以在一个第三方的地方可以持续运行

因此，在[www.pythonanywhere.com](https://www.pythonanywhere.com).注册一个新的 Python Anywhere账户