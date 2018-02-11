# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## Що таке URL?

URL - це просто веб-адреса. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` - це URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Кожна сторінка в Інтернеті потребує свого власного URL. This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Як працює URL в Django?

Давайте відкриємо файл `mysite/urls.py` в редакторі коду і подивимось, як він виглядає:

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

Хіба вам не цікаво яким чином Django створює відповідності між URL і відображеннями? Гаразд, ця частина досить хитра. Django використовує `regex`, що є скороченням від "regular expressions". Regex має багато (багато!) правил, що формують шаблон пошуку. Since regexes are an advanced topic, we will not go into detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Написання окремих відображень для усіх номерів постів було б дійсно нестерпним. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** означає, що буде число (одне або декілька цифр), і ми хочемо, щоб число захопилось і вибралось
* **/** tells Django that another `/` character should follow
* **$** далі позначає кінець URL-адреси, а це означає, що під шаблон підходять лише ті рядки, які закінчуються на `/`

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Ваш файл `mysite/urls.py` повинен наразі мати такий вигляд:

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

Writing regular expressions in Python is always done with `r` in front of the string. Це підказка для інтерпретатора, що рядок може містити спеціальні символи, які використовуються в решулярних виразах.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Після цього, ми можемо додати наш перший URL шаблон:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Це правильно, тому що в механізмі Django URL, вираз ' http://127.0.0.1:8000 /' - не є частиною URL-адресу. Цей шаблон показуватиме для Django, що `views.post_list` є правильним місцем для переходу, якщо хтось введе ваш сайт за адресою 'http://127.0.0.1:8000/'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Це може бути ім'ям потрібного нам відображення (в'ю), або взагалі чимось іншим. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> Якщо бажаєте дізнатися більше про Django URLconf, зверніться до офіційної документації: https://docs.djangoproject.com/en/1.11/topics/http/urls/