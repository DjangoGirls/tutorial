# Rozbudowa aplikacji

Przeszłyśmy już wszystkie kroki niezbędne do uruchomienia naszej strony: wiemy, jak opisać nasze modele, widoki, adresy URL i szablony. Umiemy również sprawić, aby nasza strona wyglądała ładniej.

Czas na odrobinę praktyki!

Pierwszą rzeczą, której nasz blog potrzebuje, to strona wyświetlająca pojedynczy wpis, nieprawdaż?

Mamy już model `Post`, więc nie musimy już dodawać niczego do `models.py`.

## Tworzenie linku w szablonie

Zaczniemy od dodania linku w pliku `blog/templates/blog/post_list.html`. Póki co powinien on wyglądać następująco: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

Fragment `post_detail` oznacza, że Django będzie oczekiwał zdefiniowanego URL w `blog/urls.py` z ustawionym name=post_detail

A co z `pk=post.pk`? `pk` jest skrótem od primary key (ang. klucz podstawowy), który jest unikalną nazwą dla każdego rekordu bazy danych. Ponieważ nie ustaliłyśmy czym jest klucz podstawowy w naszym modelu `Post`, Django stworzyło taki klucz dla nas (standardowo jest to liczba, która rośnie o jeden przy każdym kolejnym rekordzie, np. 1, 2, 3) i dodało go jako pole pod nazwą `pk` do każdego naszego posta. Możemy dostać się do klucza podstawowego przez wpisanie `post.pk`, tak samo jak otrzymuje dostęp do innych pól (`title`, `author`, itd.) w naszym obiekcie `Post`!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![Błąd NoReverseMatch](images/no_reverse_match2.png)

## Utwórzmy URL dla poszczególnego wpisu

Dodajmy adres URL w pliku `urls.py` dla naszego *widoku* `post_detail`!

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

To oznacza, że gdy wpiszesz w przeglądarce adres `http://127.0.0.1:8000/post/5/`, Django zrozumie, że potrzebujesz *widoku* zwanego `post_detail` i przekaże temu *widokowi* informację, że `pk` jest równe `5`.

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

W folderze `blog/templates/blog` stwórzmy plik o nazwie `post_detail.html`.

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

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Potem, w konsoli [PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

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

W każdym wypadku jesteśmy gotowe przejść do podstrony [Web tab](https://www.pythonanywhere.com/web_app_setup/) i wcisnąć **Reload** (ang. odśwież).

I to już wszystko! Gratulacje :)