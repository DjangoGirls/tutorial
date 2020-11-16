# Wdrażanie!

> **Uwaga:** Niniejszy rozdział może być miejscami dość trudny. Bądź dzielna i przestudiuj go do końca; wdrażanie jest ważną częścią pracy nad stroną. Celowo umieściłyśmy go tutaj, aby Twój mentor był w stanie pomóc Ci przejść przez skomplikowany proces opublikowania Twojej strony w sieci. Oznacza to, że możesz wciąż ukończyć tutorial samodzielnie, jeśli zabraknie Ci czasu.

Do teraz twoja strona była dostępna tylko na twoim komputerze. Właśnie teraz nauczymy się, jak ją wdrożyć! Wdrożenie to inaczej opublikowanie Twojej aplikacji w internecie, dzięki czemu możesz w końcu pokazać ją innym ludziom. :)

Jak już wiesz, strona internetowa musi znajdować się na jakimś serwerze. W internecie działa wielu dostawców serwerów. Skorzystamy z usług [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere jest darmowy dla małych aplikacji, które nie przyciągają zbyt wielu odwiedzających. Z pewnością jest wystarczający dla Ciebie.

Drugą zewnętrzną usługą, jakiej będziemy używać jest [GitHub](https://www.github.com), który przechowuje kod. Istnieją inne usługi, ale w dzisiejszych czasach prawie wszyscy programiści mają konto na GitHubie - i Ty dzisiaj do nich dołączysz!

Te trzy miejsca będą dla Ciebie bardzo ważne. Twój lokalny komputer będzie miejscem, w którym będziesz rozwijać i testować swoją aplikację. Kiedy będziesz zadowolona ze swoich zmian, kod swojego programu umieścisz na GitHubie. Twoja strona za to będzie dostępna na PythonAnywhere i wszystkie zmiany będziesz tam ściągał ze swojej kopii kodu na GitHubie.

# Git

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

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

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder
    static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

I zapisz go jako `.gitignore` w katalogu "djangogirls".

> **Uwaga** Ta kropka na początku nazwy pliku jest ważna! Jeżeli masz problem podczas tworzenia tego pliku (MacOS ma na przykład problem z tworzeniem plików zaczynających się od kropki za pomocą Findera), to spróbuj użyć polecenia "Zapisz jako" w swoim edytorze, to akurat jest niezawodne. I upewnij się, że nie dodałaś .txt, .py lub jakiegokolwiek innego rozszerzenia do nazwy pliku. Zostanie on rozpoznany przez Gita tylko wtedy, gdy jego nazwą jest po prostu .gitignore. Linux and MacOS treat files with a name that starts with `.` (such as `.gitignore`) as hidden and the normal `ls` command won't show these files. Instead use `ls -a` to see the `.gitignore` file.
> 
> **Uwaga** Jednym z plików, który wyszczególniliśmy w `.gitignore` to `db.sqlite3`. Ten plik to Twoja lokalna baza danych, w której przechowywani są wszyscy Twoi użytkownicy i posty. Będziemy podążać za standardem praktyki programowania webowego, co oznacza, że będziemy używać oddzielnych baz danych dla naszej lokalnej strony testowej oraz produkcyjnej witryny na PythonAnywhere. Bazą danych dla PythonAnywhere może być SQLite, tak jak na Twojej lokalnej maszynie. Najczęściej natomiast będziesz korzystać z bazy MySQL, która potrafi poradzić sobie z dużo większą ilością odwiedzających niż SQLite. W każdym razie, zignorowanie Twojej bazy SQLite w kopii dla GitHuba oznacza, że wszystkie posty i użytkownicy, których do tej pory stworzyłaś, będą dostępne jedynie lokalnie i będziemy musiały dodać ich ponownie na środowisku produkcyjnym. Powinnaś myśleć o swojej lokalnej bazie danych jako o dobrym placu zabaw, na którym możesz testować różne rzeczy nie bojąc się, że skasujesz prawdziwe artykuły ze swojego bloga.

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
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

I na końcu zapisujemy zmiany. Przejdź do konsoli i wykonaj poniższe polecenia:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Przesyłanie kodu do GitHuba

Wejdź na stronę [GitHub.com](https://www.github.com) i załóż darmowe konto użytkownika. (Jeśli zrobiłaś to na warsztatach przygotowawczych to świetnie). Zapamiętaj hasło do swojego konta (dodaj je do swojego menedżera haseł, jeśli go używasz).

Następnie utwórz nowe repozytorium i nadaj mu nazwę "my-first-blog" (ang. "mój-pierwszy-blog"). Pozostaw niezaznaczone pole wyboru "initialize with README", pozostaw opcję .gitignore pustą (zrobiłyśmy to ręcznie) i pozostaw licencję jako None.

![](images/new_github_repo.png)

> **Uwaga** Nazwa `my-first-blog` jest ważna - mogłabyś wybrać jakąś inną, ale będziemy tej nazwy używać wiele razy i za każdym razem musiałabyś pamiętać, żeby zastępować "my-first-blog" swoją wybraną nazwą. Z tego powodu najłatwiej będzie jak użyjesz nazwy `my-first-blog`.

Na następnym obrazku zostanie wyświetlony Twój URL do klonowania repozytorium, którego będziesz używać w niektórych poleceniach.

![](images/github_get_repo_url_screenshot.png)

Teraz musimy podpiąć repozytorium Git na komputerze do tego na GitHubie.

Wpisz następujące polecenie do konsoli (zamień <your-github-username> na swoją nazwę użytkownika, którą podałaś przy tworzeniu konta na GitHubie. Nie zapomnij o usunięciu nawiasów ("<" i ">"), ten URL powinien pasować do URL-a klonującego Twoje repozytorium.

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Po wykonaniu komendy push na GitHuba zostaniesz zapytana o swoją nazwę użytkownika i hasło (albo bezpośrednio w wierszu poleceń w oknie terminala albo w wyskakującym okienku). Po poprawnym wpisaniu użytkownika i hasła powinnaś zobaczyć coś takiego:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    
    To https://github.com/ola/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Twój kod jest teraz na GitHubie. Możesz to sprawdzić! Znajdujesz się teraz w wyśmienitym towarzystwie - [Django](https://github.com/django/django), [kurs Django Girls](https://github.com/DjangoGirls/tutorial) i wiele innych świetnych projektów open-source trzyma swój kod na GitHubie! :)

# Wdrażanie bloga na PythonAnywhere

## Zakładanie konta na PythonAnywhere

> **Uwaga** Możliwe, że już wcześniej utworzyłaś konto na PythonAnywhere, jeśli przeszłaś przez wszystkie kroki w rozdziale instalacyjnym - nie ma potrzeby, byś robiła to drugi raz.

{% include "/deploy/signup_pythonanywhere.md" %}

## Konfigurowanie naszej strony w PythonAnywhere

Wróć do głównego panelu [PythonAnywhere Dashboard](https://www.pythonanywhere.com/), klikając logo i wybierz opcję uruchomienia konsoli "Bash" - jest to wersja wiersza polecenia PythonAnywhere, podobnie jak na Twoim komputerze.

![Sekcja 'New Console' na stronie PythonAnywhere z przyciskiem 'bash'](images/pythonanywhere_bash_console.png)

> **Uwaga** PythonAnywhere jest oparty na Linuksie, więc jeśli pracujesz na Windowsie, to konsola będzie wyglądać trochę inaczej, niż na Twoim komputerze.

Wdrożenie aplikacji internetowej w PythonAnywhere polega na ściągnięciu kodu z GitHuba, a następnie skonfigurowaniu PythonAnywhere w celu rozpoznania go i rozpoczęciu wyświetlania go jako aplikacji internetowej. Istnieją manualne sposoby robienia tego, ale PythonAnywhere zapewnia narzędzie pomocnicze, które zrobi to wszystko za Ciebie. W pierwszej kolejności zainstalujmy:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

To powinno wydrukować rzeczy takie jak `Collecting pythonanywhere`, a skończyć się na linii z napisem `Successfully installed (...) pythonanywhere- (...)`.

Teraz uruchamiamy pomocnika, aby automatycznie skonfigurować naszą aplikację z GitHubem. Wpisz następujące polecenie do konsoli w PythonAnywhere (nie zapomnij zamienić <your-github-username> na Twoją nazwę użytkownika GitHub, tak by Twój URL pasował do klonowanego URL-a z GitHuba).

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

Jeżeli patrzysz na proces, będziesz mogła zobaczyć:

- Pobieranie kodu z GitHuba
- Tworzenie środowiska wirtualnego na PythonAnywhere, podobnie jak na Twoim komputerze.
- Aktualizowanie pliku ustawień z niektórych ustawień wdrażania
- Konfigurowanie bazy danych w PythonAnywhere za pomocą polecenia `manage.py migrate`
- Konfigurowanie plików statycznych (dowiemy się o nich później)
- I konfigurowanie PythonAnywhere do obsługi aplikacji internetowej za pomocą interfejsu API

W PythonAnywhere wszystkie te kroki są zautomatyzowane, ale są to te same kroki, które trzeba wykonać z dowolnym innym dostawcą serwera.

Najważniejszym w tej chwili jest to, aby zapamiętać, że baza danych w PythonAnywhere jest całkowicie oddzielona od bazy danych na Twoim komputerze, co oznacza, że może mieć inne posty i konta administracyjne. W rezultacie, tak jak zrobiłyśmy to wcześniej na własnym komputerze, musimy zainicjować konto administratora za pomocą `createsuperuser`. PythonAnywhere automatycznie aktywował dla Ciebie Twojego virtualenva, więc jedyne, co musisz zrobić, to uruchomić:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Wpisz szczegóły dla konta swojego administratora. Najlepiej używać tych samych, których używasz na swoim komputerze, aby uniknąć nieporozumień, chyba że chcesz, aby hasło w PythonAnywhere było bezpieczniejsze.

Teraz, jeśli chcesz, możesz również rzucić okiem na swój kod w PythonAnywhere używając `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py tests.py  static
    templates  views.py
    

Możesz także przejść do zakładki "Pliki" i poruszać się za pomocą wbudowanej przeglądarki plików w PythonAnywhere. (Ze strony konsoli możesz przejść do innych stron PythonAnywhere za pomocą przycisku menu w prawym górnym rogu. Po przejściu na jedną ze stron, w pobliżu góry zobaczysz linki do innych.)

## Jesteś na żywo!

Twoja strona powinna teraz być dostępna w publicznym internecie! Przejdź do zakładki "Sieć" PythonAnywhere, aby uzyskać link do niej. Możesz podzielić się tym, z kimkolwiek chcesz! :)

> **Uwaga:** Jest to poradnik dla początkujących, a podczas wdrażania tej witryny użyłyśmy kilka skrótów, które nie są idealnym rozwiązaniem z punktu widzenia bezpieczeństwa. Jeśli zdecydujesz się zbudować ten projekt lub rozpocząć nowy projekt, należy przejrzeć [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/), aby uzyskać pewne wskazówki dotyczące zabezpieczania witryny.

## Porady dotyczące debugowania

Jeśli widzisz błąd podczas uruchamiania skryptu `pa_autoconfigure_django.py`, oto kilka typowych przyczyn:

- Zapominasz utworzyć Twój PythonAnywhere API token.
- Robisz błąd w GitHub URL
- Jeśli zobaczysz komunikat o błędzie *"Could not find your settings.py"*, prawdopodobnie nie udało Ci się dodać wszystkich plików do Git, i / lub nie przekazałeś ich do pomyślnie do GitHuba. Jeszcze raz spójrz na sekcję Git powyżej
- Jeśli wcześniej zarejestrowałeś konto PythonAnywhere i wystąpił błąd z collectstatic, prawdopodobnie masz starszą wersję SQLite (np. 3.8.2) dla Twojego konta. W takim przypadku zarejestruj nowe konto i wypróbuj polecenia z sekcji PythonAnywhere powyżej.

Jeśli odwiedzając swoją stronę zobaczysz błąd, to pierwszym miejscem, w którym powinnaś poszukać informacji o tym, co się stało, jest Twój **dziennik błędów** (ang. "error log"). Znajdziesz do niego link na stronie [Web](https://www.pythonanywhere.com/web_app_setup/) w PythonAnywhere. Sprawdź, czy znajdują się tam jakieś komunikaty o błędach - te najświeższe znajdują się na samym dole.

Są tam też dostępne [generalne porady odnośnie debugowania na stronie pomocy PythonAnywhere](http://help.pythonanywhere.com/pages/DebuggingImportError).

I pamiętaj, Twój mentor jest tutaj, by Ci pomóc!

# Sprawdź swoją stronę!

Domyślna strona Twojej witryny powinna brzmieć "It worked!", tak jak na Twoim lokalnym komputerze. Spróbuj dodać `/admin/` na koniec swojego adresu URL - powinnaś się przenieść do panelu admina. Zaloguj się za pomocą nazwy użytkownika i hasła. Zobaczysz, że możesz dodać nowy Post na serwerze - pamiętaj, posty z Twojej lokalnej, testowej bazy danych nie będą wysyłane na Twojego produkcyjnego bloga.

Po utworzeniu kilku postów możesz wrócić do konfiguracji lokalnej (nie PythonAnywhere). Od teraz powinnaś pracować na swoim lokalnym komputerze, jeżeli będziesz chciała dokonać zmian na stronie. To częsty sposób pracy w rozwijaniu stron WWW - wprowadzaj zmiany lokalnie, wypychaj je na GitHuba i zaciągaj na swój internetowy serwer WWW. Pozwala to na pracę i eksperymentowanie bez obawy, że zepsujesz działającą stronę. Całkiem nieźle, co nie?

*Przybij piątkę!* Wdrożenia strony na serwery są jednym z najtrudniejszych elementów tworzenia stron internetowych i często ludzie potrzebują kilku dni, zanim wszystko zacznie poprawnie działać. Ale Tobie udało się wdrożyć swoją stronę, jest ona w prawdziwym internecie!