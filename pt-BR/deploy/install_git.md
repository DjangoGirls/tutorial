O Git é um "sistema de controle de versão" usado por muitos programadores. Este software pode acompanhar mudanças em arquivos ao longo do tempo para que você possa recuperar versões específicas mais tarde. É parecido com o recurso "Controlar Alterações" dos processadores de texto (e.x Microsoft Word ou Libre Writer), mas muito mais poderoso.

## Instalando o Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Você pode baixar o Git em [git-scm.com](https://git-scm.com/). Você pode clicar "próximo" em todas as etapas seguintes, exceto em duas delas: na etapa onde se pede para que escolha o seu editor, você deve escolher Nano, e na etapa "Ajustando o seu ambiente PATH", escolha "Usar Git e ferramentas opcionais Unix para Prompt de comando Windows" (a opção de baixo). Fora isso, as configurações padrão estão ótimas. "Checkout Windows-style, commit Unix-style line endings" está bom.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Baixe o Git em [git-scm.com](https://git-scm.com/) e siga as instruções.

> **Observação:** Se estiver rodando o OS X 10.6, 10.7, ou 10.8, você precisará instalar essa versão do git: [Instalado Git para o OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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