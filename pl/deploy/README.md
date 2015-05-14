# Wdrażanie!

> **Uwaga**: Niniejszy rozdział może być miejscami dość trudny. Bądź dzielna i przestudiuj go do końca; wdrażanie jest ważną częścią pracy nad stroną. Celowo umieściłyśmy go tutaj, aby osoba prowadząca kurs była w stanie pomóc Ci przejść przez skomplikowany proces opublikowania Twojej strony w sieci. Oznacza to, że możesz wciąż ukończyć tutorial samodzielnie, jeśli zabraknie Ci czasu.

Do tej pory Twoja strona była dostępna tylko na Twoim komputerze. Teraz nauczysz się, jak ją wdrożyć! Wdrożenie to inaczej opublikowanie Twojej aplikacji w internecie, dzięki czemu możesz w końcu pokazać ją innym ludziom :).

Jak już wiesz, strona internetowa musi znajdować się na jakimś serwerze. Istnieje wiele firm udostępniających miejsce na serwerach, jednak my użyjemy takiej, która zapewnia najprostszy proces wdrażania: [Heroku][1]. Heroku jest darmowe dla aplikacji z niewielką liczbą odwiedzających i na tym etapie w zupełności Ci wystarczy.

 [1]: http://heroku.com/

Postępujemy według tego kursu: https://devcenter.heroku.com/articles/getting-started-with-django, jednak dla Twojej wygody wklejamy go poniżej.

## Plik `requirements.txt`

Musimy utworzyć plik `requirements.txt` aby poinformować Heroku, jakie pakiety muszą zostać zainstalowane na naszym serwerze.

Jednak na początku to Heroku wymaga od nas zainstalowania kilku pakietów. Przejdź do konsoli z uruchomionym `virtualenv` i wpisz:

    (myvenv) $ pip install dj-database-url gunicorn whitenoise


Gdy instalacja się zakończy, przejdź do katalogu `djangogirls` i wykonaj polecenie:

    (myvenv) $ pip freeze > requirements.txt


W ten sposób zostanie utworzony plik `requirements.txt` zawierający listę zainstalowanych przez Ciebie pakietów (czyli bibliotek Pythona, których używasz, na przykład Django :)).

> **Note** Polecenie `pip freeze` wypisuje na ekranie listę wszystkich bibliotek Pythona zainstalowanych w Twoim środowisku virtualenv, zaś `>` pobiera treść wygenerowaną przez `pip freeze` i zapisuje ją w pliku. Spróbuj wykonać `pip freeze` bez `> requirements.txt` i sprawdź, co się stanie!

Otwórz ten plik i dodaj na samym końcu następującą linijkę:

    psycopg2==2.5.4


Jest ona niezbędna, aby Twoja aplikacja działa na Heroku.

## Procfile

Kolejną rzeczą, którą musimy stworzyć, jest Procfile. W ten sposób poinformujemy Heroku, jakie polecenia muszą zostać wykonane w celu uruchomienia naszej strony. Otwórz swój edytor, utwórz plik o nazwie `Procfile` w katalogu `djangogirls` i dodaj poniższy wiersz:

    web: gunicorn mysite.wsgi


Ta linijka oznacza, że zamierzamy wdrożyć aplikację internetową (`web`); do wykonania tej operacji służy polecenie `gunicorn mysite.wsgi` (`gunicorn` jest programem przypominającym bardziej rozbudowaną wersję polecenia `runserver` w Django).

Zapisz zmiany w pliku. Gotowe!

## Plik `runtime.txt`

Musimy poinformować Heroku, z której wersji Pythona chcemy korzystać. Odbywa się to poprzez utworzenie pliku `runtime.txt` w katalogu `djangogirls` (polecenie "Nowy plik" w Twoim edytorze kodu) i umieszczenie w nim następującej treści (tak, tylko tyle!):

    python-3.4.2


## mysite/local_settings.py

Ustawienia, których używamy lokalnie (na naszym komputerze) są inne niż te, których używany dla naszego serwera. Heroku używa własnej bazy danych, nie tej samej, którą wykorzystuje Twój komputer. Dlatego musimy stworzyć osobny plik z ustawieniami, który będzie dostępny tylko dla naszego środowiska lokalnego.

Zacznij od utworzenia pliku `mysite/local_settings.py`. Powinen on zawierać Twoją konfigurację `DATABASE` z pliku `mysite/settings.py`. Tak jak poniżej:

    import os
    BASE_DIR = os.path.dirname(os.path.dirname(__file__))

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }

    DEBUG = True


A potem po prostu go zapisz! :)

