# Wprowadzenie do interfejsu wiersza poleceń

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Pozwól, że przedstawimy Ci, Twojego pierwszego przyjaciela: wiersz poleceń!**

Następujące kroki pokażą Ci, jak wykorzystać tajemnicze czarne okno, które używają wszyscy hakerzy. Na początku może to wyglądać nieco przerażająco ale tak naprawdę to tylko zachęta do wpisywania komend.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Czym jest wiersz poleceń?

Okno zwane **wierszem poleceń** lub **interfejsem wiersza poleceń** jest aplikacją tekstową służącą do przeglądania, obsługi i operowania plikami na Twoim komputerze. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Inne nazwy dla wiersza poleceń to *cmd*, *CLI*, *prompt*, *konsola* lub *terminal*.

## Uruchamiamy interfejs wiersza poleceń

Aby zacząć nasze eksperymenty, musimy najpierw otworzyć nasz wiersz poleceń.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, just Google it. :)

<!--endsec-->

## Prompt

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

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Twoja pierwsza komenda! 

Let's start by typing this command:

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

> Try to type each command; do not copy-paste. You'll remember more this way!

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
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

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
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

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

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

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

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

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

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

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

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

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

Cool, huh? :)

## Podsumowanie

Oto podsumowanie przydatnych poleceń:

| Polecenie (Windows) | Polecenie (Mac OS / Linux) | Opis                       | Przykład                                          |
| ------------------- | -------------------------- | -------------------------- | ------------------------------------------------- |
| wyjście             | wyjście                    | zamknięcie okna            | **wyjście**                                       |
| cd                  | cd                         | zmiana katalogu            | **cd test**                                       |
| cd                  | pwd                        | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir                 | ls                         | lista katalogów/plików     | **dir**                                           |
| copy                | cp                         | kopiowanie pliku           | **copy c:\test\test.txt c:\windows\test.txt** |
| move                | mv                         | przenoszenie pliku         | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir               | mkdir                      | tworzenie nowego katalogu  | **mkdir testdirectory**                           |
| rmdir (lub del)     | rm                         | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S            | rm -r                      | delete a directory         | **rm -r testdirectory**                           |

To tylko garstka wszystkich poleceń, z których możesz skorzystać w wierszu poleceń, ale na dzień dzisiejszy nie będziesz potrzebowała niczego więcej.

Jeżeli temat Cię zainteresował, to [ss64.com](http://ss64.com) zawiera kompletny spis poleceń dla wszystkich systemów operacyjnych.

## Gotowa?

No to poznajmy Pythona!