# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## 什么是 URL？

简单地说，URL 是一个网页地址。 You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` 是一个URL！ And `https://djangogirls.org` is also a URL.)

![URL](images/url.png)

每一个互联网的网页都需要自己的 URL。 This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## URL 在 Django 中如何工作？

使用你喜欢的编辑器打开 `mysite/urls.py` 就能看到它长什么样子了：

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

As you can see, Django has already put something here for us.

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. They won't be run by Python.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## 正则表达式

你知道 Django 是如何将 URL 匹配到 view 的吗？ 好吧，这部分很棘手。 Django 使用了 `regex`，这是“正则表达式”的缩写。 正则表达式有很多（非常多！）规则用来形成一个搜索模式。 Since regexes are an advanced topic, we will not go into detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

为每一个帖子都写一个单独的视图是一件会让人恼火的事情。 With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** 表示 URL 中会有一个数（一位或者多位数字），并且我们想提取出这个数
* **/** tells Django that another `/` character should follow
* **$<0> 表示 URL 的末尾，即以 `/<1> 结尾的 URL 才会被匹配到</li>
</ul>

<h2>Your first Django URL!</h2>

<p>Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.</p>

<p>We also want to keep the <code>mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.</p> 
    
    Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.
    
    你的 `mysite/urls.py` 文件现在应该看起来像这样：
    
    {% filename %}mysite/urls.py{% endfilename %}
    
    ```python
    from django.conf.urls import include
    from django.conf.urls import url
    from django.contrib import admin
    
    urlpatterns = [
        url(r'^admin/', admin.site.urls),
        url(r'', include('blog.urls')),
    ]
    ```
    
    Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.
    
    Writing regular expressions in Python is always done with `r` in front of the string. 这告诉 Python，这个字符串中的特殊字符是为正则表达式准备的，而不是为 Python 自身准备的。
    
    ## blog.urls
    
    Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:
    
    {% filename %}blog/urls.py{% endfilename %}
    
    ```python
    from django.conf.urls import url
    from . import views
    ```
    
    Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)
    
    然后，我们可以加入第一个 URL 模式：
    
    {% filename %}blog/urls.py{% endfilename %}
    
    ```python
    urlpatterns = [
        url(r'^$', views.post_list, name='post_list'),
    ]
    ```
    
    As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. 这是正确的，因为在 Django 的 URL 解析器中，'http://127.0.0.1:8000/' 并不是 URL 的一部分。（译注：即只有 'http://127.0.0.1:8000/' 后面的部分会被解析。如果后面的部分为空，即是空字符串被解析。） 这个模式告诉了 Django，如果有人访问 'http://127.0.0.1:8000' 地址，那么 `views.post_list` 是这个请求该去到的地方。
    
    The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. 它可以跟 view 的名字一样，也可以完全不一样。 We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.
    
    If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.
    
    ![错误](images/error1.png)
    
    Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.
    
    > 如果你想知道更多有关Django URLconf的知识，可以看看官方文档：https://docs.djangoproject.com/en/1.11/topics/http/urls/