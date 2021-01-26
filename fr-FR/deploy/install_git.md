Git est un " système de gestion de versions" utilisé par de nombreux développeurs. Ce logiciel permet de garder une trace des modifications apportées à chaque fichier afin que vous puissiez facilement revenir en arrière ou à une version spécifique. Un peu comme la fonction « suivi des modifications » dans les programmes de traitement de texte (par exemple, Microsoft Word ou LibreOffice Writer), mais beaucoup plus puissant.

## Installer Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Vous pouvez télécharger Git sur [git-scm.com](https://git-scm.com/). Vous pouvez cliquer sur "suivant" pour toutes les étapes sauf deux : au moment de choisir l'éditeur, sélectionnez Nano ; à l'étape intitulée "Adjusting your PATH environment", sélectionnez "Use Git and optional Unix tools from the Windows Command Prompt" (l'option du bas). Les autres choix par défaut n'ont pas besoin d'être modifiés. Laissez cocher l'option "Checkout Windows-style, commit Unix-style line endings".

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Téléchargez Git sur [git-scm.com](https://git-scm.com/) et suivez les instructions.

> **Note** Si vous utilisez un OS X 10.6, 10.7 ou 10.8, vous devrez sans doute installer la version de git présente ici : [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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