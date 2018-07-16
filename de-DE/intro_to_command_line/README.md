# Einführung in die Kommandozeile

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) behandelt.

Aufregend, oder?! In ein paar Minuten wirst du deine erste Zeile Code schreiben! :)

**Erstmal stellen wir dir deine neue Freundin vor: Die Konsole!**

Im Folgenden zeigen wir dir, wie du das schwarze Fenster benutzt, das alle Hackerinnen nutzen. Es sieht vielleicht erstmal etwas unheimlich aus, aber es ist nur ein Programm, das darauf wartet, Anweisungen von dir zu bekommen.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Was ist die Konsole?

Das Fenster, welches gewöhnlich die **Kommandokonsole** (command line) oder **Kommandozeilen-Interface** (command-line interface) genannt wird, ist eine textbasierte Applikation zum Betrachten, Bearbeiten und Manipulieren von Dateien auf deinem Computer. Es ist ähnlich wie der Windows Explorer oder Finder auf dem Mac, aber ohne die grafische Benutzeroberfläche. Andere Bezeichnungen dafür sind: *cmd*, *CLI*, *prompt*, *Eingabeaufforderung*, *Konsole* oder <0>Terminal</0>.

## Öffnen der Konsole

Um mit unserem Tutorial zu starten, musst du als Erstes das Kommandozeilenprogramm starten.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Windows 10: Gehe zur Suchleiste → Gib "cmd" in die Suche ein → Klicke den Eintrag Eingabeaufforderung mit der rechten Maustaste an → Wähle aus dem nächsten Menü die Option Ausführen aus.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Wahrscheinlich ist es unter Programme → Zubehör → Terminal, aber das ist von deinem System abhängig. Wenn es nicht da ist, google einfach schnell danach. :)

<!--endsec-->

## Eingabeaufforderung (Prompt)

Du solltest nun ein weißes oder schwarzes Fenster sehen, das auf deine Anweisungen wartet.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Auf einem Mac oder Linux, siehst du wahrscheinlich `$`, also so:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Auf Windows siehst du ein `>` Zeichen, also das hier:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Vor jedem Kommando wird dieses Zeichen und ein Leerzeichen vorangestellt, aber du musst das nicht hinschreiben. Dein Computer macht das für dich. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## Dein erstes Kommando (YAY!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Und dann betätige mit `Enter`. Das ist unser Ergebnis:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

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
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Du wirst wahrscheinlich etwas Ähnliches auf deinem Gerät sehen. Wenn du die Konsole öffnest, befindest du dich normalerweise im Heimverzeichnis deines Benutzers.

* * *

### Anzeigen von Dateien und Unterordnern

Nun, was befindet sich in deinem Verzeichnis? Es wäre toll, das herauszufinden. Lass uns mal schauen:

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
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Wechseln des Verzeichnisses

Lass uns jetzt zu unserem Desktop-Verzeichnis wechseln:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Schau, ob das Wechseln des Verzeichnisses funktioniert hat:

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

Hier ist es!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Erstellen eines Verzeichnisses

Wie wärs damit, ein Probeverzeichnis auf deinem Desktop zu erstellen? So kannst du das tun:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Dieser kleine Befehl erstellt einen Ordner mit dem Namen `practice` auf deinem Desktop. Du kannst nun überprüfen, ob er wirklich dort ist, indem du auf deinem Desktop nachschaust oder indem du den Befehl `ls` oder `dir` ausführst! Versuch es. :)

> Profi-Tipp: Wenn du die selben Befehle nicht immer wieder und wieder schreiben willst, verwende die `Pfeil aufwärts`- und `Pfeil abwärts`-Tasten deiner Tastatur, um durch die zuletzt verwendeten Befehle zu blättern.

* * *

### Übung!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Lösung:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test 
    $ ls test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice 
    > mkdir test 
    > dir 
    05/08/2014 07:28 PM <DIR>   test
    

<!--endsec-->

Glückwunsch! :)

* * *

### Aufräumen

Wir wollen kein Chaos hinterlassen, also lass uns das bislang Geschaffene wieder löschen.

Zuerst müssen wir zurück zum Desktop wechseln:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Schau nach, wo du gerade bist:

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

Jetzt ist es an der Zeit, dein `practice`-Verzeichnis zu löschen:

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

Geschafft! Lass uns schauen, ob es wirklich gelöscht ist:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Beenden

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

Hier ist eine Zusammenfassung einiger nützlicher Kommandos:

| Befehl (Windows) | Befehl (Mac OS / Linux) | Beschreibung                | Beispiel                                          |
| ---------------- | ----------------------- | --------------------------- | ------------------------------------------------- |
| beenden          | beenden                 | Fenster schließen           | **beenden**                                       |
| cd               | cd                      | Verzeichnis wechseln        | **cd test**                                       |
| cd               | pwd                     | show the current directory  | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir              | ls                      | Unterordner/Dateien zeigen  | **dir**                                           |
| copy             | cp                      | Datei kopieren              | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | Datei verschieben           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | neues Verzeichnis erstellen | **mkdir testdirectory**                           |
| rmdir (or del)   | rm                      | delete a file               | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                   | delete a directory          | **rm -r testdirectory**                           |

Das sind nur sehr wenige aller Befehle, die du in deiner Konsole verwenden kannst, heute aber wirst du keine weiteren brauchen.

Falls du neugierig bist, findest du auf [ss64.com](http://ss64.com) eine vollständige Übersicht über alle Kommandozeilen-Befehle für alle Betriebssysteme.

## Fertig?

Lass uns mit Python anfangen!