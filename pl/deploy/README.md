# Wdrażanie!

> **Uwaga:** Niniejszy rozdział może być miejscami dość trudny. Bądź dzielna i przestudiuj go do końca; wdrażanie jest ważną częścią pracy nad stroną. Celowo umieściłyśmy go tutaj, aby Twój mentor był w stanie pomóc Ci przejść przez skomplikowany proces opublikowania Twojej strony w sieci. Oznacza to, że możesz wciąż ukończyć tutorial samodzielnie, jeśli zabraknie Ci czasu.

Do tej pory Twoja strona była dostępna tylko na Twoim komputerze. Teraz nauczysz się, jak ją wdrożyć! Wdrożenie to inaczej opublikowanie Twojej aplikacji w internecie, dzięki czemu możesz w końcu pokazać ją innym ludziom :).

Jak już wiesz, strona internetowa musi znajdować się na jakimś serwerze. Istnieje wielu dostawców serwerów w internecie (tzw. firm hostingowych). Skorzystamy z takiego, którego proces wdrażania jest stosunkowo prosty: [PythonAnywhere][1]. PythonAnywhere jest darmowy dla małych aplikacji, które nie mają zbyt dużo odwiedzających, więc na początek na pewno wystarczy.

 [1]: http://pythonanywhere.com/

Drugą zewnętrzną usługą, jakiej będziemy używać jest [GitHub][2], który przechowuje kod. Istnieją inne usługi, ale w dzisiejszych czasach prawie wszyscy programiści mają konto na GitHubie - i Ty dzisiaj do nich dołączysz!

 [2]: http://www.github.com

GitHub będzie takim miejscem pośrednim, którego użyjemy, by przetransportować Twój kod między Twoim komputerem a serwerem PythonAnywhere i z powrotem.

# Git

Git jest "systemem kontroli wersji", którego używa wielu programistów. Program ten śledzi zmiany w plikach na przestrzeni czasu, dzięki czemu możesz później przywracać wybrane wersje tych plików. Działa trochę jak funkcja "śledź zmiany" w Microsoft Word, ale jest o wiele bardziej potężny.

## Instalacja Gita

> **Uwaga** Jeśli już wcześniej przeszłaś kroki instalacyjne, nie musisz ich powtarzać - przejdź od razu do następnego podrozdziału, żeby stworzyć repozytorium Git.

{% include "/deploy/install_git.md" %}

## Tworzenie repozytorium Git

Git śledzi zmiany dokonywane w zbiorze plików w czymś, co nazywamy repozytorium kodu (albo po prostu "repo", żeby było krócej). Stwórzmy takie repozytorium dla naszego projektu. Otwórz konsolę w katalogu `djangogirls` i wpisz następujące polecenia:

> **Uwaga** Zanim utworzysz repozytorium, sprawdź w jakim katalogu obecnie się znajdujesz, wpisujac `pwd` (OSX/Linux) lub `cd` (Windows). Powinnaś się znajdować w katalogu `djangogirls`.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Twoja Nazwa Uzytkownika"
    $ git config --global user.email ty@adres.pl


Inicjalizacja repozytorium to coś, co będziesz musiała zrobić tylko raz na dany projekt (i nie będziesz musiała już wpisywać swojej nazwy użytkownika i adresu email).

Git będzie śledzić zmiany we wszyskich plikach i folderach w tym katalogu, ale zwróć uwagę, że znajdują się w nim pewne pliki, których zmiany chcemy ignorować. By to zrobić, musimy utworzyć w tym katalogu plik, który nazwiemy `.gitignore`. Otwórz swój edytor kodu i utwórz nowy plik o następującej treści:

```
*.pyc
__pycache__
myvenv
db.sqlite3
.DS_Store
```

Zapisz go jako `.gitignore` w folderze najwyższego poziomu "djangogirls".

> **Uwaga** Ta kropka na początku nazwy pliku jest ważna! Jeśli masz jakieś problemy z utworzeniem tego pliku (na przykład, jeśli pracujesz na Macu to Finder broni się przed zapisywaniem plików, które zaczynają się od kropki) to użyj "Zapisz jako" w swoim edytorze, działa bezbłędnie.

