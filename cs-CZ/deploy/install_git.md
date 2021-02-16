Git je "systém pro správu verzí" používaný spoustou programátorů. Tento software může sledovat změny v souborech v průběhu času tak, že konkrétní verze můžeš později znovu zobrazit. Trochu jako funkce "sledovat změny" ve slovních procesorových programech (např. Microsoft Word nebo LibreOffice spisovatel), ale mnohem silnější.

## Instalace Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git si můžeš stáhnout z [git-scm.com](https://git-scm.com/). Klikej na "další další další" ve všech krocích s vyjímkou 5. kroku s názvem "Nastavení prostředí PATH", zvol "Spustit Git a související Unixové nástroje, z příkazového řádku systému Windows" (spodní možnost). Ostatní výchozí hodnoty jsou v pořádku. Odškrtni Windows-style konce řádků, pro commit je Unixový styl konce řádků správný.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **Note** If you are running OS X 10.6, 10.7, or 10.8, you will need to install the version of git from here: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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