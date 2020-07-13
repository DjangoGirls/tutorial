> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Niniejszy podrozdział powstał w oparciu o kurs Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Framework Django został napisany w Pythonie. Potrzebujemy Pythona, żeby móc zrobić cokolwiek w Django. Zacznijmy zatem od zainstalowania go! Chcemy zainstalować Pythona 3.6, więc jeżeli posiadasz jakąkolwiek wcześniejszą wersję, będziesz musiała ją uaktualnić. Jeśli masz już w wersji 3.4 lub nowszej, powinno być dobrze.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Najpierw sprawdź, czy na komputerze działa 32- lub 64-bitowa wersja systemu Windows, w linijce "Typ systemu" w oknie o informacjach o systemie. Aby przejść do tego okna, wypróbuj jedną z następujących metod:

* Wciśnij klawisz Windows i klawisz Pause/Break w tym samym czasie
* Otwórz panel sterowania z menu systemu Windows, a następnie przejdź do Zabezpieczenia Systemu, a następnie System
* Wciśnij przycisk Windows, a następnie przejdź do Settings>System>About
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. It will start making suggestions as soon as you type. You can select the entry once it shows up.

Możesz ściągnąć Pythona dla Windowsa ze strony https://www.python.org/downloads/windows/. Kliknij w link "Latest Python 3 Release - Python x.x.x". Jeżeli twój komputer pracuje na **64-bitowej** wersji Windowsa, ściągnij **Windows x86-64 executable installer**. W innym wypadku ściągnij **Windows x86 executable installer**. Po ściągnięciu instalatora, powinnaś go uruchomić (klikając dwukrotnie w niego) i postępować według wyświetlanych instrukcji.

Jedna rzecz, na którą trzeba uważać: podczas instalacji zauważysz okno zaznaczone jako "Setup". Upewnij się, że zaznaczyłaś opcję "Add Python 3.6 to PATH" lub ''Add Python to your environment variables" i kliknęłaś "Install Now", jak pokazano tutaj (może to wyglądać trochę inaczej, jeśli instalujesz inną wersję).

![Nie zapomnij dodać Pythona do ścieżki systemowej (ang. Path)](../python_installation/images/python-installation-options.png)

Kiedy instalacja się zakończy, możesz zobaczyć okienko dialogowe z linkiem, który możesz śledzić, aby dowiedzieć się więcej o Pythonie lub wersji, którą zainstalowałaś. Zamknij lub anuluj to okienko - nauczysz się więcej w tym tutorialu!

Uwaga: jeżeli używasz starszej wersji Windowsa (7, Vista lub jakikolwiek starszy) i podczas instalacji Python 3.6.x dostaniesz błąd, możesz:

1. zainstalować wszystkie uaktualnienia systemu Windows i spróbować instalacji Pythona 3.6 jeszcze raz; lub
2. zainstalować [starszą wersję Pythona](https://www.python.org/downloads/windows/), np. [3.4.6](https://www.python.org/downloads/release/python-346/).

Jeżeli zainstalujesz starszą wersję Pythona, ekrany instalatora mogą wyglądać nieznacznie inaczej niż pokazane wyżej. Upewnij się, że przewinęłaś do "Add python.ext to Path", kliknęłaś przycisk po lewej i wybrałaś "Will be installed on local hard drive":

![Dodawanie Pythona do zmiennej Path, starsze wersje](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Uwaga** Zanim zainstalujesz Pythona na OS X, musisz się upewnić, że ustawienia twojego Maca pozwolą na instalację pakietów, które nie pochodzą z App Store'a. Przejdź do Preferencji systemowych (znajdziesz je w folderze Aplikacje), kliknij "Ochrona i prywatność" i przejdź do zakładki "Ogólne". Jeżeli w "Dopuszczaj aplikacje pobrane z:" jest ustawione na "App Store", zmień to na "App Store i od zidentyfikowanych deweloperów".

Przejdź na stronę https://www.python.org/downloads/release/python-361/ i pobierz instalator Pythona:

* Pobierz plik o nazwie *Mac OS X 64-bit/32-bit installer*,
* Kliknij dwukrotnie na *python-3.6.1-macosx10.6.pkg*, by uruchomić instalator.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Jest bardzo prawdopodobne, że masz już zainstalowanego Pythona wraz z systemem. Aby się upewnić (a także sprawdzić jego wersję) otwórz konsolę i wpisz następujące polecenie:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Jeżeli masz zainstalowaną inną 'mikrowersję' Pythona, np. 3.6.0, to nie ma potrzeby, byś dokonywała aktualizacji. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Wpisz w konsoli poniższe polecenie:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Użyj następującego polecenia w konsoli:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Jeżeli używasz starszej wersji Fedory, możesz dostać wiadomość o błędzie, że polecenie `dnf` nie zostało znalezione. W takim wypadku zamiast tego użyj polecenia `yum`.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Użyj następującego polecenia w konsoli:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Sprawdź, czy instalacja zakończyła się pomyślnie - otwórz wiersz polecenia i uruchom polecenie `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Pokazana wersja może różnić się od 3.6.1 - powinna pasować do wersji, którą zainstalowałeś.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

W razie jakichkolwiek wątpliwości albo jeśli coś poszło nie tak i nie wiesz, co dalej robić, zapytaj mentora lub osobę prowadzącą kurs! Czasami nie wszystko idzie tak, jak powinno i najlepszym wyjściem z sytuacji jest poprosić o pomoc kogoś bardziej doświadczonego.