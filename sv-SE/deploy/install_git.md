Git är ett versionshanteringssystem som används av många programmerare. Med Git kan ändringar som gjorts i dina filer spåras över tiden så att du kan komma åt specifika versioner senare. Lite som ”spåra ändringar” funktionen i ordbehandlare program (t ex Microsoft Word eller LibreOffice Writer), men mycket mer kraftfull.

## Installera Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Du kan ladda ner Git från [git-scm.com](https://git-scm.com/). Du kan trycka ”nästa” på alla åtgärder utom två: i steget där den frågar att välja din kod-redaktör, du bör välja Nano, och i steget med titeln ”Adjusting your PATH environment", välj ”Use Git and optional Unix tools from the Windows Command Prompt” (alternativet längst ned). Annars är resten av standardvärdena bra. Lämna kryssrutan fylld för alternativet "Checkout Windows-style, commit Unix-style line endings".

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Ladda ner Git från [git-scm.com](https://git-scm.com/) och följ instruktionerna.

> **Obs** Om du kör OS X 10.6, 10.7 eller 10.8, du kommer att behöva installera versionen av git härifrån: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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