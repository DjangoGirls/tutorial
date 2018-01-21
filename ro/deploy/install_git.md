Git este un "sistem de versionare" folosit de mulți programatori. Acest software poate să urmărească schimbările făcute în fișiere de-a lungul timpului, pentru a putea reveni la anumite versiuni mai târziu. Seamănă cu funcția de "urmărire modificări" din Microsoft Word, dar este mult mai puternic.

## Instalarea Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Puteţi descărca Git aici [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the fifth step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). În afară de aceasta, valorile implicite sunt bune. Verificarea în stil Windows și sfârşiturile de linie de cod pentru commit-uri în stil Unix sunt bune.

Do not forget to restart the command prompt or powershell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Descărcați Git aici [git-scm.com](https://git-scm.com/) şi urmaţi instrucţiunile.

> **Note** If you are running OS X 10.6, 10.7, or 10.8, you will need to install the version of git from here: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt-get install git
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