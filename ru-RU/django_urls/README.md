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
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Как можешь заметить, Django уже кое-что разместил здесь для нас.

Строки между тройными кавычками (`'''` или `"""`) называются строчками документации - ты можешь написать их вверху файла, класса или метода, для того чтобы объяснить, что оно делает. Интерпретатор Python пропустит их при выполнении скрипта.

URL-адрес администрирования, который мы посещали в предыдущей главе, уже здесь присутствует:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Эта черточка означает, что для каждого URL-адреса, начинающегося с `admin`, Django найдет соответствующий ему *view* (представление). В этом случае мы охватываем большое количество различных URL-адресов, которые явно не прописаны в этом маленьком файле -- так гораздо аккуратней и более читабельно.

## Твой первый URL-адрес в Django!

Пришло время создать твой первый URL-адрес! Мы хотим, чтобы 'http://127.0.0.1:8000/' возвращал домашнюю страничку нашего блога со списком записей в ней.

Мы также хотим сохранить файл `mysite/urls.py` в максимально аккуратном виде, так что мы импортируем URL-адреса для нашего приложения `blog` в файл `mysite/urls.py`.

Смелее, добавь строку, которая будет импортировать `blog.urls`. Вам также нужно будет изменить строки `from django.urls...`, потому что мы будем использовать функцию `include`, так что вам нужно добавить этот import в строку.

Ваш файл `mysite/urls.py` должен выглядеть следующим образом:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django теперь будет перенаправлять все запросы 'http://127.0.0.1:8000/' к `blog.urls` и искать там дальнейшие инструкции.

## blog.urls

Создайте новый пустой файл с именем `urls.py` в каталоге `blog` и откройте его в редакторе кода. Хорошо! Добавьте эти две первые строки:

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

![Ошибка](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together) and restart it by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/