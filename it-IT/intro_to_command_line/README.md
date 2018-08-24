# Introduzione alla linea di comando

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Ti presentiamo il tuo primo nuovo amico: la linea di comando!**

I prossimi passaggi ti mostreranno come utilizzare quella 'finestra nera' che tutti gli hacker utilizzano. Ti potrà sembrare un po' allarmante all'inizio, ma è solamente un prompt in attesa dei tuoi comandi.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Cos'è la command line?

La finestra solitamente chiamata **comand-line** o **interfaccia della command-line**, è un'applicazione basata su testo che ti permette di visualizzare, gestire e manipolare i file sul tuo computer. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Altri nomi per la command line sono: *cmd*, *CLI*, *prompt*, *console* o *terminal*.

## Aprire l'interfaccia di command-line

Per cominciare a sperimentare dobbiamo aprire l'interfaccia della nostra command-line.

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

## Prompt

Ora dovresti essere in grado di vedere una finestra bianca o nera che è in attesa di ricevere un comando.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Su Windows, è un segno `>`, come questo:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Ogni comando sarà preceduto da questo simbolo e da uno spazio, ma tu non hai bisogno di digitarlo. Il computer lo farà per te. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

La parte fino al `$` o al `>` inclusi, si chiama *prompt della linea di comando* o semplicemente *prompt*. Ti richiede di inserire qualcosa.

Nel tutorial quando vorremo che tu scriva un comando, includeremo `$` o `>` e occasionalmente qualcosa in più a sinistra. Ignore the left part and only type in the command, which starts after the prompt.

## Il tuo primo comando (YAY!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Premi `invio`. Questo è il nostro risultato:

{% filename %}command-line{% endfilename %}

    $ whoami olasitarska
    

Come puoi vedere, il computer ha appena stampato il tuo nome utente. Bello, eh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Nozioni di base

Ogni sistema operativo ha un insieme di comandi leggermente diverso per la command line, per cui assicurati di seguire le istruzioni per il tuo sistema operativo. Proviamo questo, ti va?

### Cartella corrente

Sarebbe bello sapere dove siamo adesso, vero? Vediamo. Digita questo commando e premi `invio`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd/utenti/olasitarska
    

> Nota: 'pwd' sta per 'stampa directory di lavoro'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Probabilmente vedrai qualcosa di simile sul tuo computer. Quando apri la command-line normalmente inizi sulla tua directory home.

* * *

### Elenco di file e cartelle

Cosa c'è dentro? Sarebbe bello scoprirlo. Vediamo come:

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

### Cambiare cartella corrente

Ora, andiamo nella nostra directory Desktop:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Controlla ora se ti sei veramente spostato/a:

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

Ecco fatto!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Creare una directory

Che ne dici di creare una directory di pratica sul tuo desktop? Puoi farlo in questo modo:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Questo breve comando creerà una cartella con il nome `practice` sul tuo desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Provalo. :)

> Suggerimento PRO: se non vuoi digitare lo stesso comando tutte le volte, prova a premere ` freccia in su ` e `freccia in giù` sulla tua tastiera per scorrere tutti i comandi che hai usato fin ora.

* * *

### Esercizio!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Soluzione:

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

Congratulazioni! :)

* * *

### Facciamo ordine

Non vogliamo lasciare un pasticcio, per cui rimuoviamo tutto quello che abbiamo fatto fino a questo punto.

Per prima cosa dobbiamo tornare al Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Controlla dove ti trovi ora:

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

Adesso è l'ora di cancellare la directory `practice`:

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

Fatto! Per essere sicuri che sia stato effettivamente cancellato, controlliamo:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Uscire dalla command line

Questo è tutto per ora! puoi tranquillamente chiudere la tua command line. facciamolo alla maniera degli hacker, va bene? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Figo, eh? :)

## Indice

Questo è un riepilogo di alcuni comandi utili:

| Comandi(Windows) | Comandi (Mac OS / Linux)  | Descrizione                | Esempio                                           |
| ---------------- | ------------------------- | -------------------------- | ------------------------------------------------- |
| esci             | uscire dalla command line | chiudi la finestra         | **uscire dalla command line**                     |
| cd               | cd                        | cambiare directory         | **cd test**                                       |
| cd               | pwd                       | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir              | ls                        | elenco directory/file      | **dir**                                           |
| copia            | cp                        | copia un file              | **copy c:\test\test.txt c:\windows\test.txt** |
| sposta           | mv                        | spostare un file           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                     | creare una nuova directory | **mkdir testdirectory**                           |
| rmdir (or del)   | rm                        | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                     | delete a directory         | **rm -r testdirectory**                           |

Questi sono solo alcuni dei comandi che puoi eseguire sulla tua command line, ma non ne userai altri oltre a quelli spiegati oggi.

Se sei curioso/a, [ss64.com](http://ss64.com) contiene una guida completa ai comandi per tutti i sistemi operativi.

## Fatto?

Tuffiamoci in Python!