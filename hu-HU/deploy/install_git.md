A Git egy "version control system" (VCS, magyarul verziókezelő rendszer), amit sok programozó használ. Ez a szoftver nyomon követ minden változást a fájlokban, így a későbbiekben is visszatérhetünk egy bizonyos régebbi verzióhoz. Valamelyest hasonlít a "változások nyomon követése" funkcióhoz a Microsoft Wordben, de ez jóval hatékonyabb.

## Git telepítése

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

A Gitet innen töltheted le: [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Ezen kívül a többi maradhat az alapbeállításon. Checkout Windows-style, commit Unix-style line endings - ezek is maradhatnak így.

Do not forget to restart the command prompt or powershell after the installation finished successfully. <!--endsec-->

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