# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## Что такое URL-адрес?

URL — это просто адрес в интернете. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` это URL-адрес! And `https://djangogirls.org` is also a URL.)

![URL-адрес](images/url.png)

Любая страница в Интернете нуждается в собственном URL-адресе. This way your application knows what it should show to a user who opens that URL. В Django мы используем кое-что под названием `URLconf` (англ. URL configuration, конфигурация URL). URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## Как URL-адреса работают в Django?

Давай откроем файл `mysite/urls.py` в нашем редакторе и посмотрим, как он выглядит:

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

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. Интерпретатор Python пропустит их при выполнении скрипта.

The admin URL, which you visited in previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

Спрашиваешь себя, как Django сопоставляет URL-адреса и представления? Ну, это не так просто. В Django используются так называемые регулярные выражения (англ. "regular expressions" — сокращённо `regex`). Регулярные выражения имеют множество (множество!) правил, которые формируют поисковый шаблон. Поскольку регулярные выражения являются довольно сложной темой, мы остановимся на них чуть подробнее.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Писать представления для всех номеров будет весьма утомительно. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)** означает, что дальше должен присутствовать номер (одна или несколько цифр) и мы хотим извлечь его из url
* **/** говорит Django об очередном символе `/` после номера
* **$** означает конец url, т.е. шаблону соответствуют только адреса с `/` на конце

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Файл `mysite/urls.py` должен выглядеть следующим образом:

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

Django теперь будет перенаправлять все запросы 'http://127.0.0.1:8000/' к `blog.urls` и искать там дальнейшие инструкции.

Writing regular expressions in Python is always done with `r` in front of the string. Это полезный намек для Python, что строка может содержать специальные символы, предназначенные не для самого Python, а для регулярного выражения.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

После этого мы можем добавить наш первый URL-шаблон:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Это правильно, потому что для обработчиков URL в Django 'http://127.0.0.1:8000/' не является частью URL. Этот шаблон скажет Django, что `views.post_list` — это правильное направление для запроса к твоему веб-сайту по адресу 'http://127.0.0.1:8000/'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Оно может быть таким же, как имя представления (англ. view), а может и чем-то совершенно другим. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Ошибка](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage your `/admin/` will also not work. No worries – we will get there.

> Если хочешь узнать больше о Django URLconfs, посмотри официальную документацию: https://docs.djangoproject.com/en/1.11/topics/http/urls/