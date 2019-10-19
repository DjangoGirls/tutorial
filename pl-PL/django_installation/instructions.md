> Fragmenty tego rozdziału napisane są w oparciu o kurs Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Fragmenty tego rozdziału są oparte o tutorial [django-marcador](http://django-marcador.keimlink.de/) na licencji Creative Commons Attribution-ShareAlike 4.0 International. Tutorial django-marcador jest chroniony prawami autorskimi przez Markusa Zapke-Gründemanna i in.

## Środowisko wirtualne

Zanim zainstalujemy Django, zapoznamy się z niezwykle użytecznym narzędziem, które pomoże utrzymać porządek poczas pracy z kodem na Twoim komputerze. Można ten krok pominąć, ale zachęcamy, żebyś tego nie robiła. Dobrze jest zacząć z możliwie najlepszą konfiguracją, gdyż zaoszczędzi Ci to wielu problemów w przyszłości!

Stwórzmy zatem **środowisko wirtualne** (zwane też *virtualenv*). Jego zadaniem jest oddzielenie środowiska Pythona/Django dla każdego projektu z osobna. Oznacza to, że zmiany dokonane w obrębie jednej aplikacji nie wpłyną na działanie innych, nad którymi pracujesz. Sprytne, prawda?

Jedyne, co potrzebujesz zrobić, to wybrać katalog, w którym chcesz utworzyć `virtualenv`; na przykład Twój katalog domowy. Na Windowsie może on wyglądać jak `C:\Users\Name` (gdzie `Name` jest twoim loginem).

> **UWAGA:** W Windowsie upewnij się, że katalog ten nie zawiera znaków akcentowanych lub specjalnych; Jeśli Twoja nazwa użytkownika zawiera znaki akcentowane, użyj innego katalogu, na przykład `C:\djangogirls`.

Na potrzeby kursu będziemy tworzyć nowy katalog `djangogirls` w Twoim katalogu domowym:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Stwórzmy nowe środowisko wirtualne o nazwie `myvenv`. Polecenie ma następujący format:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Aby utworzyć nowego `virtualenv`'a, musisz otworzyć okno wiersza polecenia i wykonać polecenie `python -m venv myvenv`. Będzie to wyglądać tak:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Gdzie `myvenv` to nazwa Twojego `virtualenv`'a. Nazwa może być dowolna, ale lepiej używać tylko małych liter, bez spacji i polskich znaków. Dobrze jest też trzymać się krótkich nazw - będziesz do nich często wracała!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Możemy stworzyć `virtualenv`'a w Linuksie i OS X poprzez użycie jedynie polecenia `python3 -m venv myvenv`. Przyjmie ono następującą postać:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` to nazwa Twojego `virtualenv`'a. Nazwa środowiska może być dowolna, ale lepiej używać tylko małych liter, bez spacji i polskich znaków. Dobrze jest też trzymać się krótkich nazw - będziesz do nich często wracała!

> **UWAGA:** W niektórych wersjach Debiana/Ubuntu może pojawić się następujący komunikat o błędzie:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> W tym przypadku, wykonaj powyższe instrukcje i zainstaluj pakiet `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3-venv
>     
> 
> **UWAGA:** W niektórych wersjach Debiana/Ubuntu inicjowanie środowiska wirtualnego w ten sposób daje obecnie następujący błąd:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Aby uniknąć tego problemu, użyj polecenia `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **UWAGA:** Jeśli wystąpi błąd taki jak
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> to zamiast tego wykonaj:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Praca z virtualenv

Powyższa instrukcja utworzy katalog o nazwie `myvenv` (albo o nazwie, którą wybrałaś) zawierający nasze środowisko wirtualne (czyli w zasadzie zbiór katalogów i plików).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Uruchom wirtualne środowisko za pomocą polecenia:

{% filename %}command-line{% endfilename %}

    C:\Użytkownicy\Nazwa\djangogirls> myvenv\Scripts\activate
    

> **Uwaga:** W systemie Windows 10 możesz otrzymać błąd w programie Windows PowerShell, który mówi, `wykonywanie skryptów jest wyłączone w tym systemie`. W tym przypadku, otwórz inny Windows PowerShell z opcją "Uruchom jako Administrator". Następnie spróbuj, wpisując następujące polecenie przed rozpoczęciem środowiska wirtualnego:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Uruchom wirtualne środowisko za pomocą polecenia:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Nie zapomnij zastąpić `myvenv` nazwą, którą wybrałaś dla Twojego `virtualenv`!

> **UWAGA:** może się zdarzyć, że polecenie `source` nie będzie dostępne. W takim przypadku spróbuj użyć poniższego:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

O tym, że Twój `virtualenv` jest uruchomiony, dowiesz się, gdy zobaczysz w swojej konsoli prompt poprzedzony przedrostkiem `(myvenv)`.

W trakcie pracy ze środowiskiem wirtualnym `python` będzie automatycznie odnosił się do właściwej wersji, dzięki czemu możesz używać polecenia `python` zamiast `python3`.

Świetnie, wszystkie potrzebne elementy są już gotowe. Nareszcie możemy zainstalować Django!

## Instalowanie Django

Teraz, gdy Twój `virtualenv` jest już uruchomiony, możesz zainstalować Django.

Zanim jednak to zrobimy, powinniśmy się upewnić, że mamy najnowszą wersję `pip`, oprogramowania, które używamy do zainstalowania Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

### Instalacja pakietów z pliku wymagań

Plik wymagań zawiera listę zależności, które zainstalujemy za pomocą polecenia `pip install`:

Najpierw stwórz plik `requirements.txt` wewnątrz katalogu `djangogirls/` używając edytora kodu, który wcześniej zainstalowałaś. Aby to zrobić, otwórz nowy plik w edytorze kodu, a następnie zapisz go jako ` requirements.txt ` w folderze ` djangogirls / </ 0>. Twój katalog będzie wyglądał następująco:</p>

<pre><code>djangogirls
├── myvenv
│   └── ...
└───requirements.txt
`</pre> 

W swoim pliku `djangogirls/requirements.txt` powinnaś dodać następujący tekst:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Teraz możesz uruchomić `pip install -r requirements.txt`, aby zainstalować Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

To wszystko! Teraz (nareszcie) jesteś gotowa do stworzenia aplikacji w Django!