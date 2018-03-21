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
    

## Przesyłanie kodu do GitHub

Wejdź na stronę [GitHub.com](https://www.github.com) i utwórz nowe darmowe konto. (Jeśli już to wcześniej zrobiłaś to super!)

Następnie utwórz nowe repozytorium i nadaj mu nazwę "my-first-blog" (ang. "mój-pierwszy-blog"). Pozostaw niezaznaczone pole wyboru "initialize with README", pozostaw opcję .gitignore pustą (zrobiłyśmy to ręcznie) i pozostaw licencję jako None.

![](images/new_github_repo.png)

> **Uwaga** Nazwa `my-first-blog` jest ważna - mogłabyś wybrać jakąś inną, ale będziemy tej nazwy używać wiele razy i za każdym razem musiałabyś pamiętać, żeby zastępować "my-first-blog" swoją wybraną nazwą. Z tego powodu najłatwiej będzie jak użyjesz nazwy `my-first-blog`.

Na następnej stronie wyświetli Ci się adres URL do klonowania Twojego repozytorium. Wybierz wersję "HTTPS", skopiuj go i niedługo będziemy go wklejać do terminala:

![](images/github_get_repo_url_screenshot.png)

Teraz musimy podpiąć repozytorium Git na komputerze do tego na GitHubie.

Wpisz następujące polecenie do konsoli (Zamień `<your-github-username>` na swoją nazwę użytkownika, którą podałaś przy tworzeniu konta na GitHubie, ale bez nawiasów ostrokątnych, czyli "<" i ">"):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Wpisz swoją nazwę użytkownika GitHub oraz hasło, a wtedy powinnaś zobaczyć coś takiego:

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': ola
    Password for 'https://ola@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    
    To https://github.com/ola/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Twój kod jest teraz na GitHubie. Możesz to sprawdzić! Zważ, że znajduje się w wyśmienitym towarzystwie - [Django](https://github.com/django/django), [kurs Django Girls](https://github.com/DjangoGirls/tutorial) i wiele innych świetnych projektów open-source trzyma swój kod na GitHubie. :)

# Wdrażanie bloga na PythonAnywhere

## Zakładanie konta na PythonAnywhere

> **Uwaga** Możliwe, że już wcześniej utworzyłaś konto na PythonAnywhere, jeśli przeszłaś przez wszystkie kroki w rozdziale instalacyjnym - nie ma potrzeby, byś robiła to drugi raz.

{% include "/deploy/signup_pythonanywhere.md" %}

## Konfigurowanie naszej strony w PythonAnywhere

Wróć do głównego panelu [PythonAnywhere Dashboard](https://www.pythonanywhere.com/), klikając logo, i wybierz opcję uruchomienia konsoli "Bash" - jest to wersja wiersza poleceń PythonAnywhere, podobnie jak na Twoim komputerze.

![Pointing at Bash in the New Console section](images/pythonanywhere_bash_console.png)

> **Uwaga** PythonAnywhere jest oparty na Linuksie, więc jeśli pracujesz na Windowsie to konsola będzie wyglądać trochę inaczej niż na Twoim komputerze.

Wdrożenie aplikacji internetowej w PythonAnywhere polega na ściągnięciu kodu z GitHub, a następnie skonfigurowaniu PythonAnywhere w celu rozpoznania go i rozpoczęciu wyświetlania go jako aplikacji internetowej. Istnieją manualne sposoby robienia tego, ale PythonAnywhere zapewnia narzędzie pomocnicze, które zrobi to wszystko za Ciebie. W pierwszej kolejności zainstalujmy:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own PC
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.

As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite  static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Zapominasz utworzyć Twój PythonAnywhere API token.
- Robisz błąd w GitHub URL
- Jeśli zobaczysz komunikat o błędzie *"Could not find your settings.py"*, prawdopodobnie nie udało Ci się dodać wszystkich plików do Git, i / lub nie przekazałeś ich do GitHub pomyślnie. Jeszcze raz spójrz na sekcję Git powyżej

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!