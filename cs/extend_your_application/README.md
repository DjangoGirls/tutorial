# Rozšíření tvé aplikace

Dokončili jsme již všechny kroky potřebné k vytvoření našeho webu: víme, jak napsat model, url, view a šablonu. Víme také, jak udělat naše webové stránky pěkné.

Čas na procvičení!

První věc, kterou potřebujeme v našem blogu je pochopitelně stránka, která zobrazí jeden příspěvek, že ano?

Již máme `Post` model, takže nebudeme muset přidávat nic k `models.py`.

## Vytvoření šablony odkazu na post detail

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

{% raw %}Chceme mít odkaz ze seznamu příspěvků na stránku detail příspěvku. Změňme `< h1 >< href ="">{{ post.title }}< /a></h1>` tak, aby odkazoval na stránku detailu příspěvku:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Čas k vysvětlení tajemného `{% url 'post_detail' pk=post.pk %}`. Jak asi tušíš, `{% %}` tato notace znamená, že používáme Django šablonovací značky. Tentokrát použijeme jednu, která pro nás vytvoří adresu URL!{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match2.png)

## Vytváříme adresu URL na detail příspěvku

Pojďme vytvořit adresu URL v `urls.py` pro náš `post_detail` *view*!

Chceme, aby se detail našeho prvního příspěvku zobrazil na této **URL**: http://127.0.0.1:8000/post/1 /

Pojďme vytvořit adresu URL v souboru `blog/urls.py` odkazující Django na *view* s názvem `post_detail`, který bude zobrazovat celý příspěvek blogu. Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. Tento soubor by měl vypadat takto:

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
- `(?P<pk>\d+)` – this part is trickier. Znamená to, že Django vezme vše, co zde bude umístěné a přesune to do view do proměnné s názvem `pk`. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` znamená, že je zde má být jedna nebo více číslic. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

Znamená to, že pokud zadáte `http://127.0.0.1:8000/post/5/` do prohlížeče, Django pochopí, že hledáte *view* s názvem `post_detail` a přenese informaci, že `pk` se rovná `5` do *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Pamatuješ si, jaký je další krok? Jistě: Přidat view!

## Přidání view pro detail příspěvku

This time our *view* is given an extra parameter, `pk`. Náš *view* potřebuje tento parametr zachytit, že? Takže definujeme naši funkci jako `def post_detail (request, pk):`. Všimni si, že musíme použít přesně stejný název jako ten, který jsme určili v Url (`pk`). Vynechání této proměnné je nesprávné a bude mít za následek chybu!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

A to my nechceme! Ale, samozřejmě, Django přichází s něčím, co nám to pomůže ošetřit za nás: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

Dobrou zprávou je, že můžeš skutečně vytvořit vlastní stránku, `Page Not Found 404` a udělat jí tak krásnou, jak jen chceš. Ale to není nyní super důležité, takže to přeskočíme.

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

Ano. Je na čase aktualizovat stránku: http://127.0.0.1:8000 /

![Post list view](images/post_list2.png)

Fungovalo to! Ale co se stane, když klepneš na odkaz v názvu příspěvku?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Ach ne! Další chyba! Ale my už víme jak s tím naložit správně? Musíme přidat šablonu!

## Create a template for the post details

Vytvoříme soubor `blog/templates/blog` s názvem `post_detail.html`.

Celý příkaz bude vypadat takto:

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

Opět rozšiřujeme `base.html`. V bloku `content` chceme zobrazit published_date příspěvku (pokud existuje), název a text. Ale měli bychom probrat, některé důležité věci, že?

{% raw %} `{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Hurá! Funguje to!

## Ještě jedna věc: čas nasadit aplikaci!

Bylo by dobré zjistit, jestli naše webové stránky budou stále fungovat na PythonAnywhere? Zkusme je znovu nasadit.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Pak v [Bash konzoli PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

Nakonec, skoč na [kartu Web](https://www.pythonanywhere.com/web_app_setup/) a klikni na **Reload**.

A mělo by to být! Gratulujeme :)