## mysite/settings.py

Kolejną rzeczą, którą musimy wykonać, to zmodyfikowanie pliku `settings.py` dla naszej strony. Otwórz plik `mysite/settings.py` w swoim edytorze i dodaj następujące wiersze na końcu tego pliku:

    import dj_database_url
    DATABASES['default'] =  dj_database_url.config()

    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

    ALLOWED_HOSTS = ['*']

    STATIC_ROOT = 'staticfiles'

    DEBUG = False

    try:
        from .local_settings import *
    except ImportError:
        pass


Dzięki temu Twoje lokalne ustawienia zostaną zaimportowane, jeżeli plik z nimi istnieje.

Następnie zapisz zmiany w pliku.

## mysite/wsgi.py

Otwórz plik `mysite/wsgi.py` i dodaj poniższy fragment na samym końcu:

    from whitenoise.django import DjangoWhiteNoise
    application = DjangoWhiteNoise(application)


Doskonale!

## Konto Heroku

Zainstaluj pakiet narzędziowy Heroku, który znajduje się tutaj (możesz pominąć ten krok, jeśli jeżeli zainstalowałaś go już wcześniej): https://toolbelt.heroku.com/

> Jeżeli używasz pakietu narzędziowego Heroku pod Windows, pamiętaj, aby w trakcie wyboru składników do instalacji wybrać opcję "Custom installation". Z listy, która się pojawi, zaznacz pole wyboru przy pozycji "Git and SSH".
>
> Dodatkowo, w systemie Windows dodaj Gita i SSH do zmiennej `PATH` swojej ścieżki poleceń następującą instrukcją: `setx PATH "%PATH%;C:\Program Files\Git\bin"` lub `setx PATH "%PATH%;C:\Program Files (x86)\Git\bin"` - możesz sprawdzić w którym z katalogów zainstalował się Git przed wprowadzeniem tej komendy. Mentor na pewno Ci z tym pomoże.

> Zamknij wiersz poleceń i uruchom go ponownie, aby zmiana odniosła efekt.

Utwórz proszę darmowe konto Heroku tutaj: https://id.heroku.com/signup/www-home-top

Następnie zaloguj się do konta Heroku na swoim komputerze za pomocą następującego polecenia:

    $ heroku login


Jeżeli nie masz jeszcze klucza SSH, zostanie on utworzony automatycznie. Klucze SSH są niezbędne do publikowania kodu na Heroku.

## Git

Git jest systemem kontroli wersji używanym przez wielu programistów. Program ten śledzi dokonywane zmiany w pliku lub zestawie plików na przestrzeni czasu, dzięki czemu możesz później przywracać wybrane wersje tych plików. Heroku wykorzystuje repozytorium Gita do zarządzania plikami Twojego projektu, więc my również musimy go używać.

Utwórz w katalogu `djangogirls` plik `.gitignore` i wstaw w nim następującą treść:

    myvenv
    __pycache__
    staticfiles
    local_settings.py
    db.sqlite3
    *.py[co]

a następnie zapisz go. Kropka na początku nazwy pliku jest ważna! Jak widzisz, nakazujemy Heroku ignorować plik `local_settings.py` i nie pobierać go, dzięki czemu pozostaje on dostępny tylko i wyłącznie na Twoim komputerze (lokalnie).

Następnie stwórzmy nowe repozytorium Gita i zapiszmy nasze zmiany. Przejdź do konsoli i uruchom poniższe polecenia:

> **Note** Zanim utworzysz repozytorium, za pomocą polecenia `pwd` (OSX/Linux) lub `cd` (Windows) sprawdź, w jakim folderze się znajdujesz. Powinnaś być w katalogu `djangogirls`.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git add .
    $ git commit -m "Moja aplikacja Django Girls"
    [master (root-commit) 2943412] Moja aplikacja Django Girls
     7 files changed, 230 insertions(+)
     create mode 100644 .gitignore
     create mode 100644 Procfile
     create mode 100644 mysite/__init__.py
     create mode 100644 mysite/settings.py
     create mode 100644 mysite/urls.py
     create mode 100644 mysite/wsgi.py
     create mode 100644 manage.py
     create mode 100644 requirements.txt
     create mode 100644 runtime.txt


## Wybierz nazwę aplikacji

