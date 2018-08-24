Git is een "version control system" ("versie controle systeem") dat door veel programmeurs gebruikt wordt. Deze software houdt de wijzigingen in een bestand bij zodat je later weer een specifieke versie kunt opvragen. Een beetje zoals the "track changes" in Microsoft Word, maar veel krachtiger.

## Git Installeren

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Je kunt Git downloaden van [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Op die na zijn alle standaardinstellingen prima. "Checkout Windows-style, commit Unix-style line endings" is goed.

Vergeet niet om de command prompt of powershell te herstarten nadat de installatie succesvol afgerond is. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **Opmerking** Als je OS X 10.6, 10.7 of 10.8 gebruikt, moet je de versie van git hiervandaan installeren: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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