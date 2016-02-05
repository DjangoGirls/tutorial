# Modele w Django

Teraz zajmiemy się tworzeniem czegoś, co będzie przechowywało wszystkie wpisy na naszym blogu. Ale zanim przystąpimy do tego, musimy poświęcić chwilę na przyjrzenie się tworom zwanym `obiektami`.

## Obiekty

W programowaniu istnieje pojęcie `programowania zorientowanego obiektowo`. Chodzi o to, że zamiast wypisywania nudnych sekwencji poleceń, możemy tworzyć modele różnych rzeczy i definiować ich zachowania względem siebie.

Zatem czym są obiekty? To po prostu zbiór pewnych właściwości i czynności. Owszem, brzmi dziwnie, ale przyjrzyjmy się temu na przykładzie.

Jeśli chcemy stworzyć model kota, stworzymy obiekt o nazwie `Kot` posiadający jakieś właściwości, np. `kolor`, `wiek`, `nastrój` (np. dobry, zły, senny ;)), `właściciel` (czyli obiekt typu `Osoba` lub pozostawimy tę właściwość pustą, wtedy mamy bezpańskiego kota).

Nasz `Kot` ma określone czynności: `mrucz`, `podrap`, `jedz` (i tu przekażemy kotu oddzielny obiekt o nazwie `KociPrzysmak` ze swoimi własnymi właściwościami, np. `smak`).

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

Model Django stanowi specjalny rodzaj obiektu - jest zapisywany w `bazie danych`. Baza danych jest zbiorem informacji. Miejscem, w którym przechowujemy informacje o użytkownikach, Twoje wpisy na blogu, itd. Do zapisania naszych danych użyjemy bazy SQLite. Jest to domyślny moduł bazy danych w Django - na nasze potrzeby w zupełności wystarczy.

Możesz sobie wyobrazić model w bazie danych jako arkusz kalkulacyjny z kolumnami (polami) oraz wierszami (danymi).

### Tworzenie aplikacji

Aby utrzymać wszystko w ładzie, stworzymy osobną aplikację wewnątrz naszego projektu. Przyjemnie jest mieć wszystko uporządkowane od samego początku. Aby stworzyć aplikację, musimy wykonać następujące polecenie w konsoli (z poziomu katalogu `djangogirls`, tam gdzie znajduje się plik `manage.py`):

    (myvenv) ~/djangogirls$ python manage.py startapp blog


Z pewnością zauważysz, że pojawił się nowy folder `blog` zawierający kilka plików. Czyli foldery i pliki w naszym projekcie powinny wyglądać tak:

    djangogirls
    ├── mysite
    |       __init__.py
    |       settings.py
    |       urls.py
    |       wsgi.py
    ├── manage.py
    └── blog
        ├── migrations
        |       __init__.py
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py


Po stworzeniu aplikacji musimy dać znać Django, że powinien jej używać. Posługujemy się w tym celu plikiem `mysite/settings.py`. Musimy odnaleźć nagłówek `INSTALLED_APPS` i dodać wiersz o treści `'blog',` tuż przed nawiasem zamykającym `)`. Czyli efekt końcowy powinien wyglądać tak:

```python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
)
```

### Tworzymy model wpisu na blogu

W pliku `blog/models.py` definiujemy wszystkie obiekty zwane `modelami` - to jest miejsce, w którym zbudujemy model naszego wpisu na blogu.

Otwórz plik `blog/models.py`, usuń z niego całą zawartość i napisz taki kod:

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
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

> Upewnij się, czy na początku i końcu `str` używasz dokładnie dwóch znaków podkreślenia (`_`). W Pythonie używa się ich bardzo często i czasem nazywa się je "dunder" (skrót od angielskiej nazwy: "double-underscore").

Wygląda przerażająco, co? Ale nie martw się, wyjaśnimy o co chodzi linijka po linijce!

Wszystkie wiersze zaczynające się od `from` lub `import` są wierszami dodającymi jakieś elementy z innych plików. Czyli zamiast kopiowania i wklejania tych samych treści w każdym pliku, możemy po prostu zawrzeć ich fragmenty za pomocą `from ... import ...`.

`class Post(models.Model):` - ta linijka definiuje nasz model (jest on obiektem, czyli `object`).

*   `class` to specjalne słowo kluczowe, które sygnalizuje, że tworzymy obiekt.
*   `Post` to nazwa naszego modelu. Możemy nadać mu inną nazwę (bez polskich liter, znaków specjalnych i spacji). Zawsze zaczynaj nazwę modelu wielką literą.
*   `models.Model` oznacza, że nasz obiekt Post jest modelem Django. W ten sposób Django wie, że powinien go przechowywać w bazie danych.

Teraz dodamy właściwości, o których wspomniałyśmy już wcześniej: `title` (tytuł), `text` (treść wpisu), `created_date` (data utworzenia), `published_date` (data publikacji) oraz `author` (autor). Do tego celu potrzebujemy określić typ pola (Czy jest to tekst? Liczba? Data? Odwołanie do innego obiektu, np. użytkownika?).

*   `models.CharField` - tak definiujemy tekst z ograniczoną liczbą znaków.
*   `models.TextField` - a to nadaje się do dłuższych tekstów bez ograniczeń w ilości znaków. Dla treści wpisu będzie idealne, prawda?
*   `models.DateTimeField` - to jest data i godzina.
*   `models.ForeignKey` - to jest odnośnik do innego modelu.

Nie będziemy tutaj wyjaśniać drobiazgowo każdego elementu kodu, gdyż zajęłoby to zbyt dużo czasu. Zajrzyj do dokumentacji Django, jeżeli chcesz dowiedzieć się więcej o polach modelu oraz jak definiować typy inne niż opisywane powyżej (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

A co to takiego `def publish(self):`? To nic innego, jak nasza metoda publikująca wpis, o której wspominałyśmy wcześniej. Wyraz `def` oznacza, że mamy do czynienia z funkcją/metodą, a `publish` to nazwa metody. Możesz zmienić nazwę, jeśli chcesz. Zasadą jest, że używamy małych liter oraz znaków podkreślenia zamiast spacji. Na przykład, gdybyś chciała dodać metodę, która oblicza średnią cenę, mogłabyś ją nazwać `calculate_average_price` lub oblicz_srednia_cene.

Bardzo często metody coś zwracają (ang. `return`). Przykład tego znajdziesz w metodzie `__str__`. W tym przypadku wywołując metodę `__str__()` otrzymamy tekst (**string**) zawierający tytuł wpisu.

Jeżeli coś nadal nie jest jasne odnośnie modeli, nie bój się zapytać osoby prowadzącej kurs! Zdajemy sobie sprawę, że jest to dość skomplikowane, zwłaszcza gdy poznajesz funkcje i obiekty w tym samym czasie. Mimo wszystko mamy nadzieję, że udało nam się chociaż odrobinę rozjaśnić temat!

### Tworzymy tabele dla modeli w bazie danych

Został nam ostatni krok, a mianowicie dodanie naszego nowego modelu do bazy danych. Najpierw musimy poinformować Django, że coś w naszym modelu zostało zmienione (właśnie go utworzyłyśmy!). Wpisz `python manage.py makemigrations blog`. Efekt będzie wyglądał tak:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post


Django przygotował za nas plik z migracjami, które musimy teraz wykonać na naszej bazie danych. Wpisz `python manage.py migrate blog`. Powinnaś zobaczyć coś takiego:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK


Hurra! Nasz model wpisu na blogu znalazł się w bazie danych! Fajnie byłoby go zobaczyć, co? Aby sprawdzić jak wygląda nasz wpis, przejdź do następnego rozdziału!
