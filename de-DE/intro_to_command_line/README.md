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

{% include "/intro_to_command_line/open_instructions.md" %}

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
    

Schau 'mal in den Linux-Abschnitt hier obendrüber -- so etwas wirst du wieder im Abschnitt PythonAnywhere später im Tutorial antreffen.

<!--endsec-->

Vor jedem Kommando wird das Zeichen `$` oder `>` und ein Leerzeichen vorangestellt, aber du musst das nicht hinschreiben. Dein Computer macht das für dich. :)

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
    

Wie du sehen kannst, hat der Computer gerade deinen Benutzernamen ausgegeben. Toll, was? :)

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
    

> Hinweis: "cd" steht für "change directory". Mit PowerShell kannst du auch 'pwd' verwenden, wie auf Linux oder Mac OS X.

<!--endsec-->

Du wirst wahrscheinlich etwas Ähnliches auf deinem Gerät sehen. Wenn du die Konsole öffnest, befindest du dich normalerweise im Heimverzeichnis deines Benutzers.

* * *

### Mehr über ein Kommando lernen

Viele Befehle, die du in der Kommandozeile nutzen kannst, haben eine eingebaute Hilfe, die du anzeigen und lesen kannst! Zum Beispiel kannst du etwas über den eben verwendeten Befehl lernen:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X und Linux haben einen `man`-Befehl, mit dem du die Hilfe über die Kommandos aufrufen kannst. Gib `man pwd` ein und schau, was angezeigt wird oder setzte `man` vor andere Kommandos und sieh dir deren Hilfe an. Das Ergebnis von `man` wird in der Regel seitenweise ausgegeben. Du kannst die Leertaste benutzen, um auf die nächste Seite zu gelangen und `q` (für engl. "quit", was "verlassen"/"rausgehen" heisst), um die Hilfeseiten zu schließen.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Wenn du Windows benutzt, dann wird dir der Suffix `/?` für die meisten Kommandos die Hilfeseite ausgeben. Gegebenenfalls musst du nach oben scrollen, um alles zu sehen. Versuch es mal mit `cd /?`.

<!--endsec-->

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
    

> Hinweis: PowerShell kannst du auch 'ls' verwenden, wie auf Linux oder Mac OS X.<!--endsec-->

* * *

### Wechseln des Verzeichnisses

Lass uns jetzt zu unserem Desktop-Verzeichnis wechseln:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Wenn dein Linux-Benutzerkonto auf Deutsch eingestellt ist, kann es sein, dass auch der Name des Desktop-Verzeichnisses übersetzt ist. Wenn dem so ist, musst du im obigen Befehl `Desktop` durch den übersetzten Verzeichnisnamen `Schreibtisch` ersetzen.

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

Passt!

> Profi-Tipp: Wenn du `cd D` tippst und dann `tab` auf deiner Tastatur drückst, wird die Kommandozeile automatisch den Rest des Namens vervollständigen, wodurch du schneller navigieren kannst. Wenn es mehr als einen Ordner gibt, dessen Name mit "D" beginnt, drücke die `tab`-Taste zweimal, um eine Liste der Möglichkeiten anzuzeigen.

* * *

### Erstellen eines Verzeichnisses

Wie wär's damit, ein Übungsverzeichnis auf deinem Desktop zu erstellen? So kannst du das tun:

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

Eine kleine Herausforderung für dich: Erstelle in deinem neu erstellten `practice`-Ordner ein Verzeichnis namens `test`. (Verwende dazu die Kommandos `cd` und `mkdir`.)

#### Lösung:

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

Durch Verwendung von `..` mit dem `cd`-Kommando wechselst du von deinem aktuellen Verzeichnis zum übergeordneten Verzeichnis (dies ist das Verzeichnis, das das aktuelle Verzeichnis enthält).

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

> **Achtung**: Wenn du Daten mit `del`, `rmdir` oder `rm` löschst, kannst du das nicht mehr rückgängig machen, das bedeutet, *die gelöschten Dateien sind für immer weg*! Sei also sehr vorsichtig mit diesem Befehl.

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

Das wärs fürs Erste. Du kannst nun beruhigt deine Konsole schließen. Lass es uns wie die Hacker machen, okay? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, was? :)

## Zusammenfassung

Hier ist eine Zusammenfassung einiger nützlicher Kommandos:

| Befehl (Windows) | Befehl (Mac OS / Linux) | Beschreibung                    | Beispiel                                             |
| ---------------- | ----------------------- | ------------------------------- | ---------------------------------------------------- |
| exit             | exit                    | Fenster schließen               | **exit**                                             |
| cd               | cd                      | Verzeichnis wechseln            | **cd test**                                          |
| cd               | pwd                     | aktuelles Verzeichnis anzeigen  | **cd** (Windows) oder **pwd** (Mac OS / Linux)       |
| dir              | ls                      | Unterordner/Dateien zeigen      | **dir**                                              |
| copy             | cp                      | Datei kopieren                  | **copy c:\test\test.txt c:\windows\test.txt**    |
| move             | mv                      | Datei verschieben               | **move c:\test\test.txt c:\windows\test.txt**    |
| mkdir            | mkdir                   | neues Verzeichnis erstellen     | **mkdir testdirectory**                              |
| rmdir (oder del) | rm                      | Datei löschen                   | **del c:\test\test.txt**                           |
| rmdir /S         | rm -r                   | Verzeichnis löschen             | **rm -r testdirectory**                              |
| [CMD] /?         | man [CMD]               | Hilfe für ein Kommando aufrufen | **cd /?** (Windows) oder **man cd** (Mac OS / Linux) |

Das sind nur sehr wenige der Befehle, welche du in deiner Konsole verwenden kannst, aber du wirst heute nicht mehr brauchen.

Falls du neugierig bist, findest du auf [ss64.com](http://ss64.com) eine vollständige Übersicht über alle Kommandozeilen-Befehle für alle Betriebssysteme.

## Fertig?

Lass uns mit Python anfangen!