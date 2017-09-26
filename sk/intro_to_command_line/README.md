# Úvod do rozhrania príkazového riadku

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Dovoľ nám predstaviť ti tvojho nového priateľa: príkazový riadok!**

Nasledujúce kroky ti ukážu ako používať tú čiernu obrzovku, čo používajú všetci hackeri. Zo začiatku môže vyzerať trochu desivo, ale je to naozaj len riadok, čo čaká na tvoje príkazy.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Čo je to príkazový riadok?

Okno, ktoré sa zvyčajne nazýva **príkazový riadok** alebo **rozhranie príkazového riadku** je textová aplikácia na prehliadanie, spracovanie a manipuláciu so súbormi v tvojom počítači. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Otvor rozhranie príkazového riadku

Aby sme mohli trochu experimentovať, musíme najskôr rozhranie príkazového riadku otvoriť.

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

## Príkazový riadok

Teraz by si už mala vidieť biele alebo čierne okno, ktoré čaká na tvoje príkazy.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ak si na Macu alebo Linuxe, zrejme uvidíš `$`, presne takto:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

Na Windowse to je znak `>`, takýto:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Tvoj prvý príkaz (Hurá!)

Začnime s niečím jednoduchým. Napíš tento príkaz:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

A stlač `enter`. Toto je výsledok:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Základy

Každý operačný systém má trochu iné príkazy pre príkazový riadok, takže postupuj podľa inštrukcií pre tvoj operačný systém. Tak čo, vyskúšame to?

### Aktuálny adresár

Bolo by fajn vedieť, kde sa nachádzame, však? Zistime to. Napíš tento príkaz a stlač `enter`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Poznámka: 'pwd' je skratka pre 'print working directory'.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Na svojom stroji pravdepodobne uvidíš niečo takéto. Keď otvoríš príkazový riadok, zvyčajne začneš vo svojom domovskom adresári.

* * *

### Zoznam súborov a adresárov

Tak čo je v ňom? Bolo by super zistiť to. Pozrime sa na to:

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

### Zmena aktuálneho adresára

Teraz prejdime do adresára Plochy:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Skontroluj, či sa adresár skutočne zmenil:

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

A je to!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Vytvoriť adresár

Čo takto vytvoriť pokusný adresár na ploche? Urobíš to takto:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir pokus
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Tento príkazík vytvorí adresár s názvom `pokus` na tvojej ploche. Či je adresár naozaj tam môžeš zistiť jednoducho pohľadom na Plochu alebo spustením príkazu `ls` alebo `dir`! Try it. :)

> Profi tip: ak sa ti nechce vypisovať stále dookola tie isté príkazy, skús sa stlačením `šípky hore` a `šípky dole` vrátiť k nedávno použitým príkazom.

* * *

### Cvičenie!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Riešenie:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd pokus
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    03/20/2016 11:05 AM <DIR>      test
    

<!--endsec-->

Gratulujeme! :)

* * *

### Upratovanie

Nechceme po sebe nechať neporiadok, takže odstránime všetko, čo sme doteraz vytvorili.

Najkôr sa musíme vrátiť späť na Plochu:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Skontroluj, kde sa nachádzaš:

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

Je na čase zmazať adresár `pokus`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r pokus
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S pous
    pokus, Are you sure <Y/N>? Y
    

<!--endsec-->

Hotovo! Uistime sa, či je to naozaj vymazané:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Ukončenie

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

## Zhrnutie

Tu je prehľad niektorých užitočných príkazov:

| Príkaz (Windows) | Príkaz (Mac OS / Linux) | Popis                           | Príklad                                           |
| ---------------- | ----------------------- | ------------------------------- | ------------------------------------------------- |
| exit             | exit                    | zatvorí okno                    | **exit**                                          |
| cd               | cd                      | zmení adresár                   | **cd test**                                       |
| cd               | pwd                     | show the current directory      | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir              | ls                      | vypíše zoznam adresárov/súborov | **dir**                                           |
| copy             | cp                      | kopíruje súbor                  | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | presunie súbor                  | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | vytvorí nový adresár            | **mkdir testdirectory**                           |
| rmdir (or del)   | rm                      | delete a file                   | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                   | delete a directory              | **rm -r testdirectory**                           |

Toto je len veľmi malá časť príkazov, ktoré môžeš spustiť vo svojom príkazovom riadku, ale dnes budeš potrebovať len tieto.

Ak ťa to zaujalo, na [ss64.com](http://ss64.com) nájdeš kompletný prehľad príkazov pre všetky operačné systémy.

## Pripravená?

Vrhnime sa na Python!