Dobrym nawykiem jest wpisywanie polecenia `git status` zanim wpiszesz `git add` albo gdy nie jesteś pewna co się zmieniło. To powinno cię ustrzec przed nieprzyjemnymi niespodziankami, takimi jak dodanie lub zmienienie nieprawidłowych plików. Polecenie `git status` zwraca między innymi informacje o plikach, które zostały dodane/zmienione/usunięte. Po wpisaniu polecenia powinnaś zobaczyć coś podobnego do tego:

    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

            .gitignore
            blog/
            manage.py
            mysite/

    nothing added to commit but untracked files present (use "git add" to track)


I na końcu zapisujemy zmiany. Przejdź do konsoli i wykonaj poniższe polecenia:

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py


## Przesyłanie naszego kodu do GitHuba

Wejdź na stronę [GitHub.com][2] i utwórz nowe darmowe konto. (Jeśli już to wcześniej zrobiłaś to super!)

Potem utwórz nowe repozytorium i nadaj mu nazwę "my-first-blog" (ang. "mój pierwszy blog") Nie zaznaczaj opcji "initialise with a README", nie zmieniaj nic przy polach .gitignore (powinno być None, same załatwiliśmy tę sprawę wcześniej). Licencja też powinna być ustawiona jako None.

![][3]

 [3]: images/new_github_repo.png

> **Uwaga** Nazwa `my-first-blog` jest ważna -- mogłabyś wybrać jakąś inną, ale będziemy tej nazwy używać wiele razy i za każdym razem musiałabyś pamiętać, żeby zastępować "my-first-blog" swoją wybraną nazwą. Z tego powodu najłatwiej będzie jak użyjesz nazwy `my-first-blog`.

Na następnej stronie wyświetli Ci się adres URL do klonowania Twojego repozytorium. Wybierz wersję "HTTPS" i skopiuj ją. Niedługo będziemy tego adresu potrzebować.

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Teraz musimy podpiąć repozytorium Git na komputerze do tego na GitHubie.

Wpisz następujące polecenie do konsoli (Zamień `<your-github-username>` na swoją nazwę użytkownika, którą podałaś przy tworzeniu konta na GitHubie, ale bez nawiasów ostrokątnych, czyli "<" i ">"):

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master


Wpisz swoją nazwę użytkownika GitHub oraz hasło, a wtedy powinnaś zobaczyć coś takiego:

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.


<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Twój kod jest teraz na GitHubie. Możesz to sprawdzić! Zważ, że znajduje się w wyśmienitym towarzystwie - [Django][5], [kurs Django Girls][6] i wiele innych świetnych projektów open-source trzyma swój kod na GitHubie :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Wdrażanie bloga na PythonAnywhere

> **Uwaga** Możliwe, że już wcześniej utworzyłaś konto na PythonAnywhere, jeśli przeszłaś przez wszystkie kroki w rozdziale instalacyjnym - nie ma potrzeby, byś robiła to drugi raz.

{% include "/deploy/signup_pythonanywhere.md" %}

## Umieszczanie naszego kodu na PythonAnywhere

Kiedy już zakończysz tworzenie konta na PythonAnywhere, zostaniesz przeniesiona do strony nawigacyjnej albo do strony "Konsole" (ang. "Consoles"). Wybierz opcję, by włączyć konsolę "Bash" -- to jest PythonAnywhere'owa wersja konsoli, którą masz na swoim komputerze.

> **Uwaga** PythonAnywhere jest oparty na Linuksie, więc jeśli pracujesz na Windowsie to konsola będzie wyglądać trochę inaczej niż na Twoim komputerze.

Umieśćmy nasz kod z GitHuba na PythonAnywhere. Zrobimy to "klonując" (ang. "clone") nasze repozytorium. Wpisz następujące polecenie do konsoli w PythonAnywhere (nie zapomnij zamienić `<your-github-username>` na swoją nazwę użytkownika):

    $ git clone https://github.com/<your-github-username>/my-first-blog.git


