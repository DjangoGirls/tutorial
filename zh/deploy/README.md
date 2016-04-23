# 部署！

> **注** 这一章可以有时有点难打通。 坚持并完成它 ；部署是在网站开发过程的重要组成部分。 这一章放在本教程的中部，因此你的指导者可以帮助你在使网站上线中的一些小困难。 这意味着如果您花大量的时间，你仍然能独立完成这个教程。

到目前为止您的网站只是在您的计算机上可用，现在您将了解如何部署它 ！ 部署是在互联网上发布你的应用程序的一系列过程，因此人们最终可以一起去看看你的应用程序。

正如你所学习的，一个网站必须要放到一个服务器上。 在互联网上你可以找到很多的服务器供应商。 我们将使用一个相对简单的部署过程: [PythonAnywhere][1]。 PythonAnywhere 对于一些没有太多访问者的小应用是免费的，所以它对你来说绝对是足够使用的。

 [1]: http://pythonanywhere.com/

其它我们将使用到的外部服务是[GitHub][2]，它是一个代码托管服务。 还有其它的一些服务，但当今几乎所有的程序员都有 GitHub 帐户，并且现在你也会有的！

 [2]: http://www.github.com

我们将使用 GitHub 作为基石，以和 PythonAnywhere 互相传输我们的代码。

# Git

Git是一个被大量程序员使用的"版本控制系统"。 此软件可以跟踪任何时间文件的改变，这样你以后可以随时召回某个特定版本。 有点像Microsoft Word 的"跟踪更改"功能 ，但更强大。

## 安装Git

> **注意** 如果你已经做过安装步骤了，你可以直接跳过这个步骤开始创建你自己的Git版本库。

{% include "/deploy/install_git.md" %}

## 开始我们自己的Git版本库

Git跟踪一组特定的在代码仓库（或简称“仓库”）中文件的更改。 我们开始用git管理自己的项目吧。 打开你的终端，进入 `djangogirls` 文件夹运行以下的命令：

> **注意** 在初始化仓库之前，请使用 `pwd`命令 (OSX/Linux) 或者 `cd` (Windows) 命令检查你当前的工作目录。 你应该是在 `djangogirls` 文件夹下运行命令。

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

每个项目我们只需要初始化一次Git仓库（而且你从此不需要重新输入用户名和邮箱）。

Git会追踪这个目录下所有文件和文件夹的更改，但是有一些文件我们希望Git忽略它。 为此，我们可以在系统根目录下创建一个命名为 `.gitignore` 的文件。 打开编辑器，创建新文件并写入以下内容：

    *.pyc
    __pycache__
    myvenv
    db.sqlite3
    .DS_Store
    

然后在djangogirls项目根目录下保存为 `.gitignore`文件。

> **注意** 在文件名最前面的"."很重要。 如果你在创建文件的时候有困难(例如，Macs不能通过Finder创建开头为"."的文件), 可以在编辑器里点击"另存为", 这个没问题的。

在执行git操作之前，最好使用 `git status` 命令查看一下当前的状态，尤其是在执行 `git add`或者在你不确定哪些文件被改动的情况下。 这有助于阻止各种意外发生，例如错误的文件被添加或提交。 `git status` 命令会返回所有未追踪/修改/暂存的文件，还有分支状态等信息。 输出会是这样：

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
    
    nothing added to commit but untracked files present (use "git add" to track)
    

最后保存我们的更改。转到你的控制台并运行这些命令：

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
    [...]
    13 files changed, 200 insertions(+)
    create mode 100644 .gitignore
    [...]
    create mode 100644 mysite/wsgi.py
    

## 推送我们的代码到Github上

跳转到[GitHub.com][2]网站，注册一个新的免费账号。（如果你在看线下活动之前就已经有账号的话，那就太好了！）

现在，创建一个新的仓库，命名为“my-first-blog”。 保持 "initialise with a README" 复选框未选中状态，.gitignore 选项为无 (我们已经手动创建了) ，让License设置为无。

![][3]

 [3]: images/new_github_repo.png

