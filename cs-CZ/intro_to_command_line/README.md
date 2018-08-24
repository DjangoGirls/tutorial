# Úvod k příkazové řádce

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Dovol nám, abychom ti představili tvého prvního nového přítele: příkazovou řádku! **

Následující kroky ti ukážou, jak používat černé okno, které všichni počítačoví odborníci používají. Může to na první pohled vypadat trochu děsivě, ale opravdu je to jen okno, které čeká na tvé příkazy.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Co je příkazová řádka?

Okno, které se obvykle nazývá **příkazová řádka** nebo **rozhraní příkazové řádky**, je textová aplikace pro zobrazování, zpracovávání a manipulaci se soubory na tvém počítači. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Další jména pro příkazovou řádku jsou: *cmd*, *prompt*, *command line*, *konzole* nebo *terminál*.

## Otevři rozhraní příkazové řádky

Chceš-li začít experimentovat je třeba nejprve otevřít naše rozhraní příkazové řádky.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Příkazová řádka

Nyní bys měla vidět bílé nebo černé okno, které čeká na tvé příkazy.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

V systému Windows je to `>` tento znak:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Každý příkaz budeš psát za tento znak a jednu mezeru, ale není nutné to zadávat. Tvůj počítač to udělá za tebe. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Tvůj první příkaz (hurá!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

A zmáčkni `enter`. Tohle je výsledek:

{% filename %}command-line{% endfilename %}

    $ whoami 
    olasitarska
    

Jak vidíš, počítač právě vypsal tvé uživatelské jméno. Pěkný, co? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Základy

Každý operační systém má mírně odlišnou sadu příkazů na příkazové řádce, ujisti se, že sleduješ pokyny pro tvůj operační systém. Zkusme to, ano?

### Aktuální složka

Bylo by hezké vědět, kde právě jsme, ne? Podívejme se. Zadej následující příkaz a stiskni `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Poznámka: 'pwd' je zkratka pro "print working directory / zobrazení cesty pro pracovní adresář".

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Pravděpodobně se ti zobrazí něco podobného. Jakmile otevřeš příkazovou řádku, obvykle začínáš ve svém domovském adresáři.

* * *

### Seznam souborů a adresářů

Tak co je v něm? Bylo by fajn zjistit co je v našem adresáři. Podívejme se:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls 
    Aplikace 
    Desktop 
    Stažené soubory
    Hudba...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir  
    Directory of C:\Users\olasitarska 
    05/08/2014 07:28 PM <DIR> Applications 
    05/08/2014 07:28 PM <DIR> Desktop 
    05/08/2014 07:28 PM <DIR> Downloads 
    05/08/2014 07:28 PM <DIR> Music
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Změna aktuálního adresáře

Teď pojďme do adresáře plochy:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Zkontroluj, zda-li se adresář skutečně změnil:

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

A je to!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Jak vytvořit složku

Co si vytvořit pokusnou složku na ploše? Můžeš to udělat tímto způsobem:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir pokus
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir pokus
    

<!--endsec-->

Tento malý příkaz vytvoří složku s názvem `pokus` na ploše. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Zkus to. :)

> PRO tip: Pokud nechceš znovu a znovu zadávat stejné příkazy, zkus stisknutím `šipka nahoru` a `šipka dolů` na klávesnici přepínat mezi nedávno použitými příkazy.

* * *

### Cvičení!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Řešení:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd pokus
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd pokus
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Gratulujeme! :)

* * *

### Jak odstranit složku

Nechceme si nechat nepořádek v počítači, takže musíme odstranit vše, co jsme až do tohoto okamžiku dělali.

Zaprvé potřebujeme se dostat zpátky na plochu:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Zkontroluj, kde se nacházíš:

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

Teď je čas vymazat adresář `pokus`:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r pokus
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S pokus
    Are you sure <Y/N>? Y
    

<!--endsec-->

Hotovo! Vše je skutečně odstraněno. Pojďme to zkontrolovat:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Zavření příkazové řádky

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Suprový, co? :)

## Shrnutí

Zde je přehled některých užitečných příkazů:

| Příkaz (Windows)        | Příkaz (Mac OS / Linux) | Popis                      | Příklad                                           |
| ----------------------- | ----------------------- | -------------------------- | ------------------------------------------------- |
| zavření příkazové řádky | zavření příkazové řádky | Zavřít okno                | **zavření příkazové řádky**                       |
| cd                      | cd                      | změnit adresář             | **cd test**                                       |
| cd                      | pwd                     | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir                     | ls                      | seznam adresářů/souborů    | **dir**                                           |
| copy                    | cp                      | kopírovat soubor           | **copy c:\test\test.txt c:\windows\test.txt** |
| move                    | mv                      | přesunout soubor           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir                   | mkdir                   | vytvořit nový adresář      | **mkdir testdirectory**                           |
| rmdir (or del)          | rm                      | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S                | rm -r                   | delete a directory         | **rm -r testdirectory**                           |

Toto je jen velmi malá část příkazů, které lze spustit v příkazovém řádku, ale pro dnešek to bude stačit.

Pokud jsi zvědavá, na [ss64.com](http://ss64.com) je úplný přehled příkazů pro všechny operační systémy.

## Připraveno?

Pojďme se ponořit do Pythonu!