> Para lectores en casa: este capitulo se cubre en el video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta sección está basada en un tutorial de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django está escrito en Python. Necesitamos Python para hacer cualquier cosa en Django. ¡Empecemos con instalarlo! Queremos que instales la última versión de Python 3, así que si tienes una versión anterior, necesitarás actualizarla. Si ya tienes la versión 3.4 o una superior, debería ir bien.

Por favor, instala Python normalmente de la siguiente forma, incluso si tienes Anaconda instalada en el ordenador.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primero comprueba si tu ordenador ejecuta la versión 32 bits de Windows o la de 64, en "Tipo de sistema" en la página de "Acerca de". Para llegar a esta página, intenta uno de estos métodos:

* Presiona la tecla de Windows y la tecla Pause/Break al mismo tiempo
* Abre el Panel de Control desde el menú de Windows, después accede a Sistema & y Seguridad, luego a Sistema
* Presiona el botón de Windows, luego accede a Configuración > Sistema > Acerca de

Puedes descargar Python para Windows desde la siguiente web https://www.python.org/downloads/windows/. Clica en el enlace "Latest Python 3 Release -Python x.x.x". Si tu ordenador ejecuta la versión de **64 bits** de Windows, descarga **Windows x86-64 executable installer**. De lo contrario, descarga **Windows x86 executable installer**. Después de descargar el instalador, deberías ejecutarlo (dándole doble click) y seguir las instrucciones.

Una cosa para tener en cuenta: Durante la instalación, verás una ventana de "Setup". Asegúrate de marcar las casillas "Add Python 3.6 to PATH" o "Add Python to your environment variables" y hacer click en "Install Now", como se muestra aquí (puede que se vea un poco diferente si estás instalando una versión diferente):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Cuando la instalación de complete, verás un cuadro de diálogo con un enlace que puedes seguir para saber más sobre Python o sobre la versión que has instalado. Cierra o cancela ese dialogo -- ¡Aprenderás más en ese tutorial!

Nota: si estás usando una versión anterior de Windows (7, Vista o cualquier versión anterior) y el instalador de la versión 3.6.x de Python falla con un error, intenta también:

1. instalar todas las actualizaciones de Windows e intenta instalar Python de nuevo; o
2. instalar una [versión de Python anterior](https://www.python.org/downloads/windows/), por ejemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

Si instalas una versión anterior de Python, la pantalla de instalación puede ser un poco diferente a la mostrada arriba. Asegúrate de desplazarte hacia abajo para ver "Add python.exe to Path", después haz click en el botón de la izquierda y selecciona "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Nota** Antes de instalar Python en OS X, debes asegurarte de que la configuración del Mac permita instalar paquetes que no estén en la App Store. ve a preferencias del sistema (System Preferences, está en la carpeta Aplicaciones), da click en "Seguridad y privacidad" (Security & Privacy) y luego la pestaña "General". Si tu "Permitir aplicaciones descargadas desde:" (Allow apps downloaded from:) está establecida a "Mac App Store," cambia a "Mac App Store y desarrolladores identificados." (Mac App Store and identified developers)

Necesitas ir a la página web https://www.python.org/downloads/release/python-361/ y descargar el instalador de Python:

* Descarga el archivo *Mac OS X 64-bit/32-bit installer*,
* Doble click en *python-3.6.1-macosx10.6.pkg* para ejecutar el instalador.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a newer version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.