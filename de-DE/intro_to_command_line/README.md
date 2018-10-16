# Einführung in die Kommandozeile

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) behandelt.

Aufregend, oder?! In ein paar Minuten wirst du deine erste Zeile Code schreiben! :)

**Erstmal stellen wir dir deine neue Freundin vor: Die Konsole!**

Im Folgenden zeigen wir dir, wie du das schwarze Fenster benutzt, das alle Hackerinnen nutzen. Es sieht vielleicht erstmal etwas unheimlich aus, aber es ist nur ein Programm, das darauf wartet, Anweisungen von dir zu bekommen.

> **Hinweis:** Bitte beachte, dass wir in dem gesamten Buch die Begriffe "Verzeichnis" und "Ordner" abwechselnd gebrauchen, aber sie stehen für ein und dasselbe.

## Was ist die Konsole?

Das Fenster, welches gewöhnlich die **Kommandokonsole** (command line) oder **Kommandozeilen-Interface** (command-line interface) genannt wird, ist eine textbasierte Applikation zum Betrachten, Bearbeiten und Manipulieren von Dateien auf deinem Computer. Es ist dem Windows Explorer oder Finder auf dem Mac ähnlich, aber ohne die grafische Benutzeroberfläche. Andere Bezeichnungen dafür sind: *CMD*, *CLI*, *Prompt (Eingabeaufforderung)*, *Konsole* oder *Terminal*.

## Öffnen der Konsole

Um mit unserem Tutorial zu starten, musst du als Erstes das Kommandozeilenprogramm starten.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Windows 10: Drücke die Windows-Taste → gib in die Suchleiste “cmd” ein → bestätige mit Enter.

> Ältere Versionen von Windows: Start Menu → Alle Programme → Zubehör → Eingabeaufforderung.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Mac: Öffne das Launchpad → Andere → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Wahrscheinlich ist es unter Programme → Zubehör → Terminal, aber das ist von deinem System abhängig. Wenn es nicht da ist, kannst du versuchen, danach zu googlen. :)

<!--endsec-->

## Eingabeaufforderung (Prompt)

Du solltest nun ein weißes oder schwarzes Fenster sehen, das auf deine Anweisungen wartet.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Auf einem Mac- oder Linux-Rechner siehst du wahrscheinlich ein `$`, also so:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Auf einem Windows-Rechner siehst du wahrscheinlich ein `>`, so hier:

{% filename %}command-line{% endfilename %}

    >
    

Schau mal in den Linux-Abschnitt hier obendrüber -- so etwas wirst du wieder im Abschnitt PythonAnywhere später im Tutorial antreffen.

<!--endsec-->

Vor jedem Kommando wird das Zeichen `$` oder `>` und ein Leerzeichen vorangestellt, aber du musst das nicht hinschreiben. Dein Computer macht das für dich. :-)

> Ein kleiner Hinweis: Falls du etwas in der Art wie `C:\Users\ola>` oder `Olas-MacBook-Air:~ ola$` sehen solltest, ist das auch 100%ig korrekt.

Der Teil bis und einschließlich `$` oder `>` heißt *Kommandozeilen-Eingabeaufforderung* oder kurz *Eingabeaufforderung*. Sie fordert dich auf, hier etwas einzugeben.

Wenn wir im Tutorial wollen, dass du einen Befehl eingibst, schreiben wir `$` oder `>` mit hin, gelegentlich auch noch die anderen Angaben links davon. Ignoriere den linken Teil und gib nur das Kommando ein, welches rechts der Eingabeaufforderung steht.

## Dein erstes Kommando (YAY!)

Lass uns mit diesem Kommando beginnen:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Und dann bestätige mit `Enter`. Das ist unser Ergebnis:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Wie du siehst, der Computer hat deinen Nutzernamen ausgegeben. Toll, was? :-)

> Versuch, jeden Befehl abzuschreiben und nicht zu kopieren und einzufügen. Auf diese Weise wirst du dir mehr merken!

## Grundlagen