To polecenie ściągnie kopię twojego kodu na PythonAnywhere. By to sprawdzić, wpisz `tree my-first-blog`:

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py


### Tworzenie środowiska wirtualnego na PythonAnywhere

Tak samo jak to robiłaś na swoim komputerze, możesz stworzyć środowisko wirtualne na PythonAnywhere. W konsoli Bash wpisz:

    $ cd my-first-blog

    $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.

    $ source myvenv/bin/activate

    (mvenv) $  pip install django whitenoise
    Collecting django
    [...]
    Successfully installed django-1.8.2 whitenoise-2.0


> **Uwaga** Polecenie `pip install` może trochę potrwać. Cierpliwości, cierpliwości! Jednak jeśli trwa to dłużej niż 5 min, coś jest nie tak. Spytaj swojego mentora.

<!--TODO: think about using requirements.txt instead of pip install.-->

### Pobieranie plików statycznych.

Zastanawiałaś się o co chodziło z "whitenoise"? Jest to narzędzie dla tak zwanych "plików statycznych". Pliki statyczne to pliki, które nie zmieniają się zbyt często, takie jak pliki HTML czy CSS. Zachowują się one inaczej na serwerach niż na naszych własych komputerach i dlatego potrzebujemy takich narzędzi jak "whitenoise", by je obsługiwać.

Dowiemy się więcej o plikach statycznych później, kiedy będziemy zmieniać pliki CSS naszej strony.

Na tę chwilę musimy tylko uruchomić polecenie `collectstatic` na serwerze. Polecenie to mówi Django, by zebrał wszystkie pliki statyczne, których potrzebuje na serwerze. W tym momencie chodzi głównie o pliki, które upiększają nam panel admina.

    (mvenv) $ python manage.py collectstatic

    You have requested to collect static files at the destination
    location as specified in your settings:

        /home/edith/my-first-blog/static

    This will overwrite existing files!
    Are you sure you want to do this?

    Type 'yes' to continue, or 'no' to cancel: yes


Wpisz "yes" i niech hula maszyna! Czy to nie piękne, jak komputer wypluwa z siebie dłuugie strony tekstu? Ja czasami wydaję ciche dźwięki, które mi się z tym kojarzą. Pip, pip, piiiip...

    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/my-first-blog/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.


### Tworzenie bazy danych na PythonAnywhere

Oto kolejna różnica między Twoim komputerem a serwerem: serwer używa innej bazy danych. Tak więc możesz mieć inne konta użytkowników i posty na serwerze, a inne na swoim komputerze.

Możemy zainicjować bazę danych na serwerze dokładnie w ten sam sposób, w jaki zrobiliśmy to na swoim komputerze, poleceniami `migrate` i `createsuperuser`:

    (mvenv) $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK


    (mvenv) $ python manage.py createsuperuser


## Publikowanie naszego bloga jako aplikacji internetowej

Nasz kod znajduje się na PythonAnywhere, nasze środowisko wirtualne działa, mamy nasze pliki statyczne i zainicjowaliśmy bazę danych. Jesteśmy gotowi opublikować naszą aplikację internetową!

Kliknij na logo PythonAnywhere, by wrócić do panelu nawigacyjnego, a potem kliknij na zakładkę **Web**. Następnie kliknij **Add a new web app** (czyli po polsku: "Dodaj nową aplikację internetową").

Po potwierdzeniu nazwy domeny, w oknie dialogowym wybierz konfigurację ręczną, czyli po angielsku **manual configuration** (*nie* opcję "Django"). Następnie wybierz **Python 3.4** i kliknij przycisk Dalej, aby zakończyć.

> **Uwaga** Upewnij się, że wybrałaś opcję "Ręczna konfiguracja", nie "Django". Jesteśmy zbyt fajne, aby używać domyślnej konfiguracji Django na PythonAnywhere ;-)

### Ustawienie wirtualnego środowiska

Zostaniesz przeniesiony do strony konfiguracji Twojej aplikacji internetowej, czyli do miejsca, gdzie musisz się udać, gdy chcesz zrobić zmiany w swojej aplikacji na serwerze.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

