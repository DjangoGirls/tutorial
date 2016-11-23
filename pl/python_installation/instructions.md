> Niniejszy podrozdział powstał w oparciu o kurs Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django został w napisany w Pythonie. Potrzebujemy Pythona, żeby móc zrobić cokolwiek w Django. Zacznijmy zatem od zainstalowania go! Potrzebujemy zainstalować Pythona 3.4, dlatego jeżeli masz już zainstalowaną jakąkolwiek starszą wersję, będziesz musiała ją uaktualnić.

### Windows

Możesz ściągnąć Pythona pod Windows z tej strony: https://www.python.org/downloads/release/python-343/. Po pobraniu pliku ***.msi**, uruchom go (klikając dwukrotnie na niego) i postępuj według wyświetlanych instrukcji. Koniecznie zapamiętaj ścieżkę (katalog), w którym zainstalowałaś Pythona. Będzie Ci niebawem potrzebna!

Na jedno trzeba zwrócić uwagę: na drugiej stronie instalatora nazwanej "Customize" ("Dostosuj do potrzeb") przewiń na sam dół i wybierz "Add python.exe to the Path" ("Dodaj python.exe do ścieżki systemowej"), tak jak to zostało pokazane na poniższym obrazku:

![Nie zapomnij dodać Pythona do ścieżki systemowej (ang. Path)](../python_installation/images/add_python_to_windows_path.png)

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
