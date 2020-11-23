> Für Leserinnen zuhause: Dieses Kapitel wird auch im Video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) behandelt.
> 
> Dieses Kapital basiert auf einem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Django ist in Python geschrieben. Wir brauchen Python für alles in Django. Fangen wir mit der Installation an! Wir möchten, dass du Python 3 installierst. Solltest du also bereits eine ältere Version installiert haben, musst du diese aktualisieren. Wenn du schon Version {{ book.py_min_version }} oder höher hast, ist das in Ordnung.

Bitte installiere ein gewöhnliches Python wie folgt, selbst falls auf deinem Computer bereits Anaconda installiert ist.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Bitte schau zuerst auf der "Systemtyp"-Zeile der Systeminformationsseite nach, ob auf deinem Computer eine 32-Bit-Version oder eine 64-Bit-Version von Windows läuft. Um diese Seite zu finden, versuche eine der folgenden Methoden:

* Drücke die Windows-Taste und die Pause/Break-Taste zur selben Zeit
* Öffne dein Control Panel über das Windows Menü und navigiere dann zu System & Sicherheit, dann System
* Drücke die Windows-Taste und navigiere dann zu Einstellungen > System > Über
* Suche im Windows-Startmenü nach "Systeminformationen". Klicke datu auf Start oder drücke die Window-Taste, dann beginne `Systeminformationen` zu tippen. Sobald du etwas eingegeben hast, bekommst du passende Vorschläge. Wähle den Eintrag "Systeminformationen" an, sobald er erscheint.

Du kannst Python für Windows von der Webseite https://www.python.org/downloads/windows/ herunterladen. Klicke auf den "Latest Python 3 Release - Python x.x.x" Link. Wenn du eine **64-bit**-Version von Windows benutzt, lade die Datei **Windows x86-64 executable installer** herunter. Andernfalls lade den **Windows x86 executable installer** herunter. Führe den Installer nach dem Download (per Doppelklick) aus und folge den Anweisungen des Installationsprogramms.

Auf eine Sache solltest du achten: Während der Installation wird ein Setup-Fenster auftauchen. Stell sicher, dass du die Checkbox mit "Add Python {{ book.py_version }} to PATH" oder "Add Python to your environment variables" aktiviert hast und klicke dann auf "Install Now" wie hier gezeigt (es kann bei dir etwas anders aussehen, wenn du eine andere Version installierst):

![Vergiss nicht, Python zum Pfad hinzuzufügen](../python_installation/images/python-installation-options.png)

Wenn die Installation abgeschlossen ist, siehst du vielleicht ein Dialogfeld mit einem Link, wo du mehr über Python oder über die Version lernen kannst. Schließe es oder brich den Dialog ab -- du wirst darüber mehr in diesem Tutorial lernen!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} benötigt Python {{ book.py_min_version }} oder höher, das weder Windows XP noch frühere Windows-Versionen unterstützt.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Hinweis** Bevor du Python auf Mac OS X installierst, musst du sicherstellen, dass deine Mac-Einstellungen es erlauben, Pakete zu installieren, die nicht aus dem App Store stammen. Geh auf Systemeinstellungen (im Ordner "Programme"), klicke auf "Sicherheit", und dann auf die Registerkarte "Allgemein". Wenn "Apps-Download erlauben von:" auf "Mac App Store" gestellt ist, ändere die Einstellung auf "Mac App Store und verifizierte Entwickler".

Auf der Website https://www.python.org/downloads/mac-osx/ findest du aktuellen Python-Installer:

* Lade die Datei *Mac OS X 64-bit/32-bit installer* herunter,
* Doppelklicke auf *python-{{ book.py_release }}-macosx10.9.pkg*, um die Installation zu starten.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Es ist ziemlich wahrscheinlich, dass du Python schon automatisch installiert hast. Um herauszufinden, ob das so ist (und wenn ja, welche Version du hast), öffne eine Konsole und gib das folgende Kommando ein:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.