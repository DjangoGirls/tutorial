# Twój pierwszy projekt w Django!

> Fragment tego rozdziału jest oparty na tutorialu Geek Girls Carrots (http://django.carrots.pl/).
>
> Fragmenty tego rozdziału są oparte o [tutorial django-marcador][1] na licencji Creative Commons Attribution-ShareAlike International 4.0. Tutorial django-marcador jest chroniony prawami autorskimi przez Markusa Zapke-Gründemanna i in.

[1]: http://django-marcador.keimlink.de/

Mamy zamiar stworzyć prostego bloga!

Pierwszym krokiem w stronę utworzenia go jest założenie nowego projektu w Django. To w zasadzie oznacza, że skorzystamy z dostarczonych przez Django skryptów, które za nas utworzą szkielet projektu Django: zbiór katalogów i plików, których będziemy używać później.

Nazwy niektórych plików i katalogów są bardzo ważne dla Django. Nie powinnaś zmieniać nazw plików, które zostaną utworzone. Przenoszenie ich w inne miejsce też nie jest dobrym pomysłem. Django musi trzymać pewną strukturę, aby mieć łatwy dostęp do potrzebnych rzeczy.

Uruchom w konsoli (pamiętaj, że nie musisz pisać `(myvenv) ~/djangogirls$`, OK?):

> Pamiętaj, aby uruchamiać wszystko w virtualenv. Jeśli nie widzisz prefiksu `(myvenv)` w konsoli, to znaczy że musisz uruchomić swój virtualenv. Wyjaśniłyśmy, jak to zrobić w rozdziale **Instalowanie Django** w części **Praca z virtualenv**.
 
Uruchom komendę:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .

Dla Windows:

    (myvenv) C:\Users\Nazwa\djangogirls> python myvenv\Scripts\django-admin.py startproject mysite .

> **Uwaga:** Pamiętaj koniecznie o kropce (`.`) na końcu polecenia, ona jest tam niezbędna.

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

Fajnie byłoby posługiwać się poprawnym czasem na naszej stronie. Przejdź do http://en.wikipedia.org/wiki/List_of_tz_database_time_zones i skopiuj właściwą strefę czasową (TZ). (np. `Europe/Berlin`)

Znajdź linie zawierające `USE_TZ` i `TIME_ZONE` i zmodyfikuj je w następujący sposób, wstawiając w miejsce `Europe/Berlin` właściwą strefę czasową:

    USE_TZ = False
    TIME_ZONE = 'Europe/Berlin'


## Ustawienie bazy danych

Istnieje duży wybór baz danych, w których możemy przechowywać dane naszej strony. My użyjemy bazy domyślnej, czyli `sqlite3`.

Została ona już ustawiona w tej części pliku `mysite/settings.py`:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }


Aby utworzyć bazę danych dla naszego bloga, wykonajmy następujące polecenie w konsoli: `python manage.py migrate` (musimy być w katalogu `djangogirls`, tam, gdzie znajduje się plik `manage.py`). Gdy to się uda, powinnaś zobaczyć coś takiego jak poniżej:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: admin, contenttypes, auth, sessions
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying sessions.0001_initial... OK


I to wszystko! Czas uruchomić serwer i zobaczyć, czy nasza strona działa!

Musisz znajdować się w katalogu zawierającym plik `manage.py` (katalog `djangogirls`). W konsoli możemy uruchomić serwer za pomocą polecenia `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver


Teraz pozostaje Ci jedynie przekonać się, czy Twoja strona działa - otwórz przeglądarkę (Firefox, Chrome, Safari, Internet Explorer lub inna, której używasz) i wpisz adres:

    http://127.0.0.1:8000/


Serwer przejmie Twój wiersz poleceń i będzie go używał dopóty, dopóki go nie wyłączysz. Aby mieć możliwość wykonywania innych poleceń, możesz zrobić jedną z dwóch rzeczy: otwórz nowe okienko terminala (i nie zapomnij o uruchomieniu w nim środowiska virtualenv) albo zatrzymaj serwer - w tym celu wróć do okienka, w którym został on uruchomiony i wciśnij CTRL+C (klawisze Control i C jednocześnie; pod Windows działa skrót Ctrl+Break).

Gratulacje! Właśnie stworzyłaś swoją pierwszą stronę i uruchomiłaś ją za pomocą serwera! Prawda, że wspaniale?

![Działa!](images/it_worked2.png)

Gotowa na następny krok? Czas stworzyć treść!
