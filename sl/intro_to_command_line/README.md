# Osnove dela z ukazno vrstico

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Najprej pa te moramo seznaniti z zelo uporabnim in zabavnim orodjem: ukazno vrstico!**

Nadaljni koraki te bodo seznanili z uporabo črnega okna, ki ga uporablja vsak pravi heker. Sprva deluje malce nenavadno, vendar je dejansko zgolj program, v katerega vpisuješ ustrezne ukaze.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Kaj je ukazna vrstica?

Okno, ki mu rečemo **ukazna vrstica** ali **ukazna lupina**, je program, ki omogoča raznovrstno delo z datotekami na računalniku, kot je brisanje, pregledovanje, urejanje in dodajanje. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Zagon ukazne vrstice

Delo z ukazno vrstico bomo začeli z zagonom le-te.

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

## Ukazna vrstica

Pred sabo imaš torej odprto črno ali belo okno, ki čaka, da vanj vpišeš ustrezne ukaze.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Če uporabljaš operacijski sistem Mac ali Linux, se prva vrstica v ukazni lupini verjetno začne takole:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

Na operacijskem sistemu Windows pa tako:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Tvoj prvi ukaz :)

Začnimo z nečim preprostim. Vpiši sledeči ukaz:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Nato pritisni `enter`. Rezultat je približno tak:

{% filename %}command-line{% endfilename %}

    $ whoami
    ana
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Osnove

Vsak operacijski sistem ima malce različen nabor ukazov v ukazni vrstici, zato se vedno prepričaj, da spremljaš navodila za svoj operacijski sistem.

### Trenutni imenik

Če želimo delati z datotekami, bi bilo za začetek uporabno vedeti, v katerem direktoriju se nahajamo. Vpiši sledeči ukaz in pritisni `enter`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/ana
    

> Opomba: 'pwd' pomeni 'print working directory'.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Uporabniki\ana
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Nekaj podobnega si verjetno dobila tudi ti. Ko odpreš ukazno vrstico, je tvoj imenik običajno enak domačemu imeniku prijavljenega uporabnika.

* * *

### Izpis datotek in imenikov

Bi rada izpisala vse imenike in datoteke, ki so v tvojem trenutnem imeniku? To narediš takole:

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
     Directory of C:\Uporabniki\ana
    05/08/2014 07:28 PM <DIR>      Aplikacije
    05/08/2014 07:28 PM <DIR>      Namizje
    05/08/2014 07:28 PM <DIR>      Prenosi
    05/08/2014 07:28 PM <DIR>      Glasba
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Sprememba imenika

Premaknimo se v imenik Namizje:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Namizje
    

<!--endsec-->

Preveri, če si se res premaknila:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/ana/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Uporabniki\ana\Namizje
    

<!--endsec-->

Deluje! Super!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Ustvarjanje imenika

Kako pa bi ustvarili nov imenik? Recimo takole:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir vaja
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir vaja
    

<!--endsec-->

Ta ukaz bo naredil nov imenik z imenom `vaja` znotraj našega trenutnaga imenika. To lahko preveriš tako, da vpišeš ukaz `ls` oziroma `dir`, ali pa greš pogledat v imenik s pomočjo programa Finder oziroma Explorer! Try it. :)

> UPORABEN namig: Če nočeš vedno znova vpisovati istega ukaza, lahko s pomočje pritiskanja puščic `gor` in `dol` na tipkovnici, pregledaš nedavno uporabljene ukaze.

* * *

### Vaja!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Rešitev:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd vaja
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd vaja
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Čestitke! :)

* * *

### Čistka :)

Ustvarjenih imenikov ne potrebujemo več, zato jim odstranimo.

Za začetek se pomaknimo nazaj v nadrejeni imenik:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Preverimo našo lokacijo:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/ana/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Uporabniki\ana\Namizje
    

<!--endsec-->

Pripravljeni smo za odstranitev imenika `vaja`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r vaja
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S vaja
    vaja, Are you sure <Y/N>? Y
    

<!--endsec-->

Končano! Preverimo imenik:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Izhod

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

## Povzetek

Tu je še povzetek nekaterih uporabnih ukazov:

| Ukaz (Windows) | Ukaz (Mac OS/ Linux) | Opis                                                   | Primer                                            |
| -------------- | -------------------- | ------------------------------------------------------ | ------------------------------------------------- |
| exit           | exit                 | zapri okno                                             | **exit**                                          |
| cd             | cd                   | spremeni imenik                                        | **cd test**                                       |
| cd             | pwd                  | show the current directory                             | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir            | ls                   | izpiši imenike/datoteke, vsebovane v trenutnem imeniku | **dir**                                           |
| copy           | cp                   | kopiraj datoteko                                       | **copy c:\test\test.txt c:\windows\test.txt** |
| move           | mv                   | premakni datoteko                                      | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir          | mkdir                | ustvari nov imenik                                     | **mkdir testniimenik**                            |
| rmdir (or del) | rm                   | delete a file                                          | **del c:\test\test.txt**                        |
| rmdir /S       | rm -r                | delete a directory                                     | **rm -r testdirectory**                           |

To je le nekaj osnovnih ukazov za ukazno vrstico. Drugih danes ne boš potrebovala.

Če ti je bilo to poglavje zanimivo in bi rada izvedela še kaj več, imaš na strani [ss64.com](http://ss64.com) seznam vseh ukazov za vse operacijske sisteme.

## Pripravljena?

Začnimo s programskim jezikom Python!