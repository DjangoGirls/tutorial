Git est un " système de gestion de versions" utilisé par de nombreux développeurs. Ce logiciel permet de garder une trace des modifications apportées à chaque fichier afin que vous puissiez facilement revenir en arrière ou à une version spécifique. Cette fonction est similaire au "suivi des modifications" de Microsoft Word, mais en beaucoup plus puissant.

## Installer Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Vous pouvez télécharger Git sur [git-scm.com](https://git-scm.com/). Vous pouvez cliquer sur "suivant" pour toutes les étapes sauf une : à l'étape intitulé "Adjusting your PATH environment", sélectionnez "Use Git and optional Unix tools from the Windows Command Prompt" (l'option du bas). Les autres choix par défaut n'ont pas besoin d'être modifiés. L'option "Checkout Windows-style, commit Unix-style line endings" est parfaite: vous n'avez rien à changer sur cette page.

Do not forget to restart the command prompt or powershell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Vous pouvez télécharger Git sur [git-scm.com](https://git-scm.com/). Pour le reste de l'installation, suivez simplement les instructions de l'installateur.

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