Jedes Betriebssystem hat einen geringfügig anderen Bestand an Befehlen für die Kommandozeile, beachte daher die Anweisungen für dein Betriebssystem. Lass uns das ausprobieren.

### Aktuelles Verzeichnis

Es wäre schön zu sehen, wo wir uns befinden, oder? Lass uns nachsehen. Gib diesen Befehl in die Konsole ein und bestätige ihn mit `Enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Hinweis: 'pwd' steht für 'print working directory' (zeige derzeitiges Arbeitsverzeichnis).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Hinweis: "cd" steht für "change directory". Mit Powershell kannst du auch 'pwd' verwenden, wie auf Linux oder Mac OS X.

<!--endsec-->

Du wirst wahrscheinlich etwas Ähnliches auf deinem Gerät sehen. Wenn du die Konsole öffnest, befindest du dich normalerweise im Heimverzeichnis deines Benutzers.

* * *

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_help" data-collapse=true ces-->

Adding a `/?` suffix to most commands will print the help page. You may need to scroll your command window up to see it all. Try `cd /?`.

<!--endsec-->

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Anwendungen
    Desktop
    Downloads
    Musik
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
     05/08/2014 07:28 PM <DIR> Applications 
     05/08/2014 07:28 PM <DIR> Desktop
     05/08/2014 07:28 PM <DIR> Downloads
     05/08/2014 07:28 PM <DIR> Music ...
    

> Hinweis: Mit Powershell kannst du auch 'ls' vwerden, wie auf Linux oder Mac OS X. <!--endsec-->

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

> Pro-Tipp: Wenn du `cd D` tippst und dann `tab` auf deiner Tastatur drückst, wird die Kommandozeile automatisch den Rest des Namens vervollständigen, wodurch du schneller navigieren kannst. Wenn es mehr als einen Ordner gibt, dessen Name mit "D" beginnt, drücke die `tab`-Taste zweimal, um eine Liste der Möglichkeiten anzuzeigen.

* * *

### Create directory

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> Pro-Tipp: Wenn du die selben Befehle nicht immer wieder und wieder schreiben willst, verwende die `Pfeil aufwärts`- und `Pfeil abwärts`-Tasten deiner Tastatur, um durch die zuletzt verwendeten Befehle zu blättern.

* * *

### Exercise!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Lösung:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test 
    $ ls test
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice 
    > mkdir test 
    > dir 
    05/08/2014 07:28 PM <DIR>   test
    

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

> **Achtung**: Wenn du Daten mit `del`, `rmdir` oder `rm` löschst, kannst du das nicht mehr rückgängig machen, das bedeutet *die gelöschten Dateien sind für immer weg*! Sei also sehr vorsichtig mit diesem Befehl.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice 
    practice, Are you sure <Y/N>? Y
    

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

## Zusammenfassung

Here is a summary of some useful commands:

| Befehl (Windows) | Befehl (Mac OS / Linux) | Beschreibung                   | Beispiel                                           |
| ---------------- | ----------------------- | ------------------------------ | -------------------------------------------------- |
| exit             | exit                    | Fenster schließen              | **exit**                                           |
| cd               | cd                      | Verzeichnis wechseln           | **cd test**                                        |
| cd               | pwd                     | aktuelles Verzeichnis anzeigen | **cd** (Windows) oder **pwd** (Mac OS / Linux)     |
| dir              | ls                      | Unterordner/Dateien zeigen     | **dir**                                            |
| copy             | cp                      | Datei kopieren                 | **copy c:\test\test.txt c:\windows\test.txt**  |
| move             | mv                      | Datei verschieben              | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir            | mkdir                   | neues Verzeichnis erstellen    | **mkdir testdirectory**                            |
| rmdir (oder del) | rm                      | Datei löschen                  | **del c:\test\test.txt**                         |
| rmdir /S         | rm -r                   | Verzeichnis löschen            | **rm -r testdirectory**                            |
| [CMD] /?         | man [CMD]               | get help for a command         | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Fertig?

Let's dive into Python!