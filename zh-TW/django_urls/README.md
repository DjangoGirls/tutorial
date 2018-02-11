# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## 什麼是 URL？

URL 只是一個 web 位址。 You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` 是‘一個 URL！ And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

在網際網路上每個網頁都需要有它自己的 URL。 This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## 在 Django 上 URLs 如何運作？

在你選擇的程式碼編輯器上，打開 `mysite/urls.py` 檔，看看它長什麼樣子：

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

## Regex

你想知道 Django 如何將 URLs 匹配到 views 嗎？ 喔，這一部分比較棘手。 Django 使用 `regex`，是 "正規表示法" ("regular expressions") 的簡稱。 正規表示法有很多（很多！）的規則，這些規則形成一個搜尋模式。‘ Since regexes are an advanced topic, we will not go into detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

為所有個別編號的文章撰寫單獨的 views將會很令人惱火。 With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** 表示這是一個數字（個位數或多數位），且我們要提取這個數字。
* **/** tells Django that another `/` character should follow
* **$** 表示 URL 的末端，意味只有以 `/` 結束的字串將匹配這個模式。

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

你的 `mysite/urls.py` 檔現在應該像這樣：

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

Writing regular expressions in Python is always done with `r` in front of the string. 對 Python 而言，這是一個有用的提示，它告訴 Python 這字串可能包含特殊字元，這些特殊字元不是給 Python 而是給正規表示法用的。

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

然後，我們可以新增我們第一個 URL 模式：

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. 這是正確的，因為在 Django URL 解碼器 (resolvers) 中，'http://127.0.0.1:8000/' 不是 URL 的一部分。 這種模式將會告訴 Django，如果有人要以 'http://127.0.0.1:8000/' 網址進入你的網站，那麼 `views.post_list` 是這個請求應該去的地方。

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. 這可以和 view 的名稱相同，但它也可以是完全不同的名稱。 We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![錯誤 (Error)](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> 如果你想要知道更多有關於 Django URLconfs，可查看 Django 官方文件：https://docs.djangoproject.com/en/1.11/topics/http/urls/