# Introduktion till kommandotolken

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Låt oss introducera dig till din första nya vän: kommandotolken!**

De följande stegen kommer att visa dig hur du använder det svarta fönstret som alla hackers använder. Det kan se lite läskigt ut i början, men egentligen är det bara ett fönster som väntar på instruktioner från dig.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Vad är kommandotolken?

Fönstret, som oftast kallas **kommandotolken** eller **terminalen**, är ett textbaserat program för att visa, hantera och ändra filer på din dator. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Öppna kommandotolken

För att börja experimentera måste vi först öppna kommandotolken.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, just Google it. :)

<!--endsec-->

## Prompt

Nu borde du se ett vitt eller svart fönster som väntar på dina kommandon.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Om du använder Mac eller Linux ser du antagligen `$`, precis såhär:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

På Windows är det ett `>`, såhär:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Ditt första kommando (WOHO!)

Vi börjar med något enkelt. Skriv in detta kommandot:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Och tryck på `Enter`. Detta blir resultatet:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Grunderna

Varje operativsystem har lite olika kommandon för terminalen, så följ instruktionerna för ditt operativsystem. Nu kör vi!

### Aktuell katalog

Visst hade det varit bra och veta var vi är nu? Skriv in detta kommando och tryck `enter`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Notis: 'pwd' står för 'print working directory', alltså 'skriv ut nuvarande mapp'.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Du ser säkert något liknande på din dator. När du öppnar terminalen brukar du starta i användarens hemmamapp.

* * *

### Lista filer och mappar

Så vad finns här? Det hade varit kul att se. Vi testar:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

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

### Ändra aktuell katalog

Låt oss gå till Skrivbordets katalog:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Testa om det verkligen fungerande:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Det fungerade!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Skapa katalog

Nu kan vi skapa en katalog för Django Girls på skrivbordet såhär:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir djangogirls
    

<!--endsec-->

Det här kommandot skapar en mapp med namnet `djangogirls` på ditt skrivbord. Du kan kolla om den är där genom att kolla på ditt skrivbord eller genom att köra kommandot `ls` eller `dir`! Try it. :)

> Tips: Om du inte vill skriva samma kommandon om och om igen, testa att trycka på `uppåtpilen` och `nedåtpilen` för att bläddra bland kommandon som du nyligen har använt.

* * *

### Övning!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Lösning:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd djangogirls
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd djangogirls
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Grattis! :)

* * *

### Städa upp

Vi vill inte lämna det stökigt, så låt oss ta bort allt som vi har gjort hittills.

Först måste vi tillbaka till skrivbordet:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Kolla var du är:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Nu är det dags att ta bort katalogen `djangogirls`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r djangogirls
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S djangogirls
    djangogirls, Are you sure <Y/N>? Y
    

<!--endsec-->

Klart! För att vara säker på att den verkligen är raderad kan vi kolla med:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Sammanfattning

Här är en sammanfattning med några användbara kommandon:

| Kommando (Windows) | Kommando (Mac OS / Linux) | Beskrivning                | Exempel                                           |
| ------------------ | ------------------------- | -------------------------- | ------------------------------------------------- |
| exit               | exit                      | stäng fönstret             | **exit**                                          |
| cd                 | cd                        | ändra mapp                 | **cd test**                                       |
| cd                 | pwd                       | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir                | ls                        | lista kataloger/filer      | **dir**                                           |
| copy               | cp                        | kopiera fil                | **copy c:\test\test.txt c:\windows\test.txt** |
| move               | mv                        | flytta fil                 | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir              | mkdir                     | skapa en ny katalog        | **mkdir testkatalog**                             |
| rmdir (or del)     | rm                        | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S           | rm -r                     | delete a directory         | **rm -r testdirectory**                           |

Dessa är bara några av de kommandon du kan köra i terminalen men du kommer inte behöva fler än dessa idag.

Om du är nyfiken så innehåller [ss64.com](http://ss64.com) en komplett lista med kommandon för alla operativsystem.

## Redo?

Nu dyker vi ner i Python!