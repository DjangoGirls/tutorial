# Úvod do rozhrania príkazového riadku

> Pre čitateľov doma: Táto kapitola je spracovaná v [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) videu.

Je to vzrušujúce, však? Už o pár minút napíšeš svoj prvý riadok kódu! :)

**Dovoľ nám predstaviť ti tvojho nového priateľa: príkazový riadok!**

Nasledujúce kroky ti ukážu ako používať tú čiernu obrzovku, čo používajú všetci hackeri. Zo začiatku môže vyzerať trochu desivo, ale je to naozaj len riadok, čo čaká na tvoje príkazy.

> **Poznámka** Prosím všimni si, že v knižke používame výrazy 'adresár' aj 'zložka' zameniteľne, no ich význam je rovnaký.

## Čo je to príkazový riadok?

Okno, ktoré sa zvyčajne nazýva **príkazový riadok** alebo **rozhranie príkazového riadku** je textová aplikácia na prehliadanie, spracovanie a manipuláciu so súbormi v tvojom počítači. V podstate je to ako Prieskumník vo Windowse alebo Finder na Macu, akurát bez grafického rozhrania. Ďalšie názvy pre príkazový riadok môžu byť: *cmd*, *CLI*, *prompt*, *konzola* alebo *terminál*.

## Otvor rozhranie príkazového riadku

Aby sme mohli trochu experimentovať, musíme najskôr rozhranie príkazového riadku otvoriť.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Prejdite na Štart menu → Systém Windows → Príkazový riadok.

> V starších verziách systému Windows, pozrite v Štart menu → Všetky programy → Príslušenstvo → Príkazový riadok.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Choď do Aplikácie → Nástroje → Terminál.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Príkazový riadok

Teraz by si už mala vidieť biele alebo čierne okno, ktoré čaká na tvoje príkazy.

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

> Len krátka poznámka: v tvojom prípade môže tam byť pred niečo ako `C:\Users\ola>` alebo `Olas-MacBook-Air:~ ola$` a to je úplne v poriadku.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Tvoj prvý príkaz (Hurá!)

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

> Skús každý príkaz napísať, nielen kopírovať. Viac si tak zapamätáš!

## Základy

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Aktuálny adresár

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Poznámka: 'pwd' je skratka pre 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Poznámka: 'cd' znamená 'change directory', teda zmena priečinku. V powershell môžeš použiť pwd tak ako na Linuxe alebo Mac OS X.

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Zoznam súborov a adresárov

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
    

> Poznámka: V powershelli môžeš použiť aj 'ls' ako na Linuxe alebo Mac OS X. <!--endsec-->

* * *

### Zmena aktuálneho adresára

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

> Profi tip: ak napíšeš `cd D` a potom stlačíš `tab`, príkazový riadok automaticky doplní zvyšok názvu, takže adresáre môžeš prechádzať rýchlejšie. Ak na "D" začína viac ako jeden adresár, stlač `tab` dvakrát a dostaneš zoznam možností.

* * *

### Vytvoriť adresár

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir pokus
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> Profi tip: ak sa ti nechce vypisovať stále dookola tie isté príkazy, skús sa stlačením `šípky hore` a `šípky dole` vrátiť k nedávno použitým príkazom.

* * *

### Cvičenie!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Riešenie:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd pokus
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    03/20/2016 11:05 AM <DIR>      test
    

<!--endsec-->

Congrats! :)

* * *

### Upratovanie

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

> **Pozor**: mazanie súborov pomocou `del` `rmdir` alebo `rm` je neodvolateľné, teda *odstránené súbory budú navždy odtranené*! Takže s týmito príkazmi buď opatrná.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r pokus
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S pous
    pokus, Are you sure <Y/N>? Y
    

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

### Ukončenie

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

## Zhrnutie

Here is a summary of some useful commands:

| Príkaz (Windows) | Príkaz (Mac OS / Linux) | Popis                           | Príklad                                           |
| ---------------- | ----------------------- | ------------------------------- | ------------------------------------------------- |
| ukončenie        | ukončenie               | zatvorí okno                    | **ukončenie**                                     |
| cd               | cd                      | zmení adresár                   | **cd test**                                       |
| cd               | pwd                     | ukáž akutuálny adresár          | **cd** (Windows) alebo **pwd** (Mac OS / Linux)   |
| dir              | ls                      | vypíše zoznam adresárov/súborov | **dir**                                           |
| copy             | cp                      | kopíruje súbor                  | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | presunie súbor                  | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | vytvorí nový adresár            | **mkdir testdirectory**                           |
| rmdir (or del)   | rm                      | vymazať súbor                   | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                   | odstráni adresár/súbor          | **rm -r testdirectory**                           |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Pripravená?

Let's dive into Python!