> **注意** `my-first-blog`这个名字很重要 — 你可以用其它的，但是这个名字会在教程中出现多次，你需要确保每次都替换掉它。 保持用 `my-first-blog` 这个名字可能更为简单.

在下一屏中，你将看到你的仓库克隆 URL。选择“HTTPS”版本，拷贝地址，我们马上要把它粘贴到终端：

![][4]

 [4]: images/github_get_repo_url_screenshot.png

现在我们需要把你电脑上的Git仓库和Github上的挂接。

在控制台输入以下内容（替换 `<your-github-username>` 为你的 github 用户名 ，不包含尖括号）：

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

输入你的Github账号名和密码，然后你会看到这样：

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

你的代码已经在Github上了。 快去确认一下吧！ 你会发现这些好家伙们 — [Django][5], [Django Girls Tutorial][6]，还有很多其它优秀的开放源代码软件项目同样也在Github上 :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# 在 PythonAnywhere 设置我们的博客

> **注意** 你可能在之前的安装步骤中已经创建 PythonAnywhere 账户 — 如果是的话，那么无需再来一次。

{% include "/deploy/signup_pythonanywhere.md" %}

## 在 PythonAnywhere 上拉取我们的代码

当然注册完 PythonAnywhere，你讲会转到仪表盘或“控制台”页面。 选择启动“Bash”控制台这一选项 — 这是 PythonAnywhere 版的控制台，就像你本地电脑上的一样。

> **注意** PythonAnywhere 基于 Linux，因此如果你使用 Windows，控制台将会和你本地电脑上的略有不同。

让我们通过创建一个我们仓库的 “Clone” 以便从 Github 拉取代码到 PythonAnywhere。 在 PythonAnywhere 控制台输入以下 (不要忘记使用 Github 用户名替换 `<your-github-username>`)：

    $ git clone https://github.com/<your-github-username>/my-first-blog.git
    

这将会拉取一份你的代码副本到 PythonAnywhere 上。通过键入`tree my-first-blog` 查阅：

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

### 在 PythonAnywhere 上创建 virtualenv

如同你在自己电脑上做的，你可以在 PythonAnywhere 上创建 virtualenv 虚拟环境。在 Bash 控制台下，键入：

    $ cd my-first-blog
    
    $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.
    
    $ source myvenv/bin/activate
    
    (mvenv) $  pip install django whitenoise
    Collecting django
    [...]
    Successfully installed django-1.8.2 whitenoise-2.0
    

> **注意** `pip 安装` 步骤可能需要几分钟。 耐心，耐心！但是如果超过 5 分钟，就不对劲了。 问问你的教练。

<!--TODO: think about using requirements.txt instead of pip install.-->

### 收集静态文件。

你可曾好奇，什么是"whitenoise"白噪音？ 它是用来服务所谓的“static files”静态文件的工具。 静态文件是很少改动或者并非可运行的程序代码的那些文件，比如 HTML 或 CSS 文件。 在我们的计算机上，它们以不同的方式工作，我们需要比如“whitenoise”这样的工具来为其服务。

在教程后续编辑网站 CSS 章节会介绍更多有关静态文件的内容。

暂且我们只需要在服务器上运行一个额外的命令，就是 `collectstatic`。 它告诉 Django 去收集服务器上所有需要的静态文件。 就眼下来说主要是使admin管理界面看起来更漂亮的文件。

    (mvenv) $ python manage.py collectstatic
    
    You have requested to collect static files at the destination
    location as specified in your settings:
    
    /home/edith/my-first-blog/static
    
    This will overwrite existing files!
    Are you sure you want to do this?
    
    Type 'yes' to continue, or 'no' to cancel: yes
    

键入 "yes", 然后它会自行运转！你可喜欢让计算机打印一页一页令人费解的文本？ 我总会弄点噪音作为伴奏。Brp, brp brp...

    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.
    

### 在 PythonAnywhere 上创建数据库

服务器与你自己的计算机不同的另外一点是：它使用不同的数据库。因此用户账户以及文章和你电脑上的可能会有不同。

