# Django URLs

Мы собираемся создать нашу первую веб-страницу: домашнюю страницу для вашего блога! Но сначала давайте немного узнаем о URL-адресах Django.

## Что такое URL-адрес?

URL — это просто адрес в интернете. Ты можешь видеть URL каждый раз при посещении веб-сайта - он отображается в адресной строке. (Да! `127.0.0.1:8000` это URL-адрес! И `https://djangogirls.org` — тоже URL.)

![URL-адрес](images/url.png)

Любая страница в Интернете нуждается в собственном URL-адресе. Таким образом, ваше приложение знает, что оно должно показать пользователю, который открывает этот URL-адрес. В Django, мы используем кое-что под названием `URLconf` (URL configuration). URLconf — это набор шаблонов, которые Django попробует сопоставить с полученным URL, чтобы выбрать правильный метод для отображения (view).

## Как URL-адреса работают в Django?

Давай откроем файл `mysite/urls.py` в нашем редакторе и посмотрим, как он выглядит:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Как можешь заметить, Django уже кое-что разместил здесь для нас.

Строки между тройными кавычками (`'''` или `"""`) называются строчками документации - ты можешь написать их вверху файла, класса или метода, для того чтобы объяснить, что оно делает. Интерпретатор Python пропустит их при выполнении скрипта.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

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

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/