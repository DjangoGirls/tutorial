# Vamos a empezar con Python

¡Por fin estamos aquí!

Pero primero, déjenos decirte qué es Python. Python es un lenguaje de programación muy popular que puede utilizarse para la creación de sitios web, juegos, software académico, gráficos y mucho, mucho más.

Python se originó en la década de 1980 y su objetivo principal es ser legible por los seres humanos (¡no sólo para las máquinas!), por eso parece mucho más simple que otros lenguajes de programación. Esto hace que sea más fácil de aprender, pero no te preocupes, ¡Python es también muy poderoso!

# Instalación de Python

> Este subcapítulo se basa en un tutorial de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots/)

Django está escrito en Python. Necesitamos Python para cualquier cosa en Django. ¡Vamos a empezar con la instalación! Queremos que instales Python 3.4, así que si tienes alguna versión anterior, deberás actualizarla.

### Windows

Puedes descargar Python para Windows desde el sitio web https://www.python.org/downloads/release/python-343/. Después de descargar el archivo ***.msi**, debes ejecutarlo (haz doble click en el archivo) y sigue las instrucciones. Es importante recordar la ruta (el directorio) donde se ha instalado Python. ¡Será necesario más adelante!

Algo para tener en cuenta: en la segunda pantalla del asistente de instalación, llamada "Customize", asegúrate de ir hacia abajo y elegir la opción "Add python.exe to the Path", como en

![No te olvides de agregar Python al Path][1]

 [1]: images/add_python_to_windows_path.png

### Linux

Es muy posible que ya tengas Python instalado. Para verificar que ya lo tienes instalado (y qué versión es), abre una consola y tipea el siguiente comando:

    $ python3 --version
    Python 3.4.2
    

Si no tienes Python instalado o si quieres una versión diferente, puedes instalarlo como sigue:

#### Ubuntu

Tipea este comando en tu consola:

    sudo apt-get install python3.4
    

#### Fedora

Usa este comando en tu consola:

    sudo yum install python3.4
    

#### openSUSE

Usa este comando en tu consola:

    sudo zypper install python3


### OS X

Debes ir al sitio web https://www.python.org/downloads/release/python-342/ y descargar el instalador de Python:

*   descarga el archivo *DMG* *Mac OS X 64-bit/32-bit installer*,
*   haz doble click para abrirlo,
*   doble click en *Python.mpkg* para ejecutar al instalador.

Verifica que la instalación fue exitosa abriendo la *Terminal* y ejecutando el comando `python3`:

    $ python3 --version
    Python 3.4.2
    

* * *

Si tienes alguna duda o si algo salió mal y no sabes cómo resolverlo - ¡pide ayuda a tu tutor! Algunas veces las cosas no salen tan fácilmente y es mejor pedir ayuda a alguien con más experiencia.
