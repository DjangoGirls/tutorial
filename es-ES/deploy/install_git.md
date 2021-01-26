Git es un "sistema de control de versiones" que utilizan muchos programadores. Este software puede seguir los cambios realizados en archivos a lo largo del tiempo de forma que más tarde puedas volver a cualquier versión anterior. Algo similar a la herramienta de "Control de Cambios" en los programas de tipo Word (por ejemplo, Microsoft Word o LibreOffice Writer), pero mucho más potente.

## Instalar Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Puedes descargar Git desde [git-scm.com](https://git-scm.com/). Puedes hacer click en "Next" en todos los pasos excepto en dos: cuando se te pregunte que selecciones tu editor, selecciona Nano, y en el paso "adjusting your PATH environment", selecciona "Use Git and optional Unix tools from the Windows Command Prompt" (la última opción). Aparte de eso, los valores por defecto son correctos. "Checkout Windows-style, commit Unix-style line endings" tampoco necesita corrección.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Descarga Git de [git-scm.com](https://git-scm.com/) y sigue las instrucciones.

> **Nota** Si estas usando OS X 10.6, 10.7 o 10.8, tendrás que instalar git desde aquí: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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
$sudo zypper install git
```

<!--endsec-->