> Para lectores en casa: este capitulo se cubre en el video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta sección está basada en un tutorial de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django esta escrito en Python. Necesitamos Python para hacer cualquier cosa en Django. Comencemos instalandolo!. Tenemos que instalar Python 3.6, así que si tienes una versión anterior, debes actualizarla.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primero comprueba si tu computador tiene una version de Windows de 32-bit o 64-bit, presiona tecla Windows + Pause/Break, esto abrirá tu System info (información de tu sistema), ahora busta la linea "System type". Puedes descargar Python para Windows desde el sitio web https://www.python.org/downloads/windows/. Haz click en el link "Latest Python 3 release - Python x.x.x.". Si tu computador tiene una versión de Windows de **64 bits**, descarga **Windows x86-64 executable installer**. De lo contrario, descarga **Windows x86 executable installer**. Después de descargar el instalador, debes ejecutarlo (hazle doble click) y sigue las instrucciones.

Algo a tener en cuenta: Durante la instalación notarás una ventana llamada "Setup". Asegúrate de seleccionar la casilla "Add Python 3.6 to Path" y luego haz click en "Install Now", como se muestra a continuación:

![No te olvides de agregar Python al Path](../python_installation/images/python-installation-options.png)

En los próximos pasos, vas a utilizar la línea de comandos de Windows (acerca de la cual también de contaremos algo). Por ahora, si necesitas escribir algunos comandos, ve a Menú de inicio → Windows System → Command Prompt. También puedes mantener presionada la tecla Windows y presiona la tecla "R" hasta que la ventana "Run" aparezca. Para abrir la línea de comandos, escribe "cmd" y pulsa enter en la ventana "Run". (En versiones más recientes de Windows, quizá deba buscar "Command Prompt" ya que a veces esta oculto.)

![Escribe "cmd" en la ventana "Run&quot](../python_installation/images/windows-plus-r.png)

Nota: Si estas utilizando una versión anterior de Windows (7, Vista, o cualquier versión anterior) y el instalador de Python 3.6.x falla con un error, puedes tratar ya sea:

1. instalar todas las actualizaciones de Windows e intentar instalar Python 3.6 nuevamente; o
2. instalar una [versión de Python anterior](https://www.python.org/downloads/windows/), por ejemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

Si instalas una versión anterior de Python, la pantalla de instalación puede ser un poco diferente a la que se muestra arriba. Asegúrate de desplazarte hacia abajo para ver "Add python.exe to Path", y dar click en el botón a la izquierda y seleccionar "Will be installed on local hard drive":

![Añadir Python a Path, versiones más antiguas](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Nota** Antes de instalar Python en OS X, debes asegurarte de que la configuración del Mac permita instalar paquetes que no estén en la App Store. ve a preferencias del sistema (System Preferences, está en la carpeta Aplicaciones), da click en "Seguridad y privacidad" (Security & Privacy) y luego la pestaña "General". Si tu "Permitir aplicaciones descargadas desde:" (Allow apps downloaded from:) está establecida a "Mac App Store," cambia a "Mac App Store y desarrolladores identificados." (Mac App Store and identified developers)

Debes ir al sitio web https://www.python.org/downloads/release/python-361/ y descargar el instalador de Python:

* Descargar el archivo *Mac OS X 64-bit/32-bit installer*,
* Haz doble clic en *python-3.4.3-macosx10.6.pkg* para ejecutar al instalador.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Es muy posible que ya tengas Python instalado de serie. Para verificar que ya lo tienes instalado (y qué versión es), abre una consola y escribe el siguiente comando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Si tienes una 'micro versión' diferente de Python instalada, por ejemplo 3.6.0, entonces no tienes que actualizar. Si no tienes instalado Python o si deseas una versión diferente, puedes instalarla de la siguiente manera:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Escribe este comando en tu consola:

{% filename %}command-line{% endfilename %}

    sudo yum install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Usa este comando en tu consola:

{% filename %}command-line{% endfilename %}

    $ sudo dnf instalar python3
    

Si usas versiones antiguas de Fedora puede que te dé un error de que no se encuentra el comando `dnf`. Si ése es tu caso, debes usar yum.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Usa este comando en tu consola:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifica que la instalación fue exitosa abriendo una terminal y ejecutando el comando `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NOTA:** Si estás en Windows y recibes un mensaje de error no se encontró `python3`, intenta usar `python` (sin el `3`) y comprueba si todavía es una versión de Python 3.6.

* * *

Si tienes alguna duda o si algo salió mal y no sabes cómo resolverlo - ¡pide ayuda a tu tutor! A veces las cosas no van bien y que es mejor pedir ayuda a alguien con más experiencia.