# Wprowadzenie do interfejsu wiersza poleceń

> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Za chwilę napiszesz swoją pierwszą linijkę kodu. Jesteś już podekscytowana? :)

**Pozwól, że przedstawimy Ci, Twojego pierwszego przyjaciela: wiersz poleceń!**

Następujące kroki pokażą Ci, jak wykorzystać tajemnicze czarne okno, które używają wszyscy hakerzy. Na początku może to wyglądać nieco przerażająco ale tak naprawdę to tylko zachęta do wpisywania komend.

> **Uwaga** Podczas tego kursu będziemy używać terminów "katalog" i "folder" zamiennie, ponieważ oznaczają one tę samą rzecz.

## Czym jest wiersz poleceń?

Okno zwane **wierszem poleceń** lub **interfejsem wiersza poleceń** jest aplikacją tekstową służącą do przeglądania, obsługi i operowania plikami na Twoim komputerze. Podobnie jak np. Eksplorator Windows lub Finder na Macu, ale bez interfejsu graficznego. Inne nazwy dla wiersza poleceń to *cmd*, *CLI*, *prompt*, *konsola* lub *terminal*.

## Uruchamiamy interfejs wiersza poleceń

Aby zacząć nasze eksperymenty, musimy najpierw otworzyć nasz wiersz poleceń.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Przejdź do menu Start → System → Wiersz polecenia.

> Na starszych wersjach Windowsa szukaj w menu Start → Wszystkie programy → Akcesoria → Wiersz poleceń.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Przejdź do Aplikacje → Narzędzia → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Prawdopodobnie gdzieś w menu Aplikacje → Akcesoria → Terminal, ale to może zależeć od wersji Twojego systemu. Jeżeli tam nie znajdziesz, po prostu zapytaj Google'a. :)

<!--endsec-->

## Znak zachęty

Teraz powinnaś zobaczyć białe lub czarne okno, które czeka na Twoje polecenia.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Jeżeli używasz Maca lub Linuksa, powinnaś zobaczyć `$`, tak jak poniżej:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

W systemie Windows ujrzysz znak `>`, o tak:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Każde polecenie będzie poprzedzone tym znakiem oraz jedną spacją, ale nie musisz ich przepisywać. Twój komputer zrobi to za Ciebie. :)

> Jedna mała uwaga: w Twoim przypadku prompt może być poprzedzony czymś jeszcze, np. `C:\Users\ola>` lub `Olas-MacBook-Air:~ ola$` i jest to w 100% poprawne.

Część do znaku `$` lub `>` razem z nim nazywana jest *znakiem zachęty wiersza poleceń* lub skrótowo *znakiem zachęty (promptem)*. Jego celem jest zachęcić Ciebie do wpisania jakiegoś polecenia.

W tutorialu, jeżeli będziemy chciały byś wpisała komendę, umieścimy przed nią również `$` lub `>`, a czasami nawet resztę znaku zachęty. Możesz śmiało zignorować lewą część i wpisać tylko komendę zaczynającą się za promptem.

## Twoja pierwsza komenda! 

Zacznijmy od wpisania następującego polecenia:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

A następnie wciśnij `enter`. Oto rezultat:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Jak widzisz, komputer właśnie wyświetlił Twoją nazwę użytkownika. Prawda, że sprytne? :)

> Staraj się zawsze przepisywać polecenia zamiast je kopiować i wklejać. W ten sposób zapamiętasz więcej!

## Podstawy

Każdy system operacyjny ma nieco inny zestaw komend dostępnych w wierszu poleceń, zatem postępuj według instrukcji odpowiadających Twojemu systemowi operacyjnemu. To co, spróbujemy?

### Bieżący katalog

