# Introduzione all'interfaccia a riga di comando

> Messaggio per i lettori: questo capitolo si trova nel video [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Non è grandioso? avete appena scritto la vostra prima linea di codice in pochi minuti! :)

**Ti presentiamo il tuo primo nuovo amico: la riga di comando!**

I prossimi passaggi ti mostreranno come utilizzare quella 'finestra nera' che tutti gli hacker utilizzano. Ti potrà sembrare un po' allarmante all'inizio, ma è solamente un prompt in attesa dei tuoi comandi.

> **Nota**: si prega di notare che in questo libro useremo il termine "directory" e "cartella" in maniera intercambiabile, ma sono la medesima cosa.

## Cos'è la riga di comando?

La finestra solitamente chiamata **riga di comando** o **interfaccia della riga di comando**, è un'applicazione basata su testo che ti permette di visualizzare, gestire e modificare i file sul tuo computer. È simile a Windows Explorer o Finder su Mac, ma senza interfaccia grafica. Altri nomi della riga di comando sono: *cmd*, *CLI*, *prompt*, *console* o *terminal*.

## Aprire l'interfaccia della riga di comando

Per cominciare a sperimentare, dobbiamo prima aprire la nostra interfaccia della riga di comando.

{% include "/intro_to_command_line/open_instructions.md" %}

## Prompt

Dovreste vedere ora una finestra nera o bianca in attesa dei vostri comandi.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Se state utilizzando un Mac o Linux, vedrete probabilmente un`$` come questo:

{% filename %}riga di comando{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Su Windows, probebilmente vedrete un`>` come questo:

{% filename %}riga di comando{% endfilename %}

    >
    

Dai un'occhiata alla sezione Linux appena sopra -- vedrai qualcosa di più come quando arriverai a PythonAnywhere più tardi nel tutorial.

<!--endsec-->

Ogni comando sarà prepesso da un `$` o `>` e uno spazio, ma non dovresti digitarlo. Il tuo computer lo farà per te. :)

> Solo una piccola nota: nel tuo caso ci dovrebbe essere qualcosa come `C:\Users\ola>` oppure `Olas-MacBook-Air:~ ola$` prima del segno di prompt. È corretto al 100%.

La parte fino al `$` o al `>` inclusi, si chiama *prompt della linea di comando* o semplicemente *prompt*. Ti richiede di inserire qualcosa.

Nel tutorial quando vorremo che tu scriva un comando, includeremo `$` o `>` e occasionalmente qualcosa in più a sinistra. Puoi ignorare la parte a sinistra e inserire solo il comando dopo il prompt.

## Il tuo primo comando (YAY!)

Iniziamo digitando questo comando:

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

> Prova a digitare ogni comando, non copiare ed incollare. Ti ricorderai di più in questo modo!

## Nozioni di base

Ogni sistema operativo ha un insieme di comandi leggermente diverso per la command line, per cui assicurati di seguire le istruzioni per il tuo sistema operativo. Proviamo questo, ti va?

### Cartella corrente

Sarebbe bello sapere dove ci troviamo ora, giusto?Vediamo. Digita questo comando e premi Invio:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd/utenti/olasitarska
    

> Nota: 'pwd' sta per 'stampa directory di lavoro'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd C:\Users\olasitarska
    

> Nota: 'cd' è per 'modifica cartella'. Con la shell può usare pwd come su Linux o Mac OS X.

<!--endsec-->

Probabilmente vedrai qualcosa di simile sul tuo computer. Quando apri la command-line normalmente inizi sulla tua directory home.

* * *

### Guida Utente

Molti comandi che puoi digitare al comando richiesto hanno un aiuto integrato che puoi visualizzare e leggere! Per esempio, per saperne di più sul comando della directory corrente:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X e Linux hanno un comando `man` che ti dà aiuto sui comandi. Prova `man pwd` e vedi cosa dice, o mette `man` prima di altri comandi per vedere il loro aiuto. L'output di `man` è normalmente paginato. Usa la barra di spazio per passare alla pagina successiva, e `q` per smettere di guardare l'aiuto.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Aggiungere un suffisso `/?` alla maggior parte dei comandi stamparà la pagina di aiuto. Potresti dover scorrere la finestra di comando per vederlo tutto. Prova `cd /?`.

<!--endsec-->

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
    

> Nota: Nella shell vocale puoi anche utilizzare 'ls' come su Linux e Mac OS X. <!--endsec-->

* * *

### Cambiare cartella corrente

Ora, andiamo nella nostra directory Desktop:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Nota che il nome della directory "Desktop" potrebbe essere tradotto nella lingua del tuo account Linux. Se così è, dovrai sostituire `Desktop` con il nome tradotto; per esempio, `Schreibtisch` per il tedesco.

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

> Suggerimento PRO:se digiti `cd D` e poi premi `tab` sulla tastiera, la command-line completerà automaticamente il resto del nome per cui puoi navigare più velocemente. Se c'è più di una cartella che comincia con "D", premi `tab` due volte per ottenere la lista con tutte le opzioni.

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

Questo breve comando creerà una cartella con il nome `practice` sul tuo desktop. Puoi controllare se è lì semplicemente guardando sul tuo desktop oppure eseguendo un commando `ls` oppure `dir`! Provalo. :)

> Suggerimento PRO: se non vuoi digitare lo stesso comando tutte le volte, prova a premere ` freccia in su ` e `freccia in giù` sulla tua tastiera per scorrere tutti i comandi che hai usato fin ora.

* * *

### Esercizio!

Piccola sfida per te: nella tua directory appena creata `practice` crea una directory chiamata `test`. usa i comandi `cd` e `mkdir`.)

#### Soluzione:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}riga di comando{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Congratulazioni!

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

Usando `..` con il comando `cd` cambierai la tua directory attuale alla directory padre (si tratta della cartella che contiene la tua directory attuale).

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

> **Attenzione**: cancellare un file usando `del`, `rmdir` o `rm` è irreversibile, *i file cancellati andranno perduti per sempre*! Per cui sii molto prudente nell'utilizzare questi comandi.

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

| Comandi(Windows) | Comandi (Mac OS / Linux)  | Descrizione                     | Esempio                                           |
| ---------------- | ------------------------- | ------------------------------- | ------------------------------------------------- |
| esci             | uscire dalla command line | chiudi la finestra              | **uscire dalla command line**                     |
| cd               | cd                        | cambiare directory              | **cd test**                                       |
| cd               | pwd                       | Cambiare cartella corrente      | **cd** (Windows) o **pwd** (Mac OS / Linux)       |
| dir              | ls                        | elenco directory/file           | **dir**                                           |
| copia            | cp                        | copia un file                   | **copy c:\test\test.txt c:\windows\test.txt** |
| sposta           | mv                        | spostare un file                | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                     | creare una nuova directory      | **mkdir testdirectory**                           |
| rmdir (or del)   | rm                        | Eliminare un file               | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                     | Seleziona una cartella          | **mkdir testdirectory**                           |
| [CMD]/?          | man [CMD]                 | Ottieni un aiuto per un comando | **cd** (Windows) o **pwd** (Mac OS / Linux)       |

Questi sono solo alcuni dei comandi che puoi eseguire sulla tua command line, ma non ne userai altri oltre a quelli spiegati oggi.

Se sei curioso/a, [ss64.com](http://ss64.com) contiene una guida completa ai comandi per tutti i sistemi operativi.

## Fatto?

Tuffiamoci in Python!