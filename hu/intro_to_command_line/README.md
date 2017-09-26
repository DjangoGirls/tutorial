# Bevezetés a parancssor használatába

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Hadd mutassuk be neked az első új barátodat: a parancssort!**

A következő lépésekben megmutatjuk neked, hogyan használd azt a fekete ablakot úgy, ahogy az összes hacker használja. Első ránézésre kissé ijesztőnek tűnhet, de valójában csak egy egyszerű parancsot vár tőled.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Mi az a parancssor?

A **parancssor** (command line, vagy **command-line interface**) nevű ablak egy szöveges alapú alkalmazás, amit arra használhatsz, hogy fájlokat tekinthess meg, szerkeszthess, és különböző műveleteket végezhess rajtuk. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## A parancssor megnyitása

Hogy belevághass a kísérletezésbe, először meg kell nyitnod a parancssort.

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

## Parancssor

Egy fehér vagy fekete ablakot kell látnod, ami csak a te parancsaidra vár.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ha Mac-ed vagy Linux-od van, valószínűleg egy `$`-t kell látnod:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

A Windows-on ez egy `>` jel:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Az első parancsod (YAY!)

Kezdjük valami egyszerűvel. Gépeld be ezt a parancsot:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Majd nyomj `enter`t. Ezt az eredményt kapod:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Az alapok

Minden operációs rendszer parancssora kissé különböző prancsokat igényel, ezért kérlek győzödj meg arról, hogy a te operációs rendszerednek megfelelő utasításokat követed. Próbáljuk ki, rendben?

### A jelenlegi mappa

Jó lenne tudni, hogy most hol vagyunk, nem? Nézzük. Írd be ezt a parancsot, és nyomj `enter`t:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Megjegyzés: a 'pwd' jelentése: 'print working directory'.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Valószínűleg valami hasonlót fogsz látni a gépeden. Amikor megnyitod a parancssort, általában a felhasználó 'home' könyvtárába kerülsz.

* * *

### Fájlok és könyvtárak kilistázása

És mi van benne? Szuper lenne kideríteni. Nézzük meg:

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

### Jelenlegi mappa megváltoztatása

Most pedig lépjünk be a Desktop (vagy Asztal) mappába:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Nézzük meg, hogy tényleg megváltozott-e:

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

Itt is van!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Könyvtár létrehozása

Mit szólnál, ha létrehoznánk egy gyakorló (practice) könyvtárat az asztalon? Így tudod megtenni:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Ez a parancs létre fog hozni egy `practice` nevű mappát az asztalodon. Ha megnézed az asztalt, meggyőződhetsz róla, hogy tényleg ott van-e, de a `ls` vagy `dir` paranccsal is megteheted! Try it. :)

> PRO tipp: Ha nem szeretnéd újra és újra ugyanazt a parancsot begépelni, próbáld meg a `felfele` és `lefele nyilakkal` behívni a legutóbb futtatott parancsokat.

* * *

### Feladat!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Megoldás:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Gratulálunk! :)

* * *

### Takarítás

Nem szeretnénk káoszt hagyni magunk után, szóval töröljünk le mindent, amit eddig csináltunk.

Először vissza kell mennünk az Asztal-ra:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Ellenőrizzük le, hogy hol vagyunk:

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

Most pedig itt az ideje, hogy kitöröljük a `practice` könyvtárat:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Kész! Ellenőrizzük le, hogy tényleg megtörtént-e:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Kilépés

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

## Összefoglaló

Egy kis összefoglalás néhány hasznos parancsról:

| Parancs (Windows) | Parancs (Mac OS/Linux) | Leírás                        | Példa                                             |
| ----------------- | ---------------------- | ----------------------------- | ------------------------------------------------- |
| exit              | exit                   | az ablak bezárása             | **exit**                                          |
| cd                | cd                     | könyvtár megváltoztatása      | **cd test**                                       |
| cd                | pwd                    | show the current directory    | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir               | ls                     | könyvtárak/fájlok kilistázása | **dir**                                           |
| copy              | cp                     | fájl másolása                 | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                     | fájl mozgatása                | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                  | új könyvtár létrehozása       | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                     | delete a file                 | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                  | delete a directory            | **rm -r testdirectory**                           |

Ez csak néhány parancs, azok közül, amiket a parancssorban futtathatsz, de ma nem lesz szükséged ennél többre.

Ha kíváncsi vagy, a [ss64.com](http://ss64.com) oldalon megtalálod az összes parancsot bármelyik operációs rendszerre.

## Kész vagy?

Merüljünk el a Python-ban!