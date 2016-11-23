# 你的第一个Django 项目 ！

> 本章的部分内容基于 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 的教程。
> 
> 本章的部分是基于知识共享署名-4.0 国际许可协议许可的 [django marcador 教程][1]。 Django marcador 教程的版权由Markus Zapke-Gründemann 持有。

 [1]: http://django-marcador.keimlink.de/

我们将要创建一个简单的博客 ！

第一步是创建一个新的 Django 项目。 首先，我们需要运行一些由 Django 提供的脚本，为我们即将开始的项目建立主要骨架。 它会生成一系列的文件夹和文件，在后面的项目中我们会需要修改和使用到它们。

某些名称的文件和目录在 Django 起着至关重要的作用。 你不应该重命名我们将要创建的文件。 将它们移动到一个不同的地方也不是一个好主意。 Django 需要固定的系统结构，以便 Django 能够找到重要的东西。

> 记住在虚拟环境中运行的一切。 如果您没有看到您的控制台中的前缀 `（myvenv）`，您需要激活您的虚拟环境。 我们在 **Django 安装**这一节内的 **在虚拟环境下工作** 部分中解释过了。 在windows下面运行命令：myvenv\Scripts\activate，在苹果或linnux环境下运行命令：source myvenv/bin/activate

在苹果或Linux系统下，你需要运行下面的命令,**记得不要漏掉命令后面的小点（.）**: (myvenv) ~/djangogirls$ django-admin startproject mysite .

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

在windows环境下也不要忘了下面命令最后的小点。

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .
    

> 此时，符号"`.`"很重要，它将告诉脚本程序自动安装Django到你当前选择的目录中（所以这个“`.`”是告诉脚本执行时的一种参考点）
> 
> **注意**：当敲入前面命令时，记住你是从 `django-admin` 或 `django-admin.py`开始。 而命令串前面的`(myvenv) ~/djangogirls$` 和 `(myvenv) C:\Users\Name\djangogirls>`则是由系统提示用户输入命令的光标位置，这部分不用用户输入。

`django-admin.py`是一个脚本，将自动为您创建目录和文件。前面的命令正确的话，你现在就应该有一个目录结构，看起来像下面这样：

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    它是一个Django的项目文件夹，为即将开始的项目准备好了必要的资源文件和文件夹
    

`manage.py` 是一个帮助管理站点的脚本。在它的帮助下我们将能够在我们的计算机上启动一个 web 服务器，而无需安装任何东西。

`settings.py` 文件包含的您的网站的配置数据。

还记得当我们谈到一名邮差在决定何处交付一封信时的例子吗？`urls.py` 文件包含`urlresolver`所需的模型的列表。.

现在让我们忽略其他文件, 现在我们不会改变它们。要记住的唯一一点是不要不小心删除他们！

## 更改设置

让我们在 `mysite/settings.py` 中进行一些更改。使用您前面安装了的代码编辑器打开文件。

在我们的站点上有正确的时间是非常不错的。 访问[wikipedia timezones list][2]复制你所在地区的时区 (TZ). (eg. `Europe/Berlin` )

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

然后在 settings.py文件中, 找到包含`TIME_ZONE</0>字段的这行,并将时区改为你所在地区的时区。即：</p>

<pre><code>python
TIME_ZONE = 'Europe/Berlin'
`</pre> 
适当的修改"Europe/Berlin" ps:中国大陆地区可修改为 Asia/Shanghai

我们还需要添加 (我们会找出在教程后面所提到的静态文件和 CSS文件) 静态文件的路径。 我们下拉到文件的*最底部*, 就是在`STATIC_URL` 条目的下面。添加新的一行内容为 `STATIC_ROOT`:

    STATIC_URL = '/static/'
    STATIC_ROOT = os.path.join(BASE_DIR, 'static')
    

## 设置数据库

有很多的不同的数据库软件，可以用来存储你的网站数据。我们将使用默认的那个， `sqlite3`.

这已经在您的 `mysite/settings.py` 文件中设置了：

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
    

若要为我们的博客创建一个数据库，，让我们运行以下命令在控制台中： `python manage.py migrate` （我们需要`djangogirls` 目录中包含 `manage.py` 文件）。 如果一切顺利，您应该看到这样：

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK
    

我们完成了 ！现在去启动网站服务器，看看是否我们的网站正在工作！

你必须要进入包含`manage.py` 文件的目录 （`djangogirls` 目录）。 在控制台中，我们可以通过运行 `python manage.py runserver` 开启 web 服务器：

    (myvenv) ~/djangogirls$ python manage.py runserver
    

如果你在Windows系统遇到UnicodeDecodeError这个错误，用这个命令来代替

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

现在，你需要做的就是检测你的站点的服务器是否已经在运行了。打开你的浏览器（火狐，Chrome，Safari，IE 或者其他你惯用的浏览器）输入这个网址：

    http://127.0.0.1:8000/
    

Web服务器将接管你的命令行提示符，直到我们停止它。 为了尝试更多命令，我们应该同时打开一个新的终端，并激活虚拟环境。 想要停止web服务器，我们应该切换到刚才在运行程序的窗口，并且按下 CTRL+C - 同时按下CTRL键和字母C键(如果你的操作系统是windows，那么应当按下 Ctrl+Break)。

祝贺你 ！你已经创建您的第一个网站，并使用 web 服务器运行它！这超级赞吧？

![它工作了！][3]

准备好下一步了吗？现在来创建一些内容 ！

 [3]: images/it_worked2.png
