> Fragmenty tego rozdziału napisane są w oparciu o kurs Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Fragmenty tego rozdziału są oparte o tutorial [django-marcador](http://django-marcador.keimlink.de/) na licencji Creative Commons Attribution-ShareAlike 4.0 International. Tutorial django-marcador jest chroniony prawami autorskimi przez Markusa Zapke-Gründemanna i in.

## Środowisko wirtualne

Zanim zainstalujemy Django, zapoznamy się z niezwykle użytecznym narzędziem, które pomoże utrzymać porządek poczas pracy z kodem na Twoim komputerze. Można ten krok pominąć, ale zachęcamy, żebyś tego nie robiła. Dobrze jest zacząć z możliwie najlepszą konfiguracją, gdyż zaoszczędzi Ci to wielu problemów w przyszłości!

Stwórzmy zatem **środowisko wirtualne** (zwane też *virtualenv*). Jego zadaniem jest oddzielenie środowiska Pythona/Django dla każdego projektu z osobna. Oznacza to, że zmiany dokonane w obrębie jednej aplikacji nie wpłyną na działanie innych, nad którymi pracujesz. Sprytne, prawda?

Jedyne, co potrzebujesz zrobić, to wybrać katalog, w którym chcesz utworzyć `virtualenv`; na przykład Twój katalog domowy. W systemie Windows może on wyglądać tak: `C:\Użytkownicy\Nazwa` (gdzie `Nazwa` to twoja nazwa użytkownika, której używasz przy logowaniu się do komputera).

Na potrzeby kursu będziemy stwórzmy nowy katalog `djangogirls` w Twoim katalogu domowym:

    mkdir djangogirls
    cd djangogirls
    

Stwórzmy nowe środowisko wirtualne o nazwie `myvenv`. Polecenie ma następujący format:

    python3 -m venv myvenv
    

### Windows

Aby stworzyć nowego `virtualenv`'a, musisz otworzyć konsolę (wspominaliśmy o tym parę rozdziałów temu, pamiętasz?) i uruchom `C:\ Python34\python -m venv venv`. Efekt będzie wyglądał tak:

    C:\Użytkownicy\Nazwa\djangogirls> C:\Python34\python -m venv myvenv
    

gdzie `C:\Python34\python` to katalog, w którym zainstalowałaś wcześniej Pythona, zaś `myvenv` to nazwa Twojego `virtualenv`'a. Nazwa może być dowolna, ale lepiej używać tylko małych liter, bez spacji i polskich znaków. Dobrze jest też trzymać się krótkich nazw - będziesz do nich często wracała!

### Linux i OS X

Stworzenie `virtualenv`'a w Linuksie i OS X ogranicza się jedynie do użycia polecenia `python3 -m venv myvenv`. Przyjmie ono następującą postać:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` to nazwa Twojego `virtualenv`'a. Nazwa środowiska może być dowolna, ale lepiej używać tylko małych liter, bez spacji i polskich znaków. Dobrze jest też trzymać się krótkich nazw - będziesz do nich często wracała!

> **UWAGA:** Próba utworzenia w ten sposób środowiska wirtualnego w Ubuntu 14.04 skutkuje następującym błędem:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Aby uniknąć tego problemu, użyj polecenia `virtualenv`.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Praca z virtualenv

Powyższa instrukcja utworzy katalog o nazwie `myvenv` (albo o nazwie, którą wybrałaś) zawierający nasze środowisko wirtualne (czyli w zasadzie zbiór katalogów i plików).

#### Windows

Uruchom wirtualne środowisko za pomocą polecenia:

    C:\Użytkownicy\Nazwa\djangogirls> myvenv\Scripts\activate
    

#### Linux i OS X

Uruchom wirtualne środowisko za pomocą polecenia:

    ~/djangogirls$ source myvenv/bin/activate
    

Nie zapomnij zastąpić `myvenv` nazwą, którą wybrałaś dla Twojego `virtualenv`!

> **UWAGA:** może się zdarzyć, że polecenie `source` nie będzie dostępne. W takim przypadku spróbuj użyć poniższego:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

O tym, że Twój `virtualenv` jest uruchomiony, dowiesz się, gdy zobaczysz w swojej konsoli prompt podobny do tego:

    (myvenv) C:\Użytkownicy\Nazwa\djangogirls>
    

lub:

    (myvenv) ~/djangogirls$
    

Zwróć uwagę, że pojawił się tam prefix `(myvenv)`!

W trakcie pracy ze środowiskiem wirtualnym `python` będzie automatycznie odnosił się do właściwej wersji, dzięki czemu możesz używać polecenia `python` zamiast `python3`.

Świetnie, wszystkie potrzebne elementy są już gotowe. Nareszcie możemy zainstalować Django!

## Instalowanie Django

Teraz, gdy Twój `virtualenv` jest już uruchomiony, możesz zainstalować Django za pomocą narzędzia `pip`. W konsoli uruchom polecenie `pip install django==1.8` (zwróć uwagę, że używamy podwójnego znaku równości: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

w systemie Windows

> Jeżeli w trakcie wywoływania polecenia pip otrzymasz błąd, sprawdź czy ścieżka Twojego projektu nie zawiera spacji (np. `C:\Users\Imie Nazwisko\djangogirls`). Jeżeli tak, sugerujemy przeniesienie projektu do innego katalogu bez spacji w nazwie (proponujemy `C:\djangogirls`). Gdy już to zrobisz, spróbuj wykonać powyższe polecenie jeszcze raz.

w systemie Linux

> Jeśli po użyciu polecenia pip w Ubuntu 12.04 otrzymasz błąd, użyj polecenia `python -m pip install -U --force-reinstall pip`, aby naprawić instalacją pip'a w środowisku wirtualnym.

To wszystko! Teraz (nareszcie) jesteś gotowa do stworzenia aplikacji w Django!
