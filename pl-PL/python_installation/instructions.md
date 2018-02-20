> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Niniejszy podrozdział powstał w oparciu o kurs Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django jest napisane w Pythonie. Musimy posiadać Pythona by zrobić cokolwiek w Django. Zacznijmy od jego instalacji! Chcemy zainstalować Python 3.6, więc jeżeli posiadasz jakąkolwiek wcześniejszą wersję, będziesz musiała ją uaktualnić.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

First check whether your computer is running a 32-bit version or a 64-bit version of Windows, by pressing the Windows key + Pause/Break key which will open your System info, and look at the "System type" line. You can download Python for Windows from the website https://www.python.org/downloads/windows/. Click on the "Latest Python 3 Release - Python x.x.x" link. If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 executable installer**. Otherwise, download the **Windows x86 executable installer**. After downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![Nie zapomnij dodać Pythona do ścieżki systemowej (ang. Path)](../python_installation/images/python-installation-options.png)

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu → Windows System → Command Prompt. You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window. (On newer versions of Windows, you might have to search for "Command Prompt" since it's sometimes hidden.)

![Wpisz "cmd" w oknie "Uruchom""](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python 3.6 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

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
    

Jeżeli masz zainstalowaną inną 'mikrowersję' Pythona, np. 3.6.0, to nie ma potrzeby, byś dokonywała aktualizacji. Jeżeli nie masz zainstalowanego Pythona lub chciałabyś zainstalować go w innej wersji, skorzystaj z jednego z poniższych sposobów:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Wpisz w konsoli poniższe polecenie:

{% filename %}command-line{% endfilename %}

    $ sudo apt-get install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Użyj następującego polecenia w konsoli:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Jeżeli używasz starszej wersji Fedory możesz dostać wiadomość o błędzie, że polecenie `dnf` nie zostało znalezione. W takim wypadku powinnaś użyć yum.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Użyj następującego polecenia w konsoli:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Sprawdź, czy instalacja zakończyła się pomyślnie - otwórz wiersz poleceń i uruchom polecenie `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**Uwaga:** Jeżeli pracujesz na Windowsie i dostajesz wiadomość o błędzie, że `python3` nie został znaleziony, spróbuj użyć `python` (without `3`) oraz sprawdź czy być może w taki sposób uruchomisz Pythona 3.6.

* * *

W razie jakichkolwiek wątpliwości albo jeśli coś poszło nie tak i nie wiesz, co dalej robić, zapytaj mentora lub osobę prowadzącą kurs! Czasami nie wszystko idzie tak, jak powinno i najlepszym wyjściem z sytuacji jest poprosić o pomoc kogoś bardziej doświadczonego.