# Twój pierwszy projekt w Django!

> Fragment tego rozdziału jest oparty o tutoriale Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
>
> Fragmenty tego rozdziału są oparte o [tutorial django-marcador][1] na licencji Creative Commons Attribution-ShareAlike International 4.0. Tutorial django-marcador jest chroniony prawami autorskimi przez Markusa Zapke-Gründemanna i in.

 [1]: http://django-marcador.keimlink.de/

Mamy zamiar stworzyć prostego bloga!

Pierwszy krok, który trzeba wykonać, to utworzenie nowego projektu Django. To oznacza, że skorzystamy z dostarczonych przez Django skryptów, które utworzą za nas szkielet projektu Django. Ten szkielet to zbiór katalogów i plików, których będziemy używać później.

Nazwy niektórych plików i katalogów są bardzo ważne dla Django. Nie powinnaś zmieniać nazw plików, które zostaną utworzone. Przenoszenie ich w inne miejsce też nie jest dobrym pomysłem. Django wymaga zachowania pewnej struktury, by móc szybko znaleźć potrzebne rzeczy.

> Pamiętaj, aby uruchamiać wszystko w virtualenv. Jeśli nie widzisz prefiksu `(myvenv)` w konsoli, to znaczy że musisz uruchomić swój virtualenv. Wyjaśniłyśmy, jak to zrobić w rozdziale **Instalacja Django** w części **Praca z virtualenv**. Wystarczy wpisać `myvenv\Scripts\activate` w systemie Windows lub `source myvenv/bin/activate`, jeśli używasz Mac OS / Linux.

Dla systemów MacOS lub Linux; wpisz teraz do swojej konsoli następującą komendę; ** nie zapomnij dodać kropki `.` na końcu**:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .


Dla Windows; **nie zapomnij dodać kropki `.` na końcu**:

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .


> Kropka `.` ma kluczowe znaczenie, ponieważ dzięki niej skrypt wie, że ma zainstalować Django w bieżącym katalogu (kropka `.` to taka skrócona nazwa bieżącego katalogu)
>
> **Uwaga** Kiedy będziesz przepisywać komedy, które zamieściliśmy wyżej, pamiętaj, że przepisujesz tylko tę część, która zaczyna się od `django-admin` lub `django-admin.py`. Te `(myvenv) ~/djangogirls$` i `(myvenv) C:\Users\Name\djangogirls>` (zwane z ang. promptem) są tutaj tylko po to, by pokazać Ci przykład linii poleceń i tego jak ona będzie wyglądała, gdy będziesz do niej wpisywać polecenia.

`django-admin.py` jest skryptem, który utworzy katalogi i pliki za Ciebie. Powinnaś mieć teraz strukturę katalogów podobną do tej:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py


`manage.py` jest skryptem ułatwiającym zarządzanie aplikacją. Za jego pomocą, oprócz wielu innych rzeczy, możemy uruchomić serwer na naszym komputerze bez potrzeby instalowania czegokolwiek.

Plik `settings.py` zawiera konfigurację naszej strony.

Pamiętasz, jak rozmawiałyśmy o listonoszu sprawdzającym gdzie dostarczyć list? Plik `urls.py` zawiera wzorce używane przez `urlresolver'a`.

Na razie zapomnijmy o innych plikach - nie będziemy ich modyfikować. Jedyne, o czym musisz pamiętać, to żeby ich niechcący nie skasować!

## Modyfikowanie ustawień

Wprowadźmy parę zmian w pliku `mysite/settings.py`. Otwórz go za pomocą edytora kodu, który zainstalowałaś wcześniej.

Fajnie byłoby posługiwać się na naszej stronie właściwą strefą czasową. Przejdź do [listy stref czasowych w wikipedii][2] i skopiuj właściwą strefę czasową (TZ). (np. `Europe/Berlin` )

 [2]: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

W pliku settings.py znajdź linijkę, w której jest napisane `TIME_ZONE` i zmień ją według swoich potrzeb:

```python
TIME_ZONE = 'Europe/Berlin'
```

Gdzie odpowiednio zmienisz "Europe/Berlin"

Musimy także dodać ścieżkę do plików statycznych (dowiesz się więcej o plikach statycznych i CSS w dalszej części kursu). Przejdź do samego końca pliku i pod linijką zawierającą `STATIC_URL` dodaj nową zmienną `STATIC_ROOT`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'public', 'static')
```

## Ustawienie bazy danych

Istnieje duży wybór baz danych, w których możemy trzymać dane naszej strony. My użyjemy bazy domyślnej, czyli `sqlite3`.

Została ona już ustawiona w tej części pliku `mysite/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```  

Aby utworzyć bazę danych dla naszego bloga, wykonajmy następujące polecenie w konsoli: `python manage.py migrate` (musimy być w katalogu `djangogirls`, tam gdzie znajduje się plik `manage.py`). Gdy to się uda, powinnaś zobaczyć coś takiego jak poniżej:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK


I to wszystko! Czas uruchomić serwer i zobaczyć, czy nasza strona działa!

Musisz znajdować się w katalogu zawierającym plik `manage.py` (katalog `djangogirls`). W konsoli możemy uruchomić serwer za pomocą polecenia `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver


Jeśli pracujesz na Windowsie i zobaczysz w tym momencie `UnicodeDecodeError`, użyj następującej komendy:

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000


Teraz pozostaje Ci jedynie przekonać się, czy Twoja strona działa. Otwórz przeglądarkę (Firefox, Chrome, Safari, Internet Explorer czy inną, której używasz) i wpisz adres:

    http://127.0.0.1:8000/


Serwer przejmie Twój wiersz poleceń i będzie go używał cały czas dopóki go nie wyłączysz. By móc wykonywać inne polecenia, otwórz nowe okienko terminala i uruchom w nim środowisko virtualenv. Aby zatrzymać serwer, wróć do okienka, w którym został on uruchomiony i wciśnij CTRL+C - klawisze Control i C jednocześnie (jeśli używasz systemu Windows to możesz też spróbować skrótu Ctrl+Break).

Gratulacje! Właśnie stworzyłaś swoją pierwszą stronę i uruchomiłaś ją za pomocą serwera! Prawda, że wspaniale?

![Działa!][3]

 [3]: images/it_worked2.png

Gotowa na następny krok? Czas stworzyć treść!
