> Für Leserinnen zuhause: Dieses Kapitel wird auch im Video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) behandelt.
> 
> Dieses Kapital basiert auf einem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Django is written in Python. We need Python to do anything in Django. Let's start by installing it! We want you to install the latest version of Python 3, so if you have any earlier version, you will need to upgrade it. If you already have version 3.4 or higher you should be fine.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Bitte schau zuerst auf der "Systemtyp"-Zeile der Systeminformationsseite nach, ob auf deinem Computer eine 32-Bit-Version oder eine 64-Bit-Version von Windows läuft. Um diese Seite zu finden, versuche eine der folgenden Methoden:

* Drücke die Windows-Taste und die Pause/Break-Taste zur selben Zeit
* Öffne dein Control Panel über das Windows Menü und navigiere dann zu System & Sicherheit, dann System
* Drücke die Windows-Taste und navigiere dann zu Einstellungen > System > Über

Du kannst Python für Windows von der Webseite https://www.python.org/downloads/windows/ herunterladen. Klicke auf den "Latest Python 3 Release - Python x.x.x" Link. Wenn du eine **64-bit** Version von Windows benutzt, lade die Datei **Windows x86-64 executable installer** herunter. Andernfalls lade den **Windows x86 executable installer** herunter. Führe den Installer nach dem Download (per Doppelklick) aus und folge den Anweisungen des Installationsprogramms.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Vergiss nicht, Python zu dem Pfad hinzuzufügen](../python_installation/images/python-installation-options.png)

Wenn die Installation abgeschlossen ist, siehst du vielleicht ein Dialogfeld mit einem Link, wo du mehr über Python oder über die Version lernen kannst. Schließe es oder brich den Dialog ab -- du wirst darüber mehr in diesem Tutorial lernen!

Während der nächsten Schritte werden wir die Windows-Kommandozeile verwenden (über die wir dir auch noch etwas erzählen werden). Wenn du bis dahin Befehle in die Kommandozeile eingeben musst, dann gehe zum Startmenü und gib "Eingabeaufforderung" in das Suchfeld ein. (Bei alten Windows-Versionen kannst du die Eingabeaufforderung unter Startmenü → Windows System → Eingabeaufforderung finden.) Du kannst auch die Windows-Taste gedrückt halten und "R" drücken bis das "Ausführen"-Fenster auftaucht. Um damit die Kommandozeile zu öffnen, schreibe "cmd" ins "Run"-Fenster und drücke die Eingabetaste (Enter).

![Tippe "cmd" in das "Run"-Fenster](../python_installation/images/windows-plus-r.png)

Hinweis: Falls du eine ältere Version von Windows verwendest (7, Vista oder älter) und die Installation von Python 3.6.x mit einer Fehlermeldung fehlschlägt, kannst du Folgendes versuchen:

1. install all Windows Updates and try to install Python again; or
2. Installiere eine [ältere Version von Python](https://www.python.org/downloads/windows/), z. B. [3.4.6](https://www.python.org/downloads/release/python-346/).

Wenn du eine ältere Version von Python installierst, kann es sein, dass die Installationsanzeige etwas anders aussieht als oben gezeigt. Stell sicher, dass du nach unten scrollst bis du "Add python.exe to Path" siehst, klicke den Button und wähle "Will be installed on local hard drive":

![Python zum Pfad hinzufügen (Installer von älterer Python-Version)](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Hinweis** Bevor du Python auf Mac OS X installierst, musst du sicherstellen, dass deine Mac-Einstellungen es erlauben, Pakete zu installieren, die nicht aus dem App Store stammen. Geh auf Systemeinstellungen (im Ordner "Programme"), klicke auf "Sicherheit", und dann auf die Registerkarte "Allgemein". Wenn "Apps-Download erlauben von:" auf "Mac App Store" gestellt ist, ändere die Einstellung auf "Mac App Store und verifizierte Entwickler".

Auf der Website https://www.python.org/downloads/release/python-361/ findest du den passenden Python-Installer:

* Lade die Datei *Mac OS X 64-bit/32-bit installer* herunter,
* Doppelklicke auf *python-3.6.1-macosx10.6.pkg*, um die Installation zu starten.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Es ist ziemlich wahrscheinlich, dass du Python schon automatisch installiert hast. Um herauszufinden, ob das so ist (und wenn ja, welche Version du hast), öffne eine Konsole und gib das folgende Kommando ein:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a newer version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Gib diesen Befehl in die Konsole ein:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Gib diesen Befehl in die Konsole ein:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Auf älteren Fedora-Versionen kann es sein, dass du eine Fehlermeldung bekommst, dass das Kommando `dnf` nicht gefunden wird. Falls das passiert, musst du stattdessen `yum` verwenden.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Gib diesen Befehl in die Konsole ein:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Prüfe, ob die Installation erfolgreich war, indem du ein Kommandozeilenfenster öffnest und den `python3`-Befehl ausführst:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.