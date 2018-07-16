> Für Leserinnen zuhause: Dieses Kapitel wird auch im Video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) behandelt.
> 
> Dieses Kapital basiert auf einem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Django ist in Python geschrieben. Um mit Django zu arbeiten, müssen wir also erst Python installieren. Lass uns das also zuerst tun! Für das Tutorial brauchen wir Python 3.6, falls du eine Vorgängerversion benutzt aktualisiere diese bitte.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Finde zuerst heraus, ob auf deinem Computer eine 32-bit- oder 64-bit-Version von Windows läuft. Drücke dafür die Windows-Taste zusammen mit der Pause/Break-Taste, was das Systeminformationen-Fenster öffnen wird, und schau nach der "Systemtyp"-Zeile. Python für Windows kannst du auf der Webseite https://www.python.org/downloads/release/python-343/ herunterladen. Klicke auf den "Latest Python 3 Release - Python x.x.x" Link. Wenn du eine **64-bit** Version von Windows benutzt, lade die Datei **Windows x86-64 executable installer** herunter. Andernfalls, lade den **Windows x86 executable installer** herunter. Führe den Installer nach dem Download (per Doppelklick) aus und folge den Anweisungen des Installationsprogramms.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![Vergiss nicht, Python zu dem Pfad hinzuzufügen](../python_installation/images/python-installation-options.png)

In künftigen Schritten werden wir die Windows-Kommandozeile verwenden (über die wir dir auch noch erzählen werden). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. Um damit die Kommandozeile zu öffnen, schreibe "cmd" ins "Run"-Fenster und drücke die Eingabetaste (Enter).

![Tippe "cmd" in das "Run"-Fenster](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python 3.6 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Python zum Pfad hinzufügen (Installer von älterer Python-Version)](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

Auf der Website https://www.python.org/downloads/release/python-361/ findest du den passenden Python-Installer:

* Runteraden der *Mac OS X 64-bit/32-bit installer*-Datei,
* Doppelklicke auf *Python.mpkg* um die Installation zu starten.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Es ist ziemlich wahrscheinlich, dass du Python schon automatisch installiert hast. Um herauszufinden, ob das so ist (und wenn ja, welche Version du hast), öffne eine Konsole und gib das folgende Kommando ein:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. Wenn Python bei dir nicht installiert ist, oder du eine andere Version willst, kannst du es folgendermaßen installieren:

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