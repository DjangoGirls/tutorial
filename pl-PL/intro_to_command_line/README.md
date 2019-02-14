# Wprowadzenie do interfejsu wiersza polecenia

> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Za chwilę napiszesz swoją pierwszą linijkę kodu. Jesteś już podekscytowana? :)

**Pozwól, że przedstawimy Ci, Twojego pierwszego przyjaciela: wiersz polecenia!**

Następujące kroki pokażą Ci, jak wykorzystać tajemnicze czarne okno, które używają wszyscy hakerzy. Na początku może to wyglądać nieco przerażająco ale tak naprawdę to tylko zachęta do wpisywania komend.

> **Uwaga** Podczas tego kursu będziemy używać terminów "katalog" i "folder" zamiennie, ponieważ oznaczają one tę samą rzecz.

## Czym jest wiersz polecenia?

Okno zwane **wierszem polecenia** lub **interfejsem wiersza polecenia** jest aplikacją tekstową służącą do przeglądania, obsługi i operowania plikami na Twoim komputerze. Podobnie jak np. Eksplorator Windows lub Finder na Macu, ale bez interfejsu graficznego. Inne nazwy dla wiersza polecenia to *cmd*, *CLI*, *prompt*, *konsola* lub *terminal*.

## Uruchamiamy interfejs wiersza polecenia

Aby trochę poeksperymentować musimy najpierw otworzyć interfejs linii poleceń. {% include "/intro_to_command_line/open_instructions.md" %} 

## Znak zachęty

Teraz powinnaś zobaczyć białe lub czarne okno, które czeka na Twoje polecenia.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Jeżeli używasz Maca lub Linuksa, powinnaś zobaczyć `$`, tak jak poniżej:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Na Windowsie prawdopodobnie zobaczysz `>` coś takiego: 

{% filename %}command-line{% endfilename %}

    >
    

Spójrz na powyższą sekcję Linux -- Zobaczysz coś więcej gdy dojdziesz do dalszej części tutorialu. 

<!--endsec-->

Każda komenda będzie poprzedzona przez `$` lub `>` i jedną spację, czego nie powinieneś wpisywać. Twój komputer zrobi to za Ciebie. 

> Jedna mała uwaga: w Twoim przypadku prompt może być poprzedzony czymś jeszcze, np. `C:\Users\ola>` lub `Olas-MacBook-Air:~ ola$` i jest to w 100% poprawne.

Część do znaku `$` lub `>` razem z nim nazywana jest *znakiem zachęty wiersza polecenia* lub skrótowo *znakiem zachęty (promptem)*. Jego celem jest zachęcić Ciebie do wpisania jakiegoś polecenia.

W tutorialu, jeżeli będziemy chciały, byś wpisała komendę, umieścimy przed nią również `$` lub `>`, a czasami nawet resztę znaku zachęty. Możesz śmiało zignorować lewą część i wpisać komendę zaczynającą się za promptem.

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

Każdy system operacyjny ma nieco inny zestaw komend dostępnych w wierszu polecenia, zatem postępuj według instrukcji odpowiadających Twojemu systemowi operacyjnemu. To co, spróbujemy?

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

Prawdopodobnie ujrzysz coś podobnego na swoim komputerze. Kiedy otwierasz wiersz polecenia, zwykle jest on uruchamiany w folderze głównym Twojego konta użytkownika.

* * *

### Dowiedz się więcej o komendach

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_help" data-collapse=true ces-->

Adding a `/?` suffix to most commands will print the help page. You may need to scroll your command window up to see it all. Try `cd /?`.

<!--endsec-->

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

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Note that the directory name "Desktop" might be translated to the language of your Linux account. If that's the case, you'll need to replace `Desktop` with the translated name; for example, `Schreibtisch` for German.

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

Here it is!

> PRO tip: gdy wpiszesz `cd D` i wciśniesz przycisk `Tab` na klawiaturze, wiersz polecenia automatycznie uzupełni resztę nazwy, dzięki czemu będziesz mogła nawigować szybciej. Jeżeli istnieje więcej niż jeden folder o nazwie zaczynającej się na "D", wciśnij `Tab` dwukrotnie, aby wyświetlić listę możliwości.

* * *

### Tworzenie folderu

Co powiesz na stworzenie folderu na swoim pulpicie? Zrób to w ten sposób:

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

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Congrats! :)

* * *

### Sprzątanie

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Check where you are:

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

Now time to delete the `practice` directory:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Wyjście

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

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

Here is a summary of some useful commands:

| Polecenie (Windows) | Polecenie (Mac OS / Linux) | Opis                                | Przykład                                            |
| ------------------- | -------------------------- | ----------------------------------- | --------------------------------------------------- |
| wyjście             | wyjście                    | zamknięcie okna                     | **wyjście**                                         |
| cd                  | cd                         | zmiana katalogu                     | **cd test**                                         |
| cd                  | pwd                        | pokazywane bieżącego katalogu       | **cd** (Windows) lub **pwd** (Mac OS / Linux)       |
| dir                 | ls                         | lista katalogów/plików              | **dir**                                             |
| copy                | cp                         | kopiowanie pliku                    | **copy c:\test\test.txt c:\windows\test.txt**   |
| move                | mv                         | przenoszenie pliku                  | **move c:\test\test.txt c:\windows\test.txt**   |
| mkdir               | mkdir                      | tworzenie nowego katalogu           | **mkdir testdirectory**                             |
| rmdir (lub del)     | rm                         | usuwanie pliku                      | **del c:\test\test.txt**                          |
| rmdir /S            | rm -r                      | usuwanie katalogu                   | **rm -r testdirectory**                             |
| [CMD] /?            | man [CMD]                  | uzyskiwanie pomocy na temat komendy | **cd /?** (Windows) lub **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Gotowa?

Let's dive into Python!