W sekcji dotyczącej środowiska wirtualnego ("Virtualenv") kliknij na czerwone pole z napisem "Enter the path to a virtualenv" i wpisz: `/home/<your-username>/my-first-blog/myvenv/`. Kliknij w niebieski prostokąt obok, aby zapisać ścieżkę przed przejściem do dalszej części.

> **Uwaga** Podmień nazwę użytkownika na właściwą. Jeśli się pomylisz, PythonAnywhere da Ci małe ostrzeżenie.

### Konfiguracja pliku WSGI

Django używa "protokołu WSGI", standardu serwowania stron internetowych za pomocą Pythona, którego wspiera PythonAnywhere. Musimy zedytować plik konfiguracyjny WSGI tak, aby PythonAnywhere rozpoznawał naszego Django bloga.

Kliknij na link "WSGI configuration file" (w sekcji "Code" w górnej części strony - będzie nazywać się mniej więcej tak `/var/www/<twoja-nazwa-uzytkownika>_pythonanywhere_com_wsgi.py`), a zostaniesz przeniesiona do edytora.

Skasuj całą zawartość pliku i zastąp ją następującym tekstem:

```python
import os
import sys

path = '/home/<your-username>/my-first-blog'  # use your own username here
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Uwaga** Nie zapomnij zastąpić wszystkich wystąpień `<your-username>` swoją nazwą użytkownika.

Zadaniem tego pliku jest powiedzenie PythonAnywhere gdzie znajduje się nasza aplikacja i jaka jest nazwa naszego pliku z ustawieniami Django. Również zajmuje się poznanym wcześniej narzędziem "whitenoise", służącym do obsługi plików statycznych.

Naciśnij **Zapisz** i potem wróć do karty **Web**.

Mamy wszystko gotowe! Naciśnij duży zielony przycisk **Reload** ("Odśwież"), a będziesz mogła odwiedzić swoją aplikację. Znajdziesz do niej link na górze strony.

## Porady dotyczące debugowania

Jeśli odwiedzając swoją stronę zobaczysz błąd, to pierwszym miejscem, w którym powinnaś poszukać informacji o tym, co się stało jest twój **dziennik błędów** (ang. "error log"). Znajdziesz do niego link na karcie [Web][8] w PythonAnywhere. Sprawdź czy znajdują się tam jakieś komunikaty o błędach; te najświeższe znajdują się na samym dole strony. Typowe problemy to:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Pominięcie jednego z kroków, które powinnyśmy zrobić w konsoli: stworzenie środowiska wirtualnego, aktywowanie go, instalacja Django, pobranie plików statycznych, migracja bazy danych.

*   Pomyłka w ścieżce do środowiska wirtualnego w zakładce "Web" -- jeśli coś jest nie tak, wyświetli Ci się tam mały czerwony komunikat błędu.

*   Zrobienie błędu w pliku konfiguracyjnym WSGI -- czy dobrze zapisałaś ścieżkę do katalogu my-first-blog?

*   Czy wybrałaś tę samą wersję Pythona dla Twojego środowiska wirtualnego, co dla aplikacji internetowej? Obie powinny być 3.4.

*   Istnieje kilka [ogólnych porad dotyczących debugowania na PythonAnywhere wiki][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

I pamiętaj, Twój mentor jest tutaj, by Ci pomóc!

# Twoja strona jest w internecie!

Teraz na Twojej stronie w internecie powinny widniać słowa "Welcome to Django", dokładnie tak samo jak gdy otwierasz stronę znajdującą się na dysku lokalnym. Jeśli dodasz `/admin/` na koniec swojego adresu URL, powinnaś się przenieść do panelu admina. Zaloguj się swoim loginem i hasłem, a wtedy zobaczysz, że jesteś w stanie dodawać nowe posty na serwerze.

*Przybij piątkę!* Wdrażanie to jedna z najtrudniejszych i najbardziej skomplikowanych części projektowania stron internetowych. Często całemu zespołowi ludzi zajmuje to kilka dni zanim wszystko zacznie działać. Ale Tobie tak szybko udało się wdrożyć swoją stronę, jest ona w prawdziwym internecie!
