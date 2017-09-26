# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## Čo je URL?

URL je jednoducho webová adresa. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` je URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Každá stránka na internete potrebuje svoju vlastnú URL. This way your application knows what it should show to a user who opens that URL. V Djangu používame takzvaný `URLconf` (URL konfigurácia). URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## Ako fungujú URL v Djangu?

Otvorme súbor `mysite/urls.py` v editore kódu a pozrime sa, ako vyzerá:

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

The admin URL, which you visited in previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

Zaujíma ťa, ako Django porovnáva URL so zobrazeniami? No, to je trochu zložitejšie. Django používa `regex`, čo je skratka pre "regulárne výrazy". Regex má veľa (veľa!) pravidiel, ktoré tvoria vzor vyhľadávania. Keďže regexy sú pokročilá téma, nebudeme sa nimi veľmi detailne zaoberať.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Písať samostatné views pre všetky čísla postov by bolo vážne otravné. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)** znamená, že tam bude číslo (jedna alebo viac číslic) a že chceme číslo zachytiť a extrahovať
* **/** povie Djangu, že bude nasledovať ďalší znak `/`
* **$** potom označuje koniec adresy URL, čo znamená, že vzoru budú zodpovedať iba reťazce s `/` na konci

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so **you will need** to add that to the import on the first line of the file.

Súbor `mysite/urls.py` by mal teraz vyzerať takto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Django teraz presmeruje všetko, čo prichádza na 'http://127.0.0.1:8000/' do `blog.urls` a tam bude hľadať ďalšie inštrukcie.

Writing regular expressions in Python is always done with `r` in front of the string. To je užitočný tip pre Python, že reťazec môže obsahovať špeciálne znaky, ktoré nie sú urečené pre Python samotný, ale pre regulárny výraz.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Potom môžeme pridať náš prvý URL vzor:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. To je správne, pretože v Django URL prekladači 'http://127.0.0.1:8000/' nie je súčasťou URL. Tento vzor povie Djangu, že `views.post_list` je to správne miesto, kam treba ísť, ak niekto vstúpi na stránku cez adresu 'http://127.0.0.1:8000/'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Názov URL môže byť rovnaký ako názov view, ale pokojne to môže byť aj niečo úplne iné. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Chyba](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/1.11/topics/http/urls/