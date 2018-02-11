# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## Che cos'è un URL?

Una URL è semplicemente un indirizzo web. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` is a URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Ogni pagina internet ha bisogno della sua URL. This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Come funzionano le URL in Django?

Apriamo il file `mysite/urls.py` nel code editor che hai scelto e vediamo com'è:

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

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. Verranno ignorati da Python.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

Per caso ti stai chiedendo come fa Python a far corrispondere URL e view? Beh, questa parte è difficile. Django usa `regex`, abbreviazione di "espressioni regolari". Regex ha molte, (moltissime!) regole che costituiscono un modello di ricerca. Since regexes are an advanced topic, we will not go into detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Scrivere view separate per ogni numero del post sarebbe veramente noioso. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* **(\d+)** significa che ci sarà un numero (composto da una o più cifre) e che noi vogliamo che il numero venga catturato ed estratto
* **/** tells Django that another `/` character should follow
* infine, **$** indica la fine dell'URL. Significa che solo le stringhe che terminano con `/` corrisponderanno a questo modello

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Il tuo file `mysite/urls.py` ora dovrebbe avere questo aspetto:

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

Writing regular expressions in Python is always done with `r` in front of the string. Questo è un suggerimento utile per Python che la stringa possa contenere caratteri speciali che non sono destinati per lo stesso Python, ma per l'espressione regolare.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Dopo di che, possiamo aggiungere il nostro primo modello di URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. È giusto, perché nei resolver di URL di Django, ' http://127.0.0.1:8000 /' non è una parte dell'URL. Questo schema dirà a Django che `views.post_list` è il posto giusto dove andare se qualcuno entra nel tuo sito all'indirizzo 'http://127.0.0.1:8000/'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Può avere lo stesso del nome della view, ma può anche essere qualcosa di completamente diverso. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

Se provi a guardare adesso http://127.0.0.1:8000/, troverai un qualche tipo di messaggio come 'pagina non disponibile'. Questo perché il server (ricordi quando hai digitato `runserver`?) non è più attivo. Per capirne il motivo dai un occhiata alla console del tuo server.

![Errore](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. È il nome della *view* che Django prova a cercare e usare, ma non l'abbiamo ancora creata. At this stage, your `/admin/` will also not work. No worries – we will get there.

> Se vuoi saperne di più su Django URLconfs, dai uno sguardo alla documentazione ufficiale: https://docs.djangoproject.com/en/1.11/topics/http/urls/