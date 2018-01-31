# Wdrażanie!

> **Uwaga:** Niniejszy rozdział może być miejscami dość trudny. Bądź dzielna i przestudiuj go do końca; wdrażanie jest ważną częścią pracy nad stroną. Celowo umieściłyśmy go tutaj, aby Twój mentor był w stanie pomóc Ci przejść przez skomplikowany proces opublikowania Twojej strony w sieci. Oznacza to, że możesz wciąż ukończyć tutorial samodzielnie, jeśli zabraknie Ci czasu.

Do teraz twoja strona była dostępna tylko na twoim komputerze. Właśnie teraz nauczymy się, jak ją wdrożyć! Wdrożenie to inaczej opublikowanie Twojej aplikacji w internecie, dzięki czemu możesz w końcu pokazać ją innym ludziom. :)

Jak już wiesz, strona internetowa musi znajdować się na jakimś serwerze. W internecie działa wielu dostawców serwerów. Skorzystamy z usług [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere jest darmowy dla małych aplikacji, które nie przyciągają zbyt wielu odwiedzających. Z pewnością jest wystarczający dla Ciebie.

Drugą zewnętrzną usługą, jakiej będziemy używać jest [GitHub](https://www.github.com), który przechowuje kod. Istnieją inne usługi, ale w dzisiejszych czasach prawie wszyscy programiści mają konto na GitHubie - i Ty dzisiaj do nich dołączysz!

Te trzy miejsca będą dla Ciebie bardzo ważne. Twój lokalny komputer będzie miejscem, w którym będziesz rozwijać i testować swoją aplikację. Kiedy będziesz zadowolona ze swoich zmian, kod swojego programu umieścisz na GitHubie. Twoja strona za to będzie dostępna na PythonAnywhere i wszystkie zmiany będziesz tam ściągał ze swojej kopii kodu na GitHubie.

# Git

> **Uwaga** Jeżeli wykonałaś już wszystkie kroki instalacji, nie ma potrzeby ich powtarzać - możesz przeskoczyć do następnej sekcji i zacząć tworzyć repozytorium w Gicie.

{% include "/deploy/install_git.md" %}

## Tworzenie repozytorium Git

Git śledzi zmiany dokonywane w zbiorze plików w czymś, co nazywamy repozytorium kodu (albo po prostu "repo", żeby było krócej). Stwórzmy takie repozytorium dla naszego projektu. Otwórz konsolę w katalogu `djangogirls` i wpisz następujące polecenia:

> **Uwaga** Sprawdź bieżący katalog roboczy za pomocą polecenia `pwd` (Mac OS X/Linux) lub `cd` (Windows) przed inicjalizacją repozytorium. Powinnaś się znajdować w katalogu `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Twoja Nazwa Uzytkownika"
    $ git config --global user.email ty@adres.pl
    

Inicjalizacja repozytorium gita jest jednorazowym zadaniem dla każdego projektu (nie będzie więcej potrzeby, byś ponownie podawał nazwę użytkownika i email).

Git będzie śledzić zmiany we wszyskich plikach i folderach w tym katalogu, ale zwróć uwagę, że znajdują się w nim pewne pliki, których zmiany chcemy ignorować. By to zrobić, musimy utworzyć w tym katalogu plik, który nazwiemy `.gitignore`. Otwórz swój edytor kodu i utwórz nowy plik o następującej treści:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

I zapisz go jako `.gitignore` w katalogu "djangogirls".

> **Uwaga** Ta kropka na początku nazwy pliku jest ważna! Jeżeli masz problem podczas tworzenia tego pliku (MacOS ma na przykład problem z tworzeniem plików zaczynających się od kropki za pomocą Findera), to spróbuj użyć polecenia "Zapisz jako" w swoim edytorze, to akurat jest niezawodne.
> 
> **Uwaga** Jednym z plików, który wyszczególniliśmy w `.gitignore` to `db.sqlite3`. Ten plik to twoja lokalna baza danych, gdzie będą się znajdować wszystkie artykuły z twojego bloga. Nie chcemy dodawać tego pliku do repozytorium, ponieważ twoja strona na PythonAnywhere będzie korzystać z innnej bazy danych. Tą bazą może być SQLite, tak jak na twojej maszynie deweloperskiej, ale najczęściej będziesz korzystać z bazy MySQL, która radzi sobie z dużą większą ilością odwiedzających. W każdym razie, zignotowanie twojej bazy SQLite w kopii na GitHubie, oznacza że wszystkie artykuły, które stworzyłaś do tej pory zostaną i będą widoczne tylko lokalnie, i będziemy musiały dodać je ponownie na środowisku produkcyjnym. Powinnaś myśleć o swojej lokalnej bazie danych jako o dobrym placu zabaw, na którym możesz testować różne rzeczy nie bojąc się, że skasujesz prawdziwe artykuły ze swojego bloga.

Dobrym nawykiem jest wpisywanie polecenia `git status` zanim wpiszesz `git add` albo gdy nie jesteś pewna co się zmieniło. Pozwala ono zabezpieczyć się przed niespodziankami takimi, jak chociażby dodanie lub skomitowanie błędnego pliku. Polecenie `git status` zwraca informację o wszystkich nieśledzonych/zmienionych/zaplanowanych do najbliższego commita plików, statusie brancha i wiele innych. Wynik powinien wyglądać podobnie do następującego:

{% filename %}command-line{% endfilename %}

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

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    ## Wypychanie kodu na GitHuba
    
    Przejdź na [GitHub.com](https://www.github.com) i załóż nowe, darmowe konto użytkonika. (Jeśli już to wcześniej zrobiłaś to super!). 
    
    Potem utwórz nowe repozytorium i nadaj mu nazwę "my-first-blog" (ang. "mój pierwszy blog"). Nie zaznaczaj opcji "initialize with a README", nie zmieniaj nic przy polach .gitignore (powinno być None, same załatwiliśmy tę sprawę wcześniej) i licencja też powinna być ustawiona jako None.
    
    &lt;img src="images/new_github_repo.png" /&gt;
    
    &gt; **Uwaga** Nazwa my-first-blog jest ważna - mogłabyś wybrać jakąś inną, ale będziemy tej nazwy używać wiele razy i za każdym razem musiałabyś pamiętać, żeby zastępować "my-first-blog" swoją wybraną nazwą. Z tego powodu najłatwiej będzie jak użyjesz nazwy 'my-first-blog'.
    
    Na następnej stronie wyświetli Ci się adres URL do klonowania Twojego repozytorium. Wybierz wersję "HTTPS" i skopiuj ją. Niedługo będziemy tego adresu potrzebować.
    
    &lt;img src="images/github_get_repo_url_screenshot.png" /&gt;
    
    Teraz musimy podpiąć repozytorium Git na komputerze do tego na GitHubie.
    
    Wpisz następujące polecenie do konsoli (Zamień '&lt;your-github-username&gt;' na swoją nazwę użytkownika, którą podałaś przy tworzeniu konta na GitHubie, ale bez nawiasów ostrokątnych, czyli "<" i ">"):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Wpisz swoją nazwę użytkownika GitHub oraz hasło, a wtedy powinnaś zobaczyć coś takiego:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Możesz to sprawdzić!  Zauważ, że znajduje się w wyśmienitym towarzystwie - [Django](https://github.com/django/django), [kurs Django Girls](https://github.com/DjangoGirls/tutorial) i wiele innych świetnych projektów open-source trzyma swój kod na GitHubie. :)
    
    # Wdrażanie bloga na PythonAnywhere
    
    &gt; **Uwaga** Możliwe, że już wcześniej utworzyłaś konto na PythonAnywhere, jeśli przeszłaś przez wszystkie kroki w rozdziale instalacyjnym - nie ma potrzeby, byś robiła to drugi raz.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ##Umieszczanie naszego kodu na PythonAnywhere
    
    Kiedy już zakończysz tworzenie konta na PythonAnywhere, zostaniesz przeniesiona do strony nawigacyjnej albo do strony "Konsole" (ang. "Consoles"). Wybierz opcję, by włączyć konsolę "Bash" - to jest PythonAnywhere'owa wersja konsoli, którą masz na swoim komputerze.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Uwaga** PythonAnywhere jest oparty na Linuksie, więc jeśli pracujesz na Windowsie to konsola będzie wyglądać trochę inaczej niż na Twoim komputerze.
    
    Umieśćmy nasz kod z GitHuba na PythonAnywhere. Zrobimy to "klonując" (ang. "clone") nasze repozytorium. Wpisz następujące polecenie do konsoli w PythonAnywhere (nie zapomnij zamienić '&lt;your-github-username&gt;' na swoją nazwę użytkownika):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />To polecenie ściągnie kopię twojego kodu na PythonAnywhere. By to sprawdzić, wpisz 'tree my-first-blog':
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Tworzenie środowiska wirtualnego na PythonAnywhere
    
    Tak samo jak to robiłaś na swoim komputerze, możesz stworzyć środowisko wirtualne na PythonAnywhere. W konsoli Bash wpisz:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Uwaga** Polecenie 'pip install' może trochę potrwać.  Cierpliwości, cierpliwości!  Jednak jeśli trwa to dłużej niż 5 min, coś jest nie tak.  Spytaj swojego mentora.
    
    &lt;!--TODO: pomyśl o użyciu requirements.txt zamiast pip install.--&gt;
    
    ###Tworzenie bazy danych na PythonAnywhere
    
    Oto kolejna różnica między Twoim komputerem a serwerem: serwer używa innej bazy danych. Tak więc możesz mieć inne konta użytkowników i posty na serwerze, a inne na swoim komputerze.
    
    Możemy zainicjować bazę danych na serwerze dokładnie w ten sam sposób, w jaki zrobiliśmy to na swoim komputerze, poleceniami 'migrate' i 'createsuperuser':
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publikowanie naszego bloga jako aplikacji internetowej
    
    Nasz kod znajduje się na PythonAnywhere, nasze środowisko wirtualne działa, i nasza baza danych jest zainicjowana. Jesteśmy gotowi opublikować naszą aplikację internetową!
    
    Kliknij na logo PythonAnywhere, by wrócić do panelu nawigacyjnego, a potem kliknij na zakładkę **Web**. Następnie kliknij **Add a new web app** (czyli po polsku: "Dodaj nową aplikację internetową").
    
    Po potwierdzeniu nazwy domeny, w oknie dialogowym wybierz konfigurację ręczną, czyli po angielsku **manual configuration** (*nie* opcję "Django"). Następnie wybierz **Python 3.6** i kliknij przycisk Dalej, aby zakończyć.
    
    &gt; **Uwaga** Upewnij się, że wybrałaś opcję "Ręczna konfiguracja", nie "Django". Jesteśmy zbyt fajne, aby używać domyślnej konfiguracji Django na PythonAnywhere. ;-)
    
    ### Ustawienie wirtualnego środowiska
    
    Zostaniesz przeniesiony do strony konfiguracji PythonAnywhere dla Twojej aplikacji internetowej, czyli do miejsca, gdzie musisz się udać, gdy chcesz zrobić zmiany w swojej aplikacji na serwerze.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    W sekcji dotyczącej środowiska wirtualnego ("Virtualenv") kliknij na czerwone pole z napisem "Enter the path to a virtualenv" i wpisz: '/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/'. Kliknij w niebieski prostokąt obok, aby zapisać ścieżkę przed przejściem do dalszej części.
    
    &gt;**Uwaga** Zastąp własną nazwę użytkownika PythonAnywhere właściwą. Jeśli się pomylisz, PythonAnywhere da Ci małe ostrzeżenie.
    
    
    ### Konfiguracja pliku WSGI
    
    Django używa "protokołu WSGI", standardu serwowania stron internetowych za pomocą Pythona, którego wspiera PythonAnywhere. Musimy zedytować plik konfiguracyjny WSGI tak, aby PythonAnywhere rozpoznawał naszego Django bloga.
    
    Kliknij na link "WSGI configuration file" (w sekcji "Code" w górnej części strony - będzie nazywać się mniej więcej tak '/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py'), i zostaniesz przeniesiona do edytora.
    
    Skasuj całą zawartość pliku i zastąp ją następującym tekstem:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

Zadaniem tego pliku jest powiedzenie PythonAnywhere gdzie znajduje się nasza aplikacja i jaka jest nazwa naszego pliku z ustawieniami Django.

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. Dowiemy się więcej o plikach statycznych później, kiedy będziemy zmieniać pliki CSS naszej strony.

Naciśnij **Zapisz** i potem wróć do karty **Web**.

Mamy wszystko gotowe! Naciśnij duży zielony przycisk **Reload** ("Odśwież"), a będziesz mogła odwiedzić swoją aplikację. Znajdziesz do niej link na górze strony.

## Porady dotyczące debugowania

Jeśli odwiedzając swoją stronę zobaczysz błąd, to pierwszym miejscem, w którym powinnaś poszukać informacji o tym, co się stało jest twój **dziennik błędów** (ang. "error log"). Znajdziesz do niego link na karcie [Web](https://www.pythonanywhere.com/web_app_setup/) w PythonAnywhere. Sprawdź czy znajdują się tam jakieś komunikaty o błędach; te najświeższe znajdują się na samym dole strony. Typowe problemy to:

- Nie wykonanie jednego z kroków, które wcześniej wykonałyśmy w konsoli: stworzenie środowiska wirtualnego, aktywowanie go, instalacja w nim Django, migracja bazy danych.

- Błąd w ścieżce do środowiska wirtualnego w zakładce Web - przeważnie, w przypadku błędu, będzie tam na czerwono mała informacja o problemie.

- Błąd w pliku konfiguracyjny WSGI - wpisałaś poprawną ścieżkę do swojego katalogu my-first-blog?

- Czy wybrałaś tę samą wersję Pythona dla Twojego środowiska wirtualnego, co dla aplikacji internetowej? Obie powinny być 3.6.

Są tam też dostępne [generalne porady odnośnie debugowania na wiki PythonAnywhere](https://www.pythonanywhere.com/wiki/DebuggingImportError).

I pamiętaj, Twój mentor jest tutaj, by Ci pomóc!

# Twoja strona jest w internecie!

Standardowa strona dla twojej witryny powinna brzmieć "It worked!", tak jak na twoim komputerze lokalnym. Jeśli dodasz `/admin/` na koniec swojego adresu URL, powinnaś się przenieść do panelu admina. Zaloguj się swoim loginem i hasłem, a wtedy zobaczysz, że jesteś w stanie dodawać nowe posty na serwerze.

Jak już stworzysz kilka artykułów, możesz wrócić do swojego lokalnego środowiska (nie do PythonAnywhere). Od teraz powinnaś pracować na swoim lokalnym komputerze, jeżeli będziesz chciała dokonać zmian na stronie. To częsty sposób pracy w rozwijaniu stron www - wprowadzaj zmiany lokalnie, wypychaj je na GitHuba i zaciągaj na swój internetowy serwer www. Pozwala to na pracę i eksperymentowanie bez obawy, że zepsujesz działającą stronę. Całkiem nieźle, co nie?

*Przybij piątkę!* Wdrażanie to jedna z najtrudniejszych i najbardziej skomplikowanych części projektowania stron internetowych. Często całemu zespołowi ludzi zajmuje to kilka dni zanim wszystko zacznie działać. Ale Tobie tak szybko udało się wdrożyć swoją stronę, jest ona w prawdziwym internecie!