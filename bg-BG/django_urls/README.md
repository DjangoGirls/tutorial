# Django URLs

Готови сме да създадем нашата първа уеб страница: начална страница на твоя блог! Но първо нека научим малко повече за Django URLs.

## Какво е URL?

URL е уеб адрес. Може да видиш URL всеки път когато посещаваш уебсайт – видимо е в полето за адрес на твоята търсачка. (Да! `127.0.0.1:8000` е URL! И `https://djangogirls.org` също е URL.)

![URL](images/url.png)

Всяка страница в Internet има нужда от собствен URL. По този начин твоето приложение знае какво трябва да покаже на потребителя, който отваря този URL. В Django използваме нещо наречено `URLconf` (URL конфигурация). URLconf е пакет от примери, които Django се опитва да съпостави със запитания URL за да намери правилния изглед.

## Как работят URL в Django?

Нека отворим файла `mysite/urls.py` в редактора си и видим как изглежда:

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

Както може да видите, Django вече е сложил нещо за нас тук.

Редовете между трите кавички (`'''` or `"""`) се наричат docstrings – може да ги изписвате в началото на файла, класове или методи за да обясните какво прави кода - като коментар. Те няма да се изпълнят от Python.

Администртивния URL, който посетихте в предната глава е вече тук:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Този ред означава, че за всеки URL, който започва с `admin/`, Django ще намери съответстващ изглед *view*. В този случай въвеждаме много администраторски URL, така че да не е претъпкано в този малък файл – по-четимо и по-чисто.

## Твоя първи Django URL!

Време е да създадете вашия първи URL! Искаме 'http://127.0.0.1:8000/' да бъде началната страница на нашия блог и да показва лист от публикации.

Също така искаме да задържим файла `mysite/urls.py` чист, така че да въведем URL от нашата `blog` апликация към главният файл `mysite/urls.py`.

Давайте напред, акто добавите ред с който ще въведете `blog.urls`. Също ще искате да направите промени в `from django.urls…` реда, защото използваме функция `include`, така че вие трябва да добавите `import` към този ред.

Вашият файл `mysite/urls.py` трябва да изглежда ето така:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django сега ще пренасочва всичко, което идва към 'http://127.0.0.1:8000/' до `blog.urls` и търси за следващи инструкции тук.

## blog.urls

Създайте нов файл с име `urls.py` в директория на `blog` и го отворете с редактора си. И така! Добавете следните два реда:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Тук въвеждаме функцията на Django `path` и всички наши изгледи ( `views`) от `blog` апликацията. (Все още нямаме никакви, но ще стигнем до там след минута!)

След това можем да добавим наши първи URL образец:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Както виждате, сега приписваме изгледа наречен `post_list` към началния (root) URL. Този URL образец ще съвпадне с празен низ и преобразувателя в Django URL ще игнорира домейн името (т.е.,http://127.0.0.1:8000/), което започва с пълния път на URL. Този образец казва на Django, че `views.post_list` е правилното място да отиде, ако някой влезе в сайта ви на адрес 'http://127.0.0.1:8000/'.

Последната част, `name='post_list'</0, е името на URL, което ще бъде използване за идентифициране на изгледа. Това може да е също като името на изгледа, но може да е и нещо съвсем различно. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.</p>

<p>If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing <code>runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together). On Windows, you might have to press Ctrl+Break. Then you need to restart the web server by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/