> Für zu Hause: Dieses Kapitel hat ein Video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).

> Dieses Unterkapital basiert auf einem Tutorial der Geek Girls Carrots (http://django.carrots.pl/).

Django ist in Python geschrieben. Wir brauchen Python für alles in Django. Fangen wir mit der Installation an! Wir möchten, dass du Python 3.5 installierst, solltest du also bereits eine ältere Version installiert haben, musst du diese aktualisieren.


<!--sec data-title="Python installieren: Windows" data-id="python_windows" data-collapse=true ces-->

### Windows

Python für Windows kannst du auf der Webseite https://www.python.org/downloads/windows/ herunterladen. Nachdem du die ***.msi**-Datei heruntergeladen hast, solltest du diese ausführen (doppelklicke die Datei) und den Anweisungen folgen. Es ist wichtig, dass du dir den Pfad (das Verzeichnis) merkst, wo du Python installierst. Du wirst das später brauchen!

Worauf du besonders achten solltest: im zweiten Schritt des Installationsassistenten ("Anpassen") solltest du nach unten scrollen und die Option "Add python.exe to the Path" auswählen, wie hier:

![Vergiss nicht, Python zu dem Pfad hinzuzufügen](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Python installieren: macOS X" data-id="python_OSX"
data-collapse=true ces-->

### macOS X

Auf der Website https://www.python.org/downloads/release/python-343/ findest du den passenden Python-Installer:

  * Runteraden der *macOS X 64-bit/32-bit installer*-Datei,
  * Doppelklick auf *python-3.5.1-macosx10.6.pkg*, um das Installationsprogramm auszuführen.

<!--endsec-->

<!--sec data-title="Python installieren: Linux" data-id="python_linux"
data-collapse=true ces-->

### Linux

Es ist ziemlich wahrscheinlich, dass du Python schon automatisch installiert hast. Um herauszufinden, ob das so ist (und wenn ja, welche Version du hast), öffne eine Konsole und gib das folgende Kommando ein:

```bash
$ python3 --version
Python 3.5.1
```

Wenn Python bei dir nicht installiert ist, oder du eine andere Version willst, kannst du es folgendermaßen installieren:

#### Debian oder Ubuntu

Gib diesen Befehl in die Konsole ein:

```bash
$ sudo apt install python3.5
```

#### Fedora (bis zu 21)

Gib diesen Befehl in die Konsole ein:

```bash
    $ sudo yum install python3.5
```

#### Fedora (22+)

Gib diesen Befehl in die Konsole ein:

```bash
$ sudo dnf install python3.5
```

### openSUSE

Gib diesen Befehl in die Konsole ein:

```bash
$ sudo zypper install python3
```
<!--endsec-->

Um zu überprüfen, ob die Installation erfolgreich war, öffne eine Konsole und gib das `python3`-Kommando ein:

```bash
$ python3 --version
Python 3.5.1
```

Falls du irgendwelche Zweifel hast oder falls etwas falsch gelaufen ist und du keine Ahnung hast, was als Nächstes zu tun ist - frag einfach deinen Coach! Manchmal laufen die Dinge einfach nicht so glatt und dann ist es besser, jemanden mit mehr Erfahrung zu fragen.