Nasz blog będzie dostępny w internecie pod adresem `[nazwa Twojego bloga].herokuapp.com`, dlatego musimy wybrać taką nazwę, której ktoś już wcześniej nie zajął. Nazwa ta nie ma żadnego związku z naszą aplikacją `blog` w Django, `mysite` ani niczym innym, co utworzyłyśmy już wcześniej. Nazwa może wyglądać tak, jak Ci się podoba, ale Heroku posiada ścisłe reguły dotyczące zakresu dostępnych znaków: możesz używać wyłącznie małych liter alfabetu łacińskiego (bez wielkich liter i polskich znaków), cyfr oraz myślników (`-`).

Gdy już wymyślisz nazwę (może coś związanego z Twoim imieniem albo pseudonimem?), uruchom poniższe polecenie, zastępując `djangogirlsblog` nazwą Twojej aplikacji:

    $ heroku create djangogirlsblog


> **Uwaga**: Nie zapomnij zmienić `djangogirlsblog` na nazwę swojej aplikacji na Heroku.

Jeżeli masz problem z wymyśleniem nazwy, możesz po prostu wpisać

    $ heroku create


wówczas Heroku sam wybierze Ci wolną nazwę (pewnie coś w rodzaju `enigmatic-cove-2527`).

Jeżeli kiedykolwiek zapragniesz zmienić nazwę swojej aplikacji na Heroku, możesz to zrobić w dowolnym momencie za pomocą poniższego polecenia (zastąp `nowa-nazwa` tą nazwą, której chcesz używać od tej pory):

    $ heroku apps:rename nowa-nazwa


> **Uwaga**: Pamiętaj, że po zmianie nazwy aplikacji zmieni się również jej adres. Aby zobaczyć swoją stronę po zmianie nazwy, przejdź pod adres `[nowa nazwa].herokuapp.com` .

## Wdrażamy na Heroku!

Dużo zabawy z konfigurowaniem i instalowaniem, co? Na szczęście wystarczy zrobić to tylko raz! Teraz możesz rozpocząć wdrożenie!

Wykonanie polecenia `heroku create` sprawiło, że do naszego repozytorium zostało automatycznie dodane zdalne repozytorium Heroku. Teraz możemy posłużyć się prostym poleceniem git push, aby wdrożyć naszą aplikację:

    $ git push heroku master


> **Uwaga**: Za pierwszym razem zobaczysz zapewne *mnóstwo* treści, ponieważ Heroku musi skompilować i zainstalować psycopg. O tym, że proces został zakończony sukcesem, dowiesz się z komunikatu `https://twojanazwa.herokuapp.com/ deployed to Heroku` gdzieś na końcu treści wynikowej na ekranie.

## Odwiedź swoją aplikację

Opublikowałaś swój kod na Heroku oraz ustawiłaś typy procesów w pliku `Procfile` (wybrałyśmy wcześniej typ procesu `web`). Teraz możemy poinstruować Heroku, aby uruchomił ten `web process`.

Aby tego dokonać, wydaj następujące polecenie:

    $ heroku ps:scale web=1


Nakazuje ono Heroku uruchomienie tylko jednej instancji naszego procesu `web`. Nasz blog jest dość prosty, zatem nie potrzebujemy zbyt wiele mocy obliczeniowej i uruchomienie jednego procesu w zupełności wystarczy. Możemy poprosić Heroku o uruchomienie większej liczby procesów (nawiasem mówić, Heroku nazywa te procesy "Dynos", zatem nie bądź zdziwiona, gdy spotkasz się z tym terminem), ale to już nie jest darmowe.

Teraz możemy otworzyć naszą aplikację w przeglądarce za pomocą polecenia `heroku open`.

    $ heroku open


> **Uwaga**: Zobaczysz stronę z komunikatem o błędzie. Zajmiemy się tym za momencik!

W Twojej przeglądarce otworzy się strona pod adresem zbliżonym do [https://djangogirlsblog.herokuapp.com/](), no i w tym momencie prawdopodobnie pojawi się błąd. Jak dotąd stworzyłyśmy w naszej aplikacji jedynie widok admina, więc dodaj do adresu `admin/` (np. [https://djangogirlsblog.herokuapp.com/admin/]()), aby zobaczyć działającą stronę Twojej aplikacji.

Błąd, który widziałaś wcześniej, był spowodowany tym, że przy wdrażaniu strony na Heroku stworzyłyśmy nową bazę danych - i teraz jest ona pusta. Aby poprawnie przygotować naszą bazę danych do pracy, musimy wykonać polecenie `migrate` w taki sam sposób, jak wtedy, gdy zaczynałyśmy tworzyć nasz projekt:

    $ heroku run python manage.py migrate

    $ heroku run python manage.py createsuperuser


Teraz powinnaś być w stanie zobaczyć swoją stronę w przeglądarce. Gratulacje! :)
