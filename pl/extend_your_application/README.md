# Rozbudowa aplikacji

Przeszłyśmy już wszystkie kroki niezbędne do uruchomienia naszej strony: wiemy, jak opisać nasze modele, widoki, adresy URL i szablony. Umiemy również sprawić, aby nasza strona wyglądała ładniej.

Czas na odrobinę praktyki!

Pierwszą rzeczą, której nasz blog potrzebuje, to strona wyświetlająca pojedynczy wpis, nieprawdaż?

We already have a `Post` model, so we don't need to add anything to `models.py`.

## Tworzenie linku w szablonie

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

{% raw %}Chcemy, aby tytuł wpisu był linkiem prowadzącym do strony ze szczegółami wpisu. Zmieńmy `<h1><a href="">{{ post.title }}</a></h1>` na link:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Czas by wyjaśnić co oznacza tajemnicze `{% url 'post_detail' pk=post.pk %}`. Jak można podejrzewać, zapis `{% %}` oznacza, że używamy tagów szablonu Django. Tym razem używamy takiego, który generuje za nas adres strony.{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![Błąd NoReverseMatch](images/no_reverse_match2.png)

## Utwórzmy URL dla poszczególnego wpisu

Let's create a URL in `urls.py` for our `post_detail` *view*!

Chcemy, aby nasz wpis i wszystkie informacje o nim, były widoczne pod tym adresem **URL**: http://127.0.0.1:8000/post/1/

W pliku `blog/urls.py` stwórzmy adres URL wskazujący na *widok* o nazwie `post_detail`, który wyświetli nam cały wpis. Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. Jego zawartość powinna wyglądać tak:

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
- `(?P<pk>\d+)` – this part is trickier. Oznacza ona, że Django pobierze wszystko, co umieścisz w tym miejscu i przekaże to do widoku w zmiennej o nazwie `pk`. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` oznacza, że to musi być jedna lub więcej cyfr. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Pamiętasz, jaki jest następny krok? Oczywiście: dodanie widoku!

## Dodajmy widok dla poszczególnego wpisu

This time our *view* is given an extra parameter, `pk`. Nasz *widok* musi go "złapać", zgadza się? A więc zdefiniujmy funkcję tak: `def post_detail(request, pk):`. Zwróć uwagę, że musimy użyć dokładnie tej samej nazwy jak ta, której użyłyśmy w pliku urls (`pk`). Pominięcie tej zmiennej jest niepoprawne i spowoduje błąd!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![Błąd DoesNotExist](images/does_not_exist2.png)

Tak nie może być! Ale oczywiście Django ma dla nas coś, co rozwiąże ten problem za nas: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Nie znaleziono strony](images/404_2.png)

Dobra wiadomość - możesz stworzyć własną stronę błędu 404 i upiększyć ją tak, jak tylko Ci się podoba. Ale teraz nie jest to super ważne, więc na razie pominiemy ten temat.

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

Czas na odświeżenie strony: http://127.0.0.1:8000/

![Widok listy wpisów](images/post_list2.png)

Działa! Ale co się stanie, gdy klikniesz na link w tytule wpisu?

![Błąd TemplateDoesNotExist](images/template_does_not_exist2.png)

O nie! Kolejny błąd! Ale wiemy już, jak sobie z nim poradzić, prawda? Musimy dodać szablon!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`.

Efekt będzie wyglądał tak:

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

Znów rozszerzamy `base.html`. W bloku `content` chcemy wyświetlić datę opublikowania wpisu (o ile istnieje), tytuł oraz treść. Ale jest kilka ważnych rzeczy do omówienia, nieprawdaż?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Strona ze szczegółami wpisu](images/post_detail2.png)

Hura! Działa!

## Jeszcze jedno: czas na wdrożenie!

Dobrze byłoby sprawdzić czy nasza strona dalej będzie dobrze działać na PythonAnywhere, prawda? Spróbuj ponownie wdrożyć projekt.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Potem, w konsoli [PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

I to już wszystko! Gratulacje :)