我们可以像在自己的计算机上一样在服务器上初始化数据库，使用 `migrate` 以及 `createsuperuser`：

    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK
    
    
    (mvenv) $ python manage.py createsuperuser
     
    Context | Request Context
    
    

## 将我们的博客发布为一个网络应用程序

现在我们的代码已在PythonAnywhere上，我们的 virtualenv 已经准备好，静态文件已收集，数据库已初始化。我们准备好发布网络应用程序！

通过点击 logo 返回到 PythonAnywhere 仪表盘，然后点击 **Web** 选项卡。最终，点 **Add a new web app**.

在确认你的域名之后，选择对话框中 **manual configuration** (注 *不是* "Django" 选项) ： 下一步选择 **Python 3.4**，然后点击 Next 以完成该向导。

> **注意** 确保你选中 "Manual configuration" 选项，而不是 "Django" 那个。我们太牛逼，所以不要用 PythonAnywhere Django 默认设置 ;-)

### 设置 virtualenv

你将会被带到 PythonAnywhere 上你的Web 应用程序的配置屏，那个页面是每次你想修改服务器上你的应用程序时候要去的页面。

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

在 “Virtualenv” 一节，点击红色文字 “Enter the path to a virtualenv"，然后键入： `/home/<your-username>/my-first-blog/myvenv/`。 前进之前，先点击有复选框的蓝色框以保存路径。

> **注意** 替换你自己的用户名。如果你犯了错，PythonAnywhere 会显示一个小警告。

### 配置 WSGI 文件

Django 使用 “WSGI 协议”，它是用来服务 Python 网站的一个标准。PythonAnywhere 支持这个标准。 PythonAnywhere 识别我们 Django 博客的方式是通过配置 WSGI 配置文件。

点击 “WSGI configuration file” 链接（在 "Code" 一节，接近页面上方 — 它将被命名为如 `/var/www/<your-username>_pythonanywhere_com_wsgi.py`），然后跳转到一个编辑器。

删除所有的内容并用以下内容替换：

    import os
    import sys
    
    path = '/home/<your-username>/my-first-blog'  # use your own username here
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from whitenoise.django import DjangoWhiteNoise
    application = DjangoWhiteNoise(get_wsgi_application())
    

> **注意** 当看到 `<your-username>`时，别忘了替换为你自己的用户名。

这个文件的作用是告诉 PythonAnywhere 我们的Web应用程序在什么位置，Django 设置文件的名字是什么。它也设置 "whitenoise" 静态文件工具。

点击 **Save** 然后返回到 **Web** 选项卡。

一切搞定！点击大大的绿色 **Reload** 按钮然后你将会看到你的应用程序。页面的顶部可以看到它的链接。

## 调试小贴士

如果你在访问你的网站时候看到一个错误，首先要去 **error log** 中找一些调试信息。 你可以在 PythonAnywhere [Web 选项卡][8] 中发现它的链接。 检查那里是否有任何错误信息，底部是最新的信息。 常见问题包括：

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   忘记我们在控制台中的步骤之一：创建 virtualenv，激活它，安装 Django 进去，运行 collectstatic，迁移数据库。

*   在 Web 选项卡中，virtualenv 路径设置错误 — 如果真是这样，这通常会是一个红色错误消息。

*   WSGI 文件设置错误 — 你的 my-first-blog 目录地址设置是否正确？

*   你是否为你的 virtualenv 选择了同样的 Python 版本，如同 Web 应用程序里的那样？两个应该都是 3.4。

*   有一些常见的调试小贴士在 [general debugging tips on the PythonAnywhere wiki][9] 里.

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

记住，你的教练会在这里帮你！

# 你上线了！

你网站的默认页面说 “Welcome to Django”，如同你本地计算机上的一样。 试着添加 `/admin/`到URL的末尾，然后你会到达管理者的页面。 输入用户名和密码登录，然后你会看到服务器上的 add new Posts 。

给你自己一个*超大*的鼓励！ 服务器部署是web开发中最棘手的部分之一， 它通常要耗费人们几天时间才能搞定。 但你的网站已经上线，运转在真正的互联网上，就是这样！
