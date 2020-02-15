{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Rozbudowa aplikacji

We've already completed all the different steps necessary for the creation of our website: we know how to write a model, URL, view and template. We also know how to make our website pretty.

Czas na odrobinę praktyki!

Pierwszą rzeczą, której nasz blog potrzebuje, to strona wyświetlająca pojedynczy wpis, nieprawdaż?

Mamy już model `Post`, więc nie musimy już dodawać niczego do `models.py`.

## Tworzenie szablonu odnośnika do detali wpisu na blogu

Zaczniemy od dodania linku wewnątrz pliku `blog/templates/blog/post_list.html`. Otwórz go w edytorze kodu. Do tej pory plik powinien wyglądać tak: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Chcemy, aby tytuł wpisu był linkiem prowadzącym do strony ze szczegółami wpisu. Let's change `<h2><a href="">{{ post.title }}</a></h2>` so that it links to the post's detail page:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}Czas wyjaśnić, co oznacza tajemnicze `{% url 'post_detail' pk=post.pk %}`. Jak można podejrzewać, zapis `{% %}` oznacza, że używamy tagów szablonu Django. Tym razem używamy takiego, który generuje dla nas adres URL!{% endraw %}

Fragment `post_detail` oznacza, że Django będzie oczekiwał URL w `blog/urls.py` o nazwie name=post_detail

A co z `pk=post.pk`? `pk` is short for primary key, which is a unique identifier for each record in a database. Every Django model has a field which serves as its primary key, and whatever other name it has, it can also be referred to as "pk". Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Teraz, gdy wejdziemy na adres http://127.0.0.1:8000/, ujrzymy błąd (co było do przewidzenia, bo nie mamy jeszcze ustawionego adresu URL ani widoku *view* dla `post_detail`). Będzie to wyglądać tak:

![Błąd NoReverseMatch](images/no_reverse_match2.png)

## Utwórzmy URL dla poszczególnego wpisu

Dodajmy adres URL w pliku `urls.py` dla naszego *widoku (ang.view)* `post_detail`!

Chcemy, aby nasz wpis i wszystkie informacje o nim, były widoczne pod tym adresem **URL**: http://127.0.0.1:8000/post/1/

W pliku `blog/urls.py` stwórzmy adres URL wskazujący na *widok* o nazwie `post_detail`, który wyświetli nam cały wpis. Otwórz plik `blog/urls.py` w edytorze i dodaj wiersz: `path('post/<int:pk>/', views.post_detail, name='post_detail'),` tak, żeby otrzymać:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Część `post/<int:pk>/` określa wzorzec URL - wytłumaczymy Tobie, co to jest:

- `post/` oznacza, że adres URL powinien zaczynać się od słowa **post**, po którym nastąpi **/**. Jak na razie idzie dobrze.
- `<int:pk>` - ta część jest trudniejsza. Oznacza ona, że Django spodziewa się liczby całkowitej i przekaże jej wartość do widoku jako zmienną `pk`.
- `/` - i znów potrzebujemy **/**, zanim zakończymy wzorzec URL.

To oznacza, że gdy wpiszesz w przeglądarce adres `http://127.0.0.1:8000/post/5/`, Django zrozumie, że potrzebujesz *widoku* zwanego `post_detail` i przekaże informację, że `pk` jest równe `5` temu *widokowi*.

OK, dodałyśmy nowy wzorzec URL do `blog/urls.py`! Odświeżmy stronę: http://127.0.0.1:8000/ Boom! Serwer znów przestał działać. Spójrz w konsolę - jak oczekiwałyśmy, zdarzył się tam kolejny błąd!

![AttributeError](images/attribute_error2.png)

Pamiętasz, jaki jest następny krok? Dodanie widoku!

## Dodajmy widok dla poszczególnego wpisu

