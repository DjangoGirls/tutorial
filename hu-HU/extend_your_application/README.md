# Egészítsd ki az applikációdat

Most már teljesítettük az összes szükséges lépést a website-unk létrehozásához: tudjuk hogyan írjunk egy modelt, url-t, view-t és template-et. Azt is tudjuk, hogy hogyan csinosítsuk ki az oldalunkat.

Itt az idő gyakorolni!

Az első dolog, amire szükségünk van, nyilván egy oldal, ami megjelenít egy bejegyzést, ugye?

Már van egy `Post` modellünk, úgyhogy nem kell hozzáadnunk semmit a `models.py`-hoz.

## Template link a bejegyzés részleteihez

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Szükségünk van egy linkre a bejegyzések címei és a bejegyzések részletes oldala között. Cseréljük ki a `<h1><a href="">{{ post.title }}</a></h1>` sort úgy, hogy a bejegyzés részletes oldalára vezet: {% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Itt az ideje elmagyarázni a rejtélyes `{% url 'post_detail' pk=post.pk %}` részt. Ahogy gyaníthattad, a `{% %}` jelölés azt jelenti, hogy Django template tag-eket használunk. Ezúttal egy olyat, ami létrehoz egy URL-t nekünk!{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch hiba](images/no_reverse_match2.png)

## URL a bejegyzés részleteihez

Hozzunk létre egy URL-t a `urls.py`-ban a `post_detail` *view*-hoz!

Az első bejegyzésünk részleteit a kövekező **URL** címen akarjuk megjeleníteni: http://127.0.0.1:8000/post/1/

Hozzunk létre egy URL-t a `blog/urls.py` fájlban, ami egy `post_detail` nevű *view*-ra mutat -- ez majd egy egész blogbejegyzést jelenít meg. Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. Így kell kinéznie a fájlnak:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. Ez azt jelenti, a Django fogja, amit ideraksz, és átirányítja egy nézethez egy `pk` nevű változóként. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` azt jelenti, hogy egy vagy több számjegynek kell lennie. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

Ez azt jelenti, hogy ha beírod a `http://127.0.0.1:8000/post/5/` címet a böngésződbe, akkor a Django megérti, hogy egy `post_detail` nevű 1>nézetet</em> keresel, és közvetíti az információt, hogy a `pk` `5-tel` egyenlő annál a *nézetnél*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Emlékszel, mi a következő lépés? Hát persze: hozzáadni egy új nézetet!

## Nézet a bejegyzés részleteihez

This time our *view* is given an extra parameter, `pk`. A *nézetünknek* ezt meg kell kapnia, igaz? Úgyhogy a function-t úgy fogjuk meghatározni, hogy `def post_detail(request, pk):`. Jegyezd meg, hogy pontosan ugyanazt a nevet kell használnunk, amit az url-ben jelöltünk meg (`pk`). A változó kihagyása helytelen, és hibát fog eredményezni!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist hiba](images/does_not_exist2.png)

Mi ezt nem akarjuk! De, természetesen a Django-nak van valamije, ami ezt megoldja nekünk: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Az oldal nem található](images/404_2.png)

A jó hír az, hogy elkészítheted a saját `Page not found` oldaladat, és olyan szépre alakíthatod, amilyenre akarod. De ez nem olyan fontos egyelőre, úgyhogy átugorhatjuk.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Igen. Ideje frissíteni az oldalt: http://127.0.0.1:8000/

![Post list nézet](images/post_list2.png)

Sikerült! De mi történik, ha ráklikkelsz egy linkre a blog bejegyzés címében?

![TemplateDoesNotExist hiba](images/template_does_not_exist2.png)

Jaj ne! Egy másik hiba! De már tudjuk, hogyan kezeljük, igaz? Létre kell hoznunk egy template-et!

## Create a template for the post details

Létrehozunk egy fájlt a `blog/templates/blog` könyvtárban, és elnevezzük: `post_detail.html`.

Ez fog történni:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Itt megint a `base.html`-t bővítjük ki. A `content` blokkban meg szeretnénk jeleníteni a bejegyzés címét, szövegét és a megjelenési idejét (published_date) - ha van. De pár fontos dolgot tisztáznunk kell még, igaz?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post részletei oldal](images/post_detail2.png)

Juppi! Működik!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Aztán írd be ezt a [PythonAnywhere Bash konzol](https://www.pythonanywhere.com/consoles/)ba:

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)