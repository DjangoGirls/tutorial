# Instalación de Django

> Parte de este capitulo esta basado en los tutoriales de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte de este capítulo se basa en el [django-marcador tutorial][1] bajo licencia de Creative Commons Attribution-ShareAlike 4.0 internacional. El tutorial de django-marcador tiene derechos de autor de Markus Zapke-Gündemann et al.

 [1]: http://django-marcador.keimlink.de/

## Entorno virtual

Antes de instalar Django, instalaremos una herramienta extremadamente útil que ayudará a mantener tu entorno de desarrollo ordenado en su computadora. Es posible omitir este paso, pero es muy recomendable no hacerlo - ¡comenzar con la mejor configuración posible ayudar a evitar muchos problemas en el futuro!

Así que, vamos a crear un **entorno virtual** (también llamado un *virtualenv*). Aislará la configuración Python/Django con base en cada proyecto, lo que significa que cualquier cambio que realices en un sitio web no afectará a otros que también estés desarrollando. Genial, ¿no?

Todo lo que necesitas hacer es encontrar un directorio en el que desees crear el `virtualenv`; tu directorio home, por ejemplo. En Windows puede verse como `C:\Users\Name` (donde `nombre` es el nombre de tu usuario).

Para este tutorial usaremos un nuevo directorio `djangogirls` en tu directorio home:

    mkdir djangogirls
    cd djangogirls
    

Haremos un virtualenv llamado `myvenv`. El comando general estará en el formato:

    python3 -m venv myvenv
    

### Windows

Para crear un nuevo `virtualenv`, debes abrir la consola (te lo indicamos unos cuantos capítulos antes, ¿recuerdas?) y ejecuta `C:\Python34\python -m venv myvenv`. Se verá así:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

en donde `C:\Python34\python` es el directorio en el que instalaste Python previamente y `myvenv` es el nombre de tu `virtualenv`. Puedes utilizar cualquier otro nombre, pero asegúrate de usar minúsculas y no dejar espacios, acentos o caracteres especiales. También es una buena idea mantener el nombre corto. ¡Vas a referirte a él mucho!

### Linux y OS X

Crear un `virtualenv` en Linux y OS X es tan simple como ejecutar `python3 -m venv myvenv`. Se verá así:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` es el nombre de tu `virtualenv`. Puedes usar cualquier otro nombre, pero mantén el uso de minúsculas y no incluyas espacios. También es una buena idea mantener el nombre corto. ¡Vas a referirte a él mucho!

> **Nota:** Actualmente, iniciar el entorno virtual en Ubuntu 14.04 de esta manera produce el siguiente error:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Para evitar esto, utiliza directamente el comando `virtualenv`.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Trabajar con virtualenv

Este comando anterior creará un directorio llamado `myvenv` (o cualquier nombre que hayas escogido) que contiene nuestro entorno virtual (básicamente un montón de archivos y carpetas). Todo lo que queremos hacer ahora es iniciarlo ejecutando:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

en Windows, o:

    ~/djangogirls$ source myvenv/bin/activate
    

en OS X y Linux.

¡Recuerda reemplazar `myvenv` con tu nombre de `virtualenv` que hayas elegido!

> **Nota:** a veces el comando `source` podría no estar disponible. En esos casos trata de hacerlo esto:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Sabrás que tienes `virtualenv` iniciado cuando veas que aparece este mensaje en la consola:

    (myvenv) C:\Users\Name\djangogirls>
    

o:

    (myvenv) ~/djangogirls$
    

¡Nota que el prefijo `(myvenv)` aparece!

Cuando trabajes en un entorno virtual, `python` automáticamente se referirá a la versión correcta, de modo que puedes utilizar `python` en vez de `python3`.

Tenemos todas las dependencias importantes en su lugar. ¡Finalmente podemos instalar Django!

## Instalar Django

Ahora que tienes tu `virtualenv` iniciado, puedes instalar Django usando `pip`. En la consola, ejecuta `pip install django==1.8` (fíjate que utilizamos un doble signo igual: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

En Windows

> Si obtienes un error al ejecutar pip en Windows comprueba si la ruta de tu proyecto contiene espacios, acentos o caracteres especiales (por ejemplo, `C:\Users\User Name\djangogirls`). Si lo tiene, por favor considera moverla a otro lugar sin espacios, acentos o caracteres especiales (sugerencia: `C:\djangogirls`). Después de hacerlo ejecuta nuevamente el comando anterior.

en Linux

> Si obtienes un error al correr pip en Ubuntu 12.04 ejecuta `python -m pip install -U --force-reinstall pip` para arreglar la instalación de pip en el virtualenv.

¡Eso es todo! ¡Ahora estás listo (por fin) para crear una aplicación Django!