Miło byłoby dowiedzieć się, gdzie teraz jesteśmy, co? No to sprawdźmy. Wpisz poniższe polecenie i wciśnij `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Uwaga: 'pwd' pochodzi od angielskiego skrótu 'print working directory', czyli wyświetl katalog roboczy - ten, w którym się aktualnie znajdujemy.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Uwaga: 'cd' pochodzi od 'change directory' (po polsku 'zmień katalog'). W PowerShell możesz używać pwd dokładnie tak samo jak w Linuksie lub Mac OS X.

<!--endsec-->

Prawdopodobnie ujrzysz coś podobnego na swoim komputerze. Kiedy otwierasz wiersz poleceń, zwykle jest on uruchamiany w folderze głównym Twojego konta użytkownika.

* * *

### Lista plików i folderów

Co znajduje się w środku? Fajnie byłoby się tego dowiedzieć. Sprawdźmy:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> Uwaga: W PowerShell możesz również używać 'ls' tak jak w Linuksie lub Mac OS X.<!--endsec-->

* * *

### Zmiana katalogu bieżącego

Przejdźmy teraz do naszego folderu Pulpit:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Sprawdźmy, czy coś się faktycznie zmieniło:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Tak, to tutaj!

> PRO tip: gdy wpiszesz `cd D` i wciśniesz przycisk `Tab` na klawiaturze, wiersz poleceń automatycznie uzupełni resztę nazwy, dzięki czemu będziesz mogła nawigować szybciej. Jeżeli istnieje więcej niż jeden folder o nazwie zaczynającej się na "D", wciśnij `Tab` dwukrotnie, aby wyświetlić listę możliwości.

* * *

### Tworzenie folderu

Co powiesz na stworzenie folderu cwiczenie na swoim pulpicie? Zrób to w ten sposób:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir cwiczenie
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir cwiczenie
    

<!--endsec-->

To niepozorne polecenie doda do Twojego pulpitu folder o nazwie `cwiczenie`. Możesz sprawdzić, czy na pewno został tam dodany - spójrz na swój pulpit albo uruchom polecenie `ls` lub `dir`! Spróbuj. :)

> PRO tip: Jeżeli nie chcesz w kółko wpisywać tych samych poleceń, wciśnij na klawiaturze klawisz ze `strzałką w górę` i `strzałką w dół` aby przewinąć listę poprzednio użytych poleceń.

* * *

### Ćwiczenie!

Małe wyzwanie dla Ciebie: wewnątrz świeżo utworzonego katalogu `cwiczenie` stwórz katalog o nazwie `test`. Użyj poleceń `cd` i `mkdir`.)

#### Rozwiązanie:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd cwiczenie
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd cwiczenie
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Gratulacje! :)

* * *

### Sprzątanie

Nie chcemy zostawić bałaganu, a zatem wyrzućmy wszystko, co do tej pory zrobiłyśmy.

Najpierw musimy wrócić do Pulpitu:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Wykonanie `cd` wraz z `..` przeniesie Cię do katalogu nadrzędnego (czyli tego, w którym znajduje się Twój aktualny katalog).

Sprawdź, gdzie jesteś:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Teraz czas usunąć katalog `cwiczenie`:

> **Uwaga**: Usuwanie plików za pomocą `del`, `rmdir` lub `rm` jest nieodwracalne. To znaczy, że *Twoje pliki zostaną bezpowrotnie utracone*! Tak więc bądź ostrożna z tymi poleceniami.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r cwiczenie
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S cwiczenie
    cwiczenie, Are you sure <Y/N>? Y
    

<!--endsec-->

Gotowe! Dla pewności, że został on naprawdę usunięty, sprawdźmy to:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Wyjście

To na razie tyle! Możesz teraz spokojnie zamknąć wiersz poleceń. To co, zrobimy to jak prawdziwy haker? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Fajnie, nie? :)

## Podsumowanie

Oto podsumowanie przydatnych poleceń:

| Polecenie (Windows) | Polecenie (Mac OS / Linux) | Opis                          | Przykład                                          |
| ------------------- | -------------------------- | ----------------------------- | ------------------------------------------------- |
| wyjście             | wyjście                    | zamknięcie okna               | **wyjście**                                       |
| cd                  | cd                         | zmiana katalogu               | **cd test**                                       |
| cd                  | pwd                        | pokazywane bieżącego katalogu | **cd** (Windows) lub **pwd** (Mac OS / Linux)     |
| dir                 | ls                         | lista katalogów/plików        | **dir**                                           |
| copy                | cp                         | kopiowanie pliku              | **copy c:\test\test.txt c:\windows\test.txt** |
| move                | mv                         | przenoszenie pliku            | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir               | mkdir                      | tworzenie nowego katalogu     | **mkdir testdirectory**                           |
| rmdir (lub del)     | rm                         | usuwanie pliku                | **del c:\test\test.txt**                        |
| rmdir /S            | rm -r                      | usuwanie katalogu             | **rm -r testdirectory**                           |

To tylko garstka wszystkich poleceń, z których możesz skorzystać w wierszu poleceń, ale na dzień dzisiejszy nie będziesz potrzebowała niczego więcej.

Jeżeli temat Cię zainteresował, to [ss64.com](http://ss64.com) zawiera kompletny spis poleceń dla wszystkich systemów operacyjnych.

## Gotowa?

No to poznajmy Pythona!