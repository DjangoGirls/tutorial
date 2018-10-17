> Para lectores en casa: este capitulo se cubre en el video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta sección está basada en un tutorial de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django esta escrito en Python. Necesitamos Python para hacer cualquier cosa en Django. Comencemos instalandolo!. Tenemos que instalar Python 3.6, así que si tienes una versión anterior, debes actualizarla.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primero comprueba si tu computador tiene una version de Windows de 32-bit o 64-bit, presiona tecla Windows + Pause/Break, esto abrirá tu System info (información de tu sistema), ahora busta la linea "System type". Puedes descargar Python para Windows desde el sitio web https://www.python.org/downloads/windows/. Haz click en el link "Latest Python 3 release - Python x.x.x.". Si tu computador tiene una versión de Windows de **64 bits**, descarga **Windows x86-64 executable installer**. De lo contrario, descarga **Windows x86 executable installer**. Después de descargar el instalador, debes ejecutarlo (hazle doble click) y sigue las instrucciones.

Algo a tener en cuenta: Durante la instalación notarás una ventana llamada "Setup". Asegúrate de seleccionar la casilla "Add Python 3.6 to Path" y luego haz click en "Install Now", como se muestra a continuación:

![No te olvides de agregar Python al Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window.

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. instalar todas las actualizaciones de Windows e intentar instalar Python 3.6 nuevamente; o
2. instalar una [versión de Python anterior](https://www.python.org/downloads/windows/), por ejemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Nota** Antes de instalar Python en OS X, debes asegurarte de que la configuración del Mac permita instalar paquetes que no estén en la App Store. ve a preferencias del sistema (System Preferences, está en la carpeta Aplicaciones), da click en "Seguridad y privacidad" (Security & Privacy) y luego la pestaña "General". Si tu "Permitir aplicaciones descargadas desde:" (Allow apps downloaded from:) está establecida a "Mac App Store," cambia a "Mac App Store y desarrolladores identificados." (Mac App Store and identified developers)

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Descargar el archivo *Mac OS X 64-bit/32-bit installer*,
* Haz doble clic en *python-3.4.3-macosx10.6.pkg* para ejecutar al instalador.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. If you don't have Python installed, or if you want a different version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    sudo yum install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf instalar python3
    

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
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.