# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## Co je adresa URL?

Adresa URL je jednoduše webová adresa. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` je adresa URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Každá stránka na internetu potřebuje svou vlastní URL. This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Jak fungují URL v Djangu?

Pojďme otevřít `mysite/urls.py` soubor v tvém zvoleném editoru kódu a uvidíme, jak vypadá:

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

Zajímá tě, jak Django porovnává URL pro views? No, tato část je složitější. Django používá `regex`, což je zkratka pro "regulární výrazy". Regex má hodně (hodně!) pravidel, ze kterých tvoří vzorek pro vyhledávání. Since regexes are an advanced topic, we will not go into detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Psaní oddělených views pro všechna čísla příspěvků by bylo opravdu otravné. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** znamená, že bude následovat číslo (jedeno nebo více číslic) a že chceme číslo zachytit a extrahovat
* **/** tells Django that another `/` character should follow
* **$** pak označuje konec adresy URL, což znamená, že pouze řetězce s `/` na konci budou odpovídat tomuto vzoru

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Tvůj `Mysite/urls.py` soubor by měl nyní vypadat takto:

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

Writing regular expressions in Python is always done with `r` in front of the string. To je užitečný tip pro Python, že řetězec může obsahovat zvláštní znaky, které nejsou určeny přímo pro Python samotný, ale pro regulární výraz namísto toho.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Poté můžeme přidat náš první URL vzor:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Tak je to správně, protože v Django URL překladači/resolveru, část adresy ' http://127.0.0.1:8000 /' není součástí adresy URL. Tento vzor řekne Djangu, že `views.post_list` je správné místo, kam jít, když někdo vstoupí na tvé webové stránky na adresu' http://127.0.0.1:8000 /'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Název URL může být stejný jako název view, ale také může být úplně jiný. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> Pokud chceš vědět více o Django URLconfs, podívej se na oficiální dokumentaci: https://docs.djangoproject.com/en/1.11/topics/http/urls/