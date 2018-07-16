> Für Leserinnen zuhause: Dieses Kapitel wird auch im Video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) behandelt.
> 
> Dieses Kapital basiert auf einem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Django ist in Python geschrieben. Um mit Django zu arbeiten, müssen wir also erst Python installieren. Lass uns das also zuerst tun! Für das Tutorial brauchen wir Python 3.6, falls du eine Vorgängerversion benutzt aktualisiere diese bitte.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Finde zuerst heraus, ob auf deinem Computer eine 32-bit- oder 64-bit-Version von Windows läuft. Drücke dafür die Windows-Taste zusammen mit der Pause/Break-Taste, was das Systeminformationen-Fenster öffnen wird, und schau nach der "Systemtyp"-Zeile. Python für Windows kannst du auf der Webseite https://www.python.org/downloads/release/python-366/ herunterladen. Klicke auf den "Latest Python 3 Release - Python x.x.x" Link. Wenn du eine **64-bit** Version von Windows benutzt, lade die Datei **Windows x86-64 executable installer** herunter. Andernfalls, lade den **Windows x86 executable installer** herunter. Führe den Installer nach dem Download (per Doppelklick) aus und folge den Anweisungen des Installationsprogramms.

Eine Sache ist zu beachten: Während der Installation wirst du ein "Setup"-Fenster bemerken. Stell sicher, dass du das Kontrollkästchen "Python 3.6 zu Pfad hinzufügen" aktiviert hast. Klicke nun auf "Jetzt installieren", wie hier gezeigt:

![Vergiss nicht, Python zu dem Pfad hinzuzufügen](../python_installation/images/python-installation-options.png)

Während der nächsten Schritte werden wir die Windows-Kommandozeile verwenden (über die wir dir auch noch etwas erzählen werden). Bis dahin, wenn du dort Befehle eingeben musst, dann gehe zum Startmenü und gib "Eingabeaufforderung" in das Suchfeld ein. (Bei alten Windows-Versionen kannst du die Eingabeaufforderung unter Startmenü → Windows System → Eingabeaufforderung finden.) Du kannst auch die Windows-Taste gedrückt halten und "R" drücken bis das "Ausführen"-Fenster auftaucht. Um damit die Kommandozeile zu öffnen, schreibe "cmd" ins "Run"-Fenster und drücke die Eingabetaste (Enter).

![Tippe "cmd" in das "Run"-Fenster](../python_installation/images/windows-plus-r.png)

Hinweis: Wenn du eine ältere Version von Windows verwendest (7, Vista oder älter) und es tritt bei der Python 3.6.x Installation ein Fehler auf, kannst du Folgendes versuchen:

1. Installiere alle Windows-Updates und versuche erneut, Python 3.6 zu installieren; oder
2. Installiere eine [ältere Version von Python](https://www.python.org/downloads/windows/), z. B. [3.4.6](https://www.python.org/downloads/release/python-346/).

Wenn du eine ältere Version von Python installierst, kann es sein, dass die Installationsanzeige etwas anders aussieht als oben gezeigt. Stell sicher, dass du nach unten scrollst bis du "python.exe zum Pfad hinzufügen" siehst, klicke den Button und wähle "Wird auf die lokale Festplatte installiert":

![Python zum Pfad hinzufügen (Installer von älterer Python-Version)](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Hinweis** Bevor du Python auf Mac OS X installierst, musst du sicherstellen, dass deine Mac-Einstellungen es erlauben, Pakete zu installieren, die nicht aus dem App Store stammen. Geh auf Systemeinstellungen (im Ordner "Programme"), klicke auf "Sicherheit", und dann auf die Registerkarte "Allgemein". Wenn "Apps-Download erlauben von:" auf "Mac App Store" gestellt ist, ändere die Einstellung auf "Mac App Store und verifizierte Entwickler".

Auf der Website https://www.python.org/downloads/release/python-366/ findest du den passenden Python-Installer:

* Lade die Datei *Mac OS X 64-bit/32-bit installer* herunter,
* Doppelklicke auf *Python.mpkg*, um die Installation zu starten.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Es ist ziemlich wahrscheinlich, dass du Python schon automatisch installiert hast. Um herauszufinden, ob das so ist (und wenn ja, welche Version du hast), öffne eine Konsole und gib das folgende Kommando ein:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Wenn du eine andere 'Mikroversion' von Python installiert hast, z.B 3.6.0, dann brauchst du die Version nicht zu aktualisieren. Wenn Python bei dir nicht installiert ist, oder du eine andere Version willst, kannst du es folgendermaßen installieren:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Gib diesen Befehl in die Konsole ein:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Gib diesen Befehl in die Konsole ein:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Auf älteren Fedora-Versionen kann es sein, dass du eine Fehlermeldung bekommst, dass das Kommando `dnf` nicht gefunden wird. Falls das passiert, musst du stattdessen yum verwenden.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Gib diesen Befehl in die Konsole ein:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Prüfe, ob die Installation erfolgreich war, in dem du ein Kommandozeilenfenster öffnest und den `python3`-Befehl ausführst:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

Wenn es Unklarheiten gibt oder wenn etwas schief ging und du nicht weiter weißt, frage bitte deinen Coach! Manchmal laufen die Dinge einfach nicht so glatt und dann ist es besser, jemanden mit mehr Erfahrung um Hilfe zu bitten.