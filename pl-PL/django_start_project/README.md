# Twój pierwszy projekt w Django!

> Fragment tego rozdziału opiera się o tutoriale Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Fragmenty tego rozdziału są oparte o [tutorial django-marcador](http://django-marcador.keimlink.de/) na licencji Creative Commons Attribution-ShareAlike International 4.0. Tutorial django-marcador jest chroniony prawami autorskimi przez Markusa Zapke-Gründemanna i in.

Mamy zamiar stworzyć prosty blog!

Pierwszy krok, który trzeba wykonać, to utworzenie nowego projektu Django. To oznacza, że skorzystamy z dostarczonych przez Django skryptów, które utworzą za nas szkielet projektu Django. Ten szkielet to zbiór katalogów i plików, których będziemy używać później.

Nazwy niektórych plików i katalogów są bardzo ważne dla Django. Nie powinnaś zmieniać nazw plików, które zostaną utworzone. Przenoszenie ich w inne miejsce też nie jest dobrym pomysłem. Django wymaga zachowania pewnej struktury, by móc szybko znaleźć potrzebne rzeczy.

> Pamiętaj, aby uruchamiać wszystko w virtualenvie. Jeśli nie widzisz prefiksu `(myvenv)` w konsoli, to znaczy że musisz uruchomić swój virtualenv. Wyjaśniłyśmy, jak to zrobić w rozdziale **Instalacja Django** w części **Praca z virtualenv**. Wystarczy wpisać `myvenv\Scripts\activate` w systemie Windows lub `source myvenv/bin/activate`, jeśli używasz Mac OS X lub Linux.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Dla systemów MacOS X lub Linux, wpisz teraz do swojej konsoli następującą komendę. **Nie zapomnij dodać kropki `.` na końcu!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Kropka `.` ma kluczowe znaczenie, ponieważ dzięki niej skrypt wie, że ma zainstalować Django w bieżącym katalogu (kropka `.` to taka skrócona nazwa bieżącego katalogu).
> 
> **Uwaga** Kiedy będziesz przepisywać komedy, które zamieściliśmy wyżej, pamiętaj, że przepisujesz tylko tę część, która zaczyna się od `django-admin`. `(myvenv) ~/djangogirls$` są tutaj tylko po to, by pokazać Ci przykład wiersza polecenia i tego, jak będzie on wyglądał, gdy będziesz wpisywać polecenia.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Dla systemu Windows wpisz teraz do swojej konsoli następującą komendę. **Nie zapomnij dodać kropki `.` na końcu**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Kropka `.` ma kluczowe znaczenie, ponieważ dzięki niej skrypt wie, że ma zainstalować Django w bieżącym katalogu (kropka `.` to taka skrócona nazwa bieżącego katalogu).
> 
> **Uwaga** Kiedy będziesz przepisywać komedy, które zamieściliśmy wyżej, pamiętaj, że przepisujesz tylko tę część, która zaczyna się od `django-admin.exe`. `(myvenv) C:\Users\Name\djangogirls>` są tutaj tylko po to, by pokazać Ci przykład znaku zachęty wiersza polecenia, który będzie Ciebie zapraszał, byś wpisała komendę.

<!--endsec-->

`django-admin.py` jest skryptem, który utworzy katalogi i pliki za Ciebie. Powinnaś mieć teraz strukturę katalogów podobną do tej:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Uwaga**: w strukturze katalogów, możesz zobaczyć również katalog `venv`, który stworzyłyśmy wcześniej.

`manage.py` jest skryptem ułatwiającym zarządzanie witryną. Za jego pomocą, oprócz wielu innych rzeczy, możemy uruchomić serwer na naszym komputerze bez potrzeby instalowania czegokolwiek.

Plik `settings.py` zawiera konfigurację naszej strony.

Pamiętasz, jak rozmawiałyśmy o listonoszu sprawdzającym gdzie dostarczyć list? Plik `urls.py` zawiera wzorce używane przez `urlresolver'a`.

Na razie zapomnijmy o innych plikach - nie będziemy ich modyfikować. Jedyne, o czym musisz pamiętać, to żeby ich niechcący nie skasować!

## Modyfikowanie ustawień

Wprowadźmy parę zmian w pliku `mysite/settings.py`. Otwórz go za pomocą edytora kodu, który zainstalowałaś wcześniej.

**Uwaga**: należy pamiętać, że `settings.py` jest zwykłym plikiem, jak każdy inny. Otworzysz go w edytorze kodu, przy użyciu menu "plik-> Otwórz". Powinnaś otrzymać zwykłe okno, w którym możesz przejść do pliku `settings.py` i zaznaczyć go. Możesz również otworzyć plik, przechodząc do folderu djangogirls na pulpicie, klikając na niego prawym przyciskiem myszy. Następnie wybierz edytor kodu z listy. Wybór edytora jest ważny, ponieważ możesz mieć zainstalowane inne programy, które mogą otworzyć plik, ale nie pozwolą Ci go edytować.

Fajnie byłoby posługiwać się na naszej stronie właściwą strefą czasową. Przejdź do [listy stref czasowych w Wikipedii](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) i skopiuj właściwą strefę czasową (TZ) (np. `Europe/Warsaw`).

W pliku `settings.py` znajdź linijkę, w której jest napisane `TIME_ZONE` i zmień ją wybierając swoją strefę czasową. Przykład:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Warsaw'
```

Kod języka składa się z języka, np. ` en ` dla języka angielskiego lub ` de ` dla języka niemieckiego i kodu kraju, np. ` de ` dla Niemiec lub ` ch ` dla Szwajcarii. Jeżeli angielski nie jest Twoim językiem ojczystym, możesz dodać tę wartość, aby domyślne przyciski i powiadomienia od Django będą w Twoim języku. Tak więc przycisk "Anuluj" zostałby przetłumaczony na język, który tu zdefiniowałaś. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Jeżeli chcesz używać innego języka, zmień jego kod, modyfikując następujący wiersz:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'pl-pl'
```

Musimy także dodać ścieżkę do plików statycznych. (Dowiemy się więcej o plikach statycznych i CSS w dalszej części kursu). Przejdź do samego *końca* pliku i pod linijką zawierającą `STATIC_URL` dodaj nową zmienną `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Gdy ` DEBUG ` jest ` True ` i ` ALLOWED_HOSTS ` jest puste, host jest sprawdzany pod kątem ` ['localhost', '127.0.0.1', '[::1]']`. To nie będzie pasować do naszej nazwy hosta w PythonAnywhere po wdrożeniu naszej aplikacji, więc zmienimy następujące ustawienie:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> ** Uwaga **: jeśli używasz Chromebooka, dodaj ten wiersz u dołu pliku settings.py: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Dodaj również `.c9users.io` do `ALLOWED_HOSTS`, jeżeli używasz cloud9

## Inicjalizacja bazy danych

Istnieje duży wybór baz danych, w których możemy trzymać dane naszej strony. My użyjemy bazy domyślnej, czyli `sqlite3`.

Została ona już ustawiona w tej części pliku `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Aby utworzyć bazę danych dla naszego bloga, wykonajmy następujące polecenie w konsoli: `python manage.py migrate` (musimy być w katalogu `djangogirls`, tam gdzie znajduje się plik `manage.py`). Gdy to się uda, powinnaś zobaczyć coś takiego jak poniżej:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

I to wszystko! Czas uruchomić serwer i zobaczyć, czy nasza strona działa!

## Uruchamianie serwera WWW

Musisz znajdować się w katalogu zawierającym plik `manage.py` (katalog `djangogirls`). W konsoli możemy uruchomić serwer za pomocą polecenia `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Jeżeli korzystasz z Chromebooka, wykorzystaj komendę poniżej:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Jeśli pracujesz na Windowsie i zobaczysz w tym momencie `UnicodeDecodeError`, użyj następującej komendy:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Teraz sprawdź, czy Twoja strona działa. Otwórz przeglądarkę (Firefox, Chrome, Safari, Internet Explorer lub jakąkolwiek inną) i wprowadź ten adres:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Jeśli używasz Chromebooka i Cloud9, kliknij adres URL w wyskakującym okienku, które powinno pojawić się w prawym górnym rogu okna poleceń, w którym działa serwer WWW. Adres URL powinien wygladąć tak:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Gratulacje! Właśnie stworzyłaś swoją pierwszą stronę i uruchomiłaś ją za pomocą serwera! Prawda, że wspaniale?

![Install worked!](images/install_worked.png)

Kiedy serwer internetowy jest uruchomiony, nie możesz zobaczyć nowego wiersza polecenia do wprowadzania dodatkowych poleceń. Terminal przyjmie nowy tekst, ale nie wykona nowego polecenia. Dzieje się tak dlatego, że serwer internetowy ciągle działa oraz oczekuje nowych żądań.

> Sprawdziliśmy, jak działają serwery internetowe w rozdziale **"Jak działa Internet"**.

Aby wpisać dodatkowe polecenia podczas działania serwera WWW, otwórz nowe okno terminala i aktywuj swoje wirtualne środowisko (virtualenv) - aby przejrzeć instrukcje dotyczące otwierania drugiego okna terminala, patrz [Wprowadzenie do wiersza poleceń](../intro_to_command_line/README.md). Aby zatrzymać serwer, wróć do okienka, w którym został on uruchomiony i wciśnij CTRL+C - klawisze Control i C jednocześnie (jeśli używasz systemu Windows to możesz też spróbować skrótu Ctrl+Break).

Gotowa na następny krok? Czas stworzyć treść!