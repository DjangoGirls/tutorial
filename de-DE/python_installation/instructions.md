> Für Leserinnen zuhause: Dieses Kapitel wird auch im Video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) behandelt.
> 
> Dieses Kapital basiert auf einem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Django ist in Python geschrieben. Wir brauchen Python für alles in Django. Fangen wir mit der Installation an! Wir möchten, dass du Python 3 installierst. Solltest du also bereits eine ältere Version installiert haben, musst du diese aktualisieren. Wenn du schon Version 3.4 oder höher besitzt, ist das in Ordnung.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Bitte schau zuerst auf der "Systemtyp"-Zeile der Systeminformationsseite nach, ob auf deinem Computer eine 32-Bit-Version oder eine 64-Bit-Version von Windows läuft. Um diese Seite zu finden, versuche eine der folgenden Methoden:

* Drücke die Windows-Taste und die Pause/Break-Taste zur selben Zeit
* Öffne dein Control Panel über das Windows Menü und navigiere dann zu System & Sicherheit, dann System
* Drücke die Windows-Taste und navigiere dann zu Einstellungen > System > Über

Du kannst Python für Windows von der Webseite https://www.python.org/downloads/windows/ herunterladen. Klicke auf den "Latest Python 3 Release - Python x.x.x" Link. Wenn du eine **64-bit**-Version von Windows benutzt, lade die Datei **Windows x86-64 executable installer** herunter. Andernfalls lade den **Windows x86 executable installer** herunter. After downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. Installiere alle Windows-Updates und versuche erneut, Python zu installieren; oder
2. Installiere eine [ältere Version von Python](https://www.python.org/downloads/windows/), z. B. [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Hinweis** Bevor du Python auf Mac OS X installierst, musst du sicherstellen, dass deine Mac-Einstellungen es erlauben, Pakete zu installieren, die nicht aus dem App Store stammen. Geh auf Systemeinstellungen (im Ordner "Programme"), klicke auf "Sicherheit", und dann auf die Registerkarte "Allgemein". Wenn "Apps-Download erlauben von:" auf "Mac App Store" gestellt ist, ändere die Einstellung auf "Mac App Store und verifizierte Entwickler".

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Lade die Datei *Mac OS X 64-bit/32-bit installer* herunter,
* Doppelklicke auf *python-3.6.1-macosx10.6.pkg*, um die Installation zu starten.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a newer version, you can install it as follows:

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
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.