# Uvod u interfejs komandne linije

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Upoznaćemo vas sa vašim novim prijateljem: komandnom linijom!**

Naredni koraci će vam pokazati kako da koristite onaj crni prozor koji svi hakeri koriste. Možda će delovati pomalo strašno u početku, ali je to zapravo jedan program koji čeka vaše komande.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Šta je komandna linija?

Prozor koji se obično naziva ** komandna linija** ili **interfejs komandne linije** je tekstualno bazirana aplikacija za pregled, rukovanje i manipulaciju fajlovima na vašem kompjuteru. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Otvorite interfejs komandne linije

Da bismo započeli eksperimentisanje, moramo prvo otvoriti naš interfejs komandne linije.

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

Trebalo bi da vidite beli ili crni prozor koji čeka vaše komande.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ako koristite Mac ili Linux, verovatno vidite `$`, poput ovoga:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

Na Windows-u imate znak `>`, poput ovoga:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Vaša prva komanda (YAY!)

Počnimo od nečeg jednostavnog. Otkucajte komandu:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

I pritisnite `enter`. Ovo je naš rezultat:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Osnove

Svaki operativni sistem ima malo drugačiji skup komandi za komandnu liniju, te budite sigurni da pratite instrukcije za vaš operativni sistem. Probajmo sledeće:

### Trenutni direktorijum

Bilo bi lepo znati gde smo sada, zar ne? Pogledajmo. Ukucajte sledeću komandu i pritisnite `enter`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Napomena 'pwd' znači 'print working directory'.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Verovatno ćete videti nešto slično na vašoj mašini. Kada otvorite komandnu liniju, obično počinjete na home direktorijimu vašeg naloga.

* * *

### Izlistavanje fajlova i direktorijuma

Šta je sve unutra? Bilo bi interesantno otkriti. Pogledajmo:

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

### Promena tekućeg direktorijuma

Hajdemo sada na Desktop direktorijum:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Proverimo da li se stvarno promenio:

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

Tu je!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Kreiranje direktorijuma

Šta kažete na to da napravimo direktorijum vežbe radi na vašem desktop-u? Možete to učiniti na sledeći način:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir vezba
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir vezba
    

<!--endsec-->

Ova mala komanda kreira folder sa nazivom `vezba` na vašem desktop-u. Možete proveriti da li je zaista tamo ako pogledate vaš desktop ili pokrenete komandu `ls` ili `dir`! Try it. :)

> PRO saver> Ako ne želite da kucate istu komandu ponovo i ponovo, pritisnite `strelicu na gore` i `strelicu na dole` na vašoj tastaturi da biste se kretali kroz skoro unete komande.

* * *

### Vežba!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Rešenje:

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

Čestitamo! :)

* * *

### Čišćenje

Ne želimo da ostavimo haos, pa hajde da izbrišemo sve što smo uradili do ove tačke.

Najpre treba da se vratimo na desktop:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Pogledajmo gde smo:

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

Sada je vreme da izbrišemo `vezva` direktorijum:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r vezba
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S vezba
    vezba, Are you sure <Y/N>? Y
    

<!--endsec-->

Gotovo! Da bismo bili sigurni da je stvarno izbrisano, proverimo sledeće:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Izlazak

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

## Kratak pregled

Evo pregleda nekih korisnih komandi:

| Komande (Windows) | Komande (Mac OS / Linux) | Opis                            | Primer                                            |
| ----------------- | ------------------------ | ------------------------------- | ------------------------------------------------- |
| exit              | exit                     | zatvara prozor                  | **exit**                                          |
| cd                | cd                       | menja direktorijum              | **cd test**                                       |
| cd                | pwd                      | show the current directory      | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir               | ls                       | izlistava direktorijume/fajlove | **dir**                                           |
| copy              | cp                       | kopira fajl                     | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | premešta fajl                   | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | pravi novi direktorijum         | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                       | delete a file                   | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | delete a directory              | **rm -r testdirectory**                           |

Ovo je samo mali broj komandi koje možete koristiti u vašoj komandnoj liniji, ali danas nećete koristiti ništa više dodatno.

Ako vas zanima, [ss64.com](http://ss64.com) sadrži kompletan pregled svih komandi za sve operativne sisteme.

## Spremni?

Hajde da se bacimo na Python!