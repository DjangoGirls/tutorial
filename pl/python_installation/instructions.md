> Niniejszy podrozdział powstał w oparciu o kurs Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django został napisany w Pythonie. Potrzebujemy Pythona, żeby móc cokolwiek zrobić w Django. Zacznijmy zatem od zainstalowania go! Potrzebujemy zainstalować Pythona 3.6.0, dlatego jeżeli masz już zainstalowaną jakąkolwiek starszą wersję, będziesz musiała ją uaktualnić.

Pliki instalacyjne Pythona możesz pobrać z tej strony: https://www.python.org/downloads/release/python-360/. Lista plików do pobrania, dla wszystkich systemów znajduje się na samym dole strony. Poniżej są szczegółowe instrukcje instalacji, w zależności od Twojego systemu operacyjnego.

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

Wybierz wersję instalacyjną, odpowiednią dla Twojego systemu. Poniżej na zdjęciu zaznaczone są wersje dla systemu 64-bitowego (kolor zielony), oraz dla systemu 32-bitowego (kolor niebieski).
Jeśli nie jesteś pewna jaki jest Twój system, to nie bój się zapytać mentora.

![Lista plików instalacyjnych dla Windows](../python_installation/images/choose_version_win.png)

Po pobraniu odpowiedniego pliku np. **python-3.6.0-amd64.exe** dla systemu 64-bitowego *(lub python-3.6.0.exe dla 32-bitowego, numer wersji może się zmieniać)*, uruchom go (klikając dwukrotnie na niego) i postępuj według wyświetlanych instrukcji:
* na pierwszym ekranie wybierz opcję **Customize installation**
* na drugim ekranie "Optional features" zaznacz wszystkie opcje oprócz "for all users"
* na trzecim ekranie "Advanced Options" zaznacz nastęujące opcje:
  * Associate files with Python
  * Create shortcuts for installed Applications
  * Add Python to environment variables **WAŻNE**  

W okienku "Customize install location" znajduje się ścieżka do folderu, w którym będzie zainstalowany Python. Jeśli chcesz, możesz wskazać inne miejsce do którego ma zostać zainstalowany Python, upewnij się tylko, aby opcja "Add Python to environment..." była zaznaczona. Zapisz też sobie gdzieś, ścieżkę, w której Python będzie zainstalowany.

Jeśli masz wszystkie opcje zaznaczone jak na poniższym obrazku oraz zapisałaś sobie ścieżkę, to możesz nacisnąć przycisk **Install**

Koniecznie zapamiętaj ścieżkę (katalog), w którym zainstalowałaś Pythona. Będzie Ci niebawem potrzebna!

![Opcje zaawansowane instalatora](../python_installation/images/advanced_options_win.png)

<!--endsec-->

### Linux

Jest bardzo prawdopodobne, że masz już zainstalowanego Pythona wraz z systemem. Aby się upewnić (a także sprawdzić jego wersję) otwórz konsolę i wpisz następujące polecenie:

    $ python3 --version
    Python 3.4.3


Jeżeli nie masz zainstalowanego Pythona lub chciałabyś zainstalować go w innej wersji, skorzystaj z jednego z poniższych sposobów:

#### Debian lub Ubuntu

Wpisz w konsoli poniższe polecenie:

    $ sudo apt-get install python3.4


#### Fedora (do 21)

Użyj następującego polecenia w konsoli:

    $ sudo yum install python3.4


#### Fedora (22+)

Użyj następującego polecenia w konsoli:

    $ sudo dnf install python3.4


#### openSUSE

Użyj następującego polecenia w konsoli:

    $ sudo zypper install python3


### OS X

Przejdź na stronę https://www.python.org/downloads/release/python-343/ i pobierz instalator Pythona:

  * Pobierz plik o nazwie *Mac OS X 64-bit/32-bit installer*,
  * Kliknij dwukrotnie na *python-3.4.3-macosx10.6.pkg*, by uruchomić instalator.

Sprawdź, czy instalacja zakończyła się pomyślnie - otwórz aplikację *Terminal* i uruchom polecenie `python3`:

    $ python3 --version
    Python 3.4.3


* * *

W razie jakichkolwiek wątpliwości albo jeśli coś poszło nie tak i nie wiesz, co dalej robić - zapytaj mentora lub osobę prowadzącą kurs! Czasami nie wszystko idzie tak, jak powinno i najlepszym wyjściem z sytuacji jest poprosić o pomoc kogoś bardziej doświadczonego.
