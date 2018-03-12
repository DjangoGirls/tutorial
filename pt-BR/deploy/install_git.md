O Git é um "sistema de controle de versão" usado por muitos programadores. Este software pode rastrear mudanças nos arquivos ao longo do tempo para que você possa recuperar versões específicas mais tarde. Um pouco parecido com o recurso "rastrear alterações" do Microsoft Word, mas muito mais poderoso.

## Instalando o Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Você pode baixar o Git em [git-scm.com](https://git-scm.com/). You can hit "next" on all steps except for one; in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Fora disso, o as configurações padrão estão ótimas. "Checkout Windows-style, commit Unix-style line endings" está bom.

Não se esqueça de reiniciar o prompt de comando ou o powershell depois que a instalação terminar com sucesso. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Baixe o Git em [git-scm.com](https://git-scm.com/) e siga as instruções.

> **NOta** Se você estiver rodando o OS X 10.6, 10.7, ou 10.8, você precisará instalar a versão do git daqui: [Instalado Git para o OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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