# Django URLs

Gleich werden wir unsere erste Website basteln: eine Homepage für deinen Blog! Zuerst sollten wir uns jedoch mit Django URLs beschäftigen.

## Was ist eine URL?

Eine URL ist einfach eine Web-Adresse. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` ist eine URL! Und `https://djangogirls.org` ist auch eine URL.)

![URL](images/url.png)

Jede Seite im Internet braucht ihre eigene URL. This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Wie funktionieren URLs in Django?

Öffne die `mysite/urls.py`-Datei in deinem Code-Editor nach Wahl und schaue dir an, wie sie aussieht:

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

Du fragst dich, WIE Django die richtige View zu einer URL findet? Nun, das ist ein bisschen komplizierter. Django benutzt `regex` kurz für "regular expressions" (reguläre Ausdrücke). Regex besteht aus vielen Regeln (wirklich vielen!), aus denen ein Suchschema aufgebaut ist. Since regexes are an advanced topic, we will not go into detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` für den Anfang des Textes
* `$` für den Ende des Textes
* `\d` für eine Zahl
* `+` um zu zeigen, dass das vorherige Objekt mindestens einmal wiederholt werden soll
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Eigene Views für jeden einzelnen Post zu schreiben, wäre ziemlich nervig. Mit regulären Ausdrücken können wir Ausdrücke schreiben, die aus einer URL die Zahlen herausfiltern: `^post/(\d+)/$`. Lass es uns in kleine Häppchen aufteilen, um zu verstehen, was wir hier genau tun:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** steht für eine Zahl (eine oder mehrere Ziffern) und wir wollen diese Zahl erfassen und auswerten
* **/** tells Django that another `/` character should follow
* **$** steht für das Ende der URL mit der Bedeutung, dass nur Zeichenfolgen, die auf `/` enden, dem Muster entsprechen

## Deine erste Django URL!

Es wird Zeit, deine erste URL zu erstellen! Wir wollen, dass 'http://127.0.0.1:8000/' die Homepage unseres Blogs wird und eine Liste unserer Posts zeigt.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Deine `mysite/urls.py`-Datei sollte jetzt so aussehen:

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

Beim Schreiben von regulären Ausdrücken in Python benutzt man immer das `r` vor der Zeichenfolge. Dies ist ein hilfreicher Hinweis an Python, dass die Zeichenfolge unter Umständen spezielle Zeichen enthalten kann, welche nicht für Python an sich gedacht sind, sondern für die regulären Ausdrücke.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Danach können wir unser erstes URL-Pattern hinzufügen:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Und das ist auch richtig so! Denn die Django URL-Auflösung erkennt 'http://127.0.0.1:8000/' nicht als Teil der URL an. Wenn jemand deine Website mit der Adresse 'http://127.0.0.1:8000/' aufruft, passt dieses Muster (leere Zeichenkette) und Django weiß so, dass `views.post_list` das gewünschte Ziel ist.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Dieser kann identisch mit dem Namen der View sein, kann aber auch etwas total Anderes sein. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Fehler](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> Wenn du mehr über Django URLconfs lernen willst, dann öffne die offizielle Dokumentation: https://docs.djangoproject.com/en/1.11/topics/http/urls/