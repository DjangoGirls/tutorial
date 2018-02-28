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
    
    ## Wypchnięcie kodu na GitHuba
    
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
    

Username for 'https://github.com': ola Password for 'https://ola@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/ola/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Twój kod jest już na Githubie. Możesz to sprawdzić!  Zauważ, że znajduje się w wyśmienitym towarzystwie - [Django](https://github.com/django/django), [kurs Django Girls](https://github.com/DjangoGirls/tutorial) i wiele innych świetnych projektów open-source trzyma swój kod na GitHubie. # Konfiguracja twojego bloga na PythonAnywhere
    
    ## Zakładanie konta na PythonAnywhere
    
    &gt; **Uwaga** Mogłaś już wcześniej, podczas instalacji, założyć konto na PythonAnywhere – jeżeli tak się stało, nie ma potrzeby byś robiła to ponownie.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    ## Konfigurowanie naszej strony w PythonAnywhere
    
    Wróć do głównego panelu [PythonAnywhere Dashboard] (https://www.pythonanywhere.com/), klikając logo, i wybierz opcję uruchomienia konsoli "Bash" - jest to wersja wiersza poleceń PythonAnywhere, podobnie jak ta na Twoim komputerze.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
    
    &gt; ** Uwaga ** PythonAnywhere jest oparty na systemie Linux, więc jeśli używasz systemu Windows, konsola będzie wyglądać trochę inaczej niż na Twoim komputerze.
    
    Wdrożenie aplikacji internetowej w PythonAnywhere polega na ściągnięciu kodu z GitHub, a następnie skonfigurowaniu PythonAnywhere w celu rozpoznania go i rozpoczęciu wyświetlania go jako aplikacji internetowej.  Istnieją manualne sposoby robienia tego, ale PythonAnywhere zapewnia narzędzie pomocnicze, które zrobi to wszystko za Ciebie. Najpierw zainstalujmy:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pip3.6 install --user pythonanywhere

    <br />To powinno wydrukować rzeczy, takie jak `Collecting pythonanywhere`, a kończy się na linii z napisem `Successfully installed (...) pythonanywhere- (...)`.
    
    Teraz uruchamiamy pomocnika, aby automatycznie skonfigurować naszą aplikację z GitHub. Wpisz następujące polecenie w konsoli na PythonAnywhere (nie zapomnij użyć swojej nazwy użytkownika GitHub w miejscu `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git

    <br />Oglądając to, będziesz mógł zobaczyć, co jest robione:
    
    - Pobieranie kodu z GitHub
    - Tworzenie virtualenv na PythonAnywhere, tak jak na Twoim własnym PC
    - Aktualizowanie pliku ustawień za pomocą niektórych ustawień wdrażania
    - Konfigurowanie bazy danych w PythonAnywhere za pomocą komendy `manage.py migrate`
    - Konfigurowanie plików statycznych (dowiemy się o nich później)
    - Konfigurowanie PythonAnywhere do obsługi aplikacji internetowej za pośrednictwem interfejsu API
    
    W PythonAnywhere wszystkie te kroki są zautomatyzowane, ale są to te same kroki, które trzeba wykonać z dowolnym innym dostawcą serwera.  Najważniejsze, aby zauważyć, że baza danych w PythonAnywhere jest całkowicie oddzielona od bazy danych na własnym komputerze, co oznacza, że może mieć inne posty i konta administracyjne.
    
    W rezultacie, tak jak zrobiłyśmy to na własnym komputerze, musimy zainicjować konto administratora za pomocą `createsuperuser`. PythonAnywhere automatycznie aktywował Twój virtualenv dla Ciebie, więc wszystko, co musisz zrobić, to uruchomić:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ python manage.py createsuperuser

    <br />Wpisz szczegóły dla swojego administratora.  Najlepiej używać tych samych, których używasz na swoim komputerze, aby uniknąć nieporozumień, chyba że chcesz, aby hasło w PythonAnywhere było bezpieczniejsze.
    
    Teraz, jeśli chcesz, możesz również rzucić okiem na swój kod na PythonAnywhere używając `ls`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```

Możesz także przejść do zakładki "Pliki" i nawigować za pomocą wbudowanej przeglądarki plików PythonAnywhere.

## Jesteś na żywo!

Twoja strona powinna teraz być dostępna w publicznym Internecie! Przejdź do zakładki "Sieć" PythonAnywhere, aby uzyskać link do niej. Możesz podzielić się tym z kimkolwiek chcesz :)

## Porady dotyczące debugowania

Jeśli widzisz błąd podczas uruchamiania skryptu `pa_autoconfigure_django.py`, oto kilka typowych przyczyn:

- Zapominasz utworzyć Twój PythonAnywhere API token.
- Robisz błąd w GitHub URL
- Jeśli zobaczysz komunikat o błędzie *"Could not find your settings.py"*, prawdopodobnie nie udało Ci się dodać wszystkich plików do Git, i / lub nie przekazałeś ich do GitHub pomyślnie. Jeszcze raz spójrz na sekcję Git powyżej

Jeśli odwiedzając swoją stronę zobaczysz błąd, to pierwszym miejscem, w którym powinnaś poszukać informacji o tym, co się stało jest twój **dziennik błędów** (ang. "error log"). Znajdziesz do niego link na karcie [Web](https://www.pythonanywhere.com/web_app_setup/) w PythonAnywhere. Sprawdź czy znajdują się tam jakieś komunikaty o błędach; te najświeższe znajdują się na samym dole strony.

Są tam też dostępne [generalne porady odnośnie debugowania na stronie pomocy PythonAnywhere](http://help.pythonanywhere.com/pages/DebuggingImportError).

I pamiętaj, Twój mentor jest tutaj, by Ci pomóc!

# Sprawdź swoją stronę!

Standardowa strona dla twojej witryny powinna brzmieć "It worked!", tak jak na twoim komputerze lokalnym. Jeśli dodasz `/admin/` na koniec swojego adresu URL, powinnaś się przenieść do panelu admina. Zaloguj się swoim loginem i hasłem, a wtedy zobaczysz, że jesteś w stanie dodawać nowe posty na serwerze.

Jak już stworzysz kilka artykułów, możesz wrócić do swojego lokalnego środowiska (nie do PythonAnywhere). Od teraz powinnaś pracować na swoim lokalnym komputerze, jeżeli będziesz chciała dokonać zmian na stronie. To częsty sposób pracy w rozwijaniu stron www - wprowadzaj zmiany lokalnie, wypychaj je na GitHuba i zaciągaj na swój internetowy serwer www. Pozwala to na pracę i eksperymentowanie bez obawy, że zepsujesz działającą stronę. Całkiem nieźle, co nie?

*Przybij piątkę!* Wdrażanie to jedna z najtrudniejszych i najbardziej skomplikowanych części projektowania stron internetowych. Często całemu zespołowi ludzi zajmuje to kilka dni zanim wszystko zacznie działać. Ale Tobie tak szybko udało się wdrożyć swoją stronę, jest ona w prawdziwym internecie!