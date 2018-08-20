Git ist ein "Versionsverwaltungssystem" für Dateien und Code, das von vielen Programmierern benutzt wird. Diese Software kann Änderungen an Dateien über die Zeit verfolgen, so dass du bestimmte Versionen im Nachhinein wieder aufrufen kannst. So ähnlich wie die Veränderungsverfolgung in der Textverarbeitung (z.B. Microsoft Word oder LibreOffice), aber viel mächtiger.

## Git installieren

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Du kannst Git von [git-scm.com](https://git-scm.com/) herunterladen. Du kannst immer "next" klicken bei allen Schritten, bis zu der Anweisung "Adjusting your PATH environment". Wähle die Einstellung "Run Git and associated Unix tools from the Windows command-line" (die letzte Option). Die anderen Voreinstellungen sind ok. "Checkout"-Stil "Windows" und "Commit" mit "Unix line endings" (Zeilenende im Unix-Format) sind die richtigen Einstellungen.

Nach Abschluss der Installation musst du deine Command-Shell oder Powershell neu starten, damit die Einstellungen aktiv sind.<!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Git von [git-scm.com](https://git-scm.com/) herunterladen und dann den Anweisungen folgen.

> **Hinweis:** Falls du OS X 10.6, 10.7, oder 10.8 verwendest, muss du die Git-Version unter folgendem Link installieren: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->