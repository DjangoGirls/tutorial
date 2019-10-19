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

W takim razie jak będzie wyglądał model naszego postu na blogu? Chcemy zbudować blog, zgadza się?

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
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

Po stworzeniu aplikacji, musimy dać znać Django, że powinien jej używać. Robimy to w pliku `mysite/settings.py` - otwórz go w swoim edytorze kodu. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. Czyli efekt końcowy powinien wyglądać tak:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### Tworzymy model wpisu na blogu

W pliku `blog/models.py` definiujemy wszystkie obiekty zwane `Models` - jest to miejsce, w którym będziemy definiować nasz wpis na blogu.

Otwórz plik `blog/models.py` w swoim edytorze kodu, usuń z niego całą zawartość i wpisz taki kod:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
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

Wygląda przerażająco, prawda? Ale nie martw się - będziemy tłumaczyć, co te linijki znaczą!

Wszystkie wiersze zaczynające się od `from` lub `import` są wierszami dodającymi jakieś elementy z innych plików. Czyli zamiast kopiowania i wklejania tych samych treści w każdym pliku, możemy po prostu zawrzeć ich fragmenty za pomocą `from... import ...`.

`class Post(models.Model):` - ta linijka definiuje nasz model (jest on obiektem, czyli `object`).

- `class` to specjalne słowo kluczowe, które sygnalizuje, że tworzymy obiekt.
- `Post` to nazwa naszego modelu. Możemy nadać mu inną nazwę (bez polskich liter, znaków specjalnych i spacji). Zawsze zaczynaj nazwę modelu wielką literą.
- `models.Model` oznacza, że nasz obiekt Post jest modelem Django. W ten sposób Django wie, że powinien go przechowywać w bazie danych.

Teraz dodamy właściwości, o których wspomniałyśmy już wcześniej: `title` (tytuł), `text` (treść wpisu), `created_date` (data utworzenia), `published_date` (data publikacji) oraz `author` (autor). Do tego celu potrzebujemy określić typ każdego pola (Czy to jest tekst? Liczba? Data? Odwołanie do innego obiektu, np. użytkownika?)

- `models.CharField` - tak definiujemy tekst z ograniczoną liczbą znaków.
- `models.TextField` - a to nadaje się do dłuższych tekstów bez ograniczeń w ilości znaków. Dla treści wpisu będzie idealne, prawda?
- `models.DateTimeField` - to jest data i godzina.
- `models.ForeignKey` - to jest odnośnik do innego modelu.

Nie będziemy tutaj wyjaśniać drobiazgowo każdego elementu kodu, gdyż zajęłoby to zbyt dużo czasu. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

A co to takiego `def publish(self):`? To jest dokładnie metoda publikująca wpis (`publish`), o której wspominaliśmy wcześniej. Wyraz `def` oznacza, że mamy do czynienia z funkcją/metodą, a `publish` to nazwa metody. Możesz zmienić nazwę metody, jeśli chcesz. Zasadą jest, że używamy małych liter oraz znaków podkreślenia zamiast spacji. Na przykład metodę, która oblicza średnią cenę, można nazwać `calculate_average_price`.

Bardzo często metody coś zwracają (ang. `return`). Przykład tego znajdziesz w metodzie `__str__`. W tym przypadku wywołując metodę `__str__()` otrzymamy tekst (**string**) zawierający tytuł wpisu.

Również należy zauważyć, że zarówno `def publish(self):` i `def __str__(self):` są wcięte wewnątrz naszej klasy. Ponieważ Python jest wrażliwy na odstępy, musimy wciąć nasze metody wewnątrz klasy. W przeciwnym razie metody nie będą należeć do klasy i można uzyskać nieoczekiwane zachowanie.

Jeśli coś nie jest jeszcze jasne w modelach, nie wahaj się zapytać swojego mentora! Zdajemy sobie sprawę, że jest to dość skomplikowane, zwłaszcza gdy poznajesz obiekty i funkcje w tym samym czasie. Mimo wszystko mamy nadzieję, że teraz wygląda nieco mniej magicznie!

### Tworzymy tabele dla modeli w bazie danych

Został nam ostatni krok, a mianowicie dodanie naszego nowego modelu do bazy danych. Najpierw musimy poinformować Django, że mamy pewne zmiany w naszym modelu. (Właśnie go utworzyłyśmy!) Przejdź do okna konsoli i wpisz `python manage.py makemigrations blog`. Będzie to wyglądać tak:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Uwaga:** Pamiętaj, aby zapisać pliki, które edytujesz. W przeciwnym razie Twój komputer wykona poprzednią wersję, która może dać Tobie nieoczekiwane komunikaty o błędach.

Django przygotował dla nas plik z migracjami, które musimy zastosować teraz do naszej bazy danych. Wpisz `python manage.py migrate blog`, a wynik powinien wyglądać następująco:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurra! Nasz model wpisu znajduje się teraz w naszej bazie danych! Byłoby miło to zobaczyć, prawda? Przejdź do następnego rozdziału, aby zobaczyć, jak wygląda nasz wpis!