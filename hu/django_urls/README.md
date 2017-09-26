# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## Mi az URL?

Az URL egyszerűen csak egy webes cím. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! a `127.0.0.1:8000` egy URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Az interneten minden oldalnak szüksége van egy saját URL-re. This way your application knows what it should show to a user who opens that URL. A Django-ban egy `URLconf` nevű dolgot használunk (URL configuration, vagyis URL beállítások). URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## Hogy működnek az URL-ek a Django-ban?

Nyisd meg a `mysite/urls.py` fájlt a kódszerkesztőben, és nézd meg:

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

Kíváncsi vagy, hogyan párosítja össze a Django az URL-eket és a view-kat? Na, ez a rész trükkös. A Django `regex`-et használ (a "regular expressions", vagyis reguláris kifejezések rövidítése). A regexnek nagyon (nagyon!) sok szabálya van arra, hogy hogyan épít fel egy keresési mintázatot. Mivel a regex egy magasabb szintű téma, most nem megyünk bele a részletekbe.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Minden egyes poszt számához új view-t írni nagyon idegesítő lenne. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* A **(\d+)** azt jelenti, hogy ezután egy szám fog következni (egy vagy több számjegyű), és ezt a számot ki szeretnénk olvasni az URL-ből
* A **/** azt mondja meg a Django-nak, hogy utána még egy `/` karakternek kell következnie
* A **$** az URL végét jelzi, vagyis csak azok a stringeket fogja megfeleltetni a mintának, amik így végződnek: `/`

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so **you will need** to add that to the import on the first line of the file.

A `mysite/urls.py` fájlod most így néz ki:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Mostantól a Django mindent, ami a 'http://127.0.0.1:8000/'-re jön, átirányít a `blog.urls`-re, és ott fogja keresni a további tennivalókat.

Writing regular expressions in Python is always done with `r` in front of the string. Ez egy hasznos tipp a Pythonnak, hogy a string tartalmazhat speciális karaktereket, de ezek a reguláris kifejezés alkotóelemei, és nem magának a Pythonnak szólnak.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Ezután megírhatjuk az első URL mintát:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Ez így helyes, mert a Django URL resolverében a 'http://127.0.0.1:8000/' nem számít az URL részének. Ez a minta mondja meg a Django-nak, hogy ha valaki a 'http://127.0.0.1:8000/' címen lép be a weboldaladra, a `views.post_list` a helyes lépés.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Ez lehet ugyanaz, mint a view neve, de lehet teljesen más is. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Hiba](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/1.11/topics/http/urls/