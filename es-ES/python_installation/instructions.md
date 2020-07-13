> Para lectores en casa: este capitulo se cubre en el vídeo [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta sección está basada en un tutorial de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django está escrito en Python. Necesitamos Python para hacer cualquier cosa en Django. ¡Empecemos con instalarlo! Queremos que instales la última versión de Python 3, así que si tienes una versión anterior, necesitarás actualizarla. Si ya tienes la versión 3.4 o una superior, debería ir bien.

Por favor, instala Python normalmente de la siguiente forma, incluso si tienes Anaconda instalada en el ordenador.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primero comprueba si tu ordenador ejecuta la versión 32 bits de Windows o la de 64, en "Tipo de sistema" en la página de "Acerca de". Para llegar a esta página, intenta uno de estos métodos:

* Presiona la tecla de Windows y la tecla Pause/Break al mismo tiempo
* Abre el Panel de Control desde el menú de Windows, después accede a Sistema & y Seguridad, luego a Sistema
* Presiona el botón de Windows, luego accede a Configuración > Sistema > Acerca de
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. It will start making suggestions as soon as you type. You can select the entry once it shows up.

Puedes descargar Python para Windows desde la siguiente web https://www.python.org/downloads/windows/. Clica en el enlace "Latest Python 3 Release -Python x.x.x". Si tu ordenador ejecuta la versión de **64 bits** de Windows, descarga **Windows x86-64 executable installer**. De lo contrario, descarga **Windows x86 executable installer**. Después de descargar el instalador, deberías ejecutarlo (dándole doble click) y seguir las instrucciones.

Una cosa para tener en cuenta: Durante la instalación, verás una ventana de "Setup". Asegúrate de marcar las casillas "Add Python 3.6 to PATH" o "Add Python to your environment variables" y hacer click en "Install Now", como se muestra aquí (puede que se vea un poco diferente si estás instalando una versión diferente):

![No te olvides de agregar Python al Path](../python_installation/images/python-installation-options.png)

Cuando la instalación de complete, verás un cuadro de diálogo con un enlace que puedes seguir para saber más sobre Python o sobre la versión que has instalado. Cierra o cancela ese dialogo -- ¡Aprenderás más en ese tutorial!

Nota: si estás usando una versión anterior de Windows (7, Vista o cualquier versión anterior) y el instalador de la versión 3.6.x de Python falla con un error, intenta también:

1. instalar todas las actualizaciones de Windows e intenta instalar Python de nuevo; o
2. instalar una [versión de Python anterior](https://www.python.org/downloads/windows/), por ejemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

Si instalas una versión anterior de Python, la pantalla de instalación puede ser un poco diferente a la mostrada arriba. Asegúrate de desplazarte hacia abajo para ver "Add python.exe to Path", después haz click en el botón de la izquierda y selecciona "Will be installed on local hard drive":

![Añadir Python a Path, versiones más antiguas](../python_installation/images/add_python_to_windows_path.png)

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

Es muy posible que ya tengas instalado Python de serie. Para verificar que ya lo tienes instalado (y qué versión es), abre una consola y escribe el siguiente comando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Si tienes instalada una versión diferente de Python, al menos 3.4.0 (por ejemplo 3.6.0), entonces no tienes que actualizar. Si tu no has instalado Python, o si tu quieres una versión diferente, primero verifica que distribución de Linux estás usando con el siguiente comando:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Después, dependiendo de el resultado, sigue una de las siguientes guías de instalación bajo ésta sección.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Escribe este comando en tu consola:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Usa éste comando en tu consola:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Si tu estás en versiones antiguas de Fedora, puedes obtener un error que el comando `dnf` no se encuentra. En ese caso, tu necesitas usar `yum` en su lugar.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Usa éste comando en tu consola:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifica si la instalación fue exitosa abriendo una terminal o consola, y corriendo el comando `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

La versión mostrada puede ser diferente desde 3.6.1 -- este debería marcar la versión que tu instalaste.

**NOTA:** Si está en Windows y recibe un mensaje de error que indica que `python3` no se encontró, intente usar `python` (sin el `3`) y compruebe si todavía podría ser una versión de Python que sea 3.4.0 o superior. Si eso tampoco funciona, puede abrir un nuevo símbolo del sistema e intentar nuevamente; Esto sucede si usa un símbolo del sistema abierto antes de la instalación de Python.

* * *

Si tú tienes alguna duda, o si ocurrió algún error y no tienes idea sobre qué hacer, ¡por favor pregunta a tú entrenador! Algunas veces las cosas no van bien y es mejor preguntar por ayuda desde alguien con más experiencia.