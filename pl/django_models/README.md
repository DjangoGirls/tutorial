# Modele w Django

Teraz zajmiemy się tworzeniem czegoś, co będzie przechowywało wszystkie wpisy na naszym blogu. Ale zanim przystąpimy do tego, musimy poświęcić chwilę na przyjrzenie się tworom zwanym `obiektami`.

## Obiekty

W programowaniu istnieje pojęcie `programowania zorientowanego obiektowego`. Chodzi o to, że zamiast wpisywania nudnych sekwencji poleceń, możemy tworzyć modele różnych rzeczy i definiować w jaki sposób wchodzą ze sobą w interakcję.

Zatem czym są obiekty? To po prostu zbiór pewnych właściwości i czynności. Owszem, brzmi dziwnie, ale przyjrzyjmy się temu na przykładzie.

Jeśli chcemy stworzyć model kota, stworzymy obiekt o nazwie `Kot` posiadający jakieś właściwości, np. `kolor`, `wiek`, `nastrój` (np. dobry, zły, senny ;)), i `właściciel` (czyli obiekt typu `Osoba` lub pozostawimy tę właściwość pustą, wtedy mamy bezpańskiego kota).

Nasz `Kot` ma określone czynności: `mrucz`, `podrap`, `jedz` (i w tym przypadku przekażemy kotu oddzielny obiekt o nazwie `KociPrzysmak` ze swoimi własnymi właściwościami, np. `smak`).

    Kot
    --------
    kolor
    wiek
    nastroj
    wlasciciel
    mrucz()
    podrap()
    jedz(koci_przysmak)
    

    KociPrzysmak
    --------
    smak
    

Czyli w zasadzie chodzi o to, że opisujemy prawdziwe rzeczy w kodzie za pomocą właściwości (zwanych `właściwościami obiektu`) oraz czynności (zwanych `metodami`).

W takim razie jak będzie wyglądał model naszego postu na blogu? Chcemy zbudować bloga, zgadza się?

Musimy sobie odpowiedzieć na pytanie: Czym jest post na blogu? Jakie powinien mieć właściwości?

Na pewno musi zawierać zawartość tekstową oraz tytuł, prawda? Fajnie byłoby też wiedzieć, kto go napisał - czyli potrzebujemy autora. No i chcemy także znać daty, kiedy wpis został utworzony i opublikowany.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Co możemy zrobić z wpisem na blogu? Przydałaby nam się jakaś `metoda`, która opublikuje nasz wpis, zgadza się?

Tak więc będziemy potrzebować metody `publish`.

Skoro już wiemy, co chcemy osiągnąć, pora zacząć tworzyć model w Django!

## Model w Django

Wiedząc, czym jest obiekt, możemy stworzyć model Django odpowiadający naszemu wpisowi na blogu.

Model w Django jest specjalnym rodzajem obiektu - jest zapisywany w `bazie danych`. Baza danych jest zbiorem informacji. Miejscem, w którym przechowujemy informacje o użytkownikach, Twoje wpisy na blogu, itd. Do zapisania naszych danych użyjemy bazy SQLite. Jest to domyślny moduł bazy danych w Django - na nasze potrzeby w zupełności wystarczy.

Możesz sobie wyobrazić model w bazie danych jako arkusz kalkulacyjny z kolumnami (polami) oraz wierszami (danymi).

### Tworzenie aplikacji

Aby utrzymać wszystko w ładzie, stworzymy osobną aplikację wewnątrz naszego projektu. Przyjemnie jest mieć wszystko uporządkowane od samego początku. Aby stworzyć aplikację, musimy wykonać następujące polecenie w konsoli (z poziomu katalogu `djangogirls`, tam gdzie znajduje się plik `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Zauważysz, że nowy katalog `blog` został utworzony i zawiera kilka plików. Katalogi i pliki w naszym projekcie powinny wyglądać tak:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

Po stworzeniu aplikacji, musimy dać znać Django, że powinien jej używać. Posługujemy się w tym celu plikiem `mysite/settings.py`. Musimy odnaleźć nagłówek `INSTALLED_APPS` i dodać wiersz o treści `'blog',` tuż przed nawiasem zamykającym `]`. Czyli efekt końcowy powinien wyglądać tak:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Tworzymy model wpisu na blogu

W pliku `blog/models.py` definiujemy wszystkie obiekty zwane `Models` - jest to miejsce, w którym będziemy definiować nasz wpis na blogu.

Otwórz plik `blog/models.py`, usuń z niego całą zawartość i napisz taki kod:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User',on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Upewnij się, że używasz dwóch znaków podkreślenia (`_`) po obu stronach `str`. W Pythonie używa się ich bardzo często i czasem nazywa się je "dunder" (skrót od angielskiej nazwy: "double-underscore").

Wygląda przerażająco, prawda? Ale nie martw się - będziemy tłumaczyć co te linijki znaczą!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` to specjalne słowo kluczowe, które sygnalizuje, że tworzymy obiekt.
- `Post` to nazwa naszego modelu. Możemy nadać mu inną nazwę (bez polskich liter, znaków specjalnych i spacji). Zawsze zaczynaj nazwę modelu wielką literą.
- `models.Model` oznacza, że nasz obiekt Post jest modelem Django. W ten sposób Django wie, że powinien go przechowywać w bazie danych.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` - tak definiujemy tekst z ograniczoną liczbą znaków.
- `models.TextField` - a to nadaje się do dłuższych tekstów bez ograniczeń w ilości znaków. Dla treści wpisu będzie idealne, prawda?
- `models.DateTimeField` - to jest data i godzina.
- `models.ForeignKey` - to jest odnośnik do innego modelu.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Tworzymy tabele dla modeli w bazie danych

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!