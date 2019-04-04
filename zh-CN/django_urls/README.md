# Django 的 URL！

我们下面要来建立自己的第一个网页：你的博客主页！但是首先，我们要来了解一下Django的URL。

## 什么是 URL？

URL是一个网页地址。 每次你登录一个网页时，你都可以在浏览器地址栏上看到一个URL。 (对！ `127.0.0.1:8000` 是一个URL！ 同时 `https://djangogirls.org` 也是一个 URL。)

![URL](images/url.png)

每一个互联网的网页都需要自己的 URL。 这样当用户打开一个 URL 时，你的应用程序才知道应该展现什么内容。 在 Django 中，我们使用一种叫做 `URLconf` (URL 配置) 的机制 。 URLconf 是一套模式，Django 会用它来把用户请求的 URL 匹配成相对应的界面。

## URL 在 Django 中如何工作？

选一个编辑器打开 `mysite/urls.py` 就能看到它长什么样子了：

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

正如你所看到的，Django 已经为我们在里面放了一些东西。

三重引号之间的语句 (` '''` 或 `''''''`) 称为文档字符串--你可以在文件、分类或算法的最上面写这些来描述它的作用。 Python不会运行它们。

你在上一章节中学到的 admin URL 已经放在里面了：

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

这一行表示对于每一个以 `admin/` 开头的 URL，Django 都会找到一个相对应的 *界面*。 在这些代码中，我们写入了许多 admin URL ，所以这些 URL 不需要全被打包进这个小文件中。这使得代码更具可读性和简洁性。

## 你的第一个 Django URL！

是时候创建第一个 URL 了！我们想用 'http://127.0.0.1:8000/' 作为博客的首页，并展示一个帖子列表。

我们也想保持 `mysite/urls.py` 文件整洁一些，所以我们要从 `博客` 应用把URL导出到主文件`mysite/urls.py`。

下面继续, 添加一行代码来导入 `blog.urls` 。 You will also need to change the `from django.urls…` line because we are using the `include` function here, so you will need to add that import to the line.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory, and open it in the code editor. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `path` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together) and restart it by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/