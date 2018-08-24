Git es un "sistema de control de versiones" que utilizan muchos programadores. Este software puede rastrear los cambios realizados en archivos a lo largo del tiempo de forma que puedas recuperar una versión específica más tarde. Es un poco parecido a la opción de "control de cambios" de Microsoft Word, pero mucho más potente.

## Instalar Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Puedes descargar Git desde [git-scm.com](https://git-scm.com/). Puedes hacer click en "next" en todos los pasos a excepción de uno; en el quinto paso titulado "Adjusting your PATH environment", escoge "Use Git and optional Unix tools from the Windows Command Prompt" (la última del fondo). Aparte de eso, los valores por defecto están bien. "Checkout Windows-style, commit Unix-style line endings" también está bien.

No olvides reiniciar "command prompt" o "powershell" después de que la instalación haya terminado. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **Note** Si estas usando OS X 10.6, 10.7 o 10.8, tendrás que instalar git desde aca: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo yum install git
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
$sudo zypper install git
```

<!--endsec-->