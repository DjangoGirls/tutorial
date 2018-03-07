{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

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

{% raw %}Chcemy, aby tytuł wpisu był linkiem prowadzącym do strony ze szczegółami wpisu. Zmieńmy `<h1><a href="">{{ post.title }}</a></h1>`, aby zawierał link do strony szczegółów wpisu:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Czas by wyjaśnić co oznacza tajemnicze `{% url 'post_detail' pk=post.pk %}`. Jak można podejrzewać, zapis `{% %}` oznacza, że używamy tagów szablonu Django. Tym razem używamy takiego, który generuje dla nas adres URL!{% endraw %}

Fragment `post_detail` oznacza, że Django będzie oczekiwał URL w `blog/urls.py` o nazwie name=post_detail

A co z `pk=post.pk`? `pk` jest skrótem od primary key (ang. klucz podstawowy), który jest unikalną nazwą dla każdego rekordu bazy danych. Ponieważ nie ustaliłyśmy czym jest klucz podstawowy w naszym modelu `Post`, Django stworzyło taki klucz dla nas (standardowo jest to liczba, która rośnie o jeden przy każdym kolejnym rekordzie, np. 1, 2, 3) i dodało go jako pole pod nazwą `pk` do każdego naszego posta. Możemy dostać się do klucza podstawowego przez wpisanie `post.pk`, tak samo jak otrzymuje dostęp do innych pól (`title`, `author`, itd.) w naszym obiekcie `Post`!

Teraz, gdy wejdziemy na adres http://127.0.0.1:8000/ ujrzymy błąd (co było do przewidzenia, bo nie mamy jeszcze ustawionego adresu URL ani widoku *view* dla `post_detail`). Będzie to wyglądać tak:

![NoReverseMatch error](images/no_reverse_match2.png)

## Utwórzmy URL dla poszczególnego wpisu

Dodajmy adres URL w pliku `urls.py` dla naszego *widoku (ang.view)* `post_detail`!

Chcemy, aby nasz wpis i wszystkie informacje o nim, były widoczne pod tym adresem **URL**: http://127.0.0.1:8000/post/1/

W pliku `blog/urls.py` stwórzmy adres URL wskazujący na *widok* o nazwie `post_detail`, który wyświetli nam cały wpis. Dodaj wiersz `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` w pliku `blog/urls.py`. Jego zawartość powinna wyglądać tak:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

Ta część `^post/(?P<pk>\d+)/$` wygląda strasznie, ale bez obaw – wyjaśnimy ją dla Ciebie:

- zaczyna się od `^` jeszcze raz - "początek".
- `post/` po prostu oznacza, że po rozpoczęciu, adres URL powinien zawierać słowo **post** i **/**. Jak na razie dobrze idzie.
- `(?P<pk>\d+)` - ta część jest trudniejsza. Oznacza ona, że Django pobierze wszystko, co umieścisz w tym miejscu i przekaże to do widoku w zmiennej o nazwie `pk`. (Zauważ, że odpowiada to nazwie jaką nadaliśmy zmiennej zawierającej klucz podstawowy powyżej w `blog/templates/blog/post_list.html`!) `\d` informuje nas, że klucz ten może zawierać tylko cyfry, nie litery (czyli wszystko pomiędzy 0 a 9). `+` oznacza, że to musi być jedna lub więcej cyfr. Czyli coś takiego: `http://127.0.0.1:8000/post//` nie jest poprawne, ale już `http://127.0.0.1:8000/post/1234567890/` jest jak najbardziej w porządku!
- `/` – potrzebujemy ponownie **/**.
- `$` – "koniec"!

To oznacza, że gdy wpiszesz w przeglądarce adres `http://127.0.0.1:8000/post/5/`, Django zrozumie, że potrzebujesz *widoku* zwanego `post_detail` i przekaże informację, że `pk` jest równe `5` temu *widokowi*.

OK, dodałyśmy nowy wzorzec URL do `blog/urls.py`! Odświeżmy stronę: http://127.0.0.1:8000/ Boom! Serwer znów przestał działać. Spójrz w konsolę - jak oczekiwałyśmy, zdarzył się tam kolejny błąd!

![AttributeError](images/attribute_error2.png)

Pamiętasz, jaki jest następny krok? Oczywiście: dodanie widoku!

## Dodajmy widok dla poszczególnego wpisu

Tym razem nasz *widok* otrzymuje dodatkowy parametr `pk`. Nasz *widok* musi go "złapać", zgadza się? A więc zdefiniujmy funkcję tak: `def post_detail(request, pk):`. Zwróć uwagę, że musimy użyć dokładnie tej samej nazwy jak ta, której użyłyśmy w urls (`pk`). Pominięcie tej zmiennej jest niepoprawne i spowoduje błąd!

Teraz chcemy wyświetlić jeden i tylko jeden wpis na blogu. Aby to zrobić, możemy użyć querysetów w następujący sposób:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ale ten kod ma problem. Jeśli nie istnieje żaden wpis (`Post`) z podanym `kluczem podstawowym` (`pk`), to otrzymamy przepaskudny błąd!

![DoesNotExist error](images/does_not_exist2.png)

Tak nie może być! Ale oczywiście Django ma dla nas coś, co rozwiąże ten problem za nas: `get_object_or_404`. W sytuacji, gdy nie istnieje żaden wpis (`Post`) z przekazaną wartością `pk`, wyświetli znacznie przyjemniejszą stronę zwaną `Page Not Found 404` albo stroną błędu 404 - informującą, że dana strona nie została znaleziona.

![Page not found](images/404_2.png)

Dobra wiadomość - możesz stworzyć własną stronę błędu 404 (`Page not found`) i upiększyć ją tak, jak tylko Ci się podoba. Ale teraz nie jest to super ważne, więc na razie pominiemy ten temat.

OK, czas dodać nasz *widok* do naszego pliku `views.py`!

W `blog/urls.py` stworzyłyśmy regułę URL, którą nazwałyśmy `post_detail` i która odnosi się do widoku `views.post_detail`. Oznacza to że Django będzie oczekiwało funkcji widoku o nazwie `post_detail` w pliku `blog/views.py`.

Powinnyśmy otworzyć `blog/views.py` i dodać poniższy kod nidaleko innych linii z `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

Oraz na końcu tego pliku dodać nasz *widok*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Tak, to czas na odświeżenie strony: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

Działa! Ale co się stanie, gdy klikniesz na link w tytule wpisu?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

O nie! Kolejny błąd! Ale wiemy już, jak sobie z nim poradzić, prawda? Musimy dodać szablon!

## Stwórzmy szablon dla poszczególnego wpisu

Stwórzmy plik w `blog/templates/blog` o nazwie `post_detail.html`.

Będzie to wyglądać tak:

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

Po raz kolejny rozszerzamy `base.html`. W bloku `content` chcemy wyświetlić datę opublikowania wpisu (o ile istnieje), tytuł oraz treść. Ale powinnyśmy omówić kilka ważnych rzeczy, prawda?

{% raw %}`{% if ... %} ... {% endif %}` jest tagiem szablonu, którego możemy użyć, gdy chcemy coś sprawdzić. (Pamiętasz `if ... else ..` z rozdziału **Wprowadzenie do Pythona**?) W tym wypadku chcemy sprawdzić czy `published_date` posta nie jest pusta.{% endraw %}

OK, możemy teraz odświeżyć naszą stronę i sprawdzić, czy `TemplateDoesNotExist` już zniknął.

![Post detail page](images/post_detail2.png)

Hura! Działa!

# Czas na wdrożenie!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Aktualizacja plików statycznych na serwerze

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)