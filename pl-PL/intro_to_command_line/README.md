# Wprowadzenie do interfejsu wiersza polecenia

> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Za chwilę napiszesz swoją pierwszą linijkę kodu. Jesteś już podekscytowana? :)

**Pozwól, że przedstawimy Ci, Twojego pierwszego przyjaciela: wiersz polecenia!**

Następujące kroki pokażą Ci, jak wykorzystać tajemnicze czarne okno, które używają wszyscy hakerzy. Na początku może to wyglądać nieco przerażająco ale tak naprawdę to tylko zachęta do wpisywania komend.

> **Uwaga** Podczas tego kursu będziemy używać terminów "katalog" i "folder" zamiennie, ponieważ oznaczają one tę samą rzecz.

## Czym jest wiersz polecenia?

Okno zwane **wierszem polecenia** lub **interfejsem wiersza polecenia** jest aplikacją tekstową służącą do przeglądania, obsługi i operowania plikami na Twoim komputerze. Podobnie jak np. Eksplorator Windows lub Finder na Macu, ale bez interfejsu graficznego. Inne nazwy dla wiersza polecenia to *cmd*, *CLI*, *prompt*, *konsola* lub *terminal*.

## Uruchamiamy interfejs wiersza polecenia

Aby zacząć nasze eksperymenty, musimy najpierw otworzyć nasz wiersz polecenia.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Przejdź do menu Start → System → Wiersz polecenia.

> Na starszych wersjach Windowsa szukaj w menu Start → Wszystkie programy → Akcesoria → Wiersz polecenia.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Przejdź do Aplikacje → Narzędzia → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Prawdopodobnie gdzieś w menu Aplikacje → Akcesoria → Terminal, ale to może zależeć od wersji Twojego systemu. Jeżeli tam nie znajdziesz, możesz spróbować zapytać Google'a. :)

<!--endsec-->

## Znak zachęty

Teraz powinnaś zobaczyć białe lub czarne okno, które czeka na Twoje polecenia.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see a `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

On Windows, you probably see a `>`, like this:

{% filename %}command-line{% endfilename %}

    >
    

Take a look at the Linux section just above now -- you'll see something more like that when you get to PythonAnywhere later in the tutorial.

<!--endsec-->

Each command will be prepended by a `$` or `>` and one space, but you should not type it. Your computer will do it for you. :)

> Jedna mała uwaga: w Twoim przypadku prompt może być poprzedzony czymś jeszcze, np. `C:\Users\ola>` lub `Olas-MacBook-Air:~ ola$` i jest to w 100% poprawne.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

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

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Staraj się zawsze przepisywać polecenia zamiast je kopiować i wklejać. W ten sposób zapamiętasz więcej!

## Podstawy

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Bieżący katalog

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

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

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

Adding a `/?` suffix to most commands will print the help page. You may need to scroll your command window up to see it all. Try `cd /?`.

<!--endsec-->

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

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

### Change current directory

Now, let's go to our Desktop directory:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Check if it's really changed:

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

### Create directory

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir cwiczenie
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir cwiczenie
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> PRO tip: Jeżeli nie chcesz w kółko wpisywać tych samych poleceń, wciśnij na klawiaturze klawisz ze `strzałką w górę` i `strzałką w dół` aby przewinąć listę poprzednio użytych poleceń.

* * *

### Exercise!

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

Congrats! :)

* * *

### Clean up

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

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

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

| Polecenie (Windows) | Polecenie (Mac OS / Linux) | Opis                          | Przykład                                           |
| ------------------- | -------------------------- | ----------------------------- | -------------------------------------------------- |
| wyjście             | wyjście                    | zamknięcie okna               | **wyjście**                                        |
| cd                  | cd                         | zmiana katalogu               | **cd test**                                        |
| cd                  | pwd                        | pokazywane bieżącego katalogu | **cd** (Windows) lub **pwd** (Mac OS / Linux)      |
| dir                 | ls                         | lista katalogów/plików        | **dir**                                            |
| copy                | cp                         | kopiowanie pliku              | **copy c:\test\test.txt c:\windows\test.txt**  |
| move                | mv                         | przenoszenie pliku            | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir               | mkdir                      | tworzenie nowego katalogu     | **mkdir testdirectory**                            |
| rmdir (lub del)     | rm                         | usuwanie pliku                | **del c:\test\test.txt**                         |
| rmdir /S            | rm -r                      | usuwanie katalogu             | **rm -r testdirectory**                            |
| [CMD] /?            | man [CMD]                  | get help for a command        | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Gotowa?

Let's dive into Python!