Tym razem nasz *widok* otrzymuje dodatkowy parametr `pk`. Nasz *widok* musi go "złapać", zgadza się? A więc zdefiniujmy funkcję tak: `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in `urls` (`pk`). Pominięcie tej zmiennej jest niepoprawne i spowoduje błąd!

Teraz chcemy wyświetlić jeden i tylko jeden wpis na blogu. Aby to zrobić, możemy użyć querysetów w następujący sposób:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ale ten kod ma problem. Jeśli nie istnieje żaden wpis (`Post`) z podanym `kluczem podstawowym` (`pk`), to otrzymamy przepaskudny błąd!

![Błąd DoesNotExist](images/does_not_exist2.png)

Tak nie może być! Ale Django ma dla nas coś, co rozwiąże ten problem za nas: `get_object_or_404`. W sytuacji, gdy nie istnieje żaden wpis (`Post`) z przekazaną wartością `pk`, wyświetli znacznie przyjemniejszą stronę zwaną `Page Not Found 404` albo stroną błędu 404 - informującą, że dana strona nie została znaleziona.

![Nie znaleziono strony](images/404_2.png)

Dobra wiadomość - możesz stworzyć własną stronę błędu 404 (`Page not found`) i upiększyć ją tak, jak tylko Ci się podoba. Ale teraz nie jest to super ważne, więc na razie pominiemy ten temat.

OK, czas dodać nasz *widok* do naszego pliku `views.py`!

W `blog/urls.py` stworzyłyśmy regułę URL, którą nazwałyśmy `post_detail` i która odnosi się do widoku `views.post_detail`. Oznacza to że Django będzie oczekiwało funkcji widoku o nazwie `post_detail` w pliku `blog/views.py`.

Otwórzmy `blog/views.py` w edytorze kodu i dodajmy poniższy kod zaraz obok pozostałych wierszy `from`:

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

![Widok listy wpisów](images/post_list2.png)

Działa! Ale co się stanie, gdy klikniesz na link w tytule wpisu?

![Błąd TemplateDoesNotExist](images/template_does_not_exist2.png)

O nie! Kolejny błąd! Ale wiemy już, jak sobie z nim poradzić, prawda? Musimy dodać szablon!

## Stwórzmy szablon dla poszczególnego wpisu

Stwórzmy teraz plik o nazwie `post_detail.html` w folderze `blog/templates/blog` i otwórzmy go w edytorze.

Wprowadź następujący kod:

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
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Po raz kolejny rozszerzamy `base.html`. W bloku `content` chcemy wyświetlić datę opublikowania wpisu (o ile istnieje), tytuł oraz treść. Ale powinnyśmy omówić kilka ważnych rzeczy, prawda?

{% raw %}`{% if ... %} ... {% endif %}` jest tagiem szablonu, którego możemy użyć, gdy chcemy coś sprawdzić. (Pamiętasz `if ... else ..` z rozdziału **Wprowadzenie do Pythona**?) W tym wypadku chcemy sprawdzić czy `published_date` posta nie jest pusta.{% endraw %}

OK, możemy teraz odświeżyć naszą stronę i sprawdzić, czy `TemplateDoesNotExist` już zniknął.

![Strona ze szczegółami wpisu](images/post_detail2.png)

Hura! Działa!

# Czas na wdrożenie!

Dobrze byłoby sprawdzić, czy Twoja strona dalej będzie dobrze działać na PythonAnywhere, prawda? Spróbuj ją ponownie wdrożyć.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Następnie w konsoli [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Pamiętaj, by podmienić `<your-pythonanywhere-domain>` na Twoją właściwą nazwę użytkownika PythonAnywhere, bez ostrych nawiasów).

## Aktualizacja plików statycznych na serwerze

Serwery takie jak PythonAnywhere lubią traktować "pliki statyczne" (takie jak pliki CSS) inaczej niż pliki Pythona, ponieważ dzięki temu mogą one je optymalizować, dzięki czemu strona ładuje się szybciej. W wyniku tego, ilekroć wprowadzamy zmiany do naszych plików CSS, musimy uruchomić dodatkowe polecenie na serwerze, by wiedział o konieczności ich aktualizacji. Komenda nazywa się `collectstatic`.

Zacznij od aktywacji swojego virtualenva, jeżeli nie jest on jeszcze aktywny (PythonAnywhere używa polecenia `workon` w celu aktywacji, dokładnie tak jak komenda `source myenv/bin/activate`, której używasz na swoim komputerze):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Komenda `manage.py collectstatic` jest trochę podobna do `manage.py migrate`. Wcześniej dokonałyśmy jakichś zmian w naszym kodzie, a teraz informujemy Django, by *zastosował* te zmiany, albo w kolekcji plików statycznych na serwerze albo w bazie danych.

W każdym razie, jesteśmy już gotowe do przejścia na stronę ["Web"](https://www.pythonanywhere.com/web_app_setup/) (klikając w menu umieszczonym w prawym górnym rogu). Następnie kliknij **Reload** i spójrz na stronę https://subdomain.pythonanywhere.com, aby zobaczyć rezultat.

I to już wszystko! Gratulacje :)